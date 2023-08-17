mkdir -p lib 
cd ./src &&
mvn clean package &&
rm ../lib/* -rf &&
cp ./target/febench-benchmark-0.5.0.jar ../lib/ &&
cd ../lib/ &&
jar -xvf febench-benchmark-0.5.0.jar &&
cd ..
