dotnet restore ./Current.Web.Api
dotnet build ./Current.Web.Api

docker build -t same-same-but-diffy-image -f ops/Dockerfile .

docker-compose up