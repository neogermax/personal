using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace QaVision.Controller
{
    public partial class GeneralTransaccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Files.Count > 0)
            {
                Upload_File_Server();
            }
            else
            {

                //validamos que este cargada la variable de accion del proceso
                if (Request.Form["Action"] != null)
                {
                    //capturamos la opcion del proceso
                    string vl_Option_Action = Request.Form["Action"];

                    switch (vl_Option_Action)
                    {

                        case "DropListUsers":
                            DropListUsers();
                            break;

                        case "DropListUsersCuenta":
                            DropListUsersCuenta();
                            break;

                        case "ListUsuarios_Campana":
                            ListUsuarios_Campana();
                            break;

                        case "ListUsuarios_Campana_UC":
                            ListUsuarios_Campana_UC();
                            break;

                        case "ListUser_Agentes_All":
                            ListUserAgentesAll();
                            break;

                        case "ListUser_Agentes_Coor":
                            ListUserAgentesCoordindor();
                            break;

                        case "List_Mensajes":
                            ListMensajes();
                            break;
                    }
                }
            }
        }

        #region "SESSION"

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object CerrarSesion(string User)
        {
            C_Sesion Cls = new C_Sesion();
            List<C_Sesion> ObjList = new List<C_Sesion>();

            string vl_User = HttpContext.Current.Session["Sesion_User_QA"].ToString().ToUpper();

            if (vl_User == User.ToUpper())
            {

                C_Acceso acceso = new C_Acceso();

                acceso.Id = Convert.ToInt64(HttpContext.Current.Session["Work_AccesoId_QA"]);
                acceso.End_Sesion(acceso);

                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Session.Remove("Sesion_User_QA");
                HttpContext.Current.Session.Remove("Work_Campana_QA");
                HttpContext.Current.Session.Remove("Work_AccesoId_QA");
                Cls.EstadoSesion = "EXIT";

                ObjList.Add(Cls);
            }


            return new
            {
                data = ObjList
            };

        }

        /// <summary>
        ///  valida la session para redireccionar
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Valida_Session()
        {
            C_Sesion Cls = new C_Sesion();
            C_UsuarioAcceso ClsUA = new C_UsuarioAcceso();
            C_EstiloCuenta ClsSE = new C_EstiloCuenta();
            C_Seleccion clsEA = new C_Seleccion();
            C_Notificacion notificacion = new C_Notificacion();

            List<C_Sesion> ObjList = new List<C_Sesion>();
            List<C_Dato> ObjListUA = new List<C_Dato>();
            List<C_EstiloCuenta> ObjListSE = new List<C_EstiloCuenta>();
            List<C_Seleccion> ObjListEA = new List<C_Seleccion>();
            List<C_Notificacion> ObjListNoti = new List<C_Notificacion>();

            C_Pagina clsME = new C_Pagina();
            List<C_Pagina> ObjListME = new List<C_Pagina>();

            if (HttpContext.Current.Session["Sesion_User_QA"] == null)
            {
                Cls.EstadoSesion = "OFF";
                ObjList.Add(Cls);
            }
            else
            {

                Cls.Usuario = HttpContext.Current.Session["Sesion_User_QA"].ToString().ToUpper();
                ObjList = Cls.Read_Data(Cls);

                notificacion.UsuarioId = ObjList[0].IdUser;
                ObjListNoti = notificacion.Read_NotificacionesUser(notificacion);

                ClsUA.UsuarioId = ObjList[0].IdUser;
                ClsUA.RolId = ObjList[0].IdRol;

                ObjListUA = ClsUA.Read_DropListEmpresas(ClsUA);

                if (HttpContext.Current.Session["Work_Campana_QA"] == null)
                {
                    ClsSE.CuentaId = ObjList[0].IdCuenta;
                    ObjListSE = ClsSE.Read_AllStyle_Cliente(ClsSE);
                }
                else
                {
                    ClsSE.CuentaId = (ObjListUA.Count == 1) ? ObjListUA[0].Id : Convert.ToInt32(HttpContext.Current.Session["Work_Campana_QA"]);
                    ObjListSE = ClsSE.Read_AllStyle_Cliente(ClsSE);

                    clsME.CuentaId = (ObjListUA.Count == 1) ? ObjListUA[0].Id : Convert.ToInt32(HttpContext.Current.Session["Work_Campana_QA"]);
                    clsME.RolId = (ObjListUA.Count == 1) ? ObjList[0].IdRol: Convert.ToInt32(HttpContext.Current.Session["Work_RolId_QA"]);

                    ObjListME = clsME.Read_DataModulos(clsME);

                    clsEA.Select_Cuenta = Convert.ToInt32(HttpContext.Current.Session["Work_Campana_QA"]);
                    clsEA.Select_Perfil = HttpContext.Current.Session["Work_Rol_QA"].ToString();
                    clsEA.Select_RolId = Convert.ToInt32(HttpContext.Current.Session["Work_RolId_QA"]);

                }

                if (ObjList[0].IdCuenta != 0)
                {
                }
                else
                {
                    //HttpContext.Current.Session["Work_Campana_QA"] = 0;
                    clsEA.Select_Cuenta = Convert.ToUInt32(HttpContext.Current.Session["Work_Campana_QA"]);
                    clsEA.Select_Perfil = HttpContext.Current.Session["Work_Rol_QA"].ToString();
                    clsEA.Select_RolId = Convert.ToInt32(HttpContext.Current.Session["Work_RolId_QA"]);
                }
                ObjListEA.Add(clsEA);
            }

            return new
            {
                data = ObjList,
                campana = ObjListUA,
                style = ObjListSE,
                selectCampana = ObjListEA,
                modulos = ObjListME,
                notificaciones = ObjListNoti
            };
        }

        /// <summary>
        /// mata session en server
        /// </summary>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Dead_Session()
        {
            C_Sesion Cls = new C_Sesion();
            List<C_Sesion> ObjList = new List<C_Sesion>();
            string user = "";
            try
            {
                user = HttpContext.Current.Session["Sesion_User_QA"].ToString();
            }
            catch { user = ""; }
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Remove("Sesion_User_QA");
            HttpContext.Current.Session.Remove("Change_User_QA");
            HttpContext.Current.Session.Remove("Work_Campana_QA");
            HttpContext.Current.Session.Remove("Work_AccesoId_QA");
            Cls.EstadoSesion = "EXIT";
            ObjList.Add(Cls);

            return new
            {
                sesion = ObjList,
            };

        }

        /// <summary>
        /// asignacion de empresa en la sesion de trabajo
        /// </summary>
        /// <param name="CampanaId"></param>
        /// <param name="RolId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object AsignaCampana(string CampanaId,
                                                                          string RolId,
                                                                          string Rol)
        {
            C_Seleccion clsEA = new C_Seleccion();
            List<C_Seleccion> ObjListEA = new List<C_Seleccion>();

            HttpContext.Current.Session["Work_Campana_QA"] = CampanaId;
            HttpContext.Current.Session["Work_RolId_QA"] = RolId;
            HttpContext.Current.Session["Work_Rol_QA"] = Rol;

            C_Pagina clsME = new C_Pagina();
            List<C_Pagina> ObjListME = new List<C_Pagina>();

            C_EstiloCuenta ClsSE = new C_EstiloCuenta();
            List<C_EstiloCuenta> ObjListSE = new List<C_EstiloCuenta>();

            clsME.CuentaId = (CampanaId == "undefined" || CampanaId == "0") ? Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]) : Convert.ToInt64(CampanaId);

            clsME.RolId = Convert.ToInt64(RolId);

            ObjListME = clsME.Read_DataModulos(clsME);

            ClsSE.CuentaId = (CampanaId == "undefined") ? Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]) : Convert.ToInt64(CampanaId);
            ObjListSE = ClsSE.Read_AllStyle_Cliente(ClsSE);
            clsEA.Select_Cuenta = (CampanaId == "undefined") ? Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]) : Convert.ToInt64(CampanaId);
            ObjListEA.Add(clsEA);


            return new
            {
                data = ObjListEA,
                style = ObjListSE,
                modulos = ObjListME
            };

        }
        #endregion

        #region "ADMIN CLIENTES"
        /// <summary>
        /// trae todos los usuarios asignados en la campana
        /// </summary>
        /// <param name="CampanaId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListClientes()
        {
            C_Clientes Cls = new C_Clientes();
            List<C_Clientes> ObjList = new List<C_Clientes>();

            ObjList = Cls.Read_Clientes(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// valida si el nombreusuario ya existe en la BD
        /// </summary>
        /// <param name="Usuario"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ValidaCliente(string Cliente)
        {
            C_Clientes Cls = new C_Clientes();
            List<C_Clientes> ObjList = new List<C_Clientes>();
            Cls.Nombre = Cliente;

            Cls.Respuesta = Cls.ValidaCliente(Cls);
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// dispara el proceso de creacion o edicion de un usuario
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="Nombre"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object CreateClientes(string TypeOperation,
                                        string Nombre,
                                        string Nit)
        {

            C_Clientes Cls = new C_Clientes();
            List<C_Clientes> ObjList = new List<C_Clientes>();

            Cls.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            Cls.Nombre = Nombre;
            Cls.Nit = Nit;

            if (Cls.Id == 0)
            {
                //crear

                Cls.Respuesta = Cls.Create_Cliente(Cls);

                int valor;

                Cls.Id = (int.TryParse(Cls.Respuesta, out valor)) ? Convert.ToInt64(Cls.Respuesta) : 0;
                Cls.Respuesta = (Cls.Id != 0) ? "200" : "500";
            }
            else
            {
                //Editar
                Cls.Id = Convert.ToInt64(Cls.Update_Cliente(Cls));
                Cls.Respuesta = (Cls.Id != 0) ? "200" : "503";
            }
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };

        }
        #endregion

        #region "ADMIN CAMPAÑAS"
        /// <summary>
        /// trae las campañas del universo del negocio
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object DropClientes()
        {
            C_Clientes Cls = new C_Clientes();
            List<C_Dato> ObjList = new List<C_Dato>();

            ObjList = Cls.List_Clientes();

            return new
            {
                data = ObjList
            };

        }

        /// <summary>
        /// trae las campañas para el grid
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListCampanas()
        {
            C_Campanas Cls = new C_Campanas();
            List<C_Campanas> ObjList = new List<C_Campanas>();

            ObjList = Cls.Read_Campanas(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// trae la data para el drop de campanas
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object DropListCampanas()
        {
            C_Campanas Cls = new C_Campanas();
            List<C_Dato> ObjList = new List<C_Dato>();

            ObjList = Cls.Read_Campanas_All(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// valida si el nombreusuario ya existe en la BD
        /// </summary>
        /// <param name="Usuario"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ValidaCampana(string Campana,
                                           string ClienteId)
        {
            C_Campanas Cls = new C_Campanas();
            List<C_Campanas> ObjList = new List<C_Campanas>();
            Cls.Nombre = Campana;
            Cls.ClienteId = Convert.ToInt64(ClienteId);
            Cls.Respuesta = Cls.ValidaCampana(Cls);

            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// trae los roles asignados en la campaña
        /// </summary>
        /// <param name="Campana"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListRolCampana(string Campana)
        {
            C_Rol rol = new C_Rol();
            List<C_Rol> ObjList = new List<C_Rol>();

            rol.CampanaId = Convert.ToInt64(Campana);

            ObjList = rol.Read_Roles(rol);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// trae los procesos asignados en la campaña
        /// </summary>
        /// <param name="Campana"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListProcesoCampana(string Campana)
        {
            C_Dato Cls = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            Cls.Id = Convert.ToInt64(Campana);
            Cls.TablaId = 8;

            ObjList = Cls.Read_DataProcesos(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// trae los permisos segun el rol en la campaña seleccionada
        /// </summary>
        /// <param name="Campana"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListPermisoPaginaCampana(string Campana)
        {
            C_Pagina Cls = new C_Pagina();
            List<C_Pagina> ObjList = new List<C_Pagina>();

            Cls.CuentaId = Convert.ToInt64(Campana);
           
            ObjList = Cls.Read_PerfilesDash(Cls);

            return new
            {
                data = ObjList
            };
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object UpdatePermisosPag(string IdSelect,
                                                                                string Opcion)
        {
            C_Pagina Cls = new C_Pagina();
            List<C_Pagina> ObjList = new List<C_Pagina>();

            Cls.Id =  Convert.ToInt64(IdSelect);
            Cls.Visible = Convert.ToInt64(Opcion);

            Cls.Visible = Convert.ToInt32(Cls.Update_PermisosPagina(Cls));

            Cls.Respuesta = (Cls.Visible == 0 || Cls.Visible == 1) ? "200" : "500";
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };

        }

        /// <summary>
        /// dispara el proceso de creacion o edicion de una campaña
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="Cliente"></param>
        /// <param name="Nombre"></param>
        /// <param name="CantidadMonitoreo"></param>
        /// <param name="FrecuenciaMonitoreo"></param>
        /// <param name="ColorBack"></param>
        /// <param name="ColorHeaderTitle"></param>
        /// <param name="ColorLabel"></param>
        /// <param name="ColorAlerta"></param>
        /// <param name="Rol1"></param>
        /// <param name="Rol2"></param>
        /// <param name="Rol3"></param>
        /// <param name="Rol4"></param>
        /// <param name="Rol5"></param>
        /// <param name="Rol6"></param>
        /// <param name="CoordinadorMonitorea"></param>
        /// <param name="Logo"></param>
        /// <param name="EmailFrom"></param>
        /// <param name="Smtp"></param>
        /// <param name="EmailConfig"></param>
        /// <param name="EmailPass"></param>
        /// <param name="ListProcesos"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object CreateCampana(string TypeOperation,
                                           string Cliente,
                                           string Nombre,
                                           string CantidadMonitoreo,
                                           string FrecuenciaMonitoreo,
                                           string ColorBack,
                                           string ColorHeaderTitle,
                                           string ColorLabel,
                                           string ColorAlerta,
                                           string Rol1,
                                           string Rol2,
                                           string Rol3,
                                           string Rol4,
                                           string Rol5,
                                           string Rol6,
                                           string Nivel0,
                                           string Nivel1,
                                           string Nivel2,
                                           string Nivel3,
                                           string Nivel4,
                                           string CoordinadorMonitorea,
                                           string Logo,
                                           string EmailFrom,
                                           string Smtp,
                                           string EmailConfig,
                                           string EmailPass,
                                           string ListProcesos)
        {

            C_CorreoCampana ClsCC = new C_CorreoCampana();
            C_Campanas Cls = new C_Campanas();
            List<C_Campanas> ObjList = new List<C_Campanas>();
            C_EstiloCampana clsEC = new C_EstiloCampana();
            C_EstructuraFormularioCampana ClsF = new C_EstructuraFormularioCampana();

            Cls.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            Cls.Nombre = Nombre;
            Cls.ClienteId = Convert.ToInt64(Cliente);
            Cls.CantidadMonitoreos = Convert.ToInt32(CantidadMonitoreo);
            Cls.FrecuenciaMonitoreoId = Convert.ToInt64(FrecuenciaMonitoreo);
            Cls.CoordinadorMonitorea = Convert.ToInt32(CoordinadorMonitorea);

            clsEC.ColorBack = ColorBack;
            clsEC.ColorHeaderTitle = ColorHeaderTitle;
            clsEC.ColorLabel = ColorLabel;
            clsEC.ColorAlerta = ColorAlerta;
            clsEC.Logo = Logo;

            ClsCC.EMAIL_CONFIG = EmailConfig;
            ClsCC.EMAIL_FROM = EmailFrom;
            ClsCC.EMAIL_PASS = EmailPass;
            ClsCC.SMTP = Smtp;

            ClsF.Title_Nivel0 = Nivel0;
            ClsF.Title_Nivel1 = Nivel1;
            ClsF.Title_Nivel2 = Nivel2;
            ClsF.Title_Nivel3 = Nivel3;
            ClsF.Title_Nivel4 = Nivel4;

            C_Rol rol = new C_Rol();

            if (Cls.Id == 0)
            {
                //crear
                Cls.Respuesta = Cls.Create_Campana(Cls);

                clsEC.CampanaId = Convert.ToInt64(Cls.Respuesta);
                clsEC.Create_EstiloCampana(clsEC);

                ClsCC.CampanaId = Convert.ToInt64(Cls.Respuesta);
                ClsCC.Create_CorreoCampana(ClsCC);

                ClsF.CuentaId = Convert.ToInt64(Cls.Respuesta);
                ClsF.Create_EstructuraFormulario(ClsF);

                rol.CampanaId = Convert.ToInt64(Cls.Respuesta);
                rol.Estado = 1;
                rol.Nombre = Rol1.ToUpper();
                rol.ValueRolId = 1;
                rol.Create_Roles(rol);

                rol.Nombre = Rol2.ToUpper();
                rol.ValueRolId = 2;
                rol.Create_Roles(rol);

                rol.Nombre = Rol3.ToUpper();
                rol.ValueRolId = 3;
                rol.Create_Roles(rol);

                rol.Nombre = Rol4.ToUpper();
                rol.ValueRolId = 4;
                rol.Create_Roles(rol);

                rol.Nombre = Rol5.ToUpper();
                rol.ValueRolId = 5;
                rol.Create_Roles(rol);

                rol.Nombre = Rol6.ToUpper();
                rol.ValueRolId = 6;
                rol.Create_Roles(rol);

                C_Pagina pagina = new C_Pagina();
                pagina.CuentaId = Convert.ToInt64(Cls.Respuesta);
                pagina.Create_PermisosIniciales(pagina);

                int valor;

                Cls.Id = (int.TryParse(Cls.Respuesta, out valor)) ? Convert.ToInt64(Cls.Respuesta) : 0;
                Cls.Respuesta = (Cls.Id != 0) ? "200" : "500";

                if (ListProcesos != "VACIO")
                {
                    //guardar procesos
                    JArray LProcesos = JArray.Parse(ListProcesos);
                    foreach (var item in LProcesos)
                    {
                        C_Dato dato = new C_Dato();
                        dato.Nombre = item["Nombre"].ToString();
                        dato.TablaId = Convert.ToInt64(item["TablaId"]);
                        dato.Campo_Add1 = clsEC.CampanaId.ToString();
                        dato.Activo = Convert.ToInt32(item["Activo"]);
                        dato.Codigo = "PRC";
                        dato.Valor = 1;
                        dato.PadreId = 0;

                        dato.Create_Dato(dato);
                    }
                }

            }
            else
            {
                //Editar
                Cls.Id = Convert.ToInt64(Cls.Update_Campana(Cls));

                clsEC.CampanaId = Cls.Id;
                clsEC.Update_EstiloCampana(clsEC);

                ClsCC.CampanaId = Cls.Id;
                ClsCC.Update_CorreoCampana(ClsCC);

                ClsF.CuentaId = Cls.Id;
                ClsF.Update_EstructuraFormulario(ClsF);

                rol.CampanaId = Cls.Id;

                List<C_Rol> ObjListRol = new List<C_Rol>();
                ObjListRol = rol.Read_Roles(rol);

                rol.Id = ObjListRol[0].Id;
                rol.Nombre = Rol1.ToUpper();
                rol.Update_Roles(rol);

                rol.Id = ObjListRol[1].Id;
                rol.Nombre = Rol2.ToUpper();
                rol.Update_Roles(rol);

                rol.Id = ObjListRol[2].Id;
                rol.Nombre = Rol3.ToUpper();
                rol.Update_Roles(rol);

                rol.Id = ObjListRol[3].Id;
                rol.Nombre = Rol4.ToUpper();
                rol.Update_Roles(rol);

                rol.Id = ObjListRol[4].Id;
                rol.Nombre = Rol5.ToUpper();
                rol.Update_Roles(rol);

                rol.Id = ObjListRol[5].Id;
                rol.Nombre = Rol6.ToUpper();
                rol.Update_Roles(rol);

                Cls.Respuesta = (Cls.Id != 0) ? "200" : "503";

                if (ListProcesos != "VACIO")
                {
                    //guardar procesos
                    JArray LProcesos = JArray.Parse(ListProcesos);
                    foreach (var item in LProcesos)
                    {
                        C_Dato dato = new C_Dato();

                        dato.Id = Convert.ToInt64(item["Id"]);
                        dato.Nombre = item["Nombre"].ToString();
                        dato.TablaId = Convert.ToInt64(item["TablaId"]);
                        dato.Campo_Add1 = Cls.Id.ToString();
                        dato.Activo = Convert.ToInt32(item["Activo"]);
                        dato.Codigo = "PRC";
                        dato.Valor = 1;
                        dato.PadreId = 0;

                        dato.FiltroQuery = (dato.Id == 0) ? dato.Create_Dato(dato) : dato.Update_Dato(dato);
                    }
                }
            }
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };

        }

        /// <summary>
        /// trae los titulos formulario asignados en la campaña
        /// </summary>
        /// <param name="Campana"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListFormularioCampana(string Campana)
        {
            C_EstructuraFormularioCampana Cls = new C_EstructuraFormularioCampana();
            List<C_EstructuraFormularioCampana> ObjList = new List<C_EstructuraFormularioCampana>();

            Cls.CuentaId = Convert.ToInt64(Campana);

            ObjList = Cls.Read_EstructuraFormularioCuenta(Cls);

            return new
            {
                data = ObjList
            };
        }

        #endregion

        #region "ADMIN USUARIOS"
        /// <summary>
        /// trae todos los usuario para el drop list
        /// </summary>
        private void DropListUsers()
        {
            List<C_Dato> ObjList = new List<C_Dato>();
            C_Usuario Cls = new C_Usuario();

            ObjList = Cls.Read_Users_All(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae las lista de usuarios por cuenta
        /// </summary>
        private void DropListUsersCuenta()
        {
            List<C_Dato> ObjList = new List<C_Dato>();
            C_Usuario Cls = new C_Usuario();

            Cls.Id = Convert.ToInt64(Request.Form["CampanaId"]);

            ObjList = Cls.Read_Users_Cuenta(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae todos los usuario para el drop list
        /// </summary>
        private void ListUsuarios_Campana()
        {
            C_Usuario Cls = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();

            Cls.Id = Convert.ToInt32(HttpContext.Current.Session["Work_Campana_QA"]);
            ObjList = Cls.Read_Users_Campana(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae los usuarios por campaña
        /// </summary>
        private void ListUsuarios_Campana_UC()
        {
            C_Usuario Cls = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();

            Cls.Id = Convert.ToInt64(Request.Form["CampanaId"]);
            ObjList = Cls.Read_Users_Campana(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae la lista de roles
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListRoles()
        {
            C_Rol Cls = new C_Rol();
            List<C_Dato> ObjList = new List<C_Dato>();

            Cls.CampanaId = Convert.ToInt32(HttpContext.Current.Session["Work_Campana_QA"]);

            ObjList = Cls.Read_DropListRol(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// valida si el nombreusuario ya existe en la BD
        /// </summary>
        /// <param name="Usuario"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ValidaUser(string Documento)
        {
            C_Usuario Cls = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();
            Cls.Documento = Documento;

            Cls.Respuesta = Cls.Validate_Usuario(Cls);
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// dispara el proceso de creacion o edicion de un usuario
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="CampanaId"></param>
        /// <param name="Nombres"></param>
        /// <param name="Apellidos"></param>
        /// <param name="Correo"></param>
        /// <param name="Documento"></param>
        /// <param name="RolId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object CreateUser(string TypeOperation,
                                        string CampanaId,
                                        string Nombres,
                                        string Apellidos,
                                        string Correo,
                                        string Gestionable,
                                        string Documento,
                                        string RolId)
        {

            C_Usuario ClsU = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();

            ClsU.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            ClsU.Nombre = Nombres;
            ClsU.Apellido = Apellidos;
            ClsU.Correo = Correo;
            ClsU.Documento = Documento;
            ClsU.Gestionable = Convert.ToInt32(Gestionable);
            ClsU.RolId = Convert.ToInt64(RolId);

            if (ClsU.Id == 0)
            {
                //crear
                Encriptar Enc = new Encriptar();
                C_UsuarioAcceso ClsUA = new C_UsuarioAcceso();
                C_GroupWork groupWork = new C_GroupWork();

                ClsU.Password = Enc.SHA256_Certificado(Documento);

                ClsU.Respuesta = ClsU.Create_User(ClsU);

                int valor;

                ClsU.Id = (int.TryParse(ClsU.Respuesta, out valor)) ? Convert.ToInt64(ClsU.Respuesta) : 0;

                if (ClsU.Id != 0)
                {

                    ClsUA.Documento = Documento;
                    ClsUA.CuentaId = Convert.ToInt64(CampanaId);
                    ClsUA.UsuarioId = ClsU.Id;
                    ClsUA.Estado = 1;
                    ClsUA.ValueRolId = Convert.ToInt64(RolId);

                    ClsUA.Id = Convert.ToInt64(ClsUA.Create_UserClientCampana(ClsUA));

                    groupWork.CampanaId = Convert.ToInt64(CampanaId);
                    groupWork.CoordinadorId = ClsU.Id;
                    groupWork.UsuarioId = ClsU.Id;
                    groupWork.ValueRolId = Convert.ToInt64(RolId);

                    groupWork.Id = Convert.ToInt64(groupWork.Create_GrupoTrabajo(groupWork));

                    if (ClsUA.Id != 0)
                    {

                        if (Correo != "NOAPLICA@CORREO.COM")
                        {
                            C_Mensajes mensajes = new C_Mensajes();
                            List<C_Mensajes> ObjListM = new List<C_Mensajes>();
                            C_EstiloCampana estiloCampana = new C_EstiloCampana();
                            List<C_EstiloCampana> ObjListEC = new List<C_EstiloCampana>();

                            Mails mails = new Mails();
                            mensajes.TipoMensajeId = 12;
                            estiloCampana.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
                            var vl_mensajeCanal = "";

                            ObjListM = mensajes.Read_TipoMensaje(mensajes);
                            ObjListEC = estiloCampana.Read_STYLE_CAMPANA(estiloCampana);

                            string vl_Accion = "Nuevo Usuario";
                            string vl_Titulo = "HORIZON - Nuevo usuario de la plataforma";
                            string FechaHoy = DateTime.Now.ToString("yyyy-MM-dd");

                            vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                            vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", Nombres + " " + Apellidos);
                            vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                            vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                            vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                            vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                            vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);



                            mails.SendMail(Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());

                        }

                        ClsU.Respuesta = (ClsUA.Id != 0) ? "200" : "502";
                    }
                    else
                    {
                        ClsU.Respuesta = "501";
                    }
                }
                else
                {
                    ClsU.Respuesta = "500";
                }
            }
            else
            {
                ClsU.ColorId = Convert.ToInt64(CampanaId);
                //Editar
                ClsU.Id = Convert.ToInt64(ClsU.Update_User(ClsU));
                ClsU.Respuesta = (ClsU.Id != 0) ? "200" : "503";
            }
            ObjList.Add(ClsU);

            return new
            {
                data = ObjList
            };

        }

        /// <summary>
        /// activa o desctiva el usuario
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="Estado"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ActiveInactiveUser(string TypeOperation,
                                               string Estado)
        {
            C_Usuario ClsU = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();

            ClsU.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);
            ClsU.Documento = Estado;

            ClsU.Estado = Convert.ToInt32(ClsU.InactiveUser(ClsU));

            ClsU.Respuesta = (ClsU.Estado == 0 || ClsU.Estado == 1) ? "200" : "500";
            ObjList.Add(ClsU);

            return new
            {
                data = ObjList
            };

        }

        /// <summary>
        /// activa el cambio de password
        /// </summary>
        /// <param name="Nombre"></param>
        /// <param name="Documento"></param>
        /// <param name="Correo"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ActivacionCambioPassword(string Nombre,
                                                                                  string Documento,
                                                                                 string Correo)
        {
            C_Usuario ClsU = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();

            ClsU.Documento = Documento;
            ClsU.ActivateUpdatePassword_User(ClsU);

            if (Correo != "NOAPLICA@CORREO.COM")
            {
                C_Mensajes mensajes = new C_Mensajes();
                List<C_Mensajes> ObjListM = new List<C_Mensajes>();
                C_EstiloCampana estiloCampana = new C_EstiloCampana();
                List<C_EstiloCampana> ObjListEC = new List<C_EstiloCampana>();

                Mails mails = new Mails();
                mensajes.TipoMensajeId = 11;
                estiloCampana.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
                var vl_mensajeCanal = "";

                ObjListM = mensajes.Read_TipoMensaje(mensajes);
                ObjListEC = estiloCampana.Read_STYLE_CAMPANA(estiloCampana);

                string vl_Accion = "Cambio de Contraseña";
                string vl_Titulo = "HORIZON - Activación de Cambio de Contraseña";
                string FechaHoy = DateTime.Now.ToString("yyyy-MM-dd");

                vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", Nombre);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                mails.SendMail(Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());

                ClsU.Respuesta = "200";
                ObjList.Add(ClsU);
            }
            else
            {
                ClsU.Respuesta = "200";
                ObjList.Add(ClsU);
            }

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// trae la datra del usuario y las campañas o cuentas asignadas
        /// </summary>
        /// <param name="UsuarioId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object DataUserCampana(string UsuarioId)
        {
            C_Usuario Cls = new C_Usuario();
            C_UsuarioAcceso ClsUA = new C_UsuarioAcceso();
            List<C_Usuario> ObjList = new List<C_Usuario>();
            List<C_UsuarioAcceso> ObjListUA = new List<C_UsuarioAcceso>();

            Cls.Id = Convert.ToInt32(UsuarioId);
            ObjList = Cls.Read_User_Id(Cls);

            ClsUA.UsuarioId = Convert.ToInt32(UsuarioId);
            ObjListUA = ClsUA.Read_UsersCampanas_All(ClsUA);

            return new
            {
                data = ObjList,
                campanasAsigned = ObjListUA
            };
        }

        /// <summary>
        /// asigna la campaña al usuario seleccionado
        /// </summary>
        /// <param name="CampanaId"></param>
        /// <param name="UsuarioId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object AddUsuarioCampana(string CampanaId,
                                               string UsuarioId,
                                               string RolId)
        {
            C_UsuarioAcceso Cls = new C_UsuarioAcceso();
            List<C_UsuarioAcceso> ObjList = new List<C_UsuarioAcceso>();

            Cls.Documento = HttpContext.Current.Session["Sesion_User_QA"].ToString().ToUpper();
            Cls.UsuarioId = Convert.ToInt32(UsuarioId);
            Cls.CuentaId = Convert.ToInt32(CampanaId);
            Cls.ValueRolId = Convert.ToInt32(RolId);
            Cls.Estado = 1;

            Cls.Respuesta = Cls.Create_UserClientCampana(Cls);

            int valor;
            Cls.Id = (int.TryParse(Cls.Respuesta, out valor)) ? Convert.ToInt64(Cls.Respuesta) : 0;

            Cls.Respuesta = (Cls.Id != 0) ? "200" : "500";
            ObjList.Add(Cls);
            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// activa o desactiva la campaña al usuario asignado
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="Estado"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ActiveInactiveUserCampana(string TypeOperation,
                                              string Estado)
        {
            C_UsuarioAcceso Cls = new C_UsuarioAcceso();
            List<C_UsuarioAcceso> ObjList = new List<C_UsuarioAcceso>();

            Cls.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);
            Cls.Estado = Convert.ToInt32(Estado);

            Cls.Estado = Convert.ToInt32(Cls.InactiveUserCampana(Cls));

            Cls.Respuesta = (Cls.Estado == 0 || Cls.Estado == 1) ? "200" : "500";
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object DataUserHistoricoPassword(string UsuarioId)
        {
            C_Usuario Cls = new C_Usuario();
            C_HistoricoPassword ClsHP = new C_HistoricoPassword();
            List<C_Usuario> ObjList = new List<C_Usuario>();
            List<C_HistoricoPassword> ObjListHP = new List<C_HistoricoPassword>();

            Cls.Id = Convert.ToInt32(UsuarioId);
            ObjList = Cls.Read_User_Id(Cls);

            ClsHP.UsuarioId = Convert.ToInt32(UsuarioId);
            ObjListHP = ClsHP.Read_Historico_User(ClsHP);

            return new
            {
                data = ObjList,
                historyPasword = ObjListHP
            };
        }

        /// <summary>
        /// genera el evento para el pdf
        /// </summary>
        /// <param name="IdUser"></param>
        /// <param name="NameUser"></param>
        /// <param name="DocumentUser"></param>
        /// <param name="ListData"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object GenerarHistoricoPDF(string IdUser,
                                                                                        string NameUser,
                                                                                        string DocumentUser,
                                                                                        string ListData,
                                                                                         string Logo)
        {
            PDF pDF = new PDF();
            List<PDF> ObjList = new List<PDF>();

            pDF.TipoDocumento = "HistoricoContraseña";
            pDF.RutaDocumento = System.Web.HttpContext.Current.Server.MapPath("/Repositorio/PDF");
            pDF.RutaLogo = System.Web.HttpContext.Current.Server.MapPath("/Repositorio/ImgClientes");
            pDF.Logo = Logo;

            pDF.NombreCompleto = NameUser;
            pDF.Documento = DocumentUser;
            pDF.ListHistory = ListData;

            pDF.Respuesta = pDF.Pdf_HistoricoContrasena(pDF);
            ObjList.Add(pDF);


            return new
            {
                data = ObjList
            };
        }

        #endregion

        #region "ADMIN MENSAJES"

        private void ListMensajes()
        {
            C_Mensajes Cls = new C_Mensajes();
            List<C_Mensajes> ObjList = new List<C_Mensajes>();

            ObjList = Cls.Read_All(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object CreateMensaje(string TypeOperation,
                                                                               string Titulo,
                                                                               string CuerpoMensaje_Interno,
                                                                               string Url,
                                                                               string CuerpoMensaje)
        {
            C_Mensajes Cls = new C_Mensajes();
            List<C_Mensajes> ObjList = new List<C_Mensajes>();

            Cls.CuerpoMensaje = CuerpoMensaje;
            Cls.CuerpoMensaje_Interno = CuerpoMensaje_Interno;
            Cls.Url = Url;

            Cls.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            if (Cls.Id == 0)
            {
            }
            else
            {

                Cls.Id = Convert.ToInt64(Cls.Update_Mensaje(Cls));
                Cls.Respuesta = (Cls.Id != 0) ? "200" : "503";

            }
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };
        }
        #endregion

        #region "LISTA - CATALOGO"
        /// <summary>
        /// TRAE LOS DATOS PARA CARGA DE DROP LIST
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="Type"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_DropList(string Id, string Type)
        {
            C_Dato Cls = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            Cls.TablaId = Convert.ToInt32(Id);
            Cls.FiltroQuery = Type;

            ObjList = Cls.Read_DropList(Cls);

            return new
            {
                data = ObjList
            };
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_DropList_Filtrer(string Id)
        {
            C_Dato Cls = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            Cls.TablaId = Convert.ToInt32(Id);
            Cls.Campo_Add1 = HttpContext.Current.Session["Work_Campana_QA"].ToString();

            ObjList = Cls.Read_DropList_Campana(Cls);

            return new
            {
                data = ObjList
            };
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object DropListCatalogo()
        {
            C_Dato Cls = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            ObjList = Cls.Read_DropTabla(Cls);

            return new
            {
                data = ObjList
            };
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListDataCatalogo(string TablaId)
        {
            C_Dato Cls = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            Cls.TablaId = Convert.ToInt64(TablaId);

            ObjList = Cls.Read_DataTablaId(Cls);

            return new
            {
                data = ObjList
            };
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ValidaDato(string TablaId,
                                                                       string Nombre)
        {
            C_Dato Cls = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            Cls.Nombre = Nombre.ToUpper();
            Cls.TablaId = Convert.ToInt64(TablaId);

            Cls.Respuesta = Cls.Validate_Dato(Cls);

            ObjList.Add(Cls);
            return new
            {
                data = ObjList
            };
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_Dato(string TypeOperation,
                                                                           string TablaId,
                                                                           string Nombre,
                                                                           string Codigo)
        {

            C_Dato dato = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            dato.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            dato.Nombre = Nombre.ToUpper();
            dato.TablaId = Convert.ToInt64(TablaId);
            dato.Campo_Add1 = "";
            dato.Activo = 1;
            dato.Codigo = Codigo;
            dato.Valor = 1;
            dato.PadreId = 0;

            dato.Respuesta = (dato.Id == 0) ? dato.Create_Dato(dato) : dato.Update_Dato(dato);

            int valor;
            dato.Id = (int.TryParse(dato.Respuesta, out valor)) ? Convert.ToInt64(dato.Respuesta) : 0;
            dato.Respuesta = (dato.Id != 0) ? "200" : "500";

            ObjList.Add(dato);

            return new
            {
                data = ObjList
            };
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ActiveInactiveDato(string TypeOperation,
                                            string Activo)
        {
            C_Dato Cls = new C_Dato();
            List<C_Dato> ObjList = new List<C_Dato>();

            Cls.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);
            Cls.Activo = Convert.ToInt32(Activo);

            Cls.Activo = Convert.ToInt32(Cls.InactiveDato(Cls));

            Cls.Respuesta = (Cls.Activo == 0 || Cls.Activo == 1) ? "200" : "500";
            ObjList.Add(Cls);

            return new
            {
                data = ObjList
            };

        }
        #endregion

        #region "CARGA ARCHIVOS"
        /// <summary>
        /// carga los archivos
        /// </summary>
        protected void Upload_File_Server()
        {
            C_Conexion vg_ConexionClass = new C_Conexion();

            C_Files Cls_File = new C_Files();
            C_Chargue Cls_Charge = new C_Chargue();
            List<C_Chargue> vl_ObjList = new List<C_Chargue>();
            //capturamos  data del control de carga
            string vl_S_RutaTemporal = Request.Form["RutaTemporal"];
            string vl_S_Nombre = Request.Form["NameTemporal"];
            string vl_S_Modulo = Request.Form["Modulo"];
            string NameFile = "";
            string objSerialize = "";

            Cls_Charge.CampanaId = Convert.ToInt64(Request.Form["CampanaId"]);
            Cls_Charge.UsuarioId = Convert.ToInt64(Request.Form["IdUser"]);
            Cls_Charge.CantidadRegistros = 0;
            Cls_Charge.CantidadRegistrosCreados = 0;
            Cls_Charge.CantidadRegistrosActualizados = 0;
            Cls_Charge.CantidadRegistros_NoInsertados = 0;


            switch (vl_S_Modulo)
            {

                case "Users":
                    //LIMPIAMOS LA TABLA TEMPORAL
                    string Result = Cls_Charge.Delete_CargaMasiva("0", vl_S_Modulo);
                    NameFile = Cls_File.Upload_File(Request.Files, vl_S_RutaTemporal, vl_S_Nombre);

                    if (NameFile != "")
                    {
                        string vl_Status_Copy = Cls_Charge.Chargue_Masivo_Excel(vl_S_RutaTemporal, vl_S_Nombre, vl_S_Modulo);

                        if (vl_Status_Copy == "OK")
                        {
                            Cls_Charge.TipoCargueId = 10;

                            string vl_CargueId = Cls_Charge.Create_ControlCargue(Cls_Charge);

                            objSerialize = Cls_Charge.CargueUsers(vl_CargueId, Request.Form["CampanaId"]);

                        }
                        else
                        {
                            objSerialize = String.Format("[{0},{1},{2}]", "Vacio", "Vacio", vl_Status_Copy);
                        }

                    }
                    else
                    {
                        objSerialize = String.Format("[{0},{1},{2}]", "Vacio", "Vacio", "FALLA EN SUBIDA DEL ARCHIVO AL SERVIDOR");
                    }


                    break;

                case "Forms":
                    //LIMPIAMOS LA TABLA TEMPORAL
                    string Result2 = Cls_Charge.Delete_CargaMasiva("0", vl_S_Modulo);
                    NameFile = Cls_File.Upload_File(Request.Files, vl_S_RutaTemporal, vl_S_Nombre);
                    string Json_2 = "";

                    if (NameFile != "")
                    {
                        string vl_Status_Copy = Cls_Charge.Chargue_Masivo_Excel(vl_S_RutaTemporal, vl_S_Nombre, vl_S_Modulo);

                        if (vl_Status_Copy == "OK")
                        {
                            string vl_CuenatId = HttpContext.Current.Session["Work_Campana_QA"].ToString();
                            Cls_Charge.TipoCargueId = 123;

                            string vl_CargueId = Cls_Charge.Create_ControlCargue(Cls_Charge);

                            objSerialize = Cls_Charge.CargueForm(vl_CargueId, vl_CuenatId);

                        }


                    }

                    break;

                case "CampanaFiles":
                    Cls_File.Delete_File(vl_S_RutaTemporal, vl_S_Nombre);
                    NameFile = Cls_File.Upload_File(Request.Files, vl_S_RutaTemporal, vl_S_Nombre);
                    string Json_3 = "";

                    List<C_Chargue> ObjList_Respuesta = new List<C_Chargue>();

                    C_Chargue Rta = new C_Chargue();

                    if (NameFile != "")
                    {
                        Rta.Respuesta = "OK";
                        vl_ObjList.Add(Rta);

                        Json_3 = JsonConvert.SerializeObject(vl_ObjList);

                        objSerialize = String.Format("[{0}]", Json_3);
                    }
                    else
                    {
                        Rta.Respuesta = "NO";
                        vl_ObjList.Add(Rta);

                        Json_3 = JsonConvert.SerializeObject(vl_ObjList);

                        objSerialize = String.Format("[{0}]", Json_3);
                    }
                    break;
            }

            Response.Write(objSerialize);
        }

        #endregion

        #region "NOTIFICACION"

        /// <summary>
        /// actualiza la lectura del monitoreo
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Update_Notificacion(string Id)
        {
            C_Notificacion Cls = new C_Notificacion();
            List<C_Notificacion> ObjList = new List<C_Notificacion>();

            Cls.Id = Convert.ToInt64(Id);

            Cls.Respuesta = Cls.Update_Flag_Notificacion(Cls);

            int valor;

            Cls.Respuesta = (int.TryParse(Cls.Respuesta, out valor)) ? "200" : "500";
            ObjList.Add(Cls);

            return new
            {
                data = ObjList,
            };

        }
        #endregion

        #region "GRUPOS"

        /// <summary>
        /// trae la data de personal ajeno al perfil de agente
        /// </summary>
        /// <param name="TablaId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListUserPersonal()
        {
            C_GroupWork Cls = new C_GroupWork();
            List<C_GroupWork> ObjList = new List<C_GroupWork>();

            Cls.Id = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            ObjList = Cls.Read_Personal(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// trae todos los agentes de la campaña seleccionada
        /// </summary>
        private void ListUserAgentesAll()
        {
            C_GroupWork Cls = new C_GroupWork();
            List<C_GroupWork> ObjList = new List<C_GroupWork>();

            Cls.Id = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            Cls.Respuesta = Request.Form["TipoOperacion"];

            switch (Cls.Respuesta)
            {
                case "0":
                    ObjList = Cls.Read_AgentesAll(Cls);
                    break;
                case "1":
                    ObjList = Cls.Read_AgentesSinAsig(Cls);
                    break;
              
            }

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        private void ListUserAgentesCoordindor()
        {
            C_GroupWork Cls = new C_GroupWork();
            List<C_GroupWork> ObjList = new List<C_GroupWork>();

            Cls.Id = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            Cls.Respuesta = Request.Form["CoordinadorId"];

            ObjList = Cls.Read_AgentesCoordinador(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }


        /// <summary>
        /// actualiza los registros selecciondos
        /// </summary>
        /// <param name="ListAsignacion"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object UpdateCoordinador(string ListAsignacion)
        {
            C_GroupWork groupWork = new C_GroupWork();
            List<C_GroupWork> ObjList = new List<C_GroupWork>();

            //actualizar coordinador
            JArray LAsignacion = JArray.Parse(ListAsignacion);
            foreach (var item in LAsignacion)
            {
                C_GroupWork Cls = new C_GroupWork();

                Cls.Id = Convert.ToInt64(item["AgenteId"]);
                Cls.CoordinadorId = Convert.ToInt64(item["CoordinadorId"]);

                Cls.Update_GrupoTrabajo(Cls);

            }

            groupWork.Respuesta = "200";
            ObjList.Add(groupWork);

            return new
            {
                data = ObjList
            };
        }
        #endregion
    }

    public class C_Seleccion
    {
        public long Select_Cuenta { get; set; }
        public long Select_RolId { get; set; }
        public string Select_Perfil { get; set; }
    }
}