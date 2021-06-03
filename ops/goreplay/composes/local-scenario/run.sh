docker build -t same-same-but-diffy:prod -f ops/Dockerfile .
docker build -t same-same-but-diffy:dev -f ops/Dockerfile .

docker build -t goreplay -f ops/goreplay/Dockerfile .

docker-compose -f ops/goreplay/composes/local-scenario/docker-compose.yml up