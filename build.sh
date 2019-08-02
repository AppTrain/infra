#!/bin/bash
set -euo pipefail
export BUILD_CONTEXT=$(pwd)
export AWS_DEFAULT_REGION=us-west-2

echo "--- :shell: prepare build"
echo 

echo "--- use :aws: cli to :docker: login to :ecr:"
eval $(aws ecr get-login --no-include-email)

echo "--- :terraform: aws/accuen/ops/base"
cd aws/accuen/ops/base && ./build.sh
cd $BUILD_CONTEXT

# echo "--- :terraform: aws/accuen/ops/build"
# cd aws/accuen/ops/build && ./plan.sh
# cd $BUILD_CONTEXT
# TODO: fix permissions indicated in https://buildkite.com/accuenmedia/infra/builds/47#8b265f64-1db0-4fe4-9fb9-80c4cfd3c8b8

echo "--- :docker: build & push containers/tunnel"
cd containers/tunnel && ./build.sh
cd $BUILD_CONTEXT

echo "--- :docker: build & push containers/tunnel"
cd containers/pgcli && ./build.sh
cd $BUILD_CONTEXT 

echo "+++ the ending"
function inline_image {
  printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

inline_image https://media.giphy.com/media/QMsS2IxP812wbn4WeE/giphy.gif 'I believe it is done'