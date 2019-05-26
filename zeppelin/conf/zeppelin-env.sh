#!/bin/bash
#export ZEPPELIN_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"
#export ZEPPELIN_INTP_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"
export SPARK_SUBMIT_OPTIONS="--jar $(JARS=("/app/libs"/*.jar); IFS=,; echo "${JARS[*]}") --driver-class-path $(JARS=("/app/libs"/*.jar); IFS=,; echo "${JARS[*]}") --properties-file /app/properties/spark.properties"
echo "############################################################"
echo
echo $SPARK_SUBMIT_OPTIONS
echo
echo "############################################################"

