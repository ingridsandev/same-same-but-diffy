dotnet restore ./Current.Web.Api
dotnet build ./Current.Web.Api

docker build -t same-same-but-diffy-image -f Dockerfile .

docker run -d -p 9990:80 --name same-same-but-diffy-primary same-same-but-diffy-image
docker run -d -p 9991:80 --name same-same-but-diffy-secondary same-same-but-diffy-image

docker run -d -p 9992:80 --name same-same-but-diffy-candidate same-same-but-diffy-image