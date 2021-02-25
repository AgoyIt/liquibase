#!/bin/bash
: ${DB_USERNAME?"Please provide the <DB_USERNAME>"}
: ${DB_PASSWORD?"Please provide the <DB_PASSWORD>"}
: ${DB_HOST?"Please provide the <DB_HOST>"}
: ${DB_PORT?"Please provide the <DB_PORT>"}
: ${DB_NAME_1?"Please provide the <DB_NAME_1>"}
: ${DB_NAME_2?"Please provide the <DB_NAME_2>"}

cat <<CONF > /liquibase.properties
  driver: org.postgresql.Driver
  classpath:/usr/local/bin/postgresql-42.2.5.jar
  url: jdbc:postgresql://$DB_HOST:$DB_PORT/$DB_NAME_1
  referenceUrl: jdbc:postgresql://$DB_HOST:$DB_PORT/$DB_NAME_2
  username: $DB_USERNAME
  password: $DB_PASSWORD
  referenceUsername: $DB_USERNAME
  referencePassword: $DB_PASSWORD
CONF
