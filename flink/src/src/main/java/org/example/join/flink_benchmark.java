package org.example.join;

import java.time.Duration;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.LongAdder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileInputStream;

import java.sql.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

import java.security.Timestamp;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.streaming.api.*;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;
import org.apache.flink.table.api.*;
//import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
//import org.apache.flink.table.api.java.StreamTableEnvironment.toDataStream;
import org.apache.flink.types.Row;
import org.apache.flink.table.api.Table;
import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.eventtime.SerializableTimestampAssigner;
import org.apache.flink.configuration.TaskManagerOptions;

import org.apache.hadoop.conf.Configuration;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericData.Record;
import org.apache.parquet.avro.AvroParquetReader;
import org.apache.hadoop.fs.Path;
import org.apache.parquet.hadoop.ParquetReader;
import java.util.concurrent.atomic.LongAdder;
import java.io.File;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.openjdk.jmh.annotations.*;
//import org.openjdk.jmh.runner.ForkedMain;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import com.sun.org.apache.bcel.internal.generic.Type;


// Mode.SampleTime, Mode.Throughput
@BenchmarkMode({Mode.SampleTime, Mode.Throughput})
@OutputTimeUnit(TimeUnit.MILLISECONDS)
@State(Scope.Benchmark)
@Threads(1)

@Fork(value = 1, jvmArgs = {"-Xms8G", "-Xmx8G"})
@Warmup(iterations = 1)
@Measurement(iterations = 2, time = 30)

public class flink_benchmark {

    // Initiate
    org.apache.flink.configuration.Configuration conf_flink = new org.apache.flink.configuration.Configuration();

    StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

    String sql_query;
    List<Record> recordList = new ArrayList<>();
    LongAdder current_row = new LongAdder();
    Integer column_numnber = 0; // manual 773 columns for all the tables
    List<Integer> column_types = new ArrayList<Integer>();
    int total_load_amount = 0;
    int threads_flink = 0;

    

    StreamTableEnvironment tenv;


    private int dataSetID;
    private String datafolder;
    private String deploySQLPath;
    private String createSQLPath;


