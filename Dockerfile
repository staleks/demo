FROM openjdk:8-jdk-alpine
MAINTAINER novacode.rs

ADD build/libs/demo-*.jar /opt/app.jar
ADD start-demo.sh /opt/start-demo.sh
RUN chmod +x /opt/start-demo.sh

ENTRYPOINT ["/opt/start-demo.sh"]



