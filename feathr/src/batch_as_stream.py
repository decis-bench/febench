from datetime import timedelta
import os
from pathlib import Path
from tempfile import TemporaryDirectory
import time
import numpy

from pyspark.ml import Pipeline
from pyspark.ml.evaluation import RegressionEvaluator
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.regression import GBTRegressor
from pyspark.sql import DataFrame, SparkSession
import pyspark.sql.functions as F

import feathr
from feathr import (
    FeathrClient,
    # Feature data types
    BOOLEAN, FLOAT, INT32, INT64, STRING, ValueType,
    # Feature data sources
    INPUT_CONTEXT, HdfsSource,
    # Feature aggregations
    TypedKey, WindowAggTransformation,
    # Feature types and anchor
    DerivedFeature, Feature, FeatureAnchor,
    # Materialization
    BackfillTime, MaterializationSettings, RedisSink,
    # Offline feature computation
    FeatureQuery, ObservationSettings,
    AvroJsonSchema, KafKaSource, KafkaConfig
)
from feathr.spark_provider.feathr_configurations import SparkExecutionConfiguration
from feathr.utils.job_utils import get_result_df

os.environ["KAFKA_SASL_JAAS_CONFIG"] = "myconnectionstring"
os.environ["REDIS_PASSWORD"] = "111111"

def basic_feature(key):
    features = [
        Feature(
            name="Id_0",
            key=key,
            feature_type=INT32,
            transform="Id",
        ),
        Feature(
            name="train_Date_original_1",
            key=key,
            feature_type=STRING,
            transform="Date",
        ),
        Feature(
            name="train_ConfirmedCases_original_2",
            key=key,
            feature_type=FLOAT,
            transform="ConfirmedCases",
        ),
        Feature(
            name="train_Country_Region_original_3",
            key=key,
            feature_type=STRING,
            transform="Country_Region",
        ),
        Feature(
            name="train_Fatalities_original_4",
            key=key,
            feature_type=FLOAT,
            transform="Fatalities",
        ),
        Feature(
            name="train_Province_State_original_5",
            key=key,
            feature_type=STRING,
            transform="Province_State",
        ),
        Feature(
            name="train_Fatalities_log_6",
            key=key,
            feature_type=FLOAT,
            transform="log(Fatalities)",
        ),
    ]
    return features

def agg_feature(key):
    window_2d = "2d"
    window_5d = "5d"
    window_7d = "7d"
    # Anchored features with aggregations
    agg_features = [
        Feature(
            name="train_Fatalities_window_max_7",
            key=key,
            feature_type=FLOAT,
            transform=WindowAggTransformation(
                agg_expr="Fatalities",
                agg_func="MAX",
                window=window_2d,
            ),
        ),
        Feature(
            name="train_Fatalities_window_max_8",
            key=key,
            feature_type=FLOAT,
            transform=WindowAggTransformation(
                agg_expr="Fatalities",
                agg_func="MAX",
                window=window_5d,
            ),
        ),
    ]
    return agg_features

def define_batch_source(DATA_FILE_PATH,col,format):
    # define source

    batch_source = HdfsSource(
        name="covidBatchSource",
        path=DATA_FILE_PATH,
        event_timestamp_column=col,
        timestamp_format=format,
    )
    return batch_source

# def define_streaming_source():
#     # Define input data schema
#     schema = AvroJsonSchema(schemaStr="""
#     {
#         "type": "record",
#         "name": "covid19",
#         "fields": [
#             {"name": "Id", "type": "int"},
#             {"name": "Province_State", "type":"string"},
#             {"name": "Country_Region", "type":"string"},
#             {
#                 "name": "Date",
#                 "type": {"type": "long", "logicalType": "timestamp-millis"}
#             },
#             {"name": "ConfirmedCases", "type":"float"},
#             {"name": "Fatalities", "type":"float"}
#         ]
#     }
#     """)
#     stream_source = KafKaSource(name="covid19_stream_source",
#                                 kafkaConfig=KafkaConfig(brokers=["localhost:9092"],
#                                                         topics=["covid2"],
#                                                         schema=schema)
#                                 )
#     return stream_source


