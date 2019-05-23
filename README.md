# Docker based Zeppelin
Preconfigured and dockerized [Zeppelin](https://zeppelin.apache.org/docs/0.8.1/setup/deployment/docker.html) with internal [Spark](http://spark.apache.org/docs/latest/index.html).

## Introduction

[Apache Spark](https://spark.apache.org) is a fast and general engine for large-scale data processing.

[Apache Zeppelin](http://zeppelin.apache.org/) is a Web-based notebook that enables data-driven, 
interactive data analytics and collaborative documents with SQL, Scala and more.

## Start complete stack

    docker-compose up
    
## Access WebUIs

* [Zeppelin](http://localhost:8080) 
    
## Docker Images used

- [Zeppelin](https://hub.docker.com/r/apache/zeppelin)
- [Postgres](https://hub.docker.com/_/postgres)
- [Adminer](https://hub.docker.com/_/adminer/)

## Development

### Recreate one specific container

    docker-compose up --force-recreate <container_name>
    
### Remove all containers

    docker-compose rm --force -v
