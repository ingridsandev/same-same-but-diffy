FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine3.13 AS base

WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine3.12 AS build
COPY ./src/same-same-but-diffy.sln ./src/same-same-but-diffy.sln
COPY ./src/WeatherForecast.Web.Api/*.csproj ./src/WeatherForecast.Web.Api/
RUN dotnet restore "/src/WeatherForecast.Web.Api/WeatherForecast.Web.Api.csproj"

COPY ./src/WeatherForecast.Web.Api/. ./WeatherForecast.Web.Api/

COPY . . 

RUN dotnet build "/src/WeatherForecast.Web.Api/WeatherForecast.Web.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish --no-restore "/src/WeatherForecast.Web.Api/WeatherForecast.Web.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WeatherForecast.Web.Api.dll"]