def gen_csv_tmp(df, range, path):
    # save csv
    data_path = os.path.join(path, "tmp" ,"data_%d.parquet"%(range))
    if not os.path.exists(data_path):
        df.limit(range).coalesce(1).write.option("header", "true").parquet(data_path)
    # get file name
    file = os.path.join(data_path, [f for f in os.listdir(data_path) if (".parquet" in f and ".crc" not in f)][0])
    return file


if __name__ == "__main__":
    # read data
    DATA_STORE_PATH = "../data/covid"
    DATA_FILE_PATH = str(Path(DATA_STORE_PATH, "part-00000-dc35485a-f7fc-4279-8343-162e08b0c42b-c000_copy.snappy.parquet"))
    spark = (
        SparkSession
        .builder
        .appName("feathr")
        .config("spark.jars.packages", "org.apache.spark:spark-avro_2.12:3.3.0,io.delta:delta-core_2.12:2.1.1")
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
        .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
        .config("spark.ui.port", "8080")  # Set ui port other than the default one (4040) so that feathr spark job doesn't fail. 
        .getOrCreate()
    )
    spark.sparkContext.setLogLevel("WARN")

    df = spark.read.parquet(DATA_FILE_PATH)
    config_path = "./conf.config"
    client = FeathrClient(config_path=config_path)

    # define key
    key = TypedKey(
        key_column="Key",
        key_column_type=ValueType.STRING,
        description="Key",
        full_name="covid.Key",
    )

    TIMESTAMP_COL = "Date"
    TIMESTAMP_FORMAT = "yyyy-MM-dd HH:mm:ss"

    # define feature
    features = basic_feature(key)    
    agg_features = agg_feature(key)

    EXECUTE_SIZE = 20
    BATCH_SIZE = 1000
    EPOCH = 2
    execute_time= [0]*(EXECUTE_SIZE+1)
    file_paths = [""]

    for _ in range(1,EXECUTE_SIZE+1):
        file_path = gen_csv_tmp(df, _*BATCH_SIZE, DATA_STORE_PATH)
        file_paths.append(file_path)
    for __ in range(0, EPOCH):
        for _ in range(1,EXECUTE_SIZE+1):
            file_path = file_paths[_]
            print(file_path)
            # define source
            batch_source = define_batch_source(file_path,TIMESTAMP_COL,TIMESTAMP_FORMAT)

            feature_anchor = FeatureAnchor(
                name="feature_anchor",
                source=batch_source,  # Pass through source, i.e. observation data.
                features=features,
            )
            agg_feature_anchor = FeatureAnchor(
                name="agg_feature_anchor",
                source=batch_source,  # External data source for feature. Typically a data table.
                features=agg_features,
            )
            client.build_features(
                anchor_list=[feature_anchor, agg_feature_anchor],
            )
            feature_names = [feature.name for feature in features + agg_features]
            DATA_FORMAT = "parquet"
            offline_features_path = str(Path(DATA_STORE_PATH, "feathr_output", f"features_{_*BATCH_SIZE}.{DATA_FORMAT}"))

            # Features that we want to request. Can use a subset of features
            query = FeatureQuery(
                feature_list=feature_names,
                key=key,
            )
            settings = ObservationSettings(
                observation_path=file_path,
                event_timestamp_column=TIMESTAMP_COL,
                timestamp_format=TIMESTAMP_FORMAT,
            )
            start_time = time.time()
            client.get_offline_features(
                observation_settings=settings,
                feature_query=query,
                # For more details, see https://feathr-ai.github.io/feathr/how-to-guides/feathr-job-configuration.html
                execution_configurations=SparkExecutionConfiguration({
                    "spark.feathr.outputFormat": DATA_FORMAT,
                }),
                output_path=offline_features_path,
            )
            client.wait_job_to_finish(timeout_sec=5000)

            end_time = time.time()
            execute_time[_] += (end_time-start_time)
    
    for _ in range(2,EXECUTE_SIZE+1):
        print("[%d]execute time:\t%f"%(_, (execute_time[_]-execute_time[_-1])/BATCH_SIZE/EPOCH))
    os.system("./clean.sh")