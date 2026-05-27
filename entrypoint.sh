#!/bin/sh
set -e

if [ -z "$MSSQL_SA_PASSWORD" ]; then
  echo "MSSQL_SA_PASSWORD is required"
  exit 1
fi

if [ -z "$SQLCMDPASSWORD" ]; then
  export SQLCMDPASSWORD="$MSSQL_SA_PASSWORD"
fi

/opt/mssql/bin/sqlservr &

sqlservr_pid=$!

for i in $(seq 1 60); do
  if /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -C -Q "SELECT 1" >/dev/null 2>&1; then
    break
  fi
  sleep 2
 done

/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -C -Q "IF DB_ID('Pos') IS NULL CREATE DATABASE [Pos];"

if [ ! -f /var/opt/mssql/.pos_schema_initialized ]; then
  /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -C -d Pos -i /sql/pos_db_script.sql
  touch /var/opt/mssql/.pos_schema_initialized
fi

wait $sqlservr_pid
