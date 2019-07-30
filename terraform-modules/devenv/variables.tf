variable "env" {
    type = "string"
}

variable "public_key" {
    type = "string"
}

variable "builder_count" {
    type = "string"
    default = 1
}

variable "vpc_azs" {
    type = "list"
    default = [
        "us-west-2a", 
        "us-west-2b",
    ]
}

variable "access_ips" {
    type = "list"
}