
using System.Linq;
using System;
using System.IO;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using System.DirectoryServices;
using System.Web.Security;
using Larca2.Models;
using Larca2.Views.ViewModels;
using Larca2.Utilities;
using System.Text;
using System.Configuration;
using System.Diagnostics;
using System.Security.Cryptography;
using LARCA2.Data;
using LARCA2.Business;
using LARCA2.Data.DatabaseModels;
using System.Security.Principal;

namespace Larca2.Controllers
{
    public class LoginController : Controller
    {
        # region Valores
        const int SIZEOFVAL = 2;
        const int VALFOR_A = 23;
        const int VALFOR_B = 16;
        const int VALFOR_C = 25;
        const int VALFOR_D = 41;
        const int VALFOR_E = 65;
        const int VALFOR_F = 46;
        const int VALFOR_G = 37;
        const int VALFOR_H = 28;
        const int VALFOR_I = 19;
        const int VALFOR_J = 76;
        const int VALFOR_K = 77;
        const int VALFOR_L = 78;
        const int VALFOR_M = 54;
        const int VALFOR_N = 31;
        const int VALFOR_O = 38;
        const int VALFOR_P = 39;
        const int VALFOR_Q = 27;
        const int VALFOR_R = 17;
        const int VALFOR_S = 15;
        const int VALFOR_T = 24;
        const int VALFOR_U = 26;
        const int VALFOR_V = 36;
        const int VALFOR_W = 57;
        const int VALFOR_X = 58;
        const int VALFOR_Y = 59;
        const int VALFOR_Z = 60;

        const int VALFOR_a = 32;
        const int VALFOR_b = 61;
        const int VALFOR_c = 52;
        const int VALFOR_d = 40;
        const int VALFOR_e = 56;
        const int VALFOR_f = 64;
        const int VALFOR_g = 73;
        const int VALFOR_h = 82;
        const int VALFOR_i = 91;
        const int VALFOR_j = 20;
        const int VALFOR_k = 10;
        const int VALFOR_l = 30;
        const int VALFOR_m = 45;
        const int VALFOR_n = 13;
        const int VALFOR_o = 83;
        const int VALFOR_p = 93;
        const int VALFOR_q = 72;
        const int VALFOR_r = 71;
        const int VALFOR_s = 51;
        const int VALFOR_t = 42;
        const int VALFOR_u = 62;
        const int VALFOR_v = 63;
        const int VALFOR_w = 75;
        const int VALFOR_x = 70;
        const int VALFOR_y = 80;
        const int VALFOR_z = 90;


        const int VALFOR_0 = 92;
        const int VALFOR_1 = 94;
        const int VALFOR_2 = 96;
        const int VALFOR_3 = 11;
        const int VALFOR_4 = 69;
        const int VALFOR_5 = 33;
        const int VALFOR_6 = 22;
        const int VALFOR_7 = 55;
        const int VALFOR_8 = 66;
        const int VALFOR_9 = 44;

        #endregion Valores

        public static string dominio;

        public ActionResult Login()
        {
            //return Content("<script language='javascript' type='text/javascript'>alert('" + user.Identity.Name + "');</script>");
            LoginViewModel loginViewModel = new LoginViewModel();
            return View("Login", loginViewModel);
        }

