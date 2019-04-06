#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# 4 nodes, bind to port 8000
gunicorn -w 4 portfolio.wsgi:application --bind 0.0.0.0:8000

# exec "$@"