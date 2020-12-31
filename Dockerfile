FROM java:8
FROM carsharing/alpine-oraclejdk8-bash

WORKDIR /opt/test/docker

ENV RAWJAR=jenkins-test-0.0.1-SNAPSHOT.jar
ENV TARGETJAR=app.jar

ADD target/jenkins-test-0.0.1-SNAPSHOT.jar $TARGETJAR
ENTRYPOINT java -jar $TARGETJAR