#!/bin/sh

docker build -f maven.Dockerfile \
             -t docker-java/maven .

docker run --rm \
           --name docker-java_maven \
           --user $(id -u ${USER}):$(id -g ${USER}) \
           --volume $(pwd):/app \
           docker-java/maven \
           mvn clean install

docker rm docker-java_maven

docker build -f java.Dockerfile \
             -t docker-java/java .
