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
RUN apt update && apt install -y vim maven

WORKDIR /work

CMD [ "/bin/bash" ]
