#!/bin/bash

#doitlive speed: 10000
#doitlive shell: /usr/local/bin/zsh
#doitlive prompt: damoekri

kubectl version --short=true
kubectl get node
kubectl get all

pachctl list-repo

# Input: Raw Sensor
pachctl list-file raw master 1
pachctl get-file raw master 1/sensor1.csv | less

# Input: Sensor Calibration
pachctl get-file calibration master calibration.csv

# Pipeline: Scale
pachctl create-pipeline -f scale.json
pachctl list-repo
pachctl list-file scale master 1

# Pipeline: Average
pachctl create-pipeline -f average.json
pachctl list-repo
pachctl list-file average master
pachctl get-file average master 1.png > 1-average.png
open -a "/Applications/Google Chrome.app/" 1-average.png

# Input: NEW Sensor Calibration
pachctl start-commit calibration master
pachctl delete-file calibration master calibration.csv
echo "0.8,1,1.1" | pachctl put-file calibration master calibration.csv
pachctl finish-commit calibration master

pachctl get-file average master 1.png > 1-new-average.png
open -a "/Applications/Google Chrome.app/" 1-new-average.png
