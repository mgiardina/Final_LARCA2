using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.EmailReader
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Running Email Reader Process ...");
            var webservice = new LarcaWebService.LARCAJobs();
            webservice.ProcesarEmails();
            Console.Write("Email Reader Process Completed ...");
        }
    }
}
