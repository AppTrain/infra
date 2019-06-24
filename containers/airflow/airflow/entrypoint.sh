#!/usr/bin/env bash

# : "${REDIS_HOST:="redis"}"
# : "${REDIS_PORT:="6379"}"
# : "${REDIS_PASSWORD:=""}"

# : "${POSTGRES_HOST:="postgres"}"
# : "${POSTGRES_PORT:="5432"}"
# : "${POSTGRES_USER:="airflow"}"
# : "${POSTGRES_PASSWORD:="airflow"}"
# : "${POSTGRES_DB:="airflow"}"

# Defaults and back-compat
# : "${AIRFLOW__CORE__FERNET_KEY:=${FERNET_KEY:=$(python -c "from cryptography.fernet import Fernet; FERNET_KEY = Fernet.generate_key().decode(); print(FERNET_KEY)")}}"
# : "${AIRFLOW__CORE__EXECUTOR:=${EXECUTOR:-Sequential}Executor}"

# export \
#   AIRFLOW__CELERY__BROKER_URL \
#   AIRFLOW__CELERY__RESULT_BACKEND \
#   AIRFLOW__CORE__EXECUTOR \
#   AIRFLOW__CORE__FERNET_KEY \
#   AIRFLOW__CORE__LOAD_EXAMPLES \
#   AIRFLOW__CORE__SQL_ALCHEMY_CONN \

# AIRFLOW__CORE__LOAD_EXAMPLES=False
# REDIS_PREFIX=:${REDIS_PASSWORD}@
# AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgresql+psycopg2://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB"
# AIRFLOW__CELERY__RESULT_BACKEND="db+postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB"
# AIRFLOW__CELERY__BROKER_URL="redis://$REDIS_PREFIX$REDIS_HOST:$REDIS_PORT/1"


# case "$1" in
#   webserver)
#     airflow initdb

#     # Install creds
#     # for f in /docker-entrypoint-initenv.d/*; do
#     #     case "$f" in *.py)
#     #         echo "!! $f"
#     #         python "$f"
#     #     esac
#     # done

#     if [ "$AIRFLOW__CORE__EXECUTOR" = "LocalExecutor" ]; then
#       # With the "Local" executor it should all run in one container.
#       airflow scheduler &
#     fi
#     exec airflow webserver


#     ;;
#   worker|scheduler)
#     # To give the webserver time to run initdb.
#     sleep 10
#     exec airflow "$@"

#     airflow [worker,scheduler] [*]
#     ;;
#   *)
#     # The command is something like bash, not an airflow subcommand. Just run it in the right environment.
#     exec "$@"
#     ;;
# esac

which airflow
exec airflow --version
exec airflow "$@"