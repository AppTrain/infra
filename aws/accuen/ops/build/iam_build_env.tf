resource "aws_iam_policy" "build_env" {
  name        = "${var.env}-buildenv"
  policy      = "${data.aws_iam_policy_document.build_env.json}"
  path        = "/annalect/"
  description = "policy to define ec2 instance permissions in the `${var.env}` environment"
}

data "aws_iam_policy_document" "build_env" {

  # SSM 
  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParameters",
      "ssm:GetParameter",
    ]

    resources = [
      # TODO: Can this be tightened by env? or something else?
      "arn:aws:ssm::${data.aws_caller_identity.this.account_id}:parameter/*",
    ]
  }

  # SECRETS MANAGER
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:List*",
      "secretsmanager:Describe*",
      "secretsmanager:Get*",
    ]
    resources = [
      # TODO: Can this be tightened by env? or something else?
      "arn:aws:secretsmanager::${data.aws_caller_identity.this.account_id}:secret:*",
    ]
  }

  # CLOUD WATCH
  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:PutMetricData",
    ]
    resources = ["*"]
  }

  # SQS
  statement {
    effect = "Allow"
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage",
      "sqs:SendMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",

    ]
    resources = ["*"]
  }

  # SNS
  statement {
    effect = "Allow"
    actions = [
      "sns:Publish",
    ]
    resources = ["*"]
  }

  # ECS
  statement {
    effect = "Allow"
    actions = [
      "ecs:StartTask",
      "ecs:StopTask",
      "ecs:DiscoverPollEndpoint",
      "ecs:StartTelemetrySession",
      "ecs:RegisterContainerInstance",
      "ecs:DeregisterContainerInstance",
      "ecs:DescribeContainerInstances",
      "ecs:Submit*",
      "ecs:Poll",
      "ecs:DescribeTasks",
    ]
    resources = ["*"]
  }

  # ECR
  statement {
    effect = "Allow"
    actions = [
      "ecr:*",
    ]
    resources = ["*"]
  }
  

  # EC2
  statement {
    effect = "Allow"
    actions = [
      "ec2:*",
      # "ec2:DescribeInstances",
      # "ec2:DescribeInstanceStatus",
      # "ec2:GetConsoleOutput",
      # "ec2:AssociateAddress",
      # "ec2:DescribeAddresses",
      # "ec2:DescribeSecurityGroups",
    ]

    resources = ["*"]
  }

  # S3
  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::some-name*",
    ]
  }

  # LOGS
  statement {
    effect = "Allow"

    actions = [
      "logs:PutLogEvents",
      "logs:CreateLogStream",
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups",
    ]

    resources = [
      # TODO: tighten to specific log group?
      "arn:aws:logs:::log-group:*", #/some/log/group*",
    ]
  }
}