#!/bin/bash
./scripts/liquibase_setup.sh

liquibase --changeLogFile=./dbchangelog.xml diffChangeLog > /dev/null
cat ./dbchangelog.xml
