docker build -t same-same-but-diffy:prod -f ops/Dockerfile .
docker build -t goreplay -f ops/goreplay/Dockerfile .

docker-compose --env-file ops/parallel-builds/dc.env -f ops/parallel-builds/docker-compose.yml up 