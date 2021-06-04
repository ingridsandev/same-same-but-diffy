#!/bin/sh

while read line; do
    if [ -s "prod_requests.gor" ] 
    then
        >&2 aws s3api put-object --bucket goreplay-poc-eu-west-1 --key "prod_requests.gor" --body 'prod_requests.gor' --region eu-west-1 --output json
    fi 
    echo $line
done;