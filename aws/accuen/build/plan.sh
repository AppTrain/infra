#!/bin/bash

terraform init
terraform plan -detailed-exitcode
# -out=path ? add plan file to artifact?
