FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine3.13 AS base

WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine3.12 AS build
COPY ./src/same-same-but-diffy.sln ./src/same-same-but-diffy.sln
COPY ./src/Hackathon.Web.Api/*.csproj ./src/Hackathon.Web.Api/
RUN dotnet restore "/src/Hackathon.Web.Api/Hackathon.Web.Api.csproj"

COPY ./src/Hackathon.Web.Api/. ./Hackathon.Web.Api/

COPY . . 

RUN dotnet build "/src/Hackathon.Web.Api/Hackathon.Web.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish --no-restore "/src/Hackathon.Web.Api/Hackathon.Web.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Hackathon.Web.Api.dll"]