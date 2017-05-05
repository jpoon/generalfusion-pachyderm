#!/bin/bash

pachctl list-repo

pachctl create-pipeline -f scale.json

pachctl create-pipelien -f average.json
