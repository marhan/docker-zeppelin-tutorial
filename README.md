# Docker based Zeppelin (Work in progress)

Preconfigured and dockerized [Zeppelin](https://zeppelin.apache.org/docs/0.8.1/setup/deployment/docker.html) with internal [Spark](http://spark.apache.org/docs/latest/index.html).

## Introduction

[Apache Spark](https://spark.apache.org) is a fast and general engine for large-scale data processing.

[Apache Zeppelin](http://zeppelin.apache.org/) is a Web-based notebook that enables data-driven, 
interactive data analytics and collaborative documents with SQL, Scala and more.

## Hints

The Zeppelin Notebooks are placed in its [own repository](https://github.com/marhan/zeppelin-notebook-samples) and will be checked out as git submodule.

## Requirement

### Software
- Docker
- Docker Compose

### Hardware (complete stack)
- RAM = 6GB

### Hardware (zeppelin only)  
- RAM = 2GB

## Checkout

    git clone --recursive git@github.com:marhan/docker-zeppelin.git
    
## Start complete stack

    docker-compose up
    
## Access WebUIs

* [Zeppelin](http://localhost:10000) 
* [Adminer (Postgres)](http://localhost:10002) 
* [Webdav Web Server](http://localhost:10003) 
* [Minio Cloud Storage Server](http://localhost:10004) 

## Source of data

- [London population](https://github.com/datasets/london-population)
- [Using data mining for bank direct marketing](http://repositorium.sdum.uminho.pt/handle/1822/14838)
    
## Docker Images used

- [Zeppelin](https://hub.docker.com/r/apache/zeppelin)
- [Postgres](https://hub.docker.com/_/postgres)
- [Adminer](https://hub.docker.com/_/adminer/)
- [Minio](https://hub.docker.com/r/minio/minio/)

## Development

### Recreate one specific container

    docker-compose stop
    docker-compose up --force-recreate <container_name>
    
### Remove all containers

    docker-compose stop
    docker-compose rm --force -v
    
### Bash into running container

    docker-compose exec <container_name> bash
    
### Download dependencies

    cd zeppelin
    mvn dependency:copy-dependencies -DoutputDirectory=libs