    public flink_benchmark() {
        dataSetID = BenchmarkConfig.DATASET_ID;
        datafolder = BenchmarkConfig.DATA_FOLDER_C[dataSetID];
        deploySQLPath = BenchmarkConfig.DEPLOY_SQL_C[dataSetID];
        createSQLPath = BenchmarkConfig.CREATE_SQL_C[dataSetID];

        switch (dataSetID) {
            case 0: {
                column_numnber = 11; 
                threads_flink = 50;
                // varchar:12; integer:4; timestamp: 93; double:8
                column_types.add(12);
                column_types.add(4);
                column_types.add(93);
                column_types.add(93);
                column_types.add(4);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(12);
                column_types.add(4);
                DataStreamSource<train_cluster0> orderDS  = env.addSource(new RichSourceFunction<train_cluster0>() {
                    private Boolean isRunning = true;
                    @Override
                    public void run(SourceContext<train_cluster0> ctx) throws Exception {
                        Random random = new Random();
                        while (isRunning) {
            
                            java.sql.Timestamp timestamp1 = new java.sql.Timestamp(System.currentTimeMillis());
            
                            train_cluster0 order = new train_cluster0("id001", random.nextInt(20), timestamp1, timestamp1, random.nextInt(20), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), "Abram", random.nextInt(20));
                            TimeUnit.SECONDS.sleep(1);
                            ctx.collect(order);
                        }
                    }
            
                    @Override
                    public void cancel() {
                        isRunning = false;
                    }
                });
                tenv = StreamTableEnvironment.create(env);
                DataStream<train_cluster0> watermakerDS = orderDS.assignTimestampsAndWatermarks(
                        WatermarkStrategy.<train_cluster0>forBoundedOutOfOrderness(Duration.ofDays(7))
                                .withTimestampAssigner(new SerializableTimestampAssigner<train_cluster0>() {
                                    @Override
                                    public long extractTimestamp(train_cluster0 element, long recordTimestamp) {
                                        return element.getTrip_duration(); //指定EventTime对应的字段
                                    }
                                })
                );
                env.setParallelism(threads_flink);
                tenv.fromDataStream(orderDS);
                break;
            }
            case 1: {
                column_numnber = 6;
                threads_flink = 50;
                // varchar:12; integer:4; timestamp: 93; double:8
                column_types.add(4);
                column_types.add(12);
                column_types.add(12);
                column_types.add(93);
                column_types.add(8);
                column_types.add(8);
                DataStreamSource<train_cluster1> orderDS = env.addSource(new RichSourceFunction<train_cluster1>() {
                    private Boolean isRunning = true;
                    @Override
                    public void run(SourceContext<train_cluster1> ctx) throws Exception {
                        Random random = new Random();
                        while (isRunning) {
            
                            java.sql.Timestamp timestamp1 = new java.sql.Timestamp(System.currentTimeMillis());
            
                            train_cluster1 order = new train_cluster1(random.nextInt(20), "test", "test", timestamp1, random.nextDouble(), random.nextDouble());
                            TimeUnit.SECONDS.sleep(1);
                            ctx.collect(order);
                        }
                    }
                    @Override
                    public void cancel() {
                        isRunning = false;
                    }
                });
                tenv = StreamTableEnvironment.create(env);
                env.setParallelism(threads_flink);
                tenv.fromDataStream(orderDS);
                break;
            }
            case 2: {
                column_numnber = 8;
                threads_flink = 50;
                // varchar:12; integer:4; timestamp: 93; double:8
                column_types.add(93);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                DataStreamSource<train_cluster2> orderDS  = env.addSource(new RichSourceFunction<train_cluster2>() {
                    private Boolean isRunning = true;
                    @Override
                    public void run(SourceContext<train_cluster2> ctx) throws Exception {
                        Random random = new Random();
                        while (isRunning) {
            
                            java.sql.Timestamp timestamp1 = new java.sql.Timestamp(System.currentTimeMillis());
            
                            train_cluster2 order = new train_cluster2(timestamp1, random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble());
                            TimeUnit.SECONDS.sleep(1);
                            ctx.collect(order);
                        }
                    }
            
                    @Override
                    public void cancel() {
                        isRunning = false;
                    }
                });
                tenv = StreamTableEnvironment.create(env);
                DataStream<train_cluster2> watermakerDS = orderDS.assignTimestampsAndWatermarks(
                        WatermarkStrategy.<train_cluster2>forBoundedOutOfOrderness(Duration.ofDays(7))
                                .withTimestampAssigner(new SerializableTimestampAssigner<train_cluster2>() {
                                    @Override
                                    public long extractTimestamp(train_cluster2 element, long recordTimestamp) {
                                        return element.getTrip_duration(); //指定EventTime对应的字段
                                    }
                                })
                );
                env.setParallelism(threads_flink);
                tenv.fromDataStream(orderDS);
                break;
            }
            case 3: {
                threads_flink = 50;
                column_numnber = 6;
                // varchar:12; integer:4; timestamp: 93; double:8
                column_types.add(12);
                column_types.add(12);
                column_types.add(93);
                column_types.add(93);
                column_types.add(12);
                column_types.add(12);
                DataStreamSource<train_cluster3> orderDS  = env.addSource(new RichSourceFunction<train_cluster3>() {
                    private Boolean isRunning = true;
                    @Override
                    public void run(SourceContext<train_cluster3> ctx) throws Exception {
                        Random random = new Random();
                        while (isRunning) {
            
                            java.sql.Timestamp timestamp1 = new java.sql.Timestamp(System.currentTimeMillis());
            
                            train_cluster3 order = new train_cluster3("test", "test", timestamp1, timestamp1, "test", "test");
                            TimeUnit.SECONDS.sleep(1);
                            ctx.collect(order);
                        }
                    }
            
                    @Override
                    public void cancel() {
                        isRunning = false;
                    }
                });
                tenv = StreamTableEnvironment.create(env);
                DataStream<train_cluster3> watermakerDS = orderDS.assignTimestampsAndWatermarks(
                        WatermarkStrategy.<train_cluster3>forBoundedOutOfOrderness(Duration.ofDays(7))
                                .withTimestampAssigner(new SerializableTimestampAssigner<train_cluster3>() {
                                    @Override
                                    public long extractTimestamp(train_cluster3 element, long recordTimestamp) {
                                        return element.getTrip_duration(); // 指定EventTime对应的字段
                                    }
                                })
                );
                env.setParallelism(threads_flink);
                tenv.fromDataStream(orderDS);
                break;
            }
            case 4: {
                threads_flink = 5;
                column_numnber = 123;
                // varchar:12; integer:4; timestamp: 93; double:8
                column_types.add(12);
                column_types.add(93);
                column_types.add(12);
                column_types.add(12);
                column_types.add(12);
                column_types.add(12);
                column_types.add(4);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(12);
                column_types.add(12);
                column_types.add(12);
                column_types.add(12);
                column_types.add(12);
                column_types.add(8);
                column_types.add(4);
                column_types.add(4);
                column_types.add(8);
                column_types.add(4);
                column_types.add(8);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(12);
                column_types.add(8);
                column_types.add(4);
                column_types.add(4);
                column_types.add(12);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(12);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(12);
                column_types.add(12);
                column_types.add(8);
                column_types.add(12);
                column_types.add(12);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(4);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(8);
                column_types.add(4);
                DataStreamSource<train_cluster4> orderDS  = env.addSource(new RichSourceFunction<train_cluster4>() {
                    private Boolean isRunning = true;
                    @Override
                    public void run(SourceContext<train_cluster4> ctx) throws Exception {
                        Random random = new Random();
                        while (isRunning) {
            
                            java.sql.Timestamp timestamp1 = new java.sql.Timestamp(System.currentTimeMillis());
            
                            train_cluster4 order = new train_cluster4("test", timestamp1, "test", "test", "test", "test", random.nextInt(20), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), "test", "test", "test", "test", "test", random.nextDouble(), random.nextInt(20), random.nextInt(20), random.nextDouble(), random.nextInt(20), random.nextDouble(), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), "test", random.nextDouble(), random.nextInt(20), random.nextInt(20), "test", random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), "test", random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), "test", "test", random.nextDouble(), "test", "test", random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextInt(20), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextDouble(), random.nextInt(20));
                            TimeUnit.SECONDS.sleep(1);
                            ctx.collect(order);
                        }
                    }
            
