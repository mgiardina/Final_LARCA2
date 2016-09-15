using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LARCA2.Data;
using LARCA2.Data.DatabaseModels;
using LARCA2.Business.Services;

namespace Larca2.Views.ViewModels
{
    public class LAScopeViewModel
    {
        public LARCA20_SmoScopeDetail Details { get; set; }
        public LARCA2.Business.Services.MasterDataBLL MasterDataBLL { get; set; }
        public List<LARCA20_User_Owner> Permisos { get; set; }
        public string rbu { get; set; }
        public string smo { get; set; }
        public List<SelectListItem> BUList { get; set; }
        public List<SelectListItem> SMOList { get; set; }

        public LAScopeViewModel()
        {
            rbu = string.Empty;
            smo = string.Empty;
            BUList = new List<SelectListItem>();
            SMOList = new List<SelectListItem>();
            MasterDataBLL = new LARCA2.Business.Services.MasterDataBLL();
            BUList.Add(new SelectListItem { Text = "Select RBU", Value = "0", Selected = true });
            SMOList.Add(new SelectListItem { Text = "Select SMO", Value = "0", Selected = true });

            foreach (LARCA2.Data.DatabaseModels.LARCA20_MasterData md in MasterDataBLL.Todos().Where(x => x.Data == "BU" && x.deleted != true).ToList())
            {
                if (md.DataFin.Length > 0)
                    if (!BUList.Exists(m => m.Text == md.DataFin.ToString()))
                        BUList.Add(new SelectListItem { Text = md.DataFin, Value = md.DataFin });
            }

            foreach (LARCA2.Data.DatabaseModels.LARCA20_MasterData md in MasterDataBLL.Todos().Where(x => x.Data == "SMO" && x.deleted != true).ToList())
            {
                if (!SMOList.Exists(m => m.Text == md.DataFin.ToString()) && md.DataFin != "VENEZUELA")
                    SMOList.Add(new SelectListItem { Text = md.DataFin, Value = md.DataFin });
            }
            SMOList.Add(new SelectListItem { Text = "LA", Value = "1" });

            var user = (LARCA20_Users)HttpContext.Current.Session["Usuario"];
            if (user == null)
                user = new UsuariosBLL().Traer(2);
            Permisos = new LARCA2.Business.Services.UserOwnerBLL().TraerPorIdUsuario(user.Id);
        }
    }
}