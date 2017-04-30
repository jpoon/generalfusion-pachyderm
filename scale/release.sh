#!/bin/bash

version=`cat VERSION`
echo "version: $version"

docker build . -t scale
docker tag scale japoon.azurecr.io/generalfusion/scale:$version
docker tag scale japoon.azurecr.io/generalfusion/scale:latest
docker push japoon.azurecr.io/generalfusion/scale:$version
docker push japoon.azurecr.io/generalfusion/scale:latest

