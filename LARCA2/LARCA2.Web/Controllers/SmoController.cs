using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Larca2.Controllers
{
    public class SmoController : Controller
    {


        public ActionResult SmoSimple()
        {
            ViewBag.Message = "";


            //Declaro BLLs e inicializo viewModel
            Larca2.Views.ViewModels.SMOScopeViewModel viewModel = new Larca2.Views.ViewModels.SMOScopeViewModel();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();


            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);

            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;

            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = new List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner>();
            if (viewModel.idRole != 1) //NOT ADMINISTRATOR
                luo = uobll.TraerPorIdUsuario(user.Id);

            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de UserOwner para el usuario logueado
            // viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            if (viewModel.idRole == 2) //EDITOR
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else if (viewModel.idRole == 1) //ADMINISTRATOR
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }
            else if (viewModel.idRole == 4) //MAL LEADER
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar("0", actualLuo.IdSmo.ToString()).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
                /*
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar("0", actualLuo.IdSmo.ToString()).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }*/
            }
            else if (viewModel.idRole == 6) //DRP OPS LEADER
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), "0").ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }

            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();

            viewModel.selectedItems = new List<bool>();

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            viewModel.EditablesSMO = viewModel.RegistrosSMO;
<<<<<<< HEAD
            viewModel.responsibles = new List<string>();

            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)
=======


            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }


            viewModel.responsibles = new List<string>();
            foreach(LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)
