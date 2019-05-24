#!/bin/bash
CLASSPATH=$(JARS=("/libs"/*.jar); IFS=:; echo "/app${JARS[*]}")
#export ZEPPELIN_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"
#export ZEPPELIN_INTP_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"
echo $CLASSPATH
export SPARK_SUBMIT_OPTIONS="--jar ${CLASSPATH} --properties-file /app/properties/spark.properties"

