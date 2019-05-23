#!/bin/bash
PGPASSWORD=${POSTGRES_ZEPPELIN_PASSWORD} psql -U ${POSTGRES_ZEPPELIN_USER} -d ${POSTGRES_ZEPPELIN_DATABASE} -f /docker-entrypoint-initdb.d/create_schema.sql_