>>>>>>> origin/master
                viewModel.responsibles.Add((itemstr.RefIdResponsable == null ? "" : repoResponsables.TraerSuNombreDeUsuario(itemstr.RefIdResponsable.Value)));

            return View("SmoSimple", viewModel);

        }



        public ActionResult SmoSimpleFiltrado(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            ViewBag.Message = "";

            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();

            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);


            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;

            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);


            //   viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //  viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            if (viewModel.idRole == 2) //EDITOR
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else if (viewModel.idRole == 1) //ADMINISTRATOR
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }
            else if (viewModel.idRole == 4) //MAL LEADER
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar("0", actualLuo.IdSmo.ToString()).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else if (viewModel.idRole == 6) //DRP OPS LEADER
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), "0").ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }

            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();


            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();


            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();
            viewModel.EditablesSMO = viewModel.RegistrosSMO;
            viewModel.selectedItems = new List<bool>();
            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }

            viewModel.responsibles = new List<string>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)
                viewModel.responsibles.Add((itemstr.RefIdResponsable == null ? "" : repoResponsables.TraerSuNombreDeUsuario(itemstr.RefIdResponsable.Value)));

            viewModel.mensaje = "Filters succesfully applied. " + viewModel.EditablesSMO.Count + " registers match the search criteria.";

            return View("SmoSimple", viewModel);

        }

        public ActionResult SmoSimpleResult(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {

            try{
                
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);
            string action = viewModel.AccionBoton;

            if (action == "group" || action == "modif")
            {
                return SmoSimpleAgrupar(viewModel);
            }
            else if (action == "filter")
            {
                return SmoSimpleFiltrado(viewModel);
            }

            //if something fails, this will redirect to the first view

            viewModel.mensaje = "Failed to identify action, please make sure you use the visible buttons.";


            return View("SmoSimple", viewModel);

               }
            catch(Exception exT)
            {
                
                viewModel.mensaje = "An error has occurred. Please refresh the page and try again.";


                //if something fails, this will redirect to the first view
                return View("SmoSimple", viewModel);

            }

        }

        public ActionResult SmoTreatmentResult(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            try
            {
                LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
                LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
                if (user == null)
                    user = repoUsuarios.Traer(2);
                string action = viewModel.AccionBoton;

                if (action == "modif")
                {
                    return SmoModificados(viewModel);
                }
                else if (action == "filter")
                {
                    return SmoFiltrado(viewModel);
                }

                viewModel.mensaje = "Failed to identify action, please make sure you use the visible buttons.";


                //if something fails, this will redirect to the first view
                return View("SmoTreatment", viewModel);
            }
            catch(Exception exT)
            {
                viewModel = new Views.ViewModels.SMOScopeViewModel();
                viewModel.mensaje = "An error has occurred. Please refresh the page and try again.";


                //if something fails, this will redirect to the first view
                return View("SmoTreatment", viewModel);

            }

        }

        public ActionResult SmoSimpleAgrupar(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            ViewBag.Message = "";
            LARCA2.Business.Services.SMOScopeBLL repoModif = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();

            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);

            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;

            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);

            //     viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //      viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            int test = 0; //para corroborar cantidad de modificados al finalizar la actualizacion de valores
            for (int countFor = 0; countFor < viewModel.EditablesSMO.Count; countFor++)
            {
                LARCA2.Data.DatabaseModels.LARCA20_SmoScope scope = viewModel.EditablesSMO[countFor];
                LARCA2.Data.DatabaseModels.LARCA20_SmoScope actualOriginal = repoModif.Traer(scope.SmoScopeID);
                if (actualOriginal == null) { } //no existe en la tabla
                if (actualOriginal != null && !LARCA2.Business.Services.SMOScopeBLL.esIgual(actualOriginal, scope, viewModel.responsibles[countFor])) //existe Y fue modificado
                {

                    if (scope.Why1 != actualOriginal.Why1)
                        actualOriginal.Why1 = scope.Why1;
                    if (scope.Why2 != actualOriginal.Why2)
                        actualOriginal.Why2 = scope.Why2;
                    if (scope.Why3 != actualOriginal.Why3)
                        actualOriginal.Why3 = scope.Why3;
                    if (scope.ActionPlan != actualOriginal.ActionPlan)
                        actualOriginal.ActionPlan = scope.ActionPlan;
                    if (scope.Problem != actualOriginal.Problem)
                        actualOriginal.Problem = scope.Problem;
                    if (scope.DueDate != actualOriginal.DueDate)
                        actualOriginal.DueDate = scope.DueDate;
                    /*  if (scope.RefIdResponsable == 0)
                          actualOriginal.RefIdResponsable = null;
                      else  if (scope.RefIdResponsable != actualOriginal.RefIdResponsable) 
                          actualOriginal.RefIdResponsable = scope.RefIdResponsable;
                     */
                    //adaptacion nuevos responsables
                    if (viewModel.responsibles[countFor] == "")
                        actualOriginal.RefIdResponsable = null;
                    else if ((actualOriginal.RefIdResponsable == null) || (viewModel.responsibles[countFor] != repoResponsables.TraerSuNombreDeUsuario(Int32.Parse(actualOriginal.RefIdResponsable.ToString()))))
                    {
                        //aca puede pasar que:


                        if (repoUsuarios.ExisteUsuario(viewModel.responsibles[countFor]) == false)
                        {
                            //el responsable ingresado no existe de ninguna manera, asi que hay que crear usuario y responsable.
                            LARCA2.Data.DatabaseModels.LARCA20_Users newUser = new LARCA2.Data.DatabaseModels.LARCA20_Users();
                            newUser.user_name = viewModel.responsibles[countFor];
                            newUser.deleted = false;
                            newUser.date = DateTime.Now;
                            repoUsuarios.Guardar(newUser);
                            //no le creo rol porque no se definió cual poner

                            LARCA2.Data.DatabaseModels.LARCA20_Responsable newResp = new LARCA2.Data.DatabaseModels.LARCA20_Responsable();
                            newResp.RefIdUser = repoUsuarios.TraerPorNombreDeUsuario(viewModel.responsibles[countFor]).Id;
                            newResp.deleted = false;
                            repoResponsables.Guardar(newResp);
                            actualOriginal.RefIdResponsable = repoResponsables.TraerPorNombreDeUsuario(viewModel.responsibles[countFor]).Id;
                        }
                        else
                        {

                            if (repoResponsables.Todos().Where(x => x.RefIdUser == repoUsuarios.TraerPorNombreDeUsuario(viewModel.responsibles[countFor]).Id).Count() > 0)
                            {
                                //el responsable ingresado exista y sea un usuario que existe, entonces solo se asigna.
                                actualOriginal.RefIdResponsable = repoResponsables.TraerPorNombreDeUsuario(viewModel.responsibles[countFor]).Id;
                            }
                            else
                            {
                                //el responsable ingresado no exista pero exista el usuario, hay que crear el responsable.
                                LARCA2.Data.DatabaseModels.LARCA20_Responsable newResp = new LARCA2.Data.DatabaseModels.LARCA20_Responsable();
                                newResp.RefIdUser = repoUsuarios.TraerPorNombreDeUsuario(viewModel.responsibles[countFor]).Id;
                                newResp.deleted = false;
                                repoResponsables.Guardar(newResp);
                                actualOriginal.RefIdResponsable = repoResponsables.TraerPorNombreDeUsuario(viewModel.responsibles[countFor]).Id;
                            }
                        }

                    }
                    if (scope.O_C != actualOriginal.O_C && (scope.O_C != null && (scope.O_C == "O" || scope.O_C == "o" || scope.O_C == "C" || scope.O_C == "c")))
                        actualOriginal.O_C = scope.O_C.ToUpper();
                    if (scope.Level4 != actualOriginal.Level4 && (scope.Level4 != null && scope.Level4 != 0))
                        actualOriginal.Level4 = scope.Level4;
                    repoModif.Guardar(actualOriginal);
                    test++;
                }

            }
            test = test + 0; //for debugging purposes

            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();

            int seleccionados = 0;
            int exitoAgrup = 0;
            if (viewModel.selectedItems != null)
                seleccionados = viewModel.selectedItems.Where(x => x.ToString() == "True").ToList().Count;
            if (seleccionados > 1)
            {
                bool puedeAgruparse = true;



                int countitemcer = 0;
                foreach (bool bcer in viewModel.selectedItems)
                {
                    if (bcer == true)
                        break;
                    countitemcer++;
                }

                //por cada seleccionado true excepto el primero
                for (int i = 1; i < seleccionados; i++)
                {

                    //desde aca incluyendo el primer for obtiene el index en la lista de registros
                    int countbool = i + 1;
                    int countitem = 0;
                    foreach (bool b in viewModel.selectedItems)
                    {
                        if (b == true)
                            countbool--;
                        if (countbool == 0)
                            break;
                        countitem++;
                    }



                    if (!(LARCA2.Business.Services.SMOScopeBLL.esAgrupable(repo.Traer(viewModel.EditablesSMO[countitemcer].SmoScopeID), repo.Traer(viewModel.EditablesSMO[countitem].SmoScopeID))))
                    {
                        puedeAgruparse = false;
                        break;
                    }
                }
                if (puedeAgruparse == true)
                {
                    LARCA2.Data.DatabaseModels.LARCA20_SmoScope smoAgrup = repo.Traer(viewModel.EditablesSMO[countitemcer].SmoScopeID);
                    LARCA2.Data.DatabaseModels.LARCA20_SmoScope smoAgrup2;

                    LARCA2.Business.Services.SMOScopeGroupedRowsBLL grbll = new LARCA2.Business.Services.SMOScopeGroupedRowsBLL();

                    for (int i = 1; i < seleccionados; i++)
                    {
                        smoAgrup = repo.Traer(viewModel.EditablesSMO[countitemcer].SmoScopeID);
                        //desde aca incluyendo el primer for obtiene el index en la lista de registros
                        int countbool = i + 1;
                        int countitem = 0;

                        foreach (bool b in viewModel.selectedItems)
                        {
                            if (b == true)
                                countbool--;
                            if (countbool == 0)
                                break;
                            countitem++;
                        }


                        smoAgrup2 = repo.Traer(viewModel.EditablesSMO[countitem].SmoScopeID);

                        //preparo y guardo el primero
                        LARCA2.Data.DatabaseModels.LARCA20_SmoScopeGroupedRows adapt = grbll.crearGroup(repo.Traer(smoAgrup.SmoScopeID));
                        if (seleccionados > 2)
                            grbll.Guardar(adapt);

                        smoAgrup.ActionPlan = smoAgrup.ActionPlan + (smoAgrup.ActionPlan != null && smoAgrup2.ActionPlan != null ? "-" : "") + smoAgrup2.ActionPlan;
                        smoAgrup.Why1 = smoAgrup.Why1 + (smoAgrup.Why1 != null && smoAgrup2.Why1 != null ? "-" : "") + smoAgrup2.Why1;
                        smoAgrup.Why2 = smoAgrup.Why2 + (smoAgrup.Why2 != null && smoAgrup2.Why2 != null ? "-" : "") + smoAgrup2.Why2;
                        smoAgrup.Why3 = smoAgrup.Why3 + (smoAgrup.Why3 != null && smoAgrup2.Why3 != null ? "-" : "") + smoAgrup2.Why3;
                        smoAgrup.Problem = smoAgrup.Problem + (smoAgrup.Problem != null && smoAgrup2.Problem != null ? "-" : "") + smoAgrup2.Problem;
                        smoAgrup.DueDate = (smoAgrup.DueDate < smoAgrup2.DueDate ? smoAgrup.DueDate : smoAgrup2.DueDate);
                        smoAgrup.Volumen = smoAgrup.Volumen + smoAgrup2.Volumen;
                        if (smoAgrup.RefIdResponsable == null)
                            smoAgrup.RefIdResponsable = smoAgrup2.RefIdResponsable;
                        else
                            smoAgrup.RefIdResponsable = smoAgrup.RefIdResponsable;


                        //now this part of the method doesnt just delete the old register but it adapts it to groupedrows table and saves it there
                        repo.Guardar(smoAgrup);
                        //repo.Eliminar(smoAgrup2.SmoScopeID);
                        adapt = grbll.crearGroup(repo.Traer(smoAgrup2.SmoScopeID));
                        adapt.GroupSmoID = smoAgrup.SmoScopeID;
                        grbll.Guardar(adapt);


                        exitoAgrup++;
                        repo.Eliminar(smoAgrup2.SmoScopeID);
                    }

                }
                else
                {
                    //no pudo agrupar
                }
            }

            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            if (viewModel.idRole == 2) //EDITOR
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeacto;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeacto = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeacto != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeacto);
                    }
                }
            }
            else if (viewModel.idRole == 1) //ADMINISTRATOR
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }
            else if (viewModel.idRole == 4) //MAL LEADER
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeacto;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeacto = ssbll.Filtrar("0", actualLuo.IdSmo.ToString()).ToList();
                    if (smoscopeacto != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeacto);
                    }
                }
            }
            else if (viewModel.idRole == 6) // DRP OPS LEADER
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeacto;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeacto = ssbll.Filtrar(actualLuo.IdBU.ToString(), "0").ToList();
                    if (smoscopeacto != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeacto);
                    }
                }
            }

            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();




            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            viewModel.EditablesSMO = viewModel.RegistrosSMO;
            viewModel.selectedItems = new List<bool>();
            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }


            viewModel.responsibles = new List<string>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)
                viewModel.responsibles.Add((itemstr.RefIdResponsable == null ? "" : repoResponsables.TraerSuNombreDeUsuario(itemstr.RefIdResponsable.Value)));
           
            viewModel.mensaje = test + " registers were modified. " + seleccionados + " registers selected for grouping. "+exitoAgrup+" registers succesfully grouped.";


            return View("SmoSimple", viewModel);

        }

        [HttpGet]
        public JsonResult Desagrupar(string id)
        {

            int groupId = Int32.Parse(id);
            LARCA2.Business.Services.SMOScopeGroupedRowsBLL rbl = new LARCA2.Business.Services.SMOScopeGroupedRowsBLL();
            LARCA2.Business.Services.SMOScopeBLL smbl = new LARCA2.Business.Services.SMOScopeBLL();

            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScopeGroupedRows> listOfRowsForGroup = rbl.TraerPorGroupId(groupId);
            if (listOfRowsForGroup.Count == 0)
                return Json("Group has already been disbanded. Please refresh the page.", JsonRequestBehavior.AllowGet);

            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScopeGroupedRows groupedRow in listOfRowsForGroup)
            {
                //se crea el smo correspondiente y se borra el smogrouped
                LARCA2.Data.DatabaseModels.LARCA20_SmoScope nuevScope = smbl.crearGroup(groupedRow);
                smbl.Guardar(nuevScope);
                rbl.Eliminar(groupedRow.SmoScopeID);
            }

            smbl.Eliminar(groupId);

            return Json("Group succesfully disbanded. Refresh the page to reflect the changes in the view.", JsonRequestBehavior.AllowGet);
        }




        [HttpGet]
        public JsonResult MostrarDetalle(string id)
        {
            int newId = Int32.Parse(id);
            LARCA2.Business.Services.SMOScopeDetailBLL dbl = new LARCA2.Business.Services.SMOScopeDetailBLL();
            LARCA2.Business.Services.MasterDataBLL mbl = new LARCA2.Business.Services.MasterDataBLL();
            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScopeDetail> details = dbl.TraerDetalle(newId);
            string result;
            result = "<!DOCTYPE html><html lang='en'><head><meta charset='utf-8' /><title> SMO Scope Detail- LARCA 2</title><link href='~/favicon.ico' rel='shortcut icon' type='image/x-icon' /><meta name='viewport' content='width=device-width' /><style>html {background-color: #e2e2e2;margin: 0;padding: 0;}body {background-color: #fff;border-top: solid 10px #000;color: #333;font-size: .85em;font-family: 'Segoe UI', Verdana, Helvetica, Sans-Serif;margin: 0;padding: 0;}table {border-collapse: collapse;border-spacing: 0;margin-top: 0.75em;border: 0 none;}th {font-size: 11px;text-align: left;border: 1px solid #e2e2e2;text-transform:uppercase;background-color:#199ED8;color:#FFFFFF;padding:5px;}th a {display: block;position: relative;}td {text-align: left;border: 1px solid #e2e2e2;font-size:11px;background-color:#FFFFFF;padding:5px;}tr.pager td {padding: 0 0.25em 0 0;}</style></head><body>";

            //result = result + "<table class='table'><tr><th width='5%' align='center'>Date</th><th width='5%' align='center'>SMO</th><th width='5%' align='center'>BU</th><th width='5%' align='center'>Volume</th><th width='5%' align='center'>OWNER</th><th width='5%' align='center'>Level2</th><th width='5%' align='center'>Level3</th><th width='5%' align='center'>Reason</th></tr>";
            result = result + "<table class='table'><tr><th width='20%' align='center'>Volume</th><th width='25%' align='center'>FPC</th><th width='25%' align='center'>Reason Code</th><th width='15%' align='center'>Customer</th><th width='15%' align='center'>Date</th></tr>";

            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScopeDetail det in details)
            {
                //   result = result + "<tr><td>" + det.Volumen.ToString() + "</td>";
                result = result + "<tr><td>" + decimal.Round(decimal.Parse(det.Volumen.ToString()), 2).ToString() + "</td>";
                result = result + "<td>" + mbl.Traer("BU", Int32.Parse(det.BuID.ToString())).DataFin + "</td>"; //showed dataini, now datafin
                result = result + "<td>" + mbl.Traer("REASON", Int32.Parse(det.ReasonID.ToString())).DataIni + "</td>";
                result = result + "<td>" + (det.Customer == null ? "-" : det.Customer.ToString()) + "</td>";
                result = result + "<td>" + (det.originaldate == null ? "" : det.originaldate.ToString()) + "</td></tr>";

                //  result = result + "<tr><td>" + det.Fecha.ToString() + "</td>";
                // result = result + "<td>" + mbl.Traer("SMO", Int32.Parse(det.SmoID.ToString())).DataIni + "</td>";
                // result = result + "<td>" + mbl.Traer("BU", Int32.Parse(det.BuID.ToString())).DataIni + "</td>";
                // result = result + "<td>" + det.Volumen.ToString() + "</td>";
                // result = result + "<td>" + mbl.Traer(det.OwnerID.Value).DataIni + "</td>";
                // result = result + "<td>" + mbl.Traer(det.Lvl2ID.Value).DataIni + "</td>";
                // result = result + "<td>" + mbl.Traer(det.Lvl3ID.Value).DataIni + "</td>";

                // result = result + "<td>" + mbl.Traer("REASON", Int32.Parse(det.ReasonID.ToString())).DataIni + "</td></tr>";
            }

            result = result + "</table>";
            result = result + "</body></html>";
            return Json(result, JsonRequestBehavior.AllowGet);
        }




        public ActionResult Dashboard()
        {
            ViewBag.Message = "";

            //Declaro BLLs e inicializo viewModel
            Larca2.Views.ViewModels.SMOScopeViewModel viewModel = new Larca2.Views.ViewModels.SMOScopeViewModel();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();


            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);



            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;
            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);


            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de UserOwner para el usuario logueado
            //    viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //    viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            if (viewModel.idRole != 1)
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }



            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();


            //LARCA2.Business.Services.MasterDataBLL mdlll = new LARCA2.Business.Services.MasterDataBLL();
            //List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> allmaster = mdlll.Todos().Exists(z => viewModel.SMOList.Where(x => x.Text == z.DataIni).ToList());
            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de SmoScope valido en termino de fecha pero llevaria mas horas
            //viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            //viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();

            if (viewModel.RegistrosSMO.Where(x => x.date.Value.Month == (DateTime.Now.Month - 1)).Count() > 0)
                viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = false });

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month == DateTime.Now.Month).ToList();

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            //Copio la lista a los editables para poder modificar los datos necesarios.
            viewModel.EditablesSMO = viewModel.RegistrosSMO;


            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }


            return View("Dashboard", viewModel);

        }



        public ActionResult SmoTreatment()
        {
            ViewBag.Message = "";

            //Declaro BLLs e inicializo viewModel
            Larca2.Views.ViewModels.SMOScopeViewModel viewModel = new Larca2.Views.ViewModels.SMOScopeViewModel();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();


            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);



            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;
            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);


            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de UserOwner para el usuario logueado
            //    viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //    viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            if (viewModel.idRole != 1)
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }



            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();


            //LARCA2.Business.Services.MasterDataBLL mdlll = new LARCA2.Business.Services.MasterDataBLL();
            //List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> allmaster = mdlll.Todos().Exists(z => viewModel.SMOList.Where(x => x.Text == z.DataIni).ToList());
            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de SmoScope valido en termino de fecha pero llevaria mas horas
            //viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            //viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();

            if (viewModel.RegistrosSMO.Where(x => x.date.Value.Month == (DateTime.Now.Month - 1)).Count() > 0)
                viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = false });

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month == DateTime.Now.Month).ToList();

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            //Copio la lista a los editables para poder modificar los datos necesarios.
            viewModel.EditablesSMO = viewModel.RegistrosSMO;


            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }

            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            viewModel.responsibles = new List<string>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)
                viewModel.responsibles.Add((itemstr.RefIdResponsable == null ? "" : repoResponsables.TraerSuNombreDeUsuario(itemstr.RefIdResponsable.Value)));

           
            return View("SmoTreatment", viewModel);

        }

        public ActionResult SmoFiltrado(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            ViewBag.Message = "";
            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();


            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);

            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;

            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);



            //   viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //   viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();

            if (viewModel.idRole != 1)
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }



            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();

            viewModel.Responsables = new List<SelectListItem>();
            List<LARCA2.Data.DatabaseModels.LARCA20_Users> listaDeUsuariosParaRespons = repoUsuarios.Todos();
            viewModel.Responsables.Add(new SelectListItem { Text = "Choose a valid Owner:", Value = "0" });
            foreach (LARCA2.Data.DatabaseModels.LARCA20_Responsable userResponsable in repoResponsables.Todos())
            {
                viewModel.Responsables.Add(new SelectListItem { Text = listaDeUsuariosParaRespons.Where(u => u.Id == userResponsable.RefIdUser).FirstOrDefault().user_name, Value = userResponsable.Id.ToString() });
            }


            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();

            if (viewModel.mesSeleccionado == "0")
            {
                if (viewModel.RegistrosSMO.Where(x => x.date.Value.Month == (DateTime.Now.Month - 1)).Count() > 0 && viewModel.dropdownMeses.Count < 2)
                    viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = false });
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month == DateTime.Now.Month).ToList();
            }
            else
            {
                if (viewModel.dropdownMeses.Count < 2)
                {
                    viewModel.dropdownMeses[0].Selected = false;
                    viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = true });
                }

                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month < DateTime.Now.Month).ToList();
            }



            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            //     viewModel.RegistrosSMO = repo.Filtrar(viewModel.bu, viewModel.smo); esto filtraba desde el TODOS
            viewModel.EditablesSMO = viewModel.RegistrosSMO;

            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }

            viewModel.responsibles = new List<string>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)
                viewModel.responsibles.Add((itemstr.RefIdResponsable == null ? "" : repoResponsables.TraerSuNombreDeUsuario(itemstr.RefIdResponsable.Value)));

            viewModel.mensaje = "Filters succesfully applied. "+ viewModel.EditablesSMO.Count +" registers match the search criteria.";

            return View("SmoTreatment", viewModel);

        }

        public ActionResult SmoModificados(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.SMOScopeBLL repoGuardado = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UserOwnerBLL uoClones = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.MasterDataBLL mdClones = new LARCA2.Business.Services.MasterDataBLL();
            LARCA2.Business.Services.Level4BLL lvlClones = new LARCA2.Business.Services.Level4BLL();
            LARCA2.Business.Services.RCClassificationBLL rcClones = new LARCA2.Business.Services.RCClassificationBLL();
            LARCA2.Business.Services.ResponsablesBLL respoClones = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL userRoles = new LARCA2.Business.Services.UsuariosRolesBLL();

            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);

            //obtengo el string con toda la info de los clones
            string[] RegistrosRecibidos = Request.Form["HI_SmoEsp"].Split(("##").ToCharArray());
            List<string> RegistrosClonados = new List<string>();


            if (RegistrosRecibidos.Count() == 0 || RegistrosRecibidos[0] == "")
            { //no se clono nada
            }
            else
            {
                //saco los strings vacios del arreglo
                for (var i = 0; i < RegistrosRecibidos.Length; i++)
                {
                    if (i % 2 == 0)  //los strings invalidos me quedaron en los impares, si algo llega a fallar revisar esto y cambiar por una eliminacion de los nulls.
                    {
                        RegistrosClonados.Add(RegistrosRecibidos[i]);
                    }
                }


                //Cada parte de RegistrosClonados es una fila clonada!
                foreach (string registro in RegistrosClonados)
                {
                    string[] act = registro.Split("%%".ToCharArray());
                    //en actFilt quedaran los atributos separados
                    List<string> actFilt = new List<string>();
                    for (var i = 0; i < act.Length; i++)
                    {
                        if (i % 2 == 0)
                        {
                            actFilt.Add(act[i].Trim().Replace("\r\n", "").Replace("&nbsp;", "").Replace("&amp;", "&"));
                        }
                    }
                    LARCA2.Data.DatabaseModels.LARCA20_SmoScope clon = new LARCA2.Data.DatabaseModels.LARCA20_SmoScope();


                    /*OLD
    RC
    SMO
    BU
    VOLUMEN
    PROBLEM
    WHY1
    WHY2
    WHY3
    ACTIONPLAN
    RESPONSABLE
    DUEDATE
    O_C
    LEVEL4*/

                    /*NEW
    VOLUMEN
    SMO
    BU
    RC
    LEVEL4
    PROBLEM
    WHY1
    WHY2
    WHY3
    ACTIONPLAN
    RESPONSABLE
    DUEDATE
    O_C*/

                    DateTime due;
                    clon.SmoScopeID = 0;
                    
                    clon.deleted = false;
                    clon.DueDate = (DateTime.TryParse(actFilt[11], out due) ? due : DateTime.Now.AddDays(7));
                    clon.date = DateTime.Now;
                    clon.Volumen = Decimal.Parse(actFilt[0]); //antes 3
                    clon.Problem = actFilt[5];
                    clon.Why1 = actFilt[6];
                    clon.Why2 = actFilt[7];
                    clon.Why3 = actFilt[8];
<<<<<<< HEAD
                    clon.O_C = (actFilt[12] == "O" || actFilt[12] == "C" ? actFilt[12] : "O");
=======
                    clon.ActionPlan = actFilt[9];
                    clon.O_C = (actFilt[12].ToUpper() == "O" || actFilt[12].ToUpper() == "C"? actFilt[12] : "O" );
>>>>>>> origin/master
                    clon.RefIdBU = mdClones.Traer(Int32.Parse(actFilt[2])).id;
                    clon.RefIdSMO = mdClones.Traer(Int32.Parse(actFilt[1])).id;
                    if (userRoles.Traer(user.Id).RefIdRoles != 1) //NOT ADMIN
                        clon.RefIdOwner = uoClones.TraerPorIdUsuario(user.Id).Where(x => x.IdBU == clon.RefIdBU && x.IdSmo == clon.RefIdSMO).FirstOrDefault().IdOwner; // :O
                    else
                        try
                        {
                            clon.RefIdOwner = uoClones.TraerPorIdUsuario(user.Id).Where(x => x.IdBU == clon.RefIdBU && x.IdSmo == clon.RefIdSMO).FirstOrDefault().IdOwner; // :O
                        }
<<<<<<< HEAD
                        catch (Exception e) { clon.RefIdOwner = null; }
=======

                        catch (Exception e) { clon.RefIdOwner = null; }

>>>>>>> origin/master
                    clon.RefIdRC = rcClones.TraerPorDesc(actFilt[3]).Id;
                   
                    
                    
                    
                    
                 /*   int io;
                    if (Int32.TryParse(actFilt[9].ToString(), out io) == true)
                        clon.RefIdResponsable = respoClones.Traer(Int32.Parse(actFilt[10])).Id;
                    else
                        clon.RefIdResponsable = null;
                    */
                    //responsClones
                    if (actFilt[10] == "")
                        clon.RefIdResponsable = null;
                     else
                    { //aca puede pasar que:
                        LARCA2.Business.Services.ResponsablesBLL repoResponsables2 = new LARCA2.Business.Services.ResponsablesBLL();

                        if (repoUsuarios.ExisteUsuario(actFilt[10]) == false)
                        {
                            //el responsable ingresado no existe de ninguna manera, asi que hay que crear usuario y responsable.
                            LARCA2.Data.DatabaseModels.LARCA20_Users newUser = new LARCA2.Data.DatabaseModels.LARCA20_Users();
                            newUser.user_name = actFilt[10];
                            newUser.deleted = false;
                            newUser.date = DateTime.Now;
                            repoUsuarios.Guardar(newUser);
                            //no le creo rol porque no se definió cual poner

                            LARCA2.Data.DatabaseModels.LARCA20_Responsable newResp = new LARCA2.Data.DatabaseModels.LARCA20_Responsable();
                            newResp.RefIdUser = repoUsuarios.TraerPorNombreDeUsuario(actFilt[10]).Id;
                            newResp.deleted = false;
                            repoResponsables2.Guardar(newResp);
                            clon.RefIdResponsable = repoResponsables2.TraerPorNombreDeUsuario(actFilt[10]).Id;
                        }
                        else
                        {

                            if (repoResponsables2.Todos().Where(x => x.RefIdUser == repoUsuarios.TraerPorNombreDeUsuario(actFilt[10]).Id).Count() > 0)
                            {
                                //el responsable ingresado exista y sea un usuario que existe, entonces solo se asigna.
                                clon.RefIdResponsable = repoResponsables2.TraerPorNombreDeUsuario(actFilt[10]).Id;
                            }
                            else
                            {
                                //el responsable ingresado no exista pero exista el usuario, hay que crear el responsable.
                                LARCA2.Data.DatabaseModels.LARCA20_Responsable newResp = new LARCA2.Data.DatabaseModels.LARCA20_Responsable();
                                newResp.RefIdUser = repoUsuarios.TraerPorNombreDeUsuario(actFilt[10]).Id;
                                newResp.deleted = false;
                                repoResponsables2.Guardar(newResp);
                                clon.RefIdResponsable = repoResponsables2.TraerPorNombreDeUsuario(actFilt[10]).Id;
                            }
                        }


                    }
                    //fin clonesRespons



                    if (actFilt[4] == "0")
                        clon.Level4 = null;
                    else
                        clon.Level4 = Int32.Parse(actFilt[4]);
                    //lvlClones.Todos().Where(l => l.deleted == false && l.Id == Int32.Parse(actFilt[4])).First().Id;

                    repoGuardado.Guardar(clon);
                    //buscar IDs y guardar en tabla LARCA20_SmoScope -en user owner no deberia hacer falta, cuando haya que hacer pruebas revisar si con un solo user owner se obtienen todos los registros de la tabla de smo scope correspondientes-
                }

            }
            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();

            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();


            //user traido mas arriba
