FROM microsoft/dotnet:1.1.1-runtime
MAINTAINER docker@jasonpoon.ca

WORKDIR /app
COPY out .

ENTRYPOINT ["dotnet", "scale.dll"]