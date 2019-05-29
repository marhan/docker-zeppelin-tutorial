FROM apache/zeppelin:0.8.1
MAINTAINER Markus Hanses <me@markushanses.de>

ENV SPARK_HOME="/opt/spark"
ENV SPARK_ARTIFACT_VERSION="spark-2.4.3-bin-hadoop2.7"
ENV CUSTOM_LIBS="/opt/custom_lib"
ENV CUSTOM_PROPERTIES="/opt/properties"
ENV MAVEN_HOME="/opt/maven"

# Spark
RUN echo "[SPARK] Download Spark binary" && \
    wget -O /tmp/${SPARK_ARTIFACT_VERSION}.tgz http://apache.lauf-forum.at/spark/spark-2.4.3/${SPARK_ARTIFACT_VERSION}.tgz && \
    tar -zxvf /tmp/${SPARK_ARTIFACT_VERSION}.tgz -C /tmp/ && \
    rm -rf /tmp/${SPARK_ARTIFACT_VERSION}.tgz && \
    mv /tmp/${SPARK_ARTIFACT_VERSION} ${SPARK_HOME}

# Maven
RUN echo "[MAVEN] Install Maven" && \
    apt-get update && apt-get install -y maven
ADD conf/pom.xml ${MAVEN_HOME}/pom.xml
WORKDIR ${MAVEN_HOME}
RUN echo "[MAVEN] Download Java libs" && \
    mvn dependency:copy-dependencies -DoutputDirectory=${CUSTOM_LIBS}

# Customize Zeppelin
ADD conf/zeppelin-env.sh ${Z_HOME}/conf/zeppelin-env.sh
ADD conf/spark.properties ${CUSTOM_PROPERTIES}/spark.properties

RUN echo "Cleanup" && \
    apt-get autoclean && \
    apt-get clean

# Redefine Entrypoint
EXPOSE 8080
ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