<<<<<<< HEAD
            int test = 0; //para corroborar cantidad de modificados al finalizar la actualizacion de valores
            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope scope in viewModel.EditablesSMO)
            {

                LARCA2.Data.DatabaseModels.LARCA20_SmoScope actualOriginal = repo.Traer(scope.SmoScopeID);
                if (actualOriginal == null) { } //no existe en la tabla
                if (actualOriginal != null && !LARCA2.Business.Services.SMOScopeBLL.esIgual(actualOriginal, scope)) //existe Y fue modificado
                {

                    if (scope.Why1 != actualOriginal.Why1)
                        actualOriginal.Why1 = scope.Why1;
                    if (scope.Why2 != actualOriginal.Why2)
                        actualOriginal.Why2 = scope.Why2;
                    if (scope.Why3 != actualOriginal.Why3)
                        actualOriginal.Why3 = scope.Why3;
                    if (scope.ActionPlan != actualOriginal.ActionPlan)
                        actualOriginal.ActionPlan = scope.ActionPlan;
                    if (scope.Problem != actualOriginal.Problem)
                        actualOriginal.Problem = scope.Problem;
                    if (scope.DueDate != actualOriginal.DueDate)
                        actualOriginal.DueDate = scope.DueDate;
                    if (scope.RefIdResponsable == 0)
                        actualOriginal.RefIdResponsable = null;
                    else if (scope.RefIdResponsable != actualOriginal.RefIdResponsable)
                        actualOriginal.RefIdResponsable = scope.RefIdResponsable;
                    if (scope.O_C != actualOriginal.O_C && (scope.O_C != null && (scope.O_C == "O" || scope.O_C == "o" || scope.O_C == "C" || scope.O_C == "c")))
                        actualOriginal.O_C = scope.O_C.ToUpper();
                    if (scope.Level4 != actualOriginal.Level4 && (scope.Level4 != null && scope.Level4 != 0))
                        actualOriginal.Level4 = scope.Level4;
                    repo.Guardar(actualOriginal);
                    test++;
                }

            }
            test = test++;
