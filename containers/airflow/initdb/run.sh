echo "airflow initidb"
sleep 3
airflow initdb 
pg_dump -U airflow -h db  airflow > /opt/local/src/airflow.sql