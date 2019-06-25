variable "name" {
    type = "string"  
}

variable "description" {
    type = "string"
}

variable "topics" {
    type = "list"
    default = [
        "annalect"
    ]
}