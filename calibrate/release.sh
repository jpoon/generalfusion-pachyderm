#!/bin/bash

version=`cat VERSION`
echo "version: $version"

docker build . -t japoon.azurecr.io/generalfusion/calibrate:$version
docker push japoon.azurecr.io/generalfusion/calibrate:$version
docker push japoon.azurecr.io/generalfusion/calibrate:latest

