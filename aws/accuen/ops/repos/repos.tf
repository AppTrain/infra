
# module repos {
#     source = "../../../terraform-modules/repos"
# }

module apd {
    source = "../../../../terraform-modules/repository_existing"
    name = "apd"
    description = "accuen pipeline data"
}

module smp {
    source = "../../../../terraform-modules/repository_existing"
    name = "smp"
    description = "smp"
}


module docker_python {
    source = "../../../../terraform-modules/repository_existing"
    name = "docker-python"
    description = "docker python base image"
    #topics = ["python", "docker"]
}

module airflow {
    source = "../../../../terraform-modules/repository_existing"
    name = "airflow"
    description = "airflow baked into docker"
    #topics = ["airflow", "python", "docker"]
}

module entrypoint {
    source = "../../../../terraform-modules/repository_existing"
    name = "entrypoint"
    description = "some dev ops documentation"
    #topics = ["documentation"]
}

module docker_ops_tools {
    source = "../../../../terraform-modules/repository_existing"
    name = "docker-ops-tools"
    description = "docker image containing ops tools"
    #topics = ["docker", "terraform", "ansible", "awscli"]
}

# TODO: this will not need a docker repo
# module packer_build_env {
#     source = "../../../../terraform-modules/repository"
#     name = "packer-build-env"
#     description = "create ami for build environment"
#     topics = ["packer", "aws", "ami"]
# }