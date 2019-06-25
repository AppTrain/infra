
# module repos {
#     source = "../../../terraform-modules/repos"
# }

module docker_python {
    source = "../../../terraform-modules/repository"
    name = "docker-python"
    description = "docker python base image"
    topics = ["python", "docker"]
}

module airflow {
    source = "../../../terraform-modules/repository"
    name = "airflow"
    description = "airflow baked into docker"
    topics = ["airflow", "python", "docker"]
}