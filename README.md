# Docker based Zeppelin

Preconfigured and dockerized [Zeppelin](https://zeppelin.apache.org/docs/0.8.1/setup/deployment/docker.html) with internal [Spark](http://spark.apache.org/docs/latest/index.html).

## Introduction

[Apache Spark](https://spark.apache.org) is a fast and general engine for large-scale data processing.

[Apache Zeppelin](http://zeppelin.apache.org/) is a Web-based notebook that enables data-driven, 
interactive data analytics and collaborative documents with SQL, Scala and more.

The Zeppelin Notebooks are placed in its [own repository](https://github.com/marhan/zeppelin-notebook-samples) and will be checked out as git submodule.

## Checkout

    git clone git@github.com:marhan/docker-zeppelin.git
    git submodule update --init

## Start complete stack

    docker-compose up
    
## Access WebUIs

* [Zeppelin](http://localhost:8080) 
    
## Docker Images used

- [Zeppelin](https://hub.docker.com/r/apache/zeppelin)
- [Postgres](https://hub.docker.com/_/postgres)
- [Adminer](https://hub.docker.com/_/adminer/)
- [Minio](https://hub.docker.com/r/minio/minio/)
- [Minio Client](https://hub.docker.com/r/minio/mc)

## Development

### Recreate one specific container

    docker-compose up --force-recreate <container_name>
    
### Remove all containers

    docker-compose rm --force -v
