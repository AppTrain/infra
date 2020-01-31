output "security_group_id" {
  value = aws_security_group.batch.id
}

output "batch_job_queue_arn" {
  value = aws_batch_job_queue.this.arn
}
