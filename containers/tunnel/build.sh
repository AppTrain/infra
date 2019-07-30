set -e 
export AWS_DEFAULT_REGION=us-west-2
THIS_DIR=$(pwd)
KEY_DIR=$THIS_DIR/keys
echo "THIS DIR: $THIS_DIR"
echo "KEY DIR: $KEY_DIR"

mkdir $KEY_DIR
cp ~/.annalect/ssh/* keys
docker build -t 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/tunnel .

eval $(aws ecr get-login --no-include-email)
docker push 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/tunnel
rm -rf $KEY_DIR

