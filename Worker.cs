using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace CreatingInstaller
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;
        private const string _logFileLocation = @"C:\temp\servicelog.txt";

        public Worker(ILogger<Worker> logger)
        {
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);

                string msg = String.Format("Worker running at: {0}", DateTimeOffset.Now);
                Log(msg);
                await Task.Delay(1000, stoppingToken);
            }
        }

private void Log(string logMessage)
{
    Directory.CreateDirectory(Path.GetDirectoryName(_logFileLocation));
    File.AppendAllText(_logFileLocation, logMessage + Environment.NewLine);
}
    }
}
