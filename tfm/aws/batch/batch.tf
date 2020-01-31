resource "aws_batch_compute_environment" "this" {
  compute_environment_name = var.compute_environment_name

  compute_resources {
    instance_role = aws_iam_instance_profile.ecs_instance.arn
    instance_type = var.instance_types
    max_vcpus     = var.max_vcpus
    min_vcpus     = var.min_vcpus
    desired_vcpus = var.desired_vcpus

    security_group_ids = [
      aws_security_group.batch.id,
    ]

    subnets = var.subnets
    type    = var.compute_resource_type
  }

  service_role = aws_iam_role.batch_service.arn
  type         = "MANAGED"

  # lifecycle {
  #   ignore_changes = [
  #     "compute_resources",
  #     # TODO: how to specify compute_resources[desired_vcpus] to ignore??
  #   ]
  # }
  depends_on = [aws_iam_role_policy_attachment.batch_service]
}

resource "aws_batch_job_queue" "this" {
  name     = var.job_queue_name
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    aws_batch_compute_environment.this.arn,
  ]
  # "${aws_batch_compute_environment.test_environment_2.arn}"

  depends_on = [
    aws_batch_compute_environment.this,
    aws_batch_job_definition.this,
  ]
}

resource "aws_batch_job_definition" "this" {
  name = var.job_definition_name
  type = "container"

  container_properties = var.container_properties
}
