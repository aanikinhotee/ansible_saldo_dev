#!/bin/bash

docker run -d --name oracle_db \
-p 1521:1521 -p 5500:5500 \
-e ORACLE_PWD=5846cb3f650dfb9f \
-e ORACLE_CHARACTERSET=AL32UTF8 \
-v oracle-db:/opt/oracle/oradata \
oracle/database:18.4.0-xe