                    @Override
                    public void cancel() {
                        isRunning = false;
                    }
                });
                tenv = StreamTableEnvironment.create(env);
                DataStream<train_cluster4> watermakerDS = orderDS.assignTimestampsAndWatermarks(
                        WatermarkStrategy.<train_cluster4>forBoundedOutOfOrderness(Duration.ofDays(7))
                                .withTimestampAssigner(new SerializableTimestampAssigner<train_cluster4>() {
                                    @Override
                                    public long extractTimestamp(train_cluster4 element, long recordTimestamp) {
                                        return element.getTrip_duration(); //指定EventTime对应的字段
                                    }
                                })
                );
                env.setParallelism(threads_flink);
                tenv.fromDataStream(orderDS);
                break;
            }
            case 5: {
                threads_flink = 5;
                column_numnber = 4;
                 // varchar:12; integer:4; timestamp: 93; double:8
                column_types.add(12);
                column_types.add(93);
                column_types.add(12);
                column_types.add(12);
                DataStreamSource<train_cluster5> orderDS  = env.addSource(new RichSourceFunction<train_cluster5>() {
                    private Boolean isRunning = true;
                    @Override
                    public void run(SourceContext<train_cluster5> ctx) throws Exception {
                        Random random = new Random();
                        while (isRunning) {
            
                            java.sql.Timestamp timestamp1 = new java.sql.Timestamp(System.currentTimeMillis());
            
                            train_cluster5 order = new train_cluster5("test", timestamp1, "test", "test");
                            TimeUnit.SECONDS.sleep(1);
                            ctx.collect(order);
                        }
                    }
            
                    @Override
                    public void cancel() {
                        isRunning = false;
                    }
                });
                tenv = StreamTableEnvironment.create(env);
                DataStream<train_cluster5> watermakerDS = orderDS.assignTimestampsAndWatermarks(
                        WatermarkStrategy.<train_cluster5>forBoundedOutOfOrderness(Duration.ofDays(7))
                                .withTimestampAssigner(new SerializableTimestampAssigner<train_cluster5>() {
                                    @Override
                                    public long extractTimestamp(train_cluster5 element, long recordTimestamp) {
                                        return element.getTrip_duration(); // 指定EventTime对应的字段
                                    }
                                })
                );
                env.setParallelism(threads_flink);
                tenv.fromDataStream(orderDS);
                break;
            }
            default: {
                System.out.println("Err in constuct function");
                System.exit(0);
                break;
            }
        }


        conf_flink.setDouble(TaskManagerOptions.CPU_CORES, threads_flink);

       
    }

    public void drop() {
    }

    public void create() {

        // load query statement
        System.out.println(createSQLPath);
        
        StringBuilder builder = new StringBuilder();
        try{
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(createSQLPath)));
            String line;
            while ((line = reader.readLine()) != null) {
                tenv.executeSql(line);
                builder.append(line).append("\n");
            }
            } catch (Exception e){
                e.printStackTrace();
            }
        System.out.println(builder.toString());
    }

    public void deploy() {
        // load query statement
        System.out.println(deploySQLPath);
        
        StringBuilder builder = new StringBuilder();
        try{
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(deploySQLPath)));
            String line;
            while ((line = reader.readLine()) != null) {
                builder.append(line).append("\n");
            }
            } catch (Exception e){
                e.printStackTrace();
            }
        sql_query = builder.toString();
        System.out.println(sql_query);
        //System.out.println("query!!!");
    }

    public void preload_maintable(){
        // load main table data (read the parquet into file)
        String filePath = "";
        switch (dataSetID){
            case 0: {
                filePath = datafolder + "train/part-00001-8a55dd20-601e-4d69-b252-79b729bdaa4f-c000.snappy.parquet";
                break;
            }
            case 1: {
                filePath = datafolder + "train/part-00000-dc35485a-f7fc-4279-8343-162e08b0c42b-c000.snappy.parquet";
                break;
            }
            case 2: {
                filePath = datafolder + "train/part-00000-2f466a55-8a91-410a-b1e7-3822921aa045-c000.snappy.parquet";
                break;
            }
            case 3: {
                filePath = datafolder + "flatten_request/part-00000-8c54161a-2ecd-4025-a657-793f9cd569d2-c000.snappy.parquet";
                break;
            }
            case 4: {
                filePath = datafolder + "flattenRequest/part-00001-b0861947-7aaa-4e44-9d41-e5776246c48c-c000.snappy.parquet"; // manual
                break;
            }
            case 5: {
                filePath = datafolder + "flatten_request/part-00010-a0b142f8-1171-4704-b5c3-ed80fc29fec8-c000.snappy.parquet"; // manual
                break;
            }
            default:{
                System.out.println("Err in preload_maintable");
                System.exit(0);
                break;
            }
        }
        //int total_load_amount = 0;
        
        //System.out.println("readParquet dataFilePath:"+filePath);
        //System.exit(0);
        Configuration conf = new Configuration();
        conf.set("parquet.avro.readInt96AsFixed", "true");
        //conf.set("taskmanager.numberOfTaskSlots", "1");

        try {
            ParquetReader<Record> reader = AvroParquetReader
                .<GenericData.Record>builder(new Path(filePath))
                .withConf(conf)
                .build();
            GenericData.Record result;
            long count = 0;
            while ((result = reader.read()) != null) { // manual
                // convert int96 type columns
                //System.out.println(result);
                //System.exit(0);
                switch (dataSetID){
                    case 0: {
                        result.put("pickup_datetime",convertINT96toLong(result.get("pickup_datetime").toString()));
                        result.put("dropoff_datetime",convertINT96toLong(result.get("dropoff_datetime").toString()));
                        break;
                    }
                    case 1: {
                        result.put("Date",convertINT96toLong(result.get("Date").toString()));
                        break;
                    }
                    case 2: {
                        result.put("date",convertINT96toLong(result.get("date").toString()));
                        break;
                    }
                    case 3: {
                        break;
                    }
                    case 4: {
                        break;
                    }
                    case 5: {
                        break;
                    }
                    default:{
                        System.out.println("Err in preload_maintable");
                        System.exit(0);
                        break;
                    }
                }
                recordList.add(result);
                ++total_load_amount;
            }
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("fail!!!!");
            System.exit(0);
        }
        //System.out.println(recordList.get(0));
        //System.exit(0);
    }

    @Setup
    public void initEnv() {
        System.out.println("begin`");
        drop();
        create();
        deploy();

        try {
            Thread.sleep(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //addSchema();
        preload_maintable();
    }

    @TearDown
    public void cleanEnv() {
        // drop();
    }

    public boolean FeatureExtractionAndInsert(String tableName,
                                           long g_row_id) throws SQLException {
        //long g_row_id = current_row.longValue();
        long round_id = g_row_id/total_load_amount;
        //String tableName = "train";
        Integer ColumnCount = 11;
        long round_gap = 10000000000L;

        int row_id = (int)(g_row_id%total_load_amount);
        //System.out.println(row_id);

        GenericData.Record record = recordList.get(row_id);
        //System.out.println(record);
        //System.exit(0);

        // insert new record;
        StringBuilder builder_insert = new StringBuilder();
        builder_insert.append("insert into ").append(tableName).append(" values(");

        for (int i = 0; i < column_numnber; i++) {

            if (i > 0) {
                builder_insert.append(", ");
            }
            int columnType = column_types.get(i);

            // varchar:12; integer:4; timestamp: 93; double:8
            if (columnType == 12) { //varchar
                if (record.get(i) == null){
                    builder_insert.append("cast(null as varchar)");
                }
                else{
                    //System.out.println("i:"+i+" Types.VARCHAR");
                    //System.out.println(record.get(i));
                    //System.out.println(record.get(i).getClass());
                    String tmp = String.valueOf(record.get(i));
                    //String tmp = String.toString(record.get(i));
                    //requestPs.setString(i + 1, String.valueOf(record.get(i)));
                    //requestPs.setString(i + 1, tmp);
                    builder_insert.append("'").append(tmp).append("'");
                }

            } else if (columnType == 8) {//double
                if (record.get(i) == null){
                    builder_insert.append("cast(null as double)");
                }
                else{
                    //System.out.println("i:"+i+" Types.DOUBLE");
                    //System.out.println(record.get(i));
                    //System.out.println(record.get(i).getClass());
                    double tmp = (double)record.get(i);
                    //requestPs.setDouble(i + 1, (double)record.get(i));
                    //requestPs.setDouble(i + 1, tmp);
                    builder_insert.append(tmp);
                }
            } else if (columnType == 6) { //float
                if (record.get(i) == null){
                    builder_insert.append("cast(null as float)");
                }
                else{                
                    //System.out.println("i:"+i+" Types.FLOAT");
                    //System.out.println(record.get(i));
                    //System.out.println(record.get(i).getClass());
                    //requestPs.setFloat(i + 1, (float)record.get(i));
                    float tmp = (float)record.get(i);
                    //requestPs.setFloat(i + 1, tmp);
                    builder_insert.append(tmp);
                }
            } else if (columnType == 4) { //integer
                if (record.get(i) == null){
                    builder_insert.append("cast(null as integer)");
                }
                else{
                //System.out.println("i:"+i+" Types.INTEGER");
                //System.out.println(record.get(i));
                //System.out.println(record.get(i).getClass());
                //requestPs.setInt(i + 1, (int)record.get(i));

                //long tmp = (long) record.get(i);
                long tmp = Long.valueOf(record.get(i).toString());
                //requestPs.setInt(i + 1, tmp);
                builder_insert.append(tmp);}
            //} else if (columnType == Types.BIGINT) {
            //    System.out.println("i:"+i+" Types.BIGINT");
            //    System.out.println(record.get(i));
            //    System.out.println(record.get(i).getClass());
            //     requestPs.setLong(i + 1, record.get(i));
            } else if (columnType == 93) { //timestamp
                if (record.get(i) == null){
                    builder_insert.append("cast(null as timestamp)");
                }
                else{
                //System.out.println("i:"+i+" Types.TIMESTAMP");
                //System.out.println(record.get(i));
                //System.out.println(record.get(i).getClass());
                //requestPs.setTimestamp(i + 1, new Timestamp(round_id*1000000000000L*(long)record.get(i)));
                //requestPs.setTimestamp(i + 1, new Timestamp(round_id*round_gap*(long)record.get(i)));
                long tmpl = round_id*round_gap+(long)record.get(i); 
                java.sql.Timestamp tmp = new java.sql.Timestamp(tmpl);
                ////System.out.println("i:"+i+" round_id*round_gap+(long)record.get(i):"+tmpl+" tmp:"+tmp);
                //requestPs.setTimestamp(i + 1, tmp);
                //long tmp = round_id*round_gap*(long)record.get(i);
                //requestPs.setLong(tmp);
                //builder_insert.append(tmp);
                builder_insert.append("CAST('").append(String.valueOf(tmp)).append("' AS TIMESTAMP)");}
            }
            /*else if (columnType == Types.DATE) {
                System.out.println("i:"+i+" Types.DATE");
                System.out.println(record.get(i));
                System.out.println(record.get(i).getClass());
                requestPs.setDate(i + 1, new Date                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    record.get(i)));
            } else if (columnType == Types.BOOLEAN) {
                System.out.println("i:"+i+" Types.BOOLEAN");
                System.out.println(record.get(i));
                System.out.println(record.get(i).getClass());
                requestPs.setBoolean(i + 1, record.get(i));
            }*/
        }
        builder_insert.append(")");
        String insertSQL = builder_insert.toString();
        //System.out.println(insertSQL);
        //System.out.println("insert!!!!!!");

        // execute insert
        /* 
        try{
            //System.out.println(insertSQL);
            //Thread.sleep(100);
            tenv.executeSql(insertSQL);
            //Thread.sleep(100);
            // execute query
            //System.out.println(sql_query);
            //TableResult tableResult = tenv.sqlQuery(sql_query).execute();
            // tenv.executeSql(sql_query);
            // TableResult tableResult = tenv.sqlQuery("with t2 as (select 1 id, sum(pickup_latitude) train_pickup_latitude_window_sum_23, sum(dropoff_latitude) train_dropoff_latitude_window_sum_25 from train window win as (partition by vendor_id order by pickup_datetime range between interval '1' hour preceding and current row)), t3 as (select 1 id, sum(pickup_latitude) train_pickup_latitude_window_sum_24, sum(dropoff_latitude) train_dropoff_latitude_window_sum_27 from train window win2 as (partition by vendor_id order by pickup_datetime range between interval '2' hour preceding and current row)), t1 as (select 1 id, pickup_datetime, trip_duration, dropoff_datetime, dropoff_latitude, dropoff_longitude, passenger_count, pickup_latitude, pickup_longitude, store_and_fwd_flag, vendor_id from train limit 1)  select t1.id, t1.pickup_datetime as train_pickup_datetime_original_0, t1.id as train_id_original_1, t1.trip_duration as train_trip_duration_original_2, CAST(t1.dropoff_datetime AS timestamp) as train_dropoff_datetime_original_3, t1.dropoff_latitude as train_dropoff_latitude_original_4, t1.dropoff_longitude as train_dropoff_longitude_original_5, t1.passenger_count as train_passenger_count_original_6, t1.pickup_latitude as train_pickup_latitude_original_7, t1.pickup_longitude as train_pickup_longitude_original_8, t1.store_and_fwd_flag as train_store_and_fwd_flag_original_9, t1.vendor_id as train_vendor_id_original_10, t1.dropoff_longitude as train_dropoff_longitude_divide_11, t1.pickup_longitude as train_pickup_longitude_divide_11, t1.pickup_longitude as train_pickup_longitude_divide_12, t1.dropoff_longitude as train_dropoff_longitude_divide_12, t1.pickup_latitude as train_pickup_latitude_divide_13, t1.dropoff_latitude as train_dropoff_latitude_divide_13, t1.dropoff_latitude as train_dropoff_latitude_divide_14, t1.pickup_latitude as train_pickup_latitude_divide_14, t1.pickup_longitude as train_pickup_longitude_multiply_15, t1.dropoff_latitude as train_dropoff_latitude_multiply_15, t1.dropoff_longitude as train_dropoff_longitude_multiply_15, t1.pickup_longitude as train_pickup_longitude_multiply_16, t1.dropoff_latitude as train_dropoff_latitude_multiply_16, t1.pickup_longitude as train_pickup_longitude_multiply_17, t1.pickup_latitude as train_pickup_latitude_multiply_17, t1.dropoff_longitude as train_dropoff_longitude_multiply_17, t1.pickup_longitude as train_pickup_longitude_multiply_18, t1.dropoff_longitude as train_dropoff_longitude_multiply_18, t1.pickup_latitude as train_pickup_latitude_multiply_19, t1.dropoff_longitude as train_dropoff_longitude_multiply_19, hour(CAST(t1.dropoff_datetime AS timestamp)) as train_dropoff_datetime_hourofday_20, hour(CAST(t1.pickup_datetime AS timestamp)) as train_pickup_datetime_hourofday_21, t2.train_pickup_latitude_window_sum_23 as train_pickup_latitude_window_sum_23, t3.train_pickup_latitude_window_sum_24 as train_pickup_latitude_window_sum_24, t2.train_dropoff_latitude_window_sum_25 as train_dropoff_latitude_window_sum_25, t3.train_dropoff_latitude_window_sum_27 as train_dropoff_latitude_window_sum_27, t1.dropoff_longitude / t1.pickup_longitude, t1.pickup_longitude / t1.dropoff_longitude, t1.pickup_latitude / t1.dropoff_latitude, t1.dropoff_latitude / t1.pickup_latitude, t1.pickup_longitude * t1.dropoff_latitude * t1.dropoff_longitude, t1.pickup_longitude * t1.dropoff_latitude, t1.pickup_longitude * t1.pickup_latitude * t1.dropoff_longitude, t1.pickup_longitude * t1.dropoff_longitude, t1.pickup_latitude * t1.dropoff_longitude from t1,t2,t3 where t1.id=t2.id and t2.id=t3.id").execute();
            TableResult tableResult = tenv.sqlQuery(sql_query).execute();
            //tableResult.print();
        }catch (InterruptedException ex)
        {
            System.out.println("出现异常");
        }*/

        tenv.executeSql(insertSQL);

        //TableResult tableResult = tenv.sqlQuery(sql_query).execute();           
        // tenv.executeSql(sql_query);

        try{
            Table resultTable = tenv.sqlQuery(sql_query);
            tenv.toRetractStream(resultTable, Row.class).print();
            //env.execute();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("出现异常");
        }

        return true;        
    }
    
    private static long convertINT96toLong(String int96String){
        long NANO_SECONDS_PER_DAY = 86400_000_000_000L;
        long JULIAN_EPOCH_OFFSET_DAYS = 2440588;

        String[] tmp = int96String.split(",");
        int[] int96Bytes = new int[tmp.length];
        for(int i=0; i< tmp.length; ++i){
            int96Bytes[i]=Integer.parseInt(tmp[i].replaceAll("\\s|\\[|\\]", ""));
            //System.out.println("int96Bytes["+i+"]: "+ int96Bytes[i]);
        }

        // Find Julian day
        int julianDay = 0;
        int index = int96Bytes.length;
        //System.out.println(" int96Bytes.length:"+int96Bytes.length);
        while (index > 8) {
            index--;
            julianDay <<= 8;
            julianDay += int96Bytes[index] & 0xFF;
        }

        // Find nanos since midday (since Julian days start at midday)
        long nanos = 0;
        // Continue from the index we got to
        while (index > 0) {
            index--;
            nanos <<= 8;
            nanos += int96Bytes[index] & 0xFF;
        }
        return ((julianDay - JULIAN_EPOCH_OFFSET_DAYS)*NANO_SECONDS_PER_DAY+nanos)/1000000;
    }

    @Benchmark
    public void executeDeployment() {
        //++current_row;
        current_row.increment(); // the value is right

        try {

            if(!FeatureExtractionAndInsert("train", current_row.longValue())){
                System.out.println("Err!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        int dataSetID = BenchmarkConfig.DATASET_ID;
        int dataSetNUM = BenchmarkConfig.DATASET_NUM;
        if(dataSetID > dataSetNUM || dataSetID < 0) {
            System.out.println("Err! Invalid dataSetID");
            return;
        }

        try {
            Options opt = new OptionsBuilder()
                    .include(flink_benchmark.class.getSimpleName())
                    .forks(1)
                    .build();
            new Runner(opt).run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}