=======


           int test = 0; //para corroborar cantidad de modificados al finalizar la actualizacion de valores
       //    foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope scope in viewModel.EditablesSMO)
           for (int countModif = 0; countModif < viewModel.EditablesSMO.Count; countModif++ )
           {
               LARCA2.Data.DatabaseModels.LARCA20_SmoScope scope = viewModel.EditablesSMO[countModif];
               LARCA2.Data.DatabaseModels.LARCA20_SmoScope actualOriginal = repo.Traer(scope.SmoScopeID);
               if (actualOriginal == null) { } //no existe en la tabla
            //   if (actualOriginal != null && !LARCA2.Business.Services.SMOScopeBLL.esIgual(actualOriginal, scope)) //existe Y fue modificado
               if (actualOriginal != null && !LARCA2.Business.Services.SMOScopeBLL.esIgual(actualOriginal, scope, viewModel.responsibles[countModif])) //existe Y fue modificado
               {

                   if (scope.Why1 != actualOriginal.Why1)
                       actualOriginal.Why1 = scope.Why1;
                   if (scope.Why2 != actualOriginal.Why2)
                       actualOriginal.Why2 = scope.Why2;
                   if (scope.Why3 != actualOriginal.Why3)
                       actualOriginal.Why3 = scope.Why3;
                   if (scope.ActionPlan != actualOriginal.ActionPlan)
                       actualOriginal.ActionPlan = scope.ActionPlan;
                   if (scope.Problem != actualOriginal.Problem)
                       actualOriginal.Problem = scope.Problem;
                   if (scope.DueDate != actualOriginal.DueDate)
                       actualOriginal.DueDate = scope.DueDate;
                  
                /*   if (scope.RefIdResponsable == 0)
                       actualOriginal.RefIdResponsable = null;
                   else if (scope.RefIdResponsable != actualOriginal.RefIdResponsable)
                       actualOriginal.RefIdResponsable = scope.RefIdResponsable;
                  */

                   if (viewModel.responsibles[countModif] == "")
                       actualOriginal.RefIdResponsable = null;
                   else if ((actualOriginal.RefIdResponsable == null) || (viewModel.responsibles[countModif] != repoResponsables.TraerSuNombreDeUsuario(Int32.Parse(actualOriginal.RefIdResponsable.ToString()))))
                   {
                       //aca puede pasar que:


                       if (repoUsuarios.ExisteUsuario(viewModel.responsibles[countModif]) == false)
                       {
                           //el responsable ingresado no existe de ninguna manera, asi que hay que crear usuario y responsable.
                           LARCA2.Data.DatabaseModels.LARCA20_Users newUser = new LARCA2.Data.DatabaseModels.LARCA20_Users();
                           newUser.user_name = viewModel.responsibles[countModif];
                           newUser.deleted = false;
                           newUser.date = DateTime.Now;
                           repoUsuarios.Guardar(newUser);
                           //no le creo rol porque no se definió cual poner

                           LARCA2.Data.DatabaseModels.LARCA20_Responsable newResp = new LARCA2.Data.DatabaseModels.LARCA20_Responsable();
                           newResp.RefIdUser = repoUsuarios.TraerPorNombreDeUsuario(viewModel.responsibles[countModif]).Id;
                           newResp.deleted = false;
                           repoResponsables.Guardar(newResp);
                           actualOriginal.RefIdResponsable = repoResponsables.TraerPorNombreDeUsuario(viewModel.responsibles[countModif]).Id;
                       }
                       else
                       {

                           if (repoResponsables.Todos().Where(x => x.RefIdUser == repoUsuarios.TraerPorNombreDeUsuario(viewModel.responsibles[countModif]).Id).Count() > 0)
                           {
                               //el responsable ingresado exista y sea un usuario que existe, entonces solo se asigna.
                               actualOriginal.RefIdResponsable = repoResponsables.TraerPorNombreDeUsuario(viewModel.responsibles[countModif]).Id;
                           }
                           else
                           {
                               //el responsable ingresado no exista pero exista el usuario, hay que crear el responsable.
                               LARCA2.Data.DatabaseModels.LARCA20_Responsable newResp = new LARCA2.Data.DatabaseModels.LARCA20_Responsable();
                               newResp.RefIdUser = repoUsuarios.TraerPorNombreDeUsuario(viewModel.responsibles[countModif]).Id;
                               newResp.deleted = false;
                               repoResponsables.Guardar(newResp);
                               actualOriginal.RefIdResponsable = repoResponsables.TraerPorNombreDeUsuario(viewModel.responsibles[countModif]).Id;
                           }
                       }

                   }



                   if (scope.O_C != actualOriginal.O_C && (scope.O_C != null && (scope.O_C == "O" || scope.O_C == "o" || scope.O_C == "C" || scope.O_C == "c")))
                       actualOriginal.O_C = scope.O_C.ToUpper();
                   if (scope.Level4 != actualOriginal.Level4 && (scope.Level4 != null && scope.Level4 != 0))
                       actualOriginal.Level4 = scope.Level4;
                   repo.Guardar(actualOriginal);
                   test++;
               }

           }
            test = test + 0;
