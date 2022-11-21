#!/bin/sh

docker build -f maven.Dockerfile \
             -t docker-java/maven .

docker run --rm \
           --name docker-java_maven \
           --user $(id -u ${USER}):$(id -g ${USER}) \
           --volume /usr/src/app \
           docker-java/maven \
           clean install

docker rm docker-java_maven

docker build -f java.Dockerfile \
             -t docker-java/java .
