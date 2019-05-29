#!/bin/bash

#export ZEPPELIN_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"
#export ZEPPELIN_INTP_MEM="-Xms1g -Xmx1g -XX:MaxPermSize=512m"

export ZEPPELIN_PORT=8080
export ZEPPELIN_LOG_DIR='/opt/logs'
export ZEPPELIN_NOTEBOOK_DIR='/opt/notebook'

export CUSTOM_LIBS="/opt/custom_lib"
export CUSTOM_PROPERTIES="/opt/properties"
export SPARK_SUBMIT_OPTIONS="--jar $(JARS=("${CUSTOM_LIBS}"/*.jar); IFS=,; echo "${JARS[*]}") --driver-class-path $(JARS=("${CUSTOM_LIBS}"/*.jar); IFS=,; echo "${JARS[*]}") --properties-file ${CUSTOM_PROPERTIES}/spark.properties"

echo "############################################################"
echo 
echo  " Start with spark options: ${SPARK_SUBMIT_OPTIONS}"
echo
echo "############################################################"

