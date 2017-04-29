using System;
using System.Globalization;
using System.IO;
using System.Linq;

namespace calibrate
{
    class Program
    {
        static void Main(string[] args)
        {
            args.ToList().ForEach(a => { Console.WriteLine($"arg={a}"); });

            if (args.Length != 3)
            {
                Console.WriteLine($"Expected 3 arguments; got {args.Length}");
                return;
            }

            var calibrationDir = args[0];
            var experimentsDir = args[1];
            var outputDir = args[2];

            var calibrationFile = Directory.GetFiles(calibrationDir).First();
            var calibrations = File.ReadAllText(calibrationFile).Split(',');
                
            foreach (var experimentDir in Directory.EnumerateDirectories(experimentsDir)) {
                var sensorFiles = Directory.GetFiles(experimentDir).ToList();
                for (var idx = 0; idx < sensorFiles.Count(); idx++) {
                    // calibration
                    var calibration = float.Parse(calibrations[idx]);
                    Console.WriteLine($"calibration={calibration}");

                    // sensor
                    var sensorFilePath = sensorFiles[idx];
                    var data = File.ReadAllLines(sensorFilePath).Select(i => float.Parse(i) * calibration);
                    Console.WriteLine($"sensorFilePath={sensorFilePath}");

                    // outpu
                    var outputFile = Path.Combine(outputDir, Path.GetFileNameWithoutExtension(sensorFilePath));
                    Directory.CreateDirectory(outputDir);
                    File.WriteAllText(outputFile, string.Join(Environment.NewLine, data));
                    Console.WriteLine($"outputDir={outputFile}");
                }
            }
        }
    }
}
