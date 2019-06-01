FROM apache/zeppelin:0.8.1
MAINTAINER Markus Hanses <me@markushanses.de>

ENV SPARK_HOME="/opt/spark"
ENV SPARK_ARTIFACT_VERSION="spark-2.4.3-bin-without-hadoop"
ENV HADOOP_HOME="/opt/hadoop"
ENV HADOOP_ARTIFACT_VERSION="hadoop-2.8.5"
ENV CUSTOM_LIBS="/opt/custom_lib"
ENV CUSTOM_PROPERTIES="/opt/properties"
ENV MAVEN_HOME="/opt/maven"


# Hadoop
RUN echo "[HADOOP] Download Hadoop binary" && \
    wget -O /tmp/${HADOOP_ARTIFACT_VERSION}.tar.gz http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/hadoop/common/$HADOOP_ARTIFACT_VERSION/$HADOOP_ARTIFACT_VERSION.tar.gz && \
    tar -zxvf /tmp/${HADOOP_ARTIFACT_VERSION}.tar.gz -C /tmp/ && \
    rm -rf /tmp/${HADOOP_ARTIFACT_VERSION}.tar.gz && \
    mv /tmp/${HADOOP_ARTIFACT_VERSION} ${HADOOP_HOME}

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
ADD conf/core-site.xml ${HADOOP_HOME}/etc/hadoop/core-site.xml

RUN echo "Cleanup" && \
    apt-get autoclean && \
    apt-get clean

# Redefine Entrypoint
EXPOSE 8080
ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
