using LARCA2.Business.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Larca2.WebService
{
    /// <summary>
    /// Summary description for LARCA_Mails
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class LARCA_Mails : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public void ProcesarEmails()
        {
            new MailingCore().ProcesarEmails();
        }

        [WebMethod]
        public string EnviarPrimerosRemiders()
        {
            new MailingCore().EnviarPrimerosRemiders();
            return "hola";
        }

        [WebMethod]
        public void EnviarSegundosRemiders()
        {
            //new MailingCore().EnviarSegundosRemiders("","");
        }
    }
}
