#!/bin/bash

name="average"
version=`cat VERSION`
echo "version: $version"

docker build . -t $name 
docker tag $name japoon.azurecr.io/generalfusion/$name:$version
docker tag $name japoon.azurecr.io/generalfusion/$name:latest
docker push japoon.azurecr.io/generalfusion/$name:$version
docker push japoon.azurecr.io/generalfusion/$name:latest
