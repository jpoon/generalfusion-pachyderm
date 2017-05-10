#!/bin/bash

#doitlive speed: 10000
#doitlive shell: /usr/local/bin/zsh
#doitlive prompt: damoekri

kubectl get node
kubectl get deployments

pachctl list-repo

# Input: Raw Sensor
pachctl list-file raw master injector1
pachctl get-file raw master injector1/sensor1.csv | less
open data/graph/1-raw.png

# Input: Sensor Calibration
pachctl get-file calibration master calibration.csv

# Pipeline: Scale
pachctl create-pipeline -f scale.json
pachctl list-repo
pachctl list-file scale master injector1

# Pipeline: Average
pachctl create-pipeline -f average.json
pachctl list-repo
pachctl list-file average master
pachctl get-file average master injector1.png > injector1-average.png
open injector1-average.png

# Input: NEW Sensor Calibration
pachctl start-commit calibration master
pachctl delete-file calibration master calibration.csv
echo "0.8,1,1.1" | pachctl put-file calibration master calibration.csv
pachctl finish-commit calibration master

pachctl list-commit average
pachctl get-file average master injector1.png > injector1-new-average.png
open injector1-new-average.png
