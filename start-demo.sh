#!/bin/sh
exec java $JAVA_OPTS -jar -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.security.egd=file:/dev/./urandom /opt/app.jar