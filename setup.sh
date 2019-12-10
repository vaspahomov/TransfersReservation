#!/bin/bash
set -e
service mysql start
mysql < /databaseCreation/createTables.sql
service mysql stop