# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
EXPOSE 80
WORKDIR /source

# copy csproj and restore as distinct layers
COPY ./src/same-same-but-diffy.sln same-same-but-diffy.sln
COPY ./src/WeatherForecast.Web.Api/*.csproj ./WeatherForecast.Web.Api/
RUN dotnet restore

# copy everything else and build app
COPY ./src/WeatherForecast.Web.Api/. ./WeatherForecast.Web.Api/
WORKDIR /source/WeatherForecast.Web.Api
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "WeatherForecast.Web.Api.dll"]