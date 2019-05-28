#!/bin/bash
#export ZEPPELIN_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"
#export ZEPPELIN_INTP_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"
export ZEPPELIN_PORT=8080
export ZEPPELIN_LOG_DIR='/opt/logs'
export ZEPPELIN_NOTEBOOK_DIR='/opt/notebook'
export SPARK_SUBMIT_OPTIONS="--jar $(JARS=("/opt/custom_lib"/*.jar); IFS=,; echo "${JARS[*]}") --driver-class-path $(JARS=("/opt/custom_lib"/*.jar); IFS=,; echo "${JARS[*]}") --properties-file /opt/properties/spark.properties"
echo "############################################################"
echo
echo $SPARK_SUBMIT_OPTIONS
echo
echo "############################################################"

