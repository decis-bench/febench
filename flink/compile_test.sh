sed -i '/DATASET_ID/d' conf/conf.properties
sed  -i  "/DATASET_NUM/i DATASET_ID=$1"  conf/conf.properties
rm -f ./src/src/main/resources/conf.properties
cp ./conf/conf.properties ./src/src/main/resources/
cd src
mvn clean install exec:exec
cd ..