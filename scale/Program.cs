using System;
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

            if (args.Length != 3)
            {
                Console.WriteLine($"Expected 3 arguments; got {args.Length}");
                return;
            }

            var calibrationDir = args[0];
            var experimentsDir = args[1];
            var outputRootDir = args[2];

            var calibrationFile = Directory.GetFiles(calibrationDir).First();
            var calibrations = File.ReadAllText(calibrationFile).Split(',');

            foreach (var experimentDir in Directory.EnumerateDirectories(experimentsDir)) {
                var sensorFiles = Directory.GetFiles(experimentDir).ToList();
                for (var idx = 0; idx < sensorFiles.Count(); idx++) {
                    // read calibration
                    var calibration = float.Parse(calibrations[idx]);
                    Console.WriteLine($"calibration={calibration}");

                    // read sensor
                    var sensorFilePath = sensorFiles[idx];
                    Console.WriteLine($"sensorFilePath={sensorFilePath}");

                    // calibration*sensor
                    var data = File.ReadAllLines(sensorFilePath).Select(i => float.Parse(i) * calibration);

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
