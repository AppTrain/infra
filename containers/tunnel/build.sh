set -e 

THIS_DIR=$(pwd)
KEY_DIR=$THIS_DIR/keys
echo "THIS DIR: $THIS_DIR"
echo "KEY DIR: $KEY_DIR"

mkdir $KEY_DIR
cp ~/.annalect/ssh/* keys
docker build -t 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/tunnel .
docker push 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/tunnel
rm -rf $KEY_DIR

