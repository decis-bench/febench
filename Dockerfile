# copy openmldb package from
FROM 4pdosc/openmldb:0.8.2 AS builder

FROM openjdk:11.0.13-jdk-slim-bullseye
COPY --from=builder /work/openmldb /work/openmldb
# group name
LABEL org.opencontainers.image.authors="Huang Wei"
# TAG

# ignores in .dockerignore
COPY * /work/febench/
# febench use zk 7181
RUN sed -i'' 's/localhost:2181/localhost:7181/g' /work/openmldb/conf/hosts

# maven
RUN apt update && apt install -y vim maven curl

# temp: use un-released spark connector in OpenMLDB
RUN curl -O --output-dir /work/openmldb/spark/jars http://43.138.115.238/download/test/openmldb-batch-0.8.2-SNAPSHOT.jar
RUN rm /work/openmldb/spark/jars/openmldb-batch-0.8.2.jar
WORKDIR /work

CMD [ "/bin/bash" ]
