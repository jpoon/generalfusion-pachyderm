FROM microsoft/dotnet:1.1-sdk-msbuild

WORKDIR /app
ADD . /app

RUN dotnet restore \
    && dotnet publish -c Release -o .