>>>>>>> origin/master

            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);


            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.

            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();
            if (viewModel.idRole != 1)
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }



            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();


            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();


            if (viewModel.mesSeleccionado == "0")
            {
                if (viewModel.RegistrosSMO.Where(x => x.date.Value.Month == (DateTime.Now.Month - 1)).Count() > 0 && viewModel.dropdownMeses.Count < 2)
                    viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = false });
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month == DateTime.Now.Month).ToList();
            }
            else
            {
                if (viewModel.dropdownMeses.Count < 2)
                {
                    viewModel.dropdownMeses[0].Selected = false;
                    viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = true });
                }

                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month < DateTime.Now.Month).ToList();
            }


            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();
            //     viewModel.RegistrosSMO = repo.Filtrar(viewModel.bu, viewModel.smo); esto filtraba desde el TODOS
            viewModel.EditablesSMO = viewModel.RegistrosSMO;


            viewModel.Responsables = new List<SelectListItem>();
            List<LARCA2.Data.DatabaseModels.LARCA20_Users> listaDeUsuariosParaRespons = repoUsuarios.Todos();
            viewModel.Responsables.Add(new SelectListItem { Text = "Choose a valid Owner:", Value = "0" });
            foreach (LARCA2.Data.DatabaseModels.LARCA20_Responsable userResponsable in repoResponsables.Todos())
            {
                viewModel.Responsables.Add(new SelectListItem { Text = listaDeUsuariosParaRespons.Where(u => u.Id == userResponsable.RefIdUser).FirstOrDefault().user_name, Value = userResponsable.Id.ToString() });
            }


            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }

            viewModel.responsibles = new List<string>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)
                viewModel.responsibles.Add((itemstr.RefIdResponsable == null ? "" : repoResponsables.TraerSuNombreDeUsuario(itemstr.RefIdResponsable.Value)));


            viewModel.mensaje = test + " registers were modified. " + (RegistrosClonados != null? RegistrosClonados.Count.ToString() : "0") + " clones succesfully created.";

            ViewBag.Message = "";
            return View("SmoTreatment", viewModel);

        }

        public ActionResult DashboardFiltrado(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {

            ViewBag.Message = "";
            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();


            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);

            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;

            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);



            //   viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //   viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();

            if (viewModel.idRole != 1)
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0").ToList();
            }



            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();

            viewModel.Responsables = new List<SelectListItem>();
            List<LARCA2.Data.DatabaseModels.LARCA20_Users> listaDeUsuariosParaRespons = repoUsuarios.Todos();
            viewModel.Responsables.Add(new SelectListItem { Text = "Choose a valid Owner:", Value = "0" });
            foreach (LARCA2.Data.DatabaseModels.LARCA20_Responsable userResponsable in repoResponsables.Todos())
            {
                viewModel.Responsables.Add(new SelectListItem { Text = listaDeUsuariosParaRespons.Where(u => u.Id == userResponsable.RefIdUser).FirstOrDefault().user_name, Value = userResponsable.Id.ToString() });
            }


            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();

            if (viewModel.mesSeleccionado == "0")
            {
                if (viewModel.RegistrosSMO.Where(x => x.date.Value.Month == (DateTime.Now.Month - 1)).Count() > 0 && viewModel.dropdownMeses.Count < 2)
                    viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = false });
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month == DateTime.Now.Month).ToList();
            }
            else
            {
                if (viewModel.dropdownMeses.Count < 2)
                {
                    viewModel.dropdownMeses[0].Selected = false;
                    viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = true });
                }

                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month < DateTime.Now.Month).ToList();
            }



            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            //     viewModel.RegistrosSMO = repo.Filtrar(viewModel.bu, viewModel.smo); esto filtraba desde el TODOS
            viewModel.EditablesSMO = viewModel.RegistrosSMO;

            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }


            return View("Dashboard", viewModel);
        }

        public ActionResult DashboardModificados(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            var repoUpdate = new LARCA2.Business.Services.SMOScopeBLL();
            foreach (var smoItem in viewModel.EditablesSMO)
            {
                var smoUpdated = repoUpdate.Traer(smoItem.SmoScopeID);
                smoUpdated.O_C = smoItem.O_C;
                smoUpdated.DueDate = smoItem.DueDate;
                repoUpdate.Guardar(smoUpdated);
            }
            return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Smo/Dashboard';</script>");

        }
    }
}
