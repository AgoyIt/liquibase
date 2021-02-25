#!/bin/bash
./scripts/liquibase_setup.sh

liquibase diffChangeLog  --changeLogFile=dbchangelog.xml
cat dbchangelog.xml
