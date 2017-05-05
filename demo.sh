#!/bin/bash

pachctl list-repo

pachctl list-file raw master 1

# show graph

pachctl get-file calibration master calibration.csv

pachctl create-pipeline -f scale.json

pachctl list-pipeline 

pachctl list-repo

pachctl create-pipelien -f average.json
