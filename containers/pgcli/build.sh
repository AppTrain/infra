set -e 
export AWS_DEFAULT_REGION=us-west-2

docker build -t 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/pgcli .

eval $(aws ecr get-login --no-include-email)
docker push 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/pgcli
