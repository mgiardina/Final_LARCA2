﻿using LARCA2.Business.Core;
using LARCA2.Data.DatabaseModels;
using System;
using System.Collections;
using System.Collections.Generic;
using System.DirectoryServices;
using System.DirectoryServices.ActiveDirectory;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace LARCA2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Groups = new List<string>();
            var user = (WindowsPrincipal)User;
            LARCA2.Business.Services.UsuariosBLL repositorioUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.RolesBLL repositorioRoles = new LARCA2.Business.Services.RolesBLL();

            LARCA20_Users usuario = repositorioUsuarios.TraerPorNombreDeUsuario(user.Identity.Name.Split(Convert.ToChar("\\"))[1]);

            //var list = GetAllGroupNames();
            //ViewBag.Groups = list;

            if (usuario == null)
            {
                return RedirectToAction("InvalidUser", "Home");
            }


           /* var lista = new List<string>();
            string manager = "";
            string username = user.Identity.Name.Split(Convert.ToChar("\\"))[1];
            using (var forest = Forest.GetCurrentForest())
            {
                foreach (Domain domain in forest.Domains)
                {
                    var userdomain = domain.Name.Split(Convert.ToChar("."))[0].ToUpper();

                    List<string> gruposEncontrados = new List<string>();
                    // Creamos un objeto DirectoryEntry para conectarnos al directorio activo
                    DirectoryEntry adsRoot = new DirectoryEntry("LDAP://" + userdomain);
                    // Creamos un objeto DirectorySearcher para hacer una búsqueda en el directorio activo
                    DirectorySearcher adsSearch = new DirectorySearcher(adsRoot);
                    adsSearch.PropertiesToLoad.Add("manager");

                    // Ponemos como filtro que busque el usuario actual
                    adsSearch.Filter = "samAccountName=" + username;

                    SearchResult oResult;
                    // Extraemos la primera coincidencia
                    oResult = adsSearch.FindOne();
                    manager = oResult.Properties["manager"][0].ToString();
                    if (oResult != null)
                    {
                        break;
                    }
                }
            }*/

            Session["Usuario"] = usuario;
            ViewData["Modal"] = "<script language='javascript' type='text/javascript'>$('#modalTest').modal('show')</script>";
            //ViewData["Modal"] = "<script language='javascript' type='text/javascript'>alert('" + manager + "');</script>";
            ViewBag.Message = "QA Version.";
            return View();
        }

        public ActionResult InvalidUser()
        {
            var repo = new Business.Services.UsuariosBLL();
            var usuario = repo.TraerPrimerAdminDisponible();
            ViewBag.Admin = usuario.name + " " + usuario.last_name;
            ViewBag.Email = usuario.Email;
            return View();
        }

        // AD Prueba de Dominios
        public List<string> GetAllGroupNames()
        {
            var lista = new List<string>();
            using (var forest = Forest.GetCurrentForest())
            {
                foreach (Domain domain in forest.Domains)
                {
                    lista.Add(domain.Name.Split(Convert.ToChar("."))[0].ToUpper());
                }
            }
            return lista;
        }
    }
}
