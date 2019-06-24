all:
	cd base && docker build . -t annalect/airflow-base
	cd airflow && docker build . -t annalect/airflow:1.10.3

	#cd initdb && docker-compose up --abort-on-container-exit