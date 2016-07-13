using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.FirstReminders
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Running First Reminders Process ...");
            var webservice = new LarcaWebService.LARCAJobs();
            webservice.ProcesarEmails();
            Console.Write("First Reminders Process Completed ...");
        }
    }
}
