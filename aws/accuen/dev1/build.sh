#!/bin/bash
set -euo pipefail
export AWS_DEFAULT_REGION=us-west-2

terraform init
terraform plan -detailed-exitcode
# -out=path ? add plan file to artifact?
