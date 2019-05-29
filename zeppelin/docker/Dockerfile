FROM apache/zeppelin:0.8.1
MAINTAINER Markus Hanses <me@markushanses.de>

ENV SPARK_HOME="/opt/spark"
ENV SPARK_ARTIFACT_VERSION="spark-2.4.3-bin-hadoop2.7.tgz"
ENV CUSTOM_LIBS="/opt/custom_lib"
ENV CUSTOM_PROPERTIES="/opt/properties"
ENV MAVEN_HOME="/opt/maven"

RUN echo "$LOG_TAG Download Spark binary" && \
    wget -O /tmp/${SPARK_ARTIFACT_VERSION} http://apache.lauf-forum.at/spark/spark-2.4.3/${SPARK_ARTIFACT_VERSION} && \
    tar -zxvf /tmp/${SPARK_ARTIFACT_VERSION} && \
    rm -rf /tmp/${SPARK_ARTIFACT_VERSION} && \
    mv /tmp/${SPARK_ARTIFACT_VERSION} ${SPARK_HOME}

RUN apt-get update && apt-get install -y maven

ADD conf/pom.xml ${MAVEN_HOME}/pom.xml
ADD conf/start_maven.sh ${MAVEN_HOME}/start_maven.sh
WORKDIR ${MAVEN_HOME}
RUN mvn dependency:copy-dependencies -DoutputDirectory=${CUSTOM_LIBS}

ADD conf/zeppelin-env.sh ${Z_HOME}/conf/zeppelin-env.sh
ADD conf/spark.properties ${CUSTOM_PROPERTIES}/spark.properties

EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
