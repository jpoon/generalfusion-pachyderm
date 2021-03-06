﻿using System;
using System.Globalization;
using System.IO;
using System.Linq;

namespace scale
{
    class Program
    {
        static void Main(string[] args)
        {
            args.ToList().ForEach(a => { Console.WriteLine($"arg={a}"); });

            var calibrationDir = args[0];
            var experimentsDir = args[1];
            var outputRootDir = args[2];

            var calibrationFilePath = Directory.GetFiles(calibrationDir).First();
            var calibrations = File.ReadAllText(calibrationFilePath).Split(',');

            foreach (var experimentDir in Directory.EnumerateDirectories(experimentsDir)) {
                var sensorFilePaths = Directory.GetFiles(experimentDir);
                for (var i = 0; i < sensorFilePaths.Count(); i++) {
                    // read calibration
                    var calibration = float.Parse(calibrations[i]);
                    Console.WriteLine($"calibration={calibration}");

                    // read sensor
                    var sensorFilePath = sensorFilePaths[i];
                    Console.WriteLine($"sensorFilePath={sensorFilePath}");

                    // calibration*sensor
                    var data = File.ReadAllLines(sensorFilePath).Select(r => float.Parse(r) * calibration);

                    // output to file
                    var outputDir = Path.Combine(outputRootDir, Path.GetFileName(Path.GetDirectoryName(sensorFilePath)));
                    var outputFile = Path.Combine(outputDir, Path.GetFileNameWithoutExtension(sensorFilePath) + "-scaled");
                    Directory.CreateDirectory(outputDir);
                    File.WriteAllText(outputFile, string.Join(Environment.NewLine, data));
                    Console.WriteLine($"outputFiler={outputFile}");
                }
            }
        }
    }
}
