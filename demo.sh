#!/bin/bash

set -e
BUILD=$(git rev-parse --short HEAD)

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

docker run \
  --rm -it \
  --net=host \
  -e USERDATA_MTD_URL="localhost/user-data" \
  -e DATAHUB_USER=XXXXXX \
  -e DATAHUB_PW=XXXXXXX \
  -e TARGET_BUCKET_PREFIX="s3://sentinel3-rbt/relorbit" \
  -e SOURCE_PRODUCT="https://scihub.copernicus.eu/s3/odata/v1/Products('6b2aa89e-7fbf-4e05-b570-db9310edbdbe')/\$value" \
asamerh4/sentinel3-s3-ingester:$BUILD
