#!/bin/bash

set -eu

terraform apply -auto-approve
sleep 60
ansible-playbook buildenv-config.yml
