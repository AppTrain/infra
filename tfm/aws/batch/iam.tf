#data "aws_caller_identity" "this" {}

data "aws_iam_policy_document" "ec2_assume" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "batch_assume" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "batch.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "art" {
  statement {
    effect = "Allow"

    actions = [
      "secretsmanager:ListSecrets",
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetRandomPassword",
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:ListSecretVersionIds",
    ]
    resources = ["*"]
    # resources = [
    #   #"arn:aws:secretsmanager:us-west-2:${data.aws_caller_identity.this.account_id}:secret:*",
    #   #"arn:aws:secretsmanager:::*:*",
    # ]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

## ECS INSTANCE
resource "aws_iam_role" "ecs_instance" {
  name               = "aws_ecs_batch_${var.env}"
  path               = "/service/"
  description        = "aws batch ecs instance role in ${var.env}"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

resource "aws_iam_role_policy_attachment" "ecs_instance" {
  role       = aws_iam_role.ecs_instance.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy" "art_statements" {
  name   = "art_batch_policy_${var.env}"
  role   = aws_iam_role.ecs_instance.id
  policy = data.aws_iam_policy_document.art.json
}

resource "aws_iam_instance_profile" "ecs_instance" {
  name = "aws_ecs_batch_${var.env}"
  role = aws_iam_role.ecs_instance.name
}

## BATCH SERVICE

resource "aws_iam_role" "batch_service" {
  name               = "aws_batch_${var.env}"
  path               = "/service/"
  description        = "aws batch service role in ${var.env}"
  assume_role_policy = data.aws_iam_policy_document.batch_assume.json
}

resource "aws_iam_role_policy_attachment" "batch_service" {
  role       = aws_iam_role.batch_service.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}
