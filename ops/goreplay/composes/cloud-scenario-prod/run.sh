docker build -t same-same-but-diffy:prod -f ops/Dockerfile .
docker build -t goreplay -f ops/goreplay/Dockerfile .

docker-compose --env-file cred.env -f ops/goreplay/composes/cloud-scenario-prod/docker-compose.yml up