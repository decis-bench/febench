mkdir -p lib 
cd ./src &&
mvn clean package &&
rm ../lib/* -rf &&
cp ./target/febench-benchmark-0.5.0.jar ../lib/ &&
cd ../lib/ &&
jar -xvf febench-benchmark-0.5.0.jar &&
cd ..
sed -i '/DATASET_ID/d' conf/conf.properties
sed  -i  "/DATASET_NUM/i DATASET_ID=$1"  conf/conf.properties
java -cp conf/:lib com._4paradigm.openmldb.benchmark.OpenMLDBPerfBenchmark_Cluster