        public ActionResult Autenticar(LoginViewModel loginViewModel)
        {
            HttpCookie myCookie;
            if (!ModelState.IsValid) return View("Login", loginViewModel);

            myCookie = ObtenerCookieReintentos(loginViewModel);

            dominio = ConfigurationManager.AppSettings["DominioActiveDirectory"];
            //log.WriteLine("Dominio Inicial = " + dominio);
            String adPath = "";
            if (loginViewModel.Usuario.NombreUsuario.Contains("@bacs"))
            {
                adPath = "LDAP://" + ConfigurationManager.AppSettings["DominioActiveDirectory2"];
                dominio = ConfigurationManager.AppSettings["DominioActiveDirectory2"];
            }
            else
            {

                adPath = "LDAP://" + ConfigurationManager.AppSettings["DominioActiveDirectory"];

            }

            LDAP adAuth = new LDAP(adPath);
            LARCA2.Business.Services.UsuariosBLL repositorioUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.RolesBLL repositorioRoles = new LARCA2.Business.Services.RolesBLL();

            LARCA20_Users usuario = repositorioUsuarios.TraerPorNombreDeUsuario(loginViewModel.Usuario.NombreUsuario);

            bool cumpleReintentos = true;
            if (usuario == null)
            {
                loginViewModel.Error = "Verifique el nombre de usuario ingresado.";
                loginViewModel.UsuarioInvalido = true;
                return View("Login", loginViewModel);
            }

            bool adAuthentication = false;
            bool primeracceso = false;


            string prueba = "username";
            if (loginViewModel.Usuario.NombreUsuario.Contains("admin") || loginViewModel.Usuario.NombreUsuario.Contains("Admin"))
            {
               adAuthentication = (Crypto.Decrypt(usuario.pass) == loginViewModel.Usuario.Clave ? true : false);      
            }
            else
            {
                if (loginViewModel.Usuario.NombreUsuario.Contains("@bacs"))
                    prueba = loginViewModel.Usuario.NombreUsuario.Split("@bacs".ToCharArray())[0];
                else
                    prueba = loginViewModel.Usuario.NombreUsuario;



                adAuthentication = adAuth.IsAuthenticated(ConfigurationManager.AppSettings["DominioActiveDirectory"], prueba, loginViewModel.Usuario.Clave);
            }


            bool probando = true;  //poner en false cuando haya un Active Directory valido en el que funcionar

            if (probando) adAuthentication = (Crypto.Decrypt(usuario.pass) == loginViewModel.Usuario.Clave ? true : false);

            //GruposDeAD(usuario.Usuario, dominio) <- Esta linea devuelve los grupos de AD de un usuario, para interpretar roles

          //  if (adAuthentication == true && usuario != null && !usuario.Borrado && cumpleReintentos && primeracceso == false)
            if (1==1) //el if que quedaria es el de arriba, esto esta cambiado hasta terminar de armar bien el login.
            {
                SetAuthenticationCookie(loginViewModel.Usuario.NombreUsuario);
                Session["Usuario"] = usuario;

                myCookie.Value = "0";
                Response.Cookies.Add(myCookie);
                myCookie.Value = (Int32.Parse(myCookie.Value) + 1).ToString();
                Response.Cookies.Add(myCookie);

                   return Content("<script language='javascript' type='text/javascript'>document.location = '../Home/Index';</script>");
     
            }

                if (!cumpleReintentos)
                {
                     loginViewModel.Error = "Se superó el máximo de reintentos. El usuario ha sido bloqueado.";
                    if (usuario != null && !usuario.deleted)
                    {
                        LARCA2.Business.Services.UsuariosBLL repo = new LARCA2.Business.Services.UsuariosBLL();
                        LARCA20_Users user = repo.Traer(usuario.Id);
                        user.deleted = true;
                        repo.Guardar(user);
                    }
                    myCookie.Value = "0";
                    Response.Cookies.Add(myCookie);
                }
                else
                {

                    if (primeracceso == false)
                    {
                        if (usuario != null)
                        {
                            if (usuario.deleted)
                                loginViewModel.Error = "El usuario está bloqueado.";
                            else
                                loginViewModel.Error = "El usuario o contraseña son inválidos";
                        }
                    }
                }

                loginViewModel.UsuarioInvalido = true;
                return View("Login", loginViewModel);

        }

        public virtual void SetAuthenticationCookie(string username)
        {
            FormsAuthentication.SetAuthCookie(username, false);
        }

        public ActionResult CerrarSesion()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);

