FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ENV DOTNET_CLI_TELEMETRY_OPTOUT='true'

ARG LBHPACKAGESTOKEN
ENV LBHPACKAGESTOKEN=$LBHPACKAGESTOKEN

ENV SONAR_TOKEN=599yxnmec858czgnyve4g6aqfkh5prunshpysepq

WORKDIR /app

RUN apt-get update && apt-get install -y openjdk-11-jdk
RUN dotnet tool install --global dotnet-sonarscanner --version 5.6.0
ENV PATH="$PATH:/root/.dotnet/tools"

RUN dotnet sonarscanner begin /k:"dummy /o:"dummy" /d:sonar.host.url=https://sonarcloud.io /d:sonar.login="${SONAR_TOKEN}"
