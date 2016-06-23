using LARCA2.Business.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Larca2.WebService
{
    /// <summary>
    /// Summary description for LARCAJobs
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class LARCAJobs : System.Web.Services.WebService
    {

        /// <summary>
        /// WebMethod ProcesarEmails
        /// </summary>
        [WebMethod]
        public void ProcesarEmails()
        {
            new MailingCore().ProcesarEmails();
        }

        [WebMethod]
        public void EnviarPrimerosRemiders()
        {
            new MailingCore().EnviarPrimerosRemiders();
        }

        [WebMethod]
        public void EnviarSegundosRemiders()
        {
            new MailingCore().EnviarSegundosRemiders();
        }
    }
}
