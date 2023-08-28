# copy openmldb package from
FROM 4pdosc/openmldb:0.8.2 AS builder

FROM openjdk:11.0.13-jdk-slim-bullseye
COPY --from=builder /work/openmldb /work/openmldb
COPY --from=builder /work/init.sh /work/init.sh
COPY --from=builder /work/zookeeper-3.4.14 /work/zookeeper-3.4.14

# group name
LABEL org.opencontainers.image.authors="Huang Wei"
# TODO TAG

# ignores in .dockerignore
COPY . /work/febench/
WORKDIR /work/febench/
ENV FEBENCH_ROOT=/work/febench
RUN sed s#\<path\>#$FEBENCH_ROOT# ./OpenMLDB/conf/conf.properties.template > ./OpenMLDB/conf/conf.properties
RUN sed s#\<path\>#$FEBENCH_ROOT# ./flink/conf/conf.properties.template > ./flink/conf/conf.properties

# febench use zk 7181, 3 tablet, default driver memory
RUN sed -i'' 's/localhost:2181/localhost:7181/g' /work/openmldb/conf/hosts
RUN sed -i'' '/\[tablet\]/a localhost:10923 /tmp/openmldb/tablet-3' /work/openmldb/conf/hosts
RUN sed -i'' 's/spark.default.conf=/spark.default.conf=spark.driver.memory=32g;/g' /work/openmldb/conf/taskmanager.properties.template

# maven
RUN apt update && apt install -y vim maven rsync curl procps git python3 python3-pip python3-numpy
# compile once, to avoid download failures when mvn build
WORKDIR /work/febench/OpenMLDB
RUN ./compile_test.sh && rm -rf lib/

# temp: use un-released spark connector in OpenMLDB
RUN curl -O --output-dir /work/openmldb/spark/jars http://43.138.115.238/download/test/openmldb-batch-0.8.2-SNAPSHOT.jar
RUN rm /work/openmldb/spark/jars/openmldb-batch-0.8.2.jar
WORKDIR /work

CMD [ "/bin/bash" ]
