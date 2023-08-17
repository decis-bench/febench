DATASET_ID=$1
sed -i '/DATASET_ID/d' conf/conf.properties
sed -i  "/DATASET_NUM/i DATASET_ID=${DATASET_ID:=0}"  conf/conf.properties
java -cp conf/:lib com._4paradigm.openmldb.benchmark.OpenMLDBPerfBenchmark_Cluster
