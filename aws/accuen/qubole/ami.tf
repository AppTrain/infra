data "aws_caller_identity" "this" {
}

data "aws_ami" "ubuntu_1804" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # canonical
}

data "aws_ami" "qubole_bastion" {
  most_recent = true

  filter {
    name   = "name"
    values = ["qubole-bastion-hvm-amzn-linux"]
  }

  owners = ["808047697977"] #qubole # account number given by qubole
}
