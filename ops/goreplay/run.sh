docker build -t same-same-but-diffy-image -f ops/Dockerfile .

docker-compose -f ops/goreplay/docker-compose.yml up