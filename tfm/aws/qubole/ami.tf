data "aws_caller_identity" "this" {
}

data "aws_ami" "qubole_bastion" {
  most_recent = true

  filter {
    name   = "name"
    values = ["qubole-bastion-hvm-amzn-linux"]
  }

  owners = ["808047697977"] #qubole # account number given by qubole
}
