sed -i '/DATASET_ID/d' conf/conf.properties
sed -i  "/DATASET_NUM/i DATASET_ID=$1"  conf/conf.properties
java -cp conf/:lib com._4paradigm.openmldb.benchmark.OpenMLDBPerfBenchmark_Cluster