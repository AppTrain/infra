variable "env" {
  description = "the environment all the things belong to"
}

variable "vpc_id" {
  description = "the vpc this batch env will run in"
}

variable "subnets" {
  description = "the subnet the batch service will run on"
}

variable "compute_environment_name" {
  description = "name of batch compute environment"
}

variable "job_queue_name" {
  description = "name of job queue"
}

variable "job_definition_name" {
  description = "job definition name"
}

variable "job_docker_image" {
  description = "docker image to execute job"
}

variable "container_properties" {
  description = "container properties for job docker image"
}

variable "instance_types" {
  default = [
    "c4.large",
  ]
}

variable "max_vcpus" {
  description = "the max"
  default     = 64
}

variable "min_vcpus" {
  description = "the min"
  default     = 0
}

variable "desired_vcpus" {
  description = "desired vcpus"
}

variable "compute_resource_type" {
  description = "EC2 or SPOT"
  default     = "EC2"
}
