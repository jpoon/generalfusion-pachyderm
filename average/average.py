#!/usr/bin/env python

import sys
import os
import numpy as np

def average(experimentDir, outputFile):
    """
    Calculates average given waveforms found in `experimentDir`
    saving output to `outputFile`
    """
    for dirpath, _, filenames in os.walk(experimentDir):
        sensorDataList = []

        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            sensor = open(filepath).read().splitlines()
            sensorDataList.append(sensor)

        mean = np.array(sensorDataList).astype(float).mean(axis=0)
        np.savetxt(outputFile, mean, newline='\n')
        print "Saving average =", outputFile

def main(argv):
    """
    Walks input directory calling `average` for each experiment
    """
    print "Args =", argv
    if len(argv) != 2:
        print "Expected 2 args; got", len(argv)
        return 1

    inputDir = argv[0]
    outputDir = argv[1]

    for dirpath, dirnames, _ in os.walk(inputDir):
        for dirname in dirnames:
            average(os.path.join(dirpath, dirname), os.path.join(outputDir, dirname))

    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))