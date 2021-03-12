FROM ubuntu:bionic AS builder
MAINTAINER junyoung.oh@nhn.com
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
 && rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV GRADLE_USER_HOME /workspace/.gradle
COPY . /demo-svc3
WORKDIR /demo-svc3
RUN ./gradlew build

FROM alpine:3.11
MAINTAINER junyoung.oh@nhn.com
RUN apk --no-cache add --update bash openjdk11-jre
COPY --from=builder /demo-svc3/build/libs/svc3-*.jar /demo-svc3/svc3.jar
WORKDIR /demo-svc3
CMD ["java", "-jar", "svc3.jar"]
