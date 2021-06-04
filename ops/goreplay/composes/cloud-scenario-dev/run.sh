#!/bin/bash

aws s3api get-object --bucket goreplay-poc-eu-west-1 --key "prod_requests.gor" "ops/goreplay/files/prod_requests.gor" --region eu-west-1 --output json
docker build -t same-same-but-diffy:dev -f ops/Dockerfile .
docker build -t goreplay -f ops/goreplay/Dockerfile .

docker-compose --env-file cred.env -f ops/goreplay/composes/cloud-scenario-dev/docker-compose.yml up