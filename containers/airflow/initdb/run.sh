echo "Every story has a beginning"
env
airflow initdb 
pg_dump -U airflow  airflow > /opt/local/src/airflow.sql