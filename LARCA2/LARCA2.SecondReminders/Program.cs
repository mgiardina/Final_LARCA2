using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.SecondReminders
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Running Second Reminders Process ...");
            var webservice = new LarcaWebService.LARCAJobs();
            webservice.ProcesarEmails();
            Console.Write("Second Reminders Process Completed ...");
        }
    }
}
