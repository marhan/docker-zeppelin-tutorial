FROM apache/zeppelin:0.8.1
MAINTAINER Markus Hanses <me@markushanses.de>

ENV SPARK_HOME="/opt/spark"
ENV SPARK_ARTIFACT_VERSION="spark-2.4.3-bin-hadoop2.7.tgz"

RUN echo "$LOG_TAG Download Spark binary" && \
    wget -O /tmp/spark.tgz http://apache.lauf-forum.at/spark/spark-2.4.3/$SPARK_ARTIFACT_VEWRSION && \
    tar -zxvf /tmp/spark.tgz && \
    rm -rf /tmp/spark.tgz && \
    mv /tmp/$SPARK_ARTIFACT_VEWRSION $SPARK_HOME

RUN apt-get update && apt-get install -y maven

ADD conf/pom.xml /opt/maven/pom.xml
WORKDIR /opt/maven/
RUN mvn dependency:copy-dependencies -DoutputDirectory=/opt/custom_lib

#ADD conf/zeppelin.sh /zeppelin/bin/zeppelin.sh
ADD conf/zeppelin-env.sh /zeppelin/conf/zeppelin-env.sh
ADD conf/spark.properties /opt/spark.properties


EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
