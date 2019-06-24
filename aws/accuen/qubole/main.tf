terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "qubole.state"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

variable env {
  description = "environment name"
  default = "qubole"
}

variable vpc_azs {
  description = "aws availability zones within a vpc"
  type        = "list"

  default =  [
    "us-west-2a", 
    "us-west-2b",
  ]
}

resource "aws_key_pair" "jeremiah" {
    key_name = "annalect-dig-${var.env}-jeremiah"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJG9/JrL8z7wciJIdjkKoHh7G7OfgOxtO/6+JwAbVN/sfgpPZ2tlCKHQEluvCvqj8mAj12EIKJY35eWd4LTQycWDXtlQ3oqwrUUsZ5YWyKIKO2WZKTnGuqH5eQrSiVBlocbDt1fiXIkE1CYvGPjVa+dTGSiva0wTjLmSrH7wC6tFmLN1k+JTqEqkYMuwCHY4e89TE64bgTYHtMbaRIzLQsHwL5Rgm0XTh4SMAgW68KhQy8Te1BZD0+60e2unUCrObP8GE0liDUsfmNdslRKzj88KXh3wW+NYuz1hd9spzNUJ15/o5XU6WB46AzLYBePizcKSxGhscxPDB/YwWoyxsJETqj2lA/kPsnCEMV9ERO3w/fgH4/2+LnUmwvr8zNjVgYuAWFUkyvKrPDhnBYL88t7PM3jXJyDPm/CGhbNA+ILs4TpfIvAMn16GjsCc2zdEp3AAXzATF5s/J+Qp5V5zAsDnn5eNsHwABFVQ+Z2PrSLfDz+DY97EdxFCpfL+XMR6TO4wUEntBz6wx9t7Tunp4xzUk/t8D6sGpNIkTeLwnIMmsBa2yzxBkO7unpFF/5NzZexsXjTZFkVeSB91XurDf69Kw+45Q9Xfals+68Ut086/GQiO8Diq7D7fA3oit2yVA9VALbTsvHdajjEGcIeyKnaPGSK41G6et+Igju+rdoWQ== Jeremiah’siPhone"

}

resource "aws_key_pair" "qubole_account" {
  key_name   = "annalect-dig-${var.env}-qubole"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCh9Op7bZRLYUBuOuQjRkHdjToWIninu97+aZW3Pug4oups/XgTeNw+Qnhl7xQjKrkc7iAqlAmNiL7Ln7LWFj/BlMFTiHzb8WjZCFf/z+49mZ5U80zoCHvEcAAYntrAqvc6+W3z7gE/dp3knFlEu2Q3RZh7D1uxXDb3WxVQyrnTGWeJPzxPYRBjOEMosJI21vv1FG2ze62d/1PCIhH4HOM7OPA+YzlCRSOn27Icu2vbo7x26n17MxlYnjOgKBC7JpzktOc88tclrIzUAkKNuckN/HTcUskx9vbm/zriaTcUnVgns+wFc8z/2o9TXHjVXRN8a1iMh/lm4Sd1pZR9wvv/"
}   

variable qubole_access_ips {
  description = "list of IP addresses to access bastion from qubole"
  default = [
      "54.243.39.255/32",
      "54.204.43.32/32",
      "23.23.178.159/32",
      "52.44.223.209/32",
  ]  
}

variable annalect_access_ips {
  description = "list of IP addresses to access bastion from qubole"
  default = [
      "104.174.30.104/32",
      "99.181.60.75/32",
      "108.193.156.146/32",
      "64.132.248.102/32",
      "71.143.194.189/32",
      "157.131.101.48/32",
      "104.129.204.70/32",
      "76.14.116.12/32",
      "12.154.43.233/32",
      "73.42.71.80/32",
      "104.129.196.81/32",
      "104.136.141.97/32", # jeremiah office
    ]  
}