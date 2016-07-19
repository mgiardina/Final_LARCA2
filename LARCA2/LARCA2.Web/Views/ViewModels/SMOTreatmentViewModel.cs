using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Larca2.Views.ViewModels
{
    public class SMOScopeViewModel
    {
        public List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> RegistrosSMO { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> EditablesSMO { get; set; }
        public List<SelectListItem> Responsables { get; set; }
        public LARCA2.Business.Services.RCClassificationBLL RCBLL { get; set; }
        public LARCA2.Business.Services.ResponsablesBLL ResponsiblesBLL { get; set; }
        public string bu { get; set; }
        public string smo { get; set; }
        public string mesSeleccionado { get; set; }
        public string enviado { get; set; }
        public string userRole { get; set; }
        public int idRole { get; set; }
        public int tempInt { get; set; }
        public string mensaje { get; set; }

        public List<SelectListItem> dropdownMeses { get; set; }
        public List<SelectListItem> BUList { get; set; }
        public List<SelectListItem> SMOList { get; set; }
        public List<SelectListItem> L4List { get; set; }
        public string AccionBoton { get; set; }

        public LARCA2.Business.Services.Level4BLL Level4BLL { get; set; }
        public LARCA2.Business.Services.MasterDataBLL MBLL { get; set; }

        public List<int> maxClones { get; set; }
        public List<string> responsibles { get; set; }
        public List<Boolean> selectedItems { get; set; }

        [DataType(DataType.Date)]
        public DateTime TestDate { get; set; }

        public SMOScopeViewModel()
        {
            bu = "0";
            smo = "0";
            mesSeleccionado = "0";
            RCBLL = new LARCA2.Business.Services.RCClassificationBLL();
            MBLL = new LARCA2.Business.Services.MasterDataBLL();
            Level4BLL = new LARCA2.Business.Services.Level4BLL();
            LARCA2.Business.Services.Level4BLL L4BLL = new LARCA2.Business.Services.Level4BLL();
            ResponsiblesBLL = new LARCA2.Business.Services.ResponsablesBLL();
            BUList = new List<SelectListItem>();
            SMOList = new List<SelectListItem>();
            L4List = new List<SelectListItem>();
            dropdownMeses = new List<SelectListItem>();
            dropdownMeses.Add(new SelectListItem { Text = "Current Month", Value = "0", Selected = true });
           
              BUList.Add(new SelectListItem{Text = "Choose a valid BU", Value = "0", Selected = true});
              SMOList.Add(new SelectListItem{Text = "Choose a valid SMO", Value = "0", Selected = true});
              
                        foreach (LARCA2.Data.DatabaseModels.LARCA20_MasterData md in MBLL.Todos().Where(x=> x.Data == "BU"))
                        {
                           BUList.Add(new SelectListItem{Text = md.DataFin, Value = md.id.ToString()});
                        }
                        
                        foreach (LARCA2.Data.DatabaseModels.LARCA20_MasterData md in MBLL.Todos().Where(x=> x.Data == "SMO"))
                        {
                            SMOList.Add(new SelectListItem { Text = md.DataFin, Value = md.id.ToString() });
                        }

                        L4List.Add(new SelectListItem { Text = "Other", Value = "0" });

                        foreach (LARCA2.Data.DatabaseModels.LARCA20_Level4 md in L4BLL.Todos())
                        {
                            L4List.Add(new SelectListItem { Text = md.name, Value = md.Id.ToString() });
                        }

           // LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            Level4BLL.Todos();
            
           // this.RegistrosSMO = repo.Todos();
          //  this.EditablesSMO = this.RegistrosSMO;
            this.Responsables = new List<SelectListItem>();
            List<LARCA2.Data.DatabaseModels.LARCA20_Users> listaDeUsuarios = repoUsuarios.Todos();
            this.Responsables.Add(new SelectListItem { Text = "Choose a valid Owner:", Value = "0"});
            foreach (LARCA2.Data.DatabaseModels.LARCA20_Responsable user in repoResponsables.Todos())
            {
                this.Responsables.Add(new SelectListItem { Text = listaDeUsuarios.Where(u => u.Id == user.RefIdUser).FirstOrDefault().user_name, Value = user.Id.ToString()});
            }


        }

    }
}