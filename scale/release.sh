#!/bin/bash

name="scale"
version=`cat VERSION`
echo "version: $version"

dotnet restore
dotnet publish -c Release -o out

docker build . -t $name 
docker tag $name japoon.azurecr.io/generalfusion/$name:$version
docker tag $name japoon.azurecr.io/generalfusion/$name:latest
docker push japoon.azurecr.io/generalfusion/$name:$version
docker push japoon.azurecr.io/generalfusion/$name:latest
