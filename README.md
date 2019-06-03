# Docker based Zeppelin (Work in progress)

Dockerized and preconfigured [Zeppelin](https://zeppelin.apache.org/docs/0.8.1/setup/deployment/docker.html).

## Introduction

[Apache Zeppelin](http://zeppelin.apache.org/) is a Web-based notebook that enables data-driven, 
interactive data analytics and collaborative documents with SQL, Scala and more.

[Apache Spark](https://spark.apache.org) is a fast and general engine for large-scale data processing.

[Apache Hadoop](https://hadoop.apache.org/) is a open-source software for reliable, scalable, distributed computing.

The Zeppelin Notebooks are placed in its [own repository](https://github.com/marhan/zeppelin-notebook-samples) and will be checked out as git submodule.

## Used versions

- Zeppelin version = 0.8.1
- Spark version = 2.4.3
- Hadoop version = 2.8.5

## Requirements

### Software
- Docker
- Docker Compose

### Hardware (complete stack)
- RAM = 8GB

### Hardware (zeppelin only)  
- RAM = 2GB

## Checkout

    git clone --recursive git@github.com:marhan/docker-zeppelin.git
    
## Start complete stack

    docker-compose up -d
    
## WebUIs

* [Zeppelin](http://localhost:10000) 
* [Adminer (Postgres)](http://localhost:10002) 
* [Webdav Web Server](http://localhost:10003) 
* [Minio Cloud Storage Server](http://localhost:10004) 

## Source of data used in notebooks

- [London population](https://github.com/datasets/london-population)
- [Using data mining for bank direct marketing](http://repositorium.sdum.uminho.pt/handle/1822/14838)
    
## Pulled Docker Images

- [Zeppelin](https://hub.docker.com/r/apache/zeppelin)
- [Postgres](https://hub.docker.com/_/postgres)
- [MariaDB](https://hub.docker.com/_/mariadb)
- [Adminer](https://hub.docker.com/_/adminer/)
- [Minio](https://hub.docker.com/r/minio/minio/)
- [WebDAV](https://hub.docker.com/r/bytemark/webdav/)

## Development

### Docker Compose CLI

#### Recreate zeppelin image and container
    
    docker-compose rm -f -s -v zeppelin
    docker rmi zeppelin    
    docker-compose up --force-recreate zeppelin
    
#### Remove all containers and volumes

    docker-compose stop
    docker-compose rm -f -v
    
#### Bash into a running container

    docker-compose exec zeppelin bash
    
### Docker CLI

#### Show running containers

    docker ps # all
    docker ps --format '{{.Names}}' # names only
    
#### Delete all containers

    docker rm $(docker ps -a -q)
    
#### Delete all images

    docker rmi $(docker images -q)

### TODO

- [ ] User Login
- [ ] Different permissions for users
