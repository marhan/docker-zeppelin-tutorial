#!/usr/bin/env bash

# variables
CUSTOM_LIBS=/opt/custom_lib

# print dependencies
mvn dependency >> depenency.txt
mvn dependency:list >> depenency_list.txt

# load dependencies
mvn dependency:copy-dependencies -DoutputDirectory=${CUSTOM_LIBS}
