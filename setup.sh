#!/bin/bash
set -ex

pachctl port-forward & 

cd data

# calibration
pachctl create-repo calibration
echo "1,1,1" | pachctl put-file calibration master -c calibration.csv

# data
cd experiment
pachctl create-repo raw
pachctl put-file -r raw master -c -f 1
