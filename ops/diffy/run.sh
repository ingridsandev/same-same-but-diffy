docker build -t same-same-but-diffy-image -f ops/Dockerfile .

docker-compose -f ops/diffy/docker-compose.yml up