            return RedirectToAction("Login");
        }

        private HttpCookie ObtenerCookieReintentos(LoginViewModel loginViewModel)
        {
            HttpCookie myCookie;
            if (Request.Cookies[loginViewModel.Usuario.NombreUsuario] == null)
            {
                myCookie = new HttpCookie(loginViewModel.Usuario.NombreUsuario);
                DateTime now = DateTime.Now;
                myCookie.Value = "1";
                //myCookie.Expires = DateTime.Now.AddMinutes(5);// La cookie expira en 5 minutos antes tenia 60 minutos
                Response.Cookies.Add(myCookie);
            }
            else
            {
                myCookie = Request.Cookies[loginViewModel.Usuario.NombreUsuario];
            }
            // myCookie.Expires = DateTime.Now.AddMinutes(1);
            return myCookie;
        }

        public ActionResult PrimerAccesoCambioClave()
        {
          LARCA2.Data.DatabaseModels.LARCA20_Users usuario = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            ModificarPasswordViewModel modificarPasswordViewModel = new ModificarPasswordViewModel();
            return View("PrimerAccesoCambioClave", modificarPasswordViewModel);
        }

        public ActionResult GuardarPassword(ModificarPasswordViewModel modificarPasswordViewModel)
        {
                  LARCA20_Users usuario = (  LARCA20_Users)Session["Usuario"];

            if (!ModelState.IsValid || modificarPasswordViewModel.PasswordViejo != Crypto.Decrypt(usuario.pass) ||
                modificarPasswordViewModel.PasswordNuevo != modificarPasswordViewModel.RepeticionPasswordNuevo)
            {
                if (ModelState.IsValid)
                {
                    modificarPasswordViewModel.Error = "La Clave Actual es Incorrecta";
                    if (modificarPasswordViewModel.PasswordNuevo != modificarPasswordViewModel.RepeticionPasswordNuevo)
                        modificarPasswordViewModel.Error = "La Clave Nueva no coincide con la Repetición de Clave";
                }

                return View("PrimerAccesoCambioClave", modificarPasswordViewModel);
            }

              LARCA2.Business.Services.UsuariosBLL  repositorioUsuarios = new   LARCA2.Business.Services.UsuariosBLL ();
            usuario.pass = Crypto.Encrypt(modificarPasswordViewModel.PasswordNuevo);
            Session["Usuario"] = usuario;
            LARCA20_Users usuarioActualizar = repositorioUsuarios.Traer(usuario.Id);
            usuarioActualizar.pass = Crypto.Encrypt(modificarPasswordViewModel.PasswordNuevo);
            repositorioUsuarios.Guardar(usuarioActualizar);

            return Content("<script language='javascript' type='text/javascript'>alert('The password has been modified.');document.location = '../Home/Index';</script>");
        }

        public string Desencriptar(string input)
        {
            int cant = input.Length;
            int cantr = 0;
            string resultado = "";
            while (cant > 0)
            {

                resultado += detraduct(int.Parse(input.Substring(cantr, SIZEOFVAL)));
                cantr += SIZEOFVAL;
                cant -= SIZEOFVAL;
            }
            return resultado;
        }

        public char detraduct(int i)
        {
            switch (i)
            {
                case (VALFOR_A): return 'A';
                case (VALFOR_B): return 'B';
                case (VALFOR_C): return 'C';
                case (VALFOR_D): return 'D';
                case (VALFOR_E): return 'E';
                case (VALFOR_F): return 'F';
                case (VALFOR_G): return 'G';
                case (VALFOR_H): return 'H';
                case (VALFOR_I): return 'I';
                case (VALFOR_J): return 'J';
                case (VALFOR_K): return 'K';
                case (VALFOR_L): return 'L';
                case (VALFOR_M): return 'M';
                case (VALFOR_N): return 'N';
                case (VALFOR_O): return 'O';
                case (VALFOR_P): return 'P';
                case (VALFOR_Q): return 'Q';
                case (VALFOR_R): return 'R';
                case (VALFOR_S): return 'S';
                case (VALFOR_T): return 'T';
                case (VALFOR_U): return 'U';
                case (VALFOR_V): return 'V';
                case (VALFOR_W): return 'W';
                case (VALFOR_X): return 'X';
                case (VALFOR_Y): return 'Y';
                case (VALFOR_Z): return 'Z';

                case (VALFOR_a): return 'a';
                case (VALFOR_b): return 'b';
                case (VALFOR_c): return 'c';
                case (VALFOR_d): return 'd';
                case (VALFOR_e): return 'e';
                case (VALFOR_f): return 'f';
                case (VALFOR_g): return 'g';
                case (VALFOR_h): return 'h';
                case (VALFOR_i): return 'i';
                case (VALFOR_j): return 'j';
                case (VALFOR_k): return 'k';
                case (VALFOR_l): return 'l';
                case (VALFOR_m): return 'm';
                case (VALFOR_n): return 'n';
                case (VALFOR_o): return 'o';
                case (VALFOR_p): return 'p';
                case (VALFOR_q): return 'q';
                case (VALFOR_r): return 'r';
                case (VALFOR_s): return 's';
                case (VALFOR_t): return 't';
                case (VALFOR_u): return 'u';
                case (VALFOR_v): return 'v';
                case (VALFOR_w): return 'w';
                case (VALFOR_x): return 'x';
                case (VALFOR_y): return 'y';
                case (VALFOR_z): return 'z';

                case (VALFOR_0): return '0';
                case (VALFOR_1): return '1';
                case (VALFOR_2): return '2';
                case (VALFOR_3): return '3';
                case (VALFOR_4): return '4';
                case (VALFOR_5): return '5';
                case (VALFOR_6): return '6';
                case (VALFOR_7): return '7';
                case (VALFOR_8): return '8';
                case (VALFOR_9): return '9';

                default: return ' ';

            }
        }

        public static List<string> GruposDeAD(string username, string userdomain)
        {

            List<string> gruposEncontrados = new List<string>();
            // Creamos un objeto DirectoryEntry para conectarnos al directorio activo
            DirectoryEntry adsRoot = new DirectoryEntry("LDAP://" + userdomain);
            // Creamos un objeto DirectorySearcher para hacer una búsqueda en el directorio activo
            DirectorySearcher adsSearch = new DirectorySearcher(adsRoot);

            try
            {
                // Ponemos como filtro que busque el usuario actual
                adsSearch.Filter = "samAccountName=" + username;

                // Extraemos la primera coincidencia
                SearchResult oResult;
                oResult = adsSearch.FindOne();

                // Obtenemos el objeto de ese usuario
                DirectoryEntry usuario = oResult.GetDirectoryEntry();

                // Obtenemos la lista de SID de los grupos a los que pertenece
                usuario.RefreshCache(new string[] { "tokenGroups" });

                // Creamos una variable StringBuilder donde ir añadiendo los SID para crear un filtro de búsqueda
                StringBuilder sids = new StringBuilder();
                sids.Append("(|");
                foreach (byte[] sid in usuario.Properties["tokenGroups"])
                {
                    sids.Append("(objectSid=");
                    for (int indice = 0; indice < sid.Length; indice++)
                    {
                        sids.AppendFormat("\\{0}", sid[indice].ToString("X2"));
                    }
                    sids.AppendFormat(")");
                }
                sids.Append(")");

                // Creamos un objeto DirectorySearcher con el filtro antes generado y buscamos todas la coincidencias
                DirectorySearcher ds = new DirectorySearcher(adsRoot, sids.ToString());
                SearchResultCollection src = ds.FindAll();

                // Recorremos toda la lista de grupos devueltos
                foreach (SearchResult sr in src)
                {
                    String sGrupo = (String)sr.Properties["samAccountName"][0];
                    gruposEncontrados.Add(sGrupo);
                    // A partir de aquí hacer lo que corresponda con cada grupo
                }
                Console.Out.WriteLine("Se encontraron " + gruposEncontrados.Count + " grupos para el usuario " + username + ".");
                foreach (string s in gruposEncontrados)
                    Console.Out.WriteLine("El usuario pertenece al grupo " + s + ".");
                return gruposEncontrados;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                List<string> l = new List<string>();
                l.Add(ex.Message);
                return l;
            }


        }


        public static string GruposDeADD(string username, string userdomain)
        {

            List<string> gruposEncontrados = new List<string>();
            // Creamos un objeto DirectoryEntry para conectarnos al directorio activo
            DirectoryEntry adsRoot = new DirectoryEntry("LDAP://" + userdomain);
            // Creamos un objeto DirectorySearcher para hacer una búsqueda en el directorio activo
            DirectorySearcher adsSearch = new DirectorySearcher(adsRoot);

            try
            {
                // Ponemos como filtro que busque el usuario actual
                adsSearch.Filter = "samAccountName=" + username;

                // Extraemos la primera coincidencia
                SearchResult oResult;
                oResult = adsSearch.FindOne();

                // Obtenemos el objeto de ese usuario
                DirectoryEntry usuario = oResult.GetDirectoryEntry();

                // Obtenemos la lista de SID de los grupos a los que pertenece
                usuario.RefreshCache(new string[] { "tokenGroups" });

                // Creamos una variable StringBuilder donde ir añadiendo los SID para crear un filtro de búsqueda
                StringBuilder sids = new StringBuilder();
                sids.Append("(|");
                foreach (byte[] sid in usuario.Properties["tokenGroups"])
                {
                    sids.Append("(objectSid=");
                    for (int indice = 0; indice < sid.Length; indice++)
                    {
                        sids.AppendFormat("\\{0}", sid[indice].ToString("X2"));
                    }
                    sids.AppendFormat(")");
                }
                sids.Append(")");

                // Creamos un objeto DirectorySearcher con el filtro antes generado y buscamos todas la coincidencias
                DirectorySearcher ds = new DirectorySearcher(adsRoot, sids.ToString());
                SearchResultCollection src = ds.FindAll();

                // Recorremos toda la lista de grupos devueltos
                foreach (SearchResult sr in src)
                {
                    String sGrupo = (String)sr.Properties["samAccountName"][0];
                    gruposEncontrados.Add(sGrupo);
                    // A partir de aquí hacer lo que corresponda con cada grupo
                }
                Console.Out.WriteLine("Se encontraron " + gruposEncontrados.Count + " grupos para el usuario " + username + ".");
                foreach (string s in gruposEncontrados)
                    Console.Out.WriteLine("El usuario pertenece al grupo " + s + ".");

                string R1 = ConfigurationManager.AppSettings["RolSA"];
                string R2 = ConfigurationManager.AppSettings["SegInf"];
                string R3 = ConfigurationManager.AppSettings["RRHH"];
                string R4 = ConfigurationManager.AppSettings["RYP"];

                foreach (string s in gruposEncontrados)
                    if (s.Equals(R1) || s.Equals(R2) || s.Equals(R3) || s.Equals(R4))
                        return s;

                return ConfigurationManager.AppSettings["CommonRole"];
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

                return ex.Message;
            }


        }


    }
}
