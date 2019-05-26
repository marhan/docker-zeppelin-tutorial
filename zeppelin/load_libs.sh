#!/usr/bin/env bash

mvn dependency:list >> depenency.txt

mvn dependency:copy-dependencies -DoutputDirectory=libs
