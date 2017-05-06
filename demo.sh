#!/bin/bash

kubectl get all

pachctl list-repo

pachctl list-file raw master 1

pachctl get-file raw master 1/sensor1.csv

# show graph

pachctl get-file calibration master calibration.csv

pachctl create-pipeline -f scale.json

pachctl list-repo

pachctl list-file scale master 1

# show graph

pachctl create-pipeline -f average.json

pachctl list-repo

pachctl list-file average master

# new calibration

pachctl start-commit calibration master
pachctl delete-file calibration master calibration.csv
echo "0.8,1,1.1" | pachctl put-file calibration master calibration.csv
pachctl finish-commit calibration master



