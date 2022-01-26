using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace QaVision.Controller
{
    public partial class ProcesoTransaccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Files.Count > 0)
            {
                //revision de archivos para el servidor
            }
            else
            {
                if (Request.Form["Action"] != null)
                {
                    //capturamos la opcion del proceso
                    string vl_Option_Action = Request.Form["Action"];

                    switch (vl_Option_Action)
                    {

                        case "ClonarForm":
                            Create_ClonarFormulario();
                            break;

                        case "UsersEscaladores":
                            DropList_UsersEscalador();
                            break;

                        case "UsersAgentes":
                            DropList_UsersPerfil("5");
                            break;

                        case "UsersCoordinadores":
                            DropList_UsersPerfil("4");
                            break;

                        case "UsersMonitores":
                            DropList_UsersPerfil("3");
                            break;

                        case "UsersSMonitores":
                            DropList_UsersPerfil("2");
                            break;

                        case "ReadComplementos":
                            ListComplementosFormulario();
                            break;

                        case "CreateNivel2":
                            Create_Nivel2();
                            break;

                        case "CreateNivel3":
                            Create_Nivel3();
                            break;

                        case "CreateNivel4":
                            Create_Nivel4();
                            break;

                        case "ListMonitoreosC":
                            ListMonitoreos_Campana();
                            break;

                        case "ListResultadoMonitoreo":
                            ListResultado_Monitoreo();
                            break;

                        case "EncabezodoReporte":
                            EncabezadoReport();
                            break;

                        case "ReportGeneralXFormulario":
                            Report_GeneralXFormulario();
                            break;

                        case "ReportMonitoreos":
                            Report_MonitoreoRealizados();
                            break;
                    }

                }

            }
        }

        #region "MONITOREO"
        /// <summary>
        /// trae todos los monitoreos por campaña
        /// </summary>
        private void ListMonitoreos_Campana()
        {
            List<C_Monitoreo> ObjList = new List<C_Monitoreo>();
            C_Monitoreo Cls = new C_Monitoreo();

            Cls.Id = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            Cls.RolId = Convert.ToInt64(Request.Form["RolId"]);
            Cls.IdUser = Convert.ToInt64(Request.Form["IdUser"]);

            ObjList = Cls.Read_Monitoreos(Cls);

            C_Usuario usuario = new C_Usuario();
            List<C_Usuario> ObjListU = new List<C_Usuario>();

            usuario.Id = Cls.Id;
            usuario.Respuesta = usuario.BuscarSupervisorr(usuario);

            ObjListU.Add(usuario);

            C_Campanas campanas = new C_Campanas();
            List<C_Campanas> ObjListC = new List<C_Campanas>();

            campanas.Id = Cls.Id;

            campanas.Respuesta = campanas.Coodinador_Monitorea(campanas);
            ObjListC.Add(campanas);

            string Json_1 = JsonConvert.SerializeObject(ObjList);
            string Json_2 = JsonConvert.SerializeObject(ObjListU);
            string Json_3 = JsonConvert.SerializeObject(ObjListC);

            string objSerialize = String.Format("[{0},{1},{2}]", Json_1, Json_2, Json_3);

            Response.Write(objSerialize);
        }

        /// <summary>
        /// trae todos los AGENTES para el drop list
        /// </summary>
        private void DropList_UsersPerfil(string vp_RolId)
        {
            List<C_Dato> ObjList = new List<C_Dato>();
            C_Usuario Cls = new C_Usuario();

            Cls.Id = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            Cls.Documento = vp_RolId;

            ObjList = Cls.Read_UsersPerfil(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// tre los perfiles para escalar
        /// </summary>
        private void DropList_UsersEscalador()
        {
            List<C_Dato> ObjList = new List<C_Dato>();
            C_Usuario Cls = new C_Usuario();

            Cls.Id = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);

            ObjList = Cls.Read_UsersEscalador(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae el coordinador del agente seleccionado
        /// </summary>
        /// <param name="AgenteId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ReadCoordinator(string AgenteId)
        {
            C_GroupWork usuarioAcceso = new C_GroupWork();
            List<C_GroupWork> ObjList = new List<C_GroupWork>();

            usuarioAcceso.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            usuarioAcceso.UsuarioId = Convert.ToInt64(AgenteId);

            ObjList = usuarioAcceso.Read_CoordinatorAsigAgent(usuarioAcceso);

            return new
            {
                data = ObjList,
            };
        }

        /// <summary>
        /// trae los formularios para carga del drop list
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object List_FormulariosDroplist()
        {
            C_Formulario formulario = new C_Formulario();
            List<C_Formulario> ObjList = new List<C_Formulario>();
            formulario.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);

            ObjList = formulario.Read_FormularioDroplist(formulario);

            return new
            {
                data = ObjList,
            };

        }

        /// <summary>
        /// crea el monitoreo
        /// </summary>
        /// <param name="FormularioId"></param>
        /// <param name="MonitorId"></param>
        /// <param name="AgenteId"></param>
        /// <param name="CoordinadorId"></param>
        /// <param name="TipoProcesoId"></param>
        /// <param name="TipoMonitoreoId"></param>
        /// <param name="FechaTransaccion"></param>
        /// <param name="NotaFinal"></param>
        /// <param name="NotaPEC"></param>
        /// <param name="NotaPECUF"></param>
        /// <param name="NotaPECN"></param>
        /// <param name="NotaPECC"></param>
        /// <param name="Observacion"></param>
        /// <param name="OperNivel"></param>
        /// <param name="IdTransaccion"></param>
        /// <param name="ListResultEncuesta"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_Monitoreo(string FormularioId,
                                                                                    string MonitorId,
                                                                                    string AgenteId,
                                                                                    string CoordinadorId,
                                                                                    string TipoProcesoId,
                                                                                    string TipoMonitoreoId,
                                                                                    string FechaTransaccion,
                                                                                    string NotaFinal,
                                                                                    string NotaPEC,
                                                                                    string NotaPECUF,
                                                                                    string NotaPECN,
                                                                                    string NotaPECC,
                                                                                    string Observacion,
                                                                                    string OperNivel,
                                                                                    string IdTransaccion,
                                                                                    string ListResultEncuesta)
        {
            C_Monitoreo monitoreo = new C_Monitoreo();
            List<C_Monitoreo> ObjList = new List<C_Monitoreo>();


            monitoreo.FormularioId = Convert.ToInt64(FormularioId);
            monitoreo.MonitorId = Convert.ToInt64(MonitorId);
            monitoreo.AgenteId = Convert.ToInt64(AgenteId);
            monitoreo.CoordinadorId = Convert.ToInt64(CoordinadorId);
            monitoreo.TipoProcesoId = Convert.ToInt64(TipoProcesoId);
            monitoreo.TipoMonitoreoId = Convert.ToInt64(TipoMonitoreoId);
            monitoreo.FechaTransaccion = FechaTransaccion;

            monitoreo.NotaFinal = NotaFinal;
            monitoreo.NotaPEC = Convert.ToInt32(NotaPEC);
            monitoreo.NotaPECUF = Convert.ToInt32(NotaPECUF);
            monitoreo.NotaPECN = Convert.ToInt32(NotaPECN);
            monitoreo.NotaPECC = Convert.ToInt32(NotaPECC);
            monitoreo.IdTransaccion = IdTransaccion;

            //crea el monitoreo
            monitoreo.Respuesta = monitoreo.Create_Monitoreo(monitoreo);

            int valor;

            monitoreo.Id = (int.TryParse(monitoreo.Respuesta, out valor)) ? Convert.ToInt64(monitoreo.Respuesta) : 0;
            monitoreo.Respuesta = (monitoreo.Id != 0) ? "200" : "500";

            if (monitoreo.Id != 0)
            {
                C_MonitoreoObservacion observacion = new C_MonitoreoObservacion();

                observacion.MonitoreoId = monitoreo.Id;
                observacion.UsuarioId = monitoreo.MonitorId;
                observacion.EstadoId = 124;
                observacion.Observacion = Observacion;

                observacion.Respuesta = observacion.Create_MonitoreoObs(observacion);

                //guardar respuesta del monitoreo
                JArray LRespuestas = JArray.Parse(ListResultEncuesta);
                foreach (var item in LRespuestas)
                {
                    C_MonitoreoResultado monitoreoResultado = new C_MonitoreoResultado();

                    monitoreoResultado.MonitoreoId = monitoreo.Id;
                    monitoreoResultado.OpeNivel = Convert.ToInt32(OperNivel);
                    monitoreoResultado.Opc = item["Opc"].ToString();
                    monitoreoResultado.NivelId = Convert.ToInt32(item["NivelId"]);

                    monitoreoResultado.Create_MonitoreoResultado(monitoreoResultado);
                }
            }
            ObjList.Add(monitoreo);


            List<C_Usuario> ObjListAgente = new List<C_Usuario>();
            List<C_Usuario> ObjListCoordinador = new List<C_Usuario>();
            List<C_Usuario> ObjListMonitor = new List<C_Usuario>();

            C_Usuario User = new C_Usuario();

            User.ColorId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);

            User.Id = Convert.ToInt64(AgenteId);
            ObjListAgente = User.Read_User_IdNotificacion(User);

            User.Id = Convert.ToInt64(CoordinadorId);
            ObjListCoordinador = User.Read_User_IdNotificacion(User);

            User.Id = Convert.ToInt64(MonitorId);
            ObjListMonitor = User.Read_User_IdNotificacion(User);

            C_Mensajes mensajes = new C_Mensajes();
            List<C_Mensajes> ObjListM = new List<C_Mensajes>();
            C_EstiloCampana estiloCampana = new C_EstiloCampana();
            List<C_EstiloCampana> ObjListEC = new List<C_EstiloCampana>();

            Mails mails = new Mails();

            mensajes.TipoMensajeId = 131;
            estiloCampana.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            var vl_mensajeCanal = "";

            ObjListM = mensajes.Read_TipoMensaje(mensajes);
            ObjListEC = estiloCampana.Read_STYLE_CAMPANA(estiloCampana);

            string vl_Accion = "Nuevo Monitoreo";
            string vl_Titulo = "HORIZON - Nuevo monitoreo";
            string FechaHoy = DateTime.Now.ToString("yyyy-MM-dd");
            string vl_User = "";
            string vl_UserM = ObjListMonitor[0].Nombre + " " + ObjListMonitor[0].Apellido;

            //correo coordinador
            if (ObjListCoordinador[0].Correo != "NOAPLICA@CORREO.COM")
            {
                vl_User = ObjListCoordinador[0].Nombre + " " + ObjListCoordinador[0].Apellido;

                vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[UserMonitor]", vl_UserM);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Cargo]", ObjListMonitor[0].Rol.ToLower());
                vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoC]", ObjListCoordinador[0].Rol.ToLower());
                vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                mails.SendMail(ObjListCoordinador[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());

            }

            //correo Agente
            if (ObjListAgente[0].Correo != "NOAPLICA@CORREO.COM")
            {
                vl_User = ObjListAgente[0].Nombre + " " + ObjListAgente[0].Apellido;

                vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[UserMonitor]", vl_UserM);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Cargo]", ObjListMonitor[0].Rol.ToLower());
                vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoC]", ObjListCoordinador[0].Rol.ToLower());
                vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                mails.SendMail(ObjListAgente[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());

            }

            string vl_Mensaje_interno = ObjListM[0].CuerpoMensaje_Interno;

            vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Num]", monitoreo.Id.ToString());
            vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Cargo]", ObjListCoordinador[0].Rol.ToLower());

            C_Notificacion notificacion = new C_Notificacion();
            notificacion.ModuloId = 130;
            notificacion.IndicativoId = monitoreo.Id;
            notificacion.Descripcion = vl_Mensaje_interno;

            //crear notificacion coordinador
            notificacion.UsuarioId = Convert.ToInt64(CoordinadorId);
            notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);

            //crear notificacion agente
            notificacion.UsuarioId = Convert.ToInt64(AgenteId);
            notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);


            return new
            {
                data = ObjList,
            };

        }

        /// <summary>
        /// trae las respuestas del monitoreo
        /// </summary>
        private void ListResultado_Monitoreo()
        {
            List<C_MonitoreoResultado> ObjList = new List<C_MonitoreoResultado>();
            C_MonitoreoResultado Cls = new C_MonitoreoResultado();


            Cls.MonitoreoId = Convert.ToInt64(Request.Form["MonitoreoId"]);

            ObjList = Cls.Read_MonitoreoResultado(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae las observaciones del monitoreo
        /// </summary>
        /// <param name="MonitoreoId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object List_ObservacionesMonitoreo(string MonitoreoId)
        {
            C_MonitoreoObservacion observacion = new C_MonitoreoObservacion();
            List<C_MonitoreoObservacion> ObjList = new List<C_MonitoreoObservacion>();

            observacion.Id = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            observacion.MonitoreoId = Convert.ToInt64(MonitoreoId);

            ObjList = observacion.Read_MonitoreoObservacion(observacion);

            return new
            {
                data = ObjList,
            };

        }

        /// <summary>
        /// guarda el flujo del monitoreo
        /// </summary>
        /// <param name="MonitoreoId"></param>
        /// <param name="EstadoId"></param>
        /// <param name="Observacion"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object SaveAvanceMonitoreo(string MonitoreoId,
                                                                                     string UsuarioId,
                                                                                     string EstadoId,
                                                                                     string Observacion,
                                                                                     string AgenteId,
                                                                                     string CoordinadorId,
                                                                                     string MonitorId)
        {

            C_MonitoreoObservacion observacion = new C_MonitoreoObservacion();
            List<C_MonitoreoObservacion> ObjList = new List<C_MonitoreoObservacion>();

            observacion.MonitoreoId = Convert.ToInt64(MonitoreoId);
            observacion.UsuarioId = Convert.ToInt64(UsuarioId);
            observacion.EstadoId = Convert.ToInt32(EstadoId);
            observacion.Observacion = Observacion;

            observacion.Respuesta = observacion.Create_MonitoreoObs(observacion);

            int valor;

            observacion.Id = (int.TryParse(observacion.Respuesta, out valor)) ? Convert.ToInt64(observacion.Respuesta) : 0;
            observacion.Respuesta = (observacion.Id != 0) ? "200" : "500";

            ObjList.Add(observacion);

            C_Monitoreo monitoreo = new C_Monitoreo();

            monitoreo.Id = Convert.ToInt64(MonitoreoId);
            monitoreo.EstadoId = Convert.ToInt32(EstadoId);

            monitoreo.Respuesta = monitoreo.UpdateEstado_Monitoreo(monitoreo);

            List<C_Usuario> ObjListAgente = new List<C_Usuario>();
            List<C_Usuario> ObjListCoordinador = new List<C_Usuario>();
            List<C_Usuario> ObjListMonitor = new List<C_Usuario>();

            C_Usuario User = new C_Usuario();
            User.ColorId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);

            User.Id = Convert.ToInt64(AgenteId);
            ObjListAgente = User.Read_User_IdNotificacion(User);

            User.Id = Convert.ToInt64(CoordinadorId);
            ObjListCoordinador = User.Read_User_IdNotificacion(User);

            User.Id = Convert.ToInt64(MonitorId);
            ObjListMonitor = User.Read_User_IdNotificacion(User);

            C_Mensajes mensajes = new C_Mensajes();
            List<C_Mensajes> ObjListM = new List<C_Mensajes>();
            C_EstiloCampana estiloCampana = new C_EstiloCampana();
            List<C_EstiloCampana> ObjListEC = new List<C_EstiloCampana>();

            Mails mails = new Mails();

            estiloCampana.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            var vl_mensajeCanal = "";

            ObjListEC = estiloCampana.Read_STYLE_CAMPANA(estiloCampana);

            string vl_Accion = "";
            string vl_Titulo = "";
            string FechaHoy = DateTime.Now.ToString("yyyy-MM-dd");
            string vl_User = "";
            string vl_UserC = "";
            string vl_UserA = "";
            string vl_Mensaje_interno = "";

            C_Notificacion notificacion = new C_Notificacion();

            switch (EstadoId)
            {
                case "125": //Retroalimentación
                    mensajes.TipoMensajeId = 132;
                    ObjListM = mensajes.Read_TipoMensaje(mensajes);

                    vl_Accion = "Retroalimentación por parte del " + ObjListCoordinador[0].Rol.ToLower();
                    vl_Titulo = "HORIZON - Retroalimentación monitoreo";

                    //correo Agente
                    if (ObjListAgente[0].Correo != "NOAPLICA@CORREO.COM")
                    {
                        vl_User = ObjListAgente[0].Nombre + " " + ObjListAgente[0].Apellido;
                        vl_UserC = ObjListCoordinador[0].Nombre + " " + ObjListCoordinador[0].Apellido;

                        vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                        vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoC]", ObjListCoordinador[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserCordi]", vl_UserC);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoA]", ObjListAgente[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserAgente]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                        mails.SendMail(ObjListAgente[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());
                    }

                    //correo Monitor
                    if (ObjListMonitor[0].Correo != "NOAPLICA@CORREO.COM")
                    {
                        vl_User = ObjListMonitor[0].Nombre + " " + ObjListMonitor[0].Apellido;
                        vl_UserA = ObjListAgente[0].Nombre + " " + ObjListAgente[0].Apellido;
                        vl_UserC = ObjListCoordinador[0].Nombre + " " + ObjListCoordinador[0].Apellido;

                        vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                        vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoC]", ObjListCoordinador[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserCordi]", vl_UserC);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoA]", ObjListAgente[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserAgente]", vl_UserA);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                        mails.SendMail(ObjListMonitor[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());
                    }

                    vl_Mensaje_interno = ObjListM[0].CuerpoMensaje_Interno;

                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Num]", monitoreo.Id.ToString());
                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Cargo]", ObjListAgente[0].Rol.ToLower());

                    notificacion.ModuloId = 130;
                    notificacion.IndicativoId = monitoreo.Id;
                    notificacion.Descripcion = vl_Mensaje_interno;

                    //crear notificacion Monitor
                    notificacion.UsuarioId = Convert.ToInt64(MonitorId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);

                    //crear notificacion agente
                    notificacion.UsuarioId = Convert.ToInt64(AgenteId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);
                    break;

                case "126"://Objeción Coordinador
                    mensajes.TipoMensajeId = 133;
                    ObjListM = mensajes.Read_TipoMensaje(mensajes);

                    vl_Accion = "Rechazo por parte del " + ObjListCoordinador[0].Rol.ToLower();
                    vl_Titulo = "HORIZON - rechazo monitoreo";

                    //correo Monitor
                    if (ObjListMonitor[0].Correo != "NOAPLICA@CORREO.COM")
                    {
                        vl_User = ObjListMonitor[0].Nombre + " " + ObjListMonitor[0].Apellido;
                        vl_UserC = ObjListCoordinador[0].Nombre + " " + ObjListCoordinador[0].Apellido;

                        vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                        vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoC]", ObjListCoordinador[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserCordi]", vl_UserC);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Rechazo]", Observacion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                        mails.SendMail(ObjListMonitor[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());
                    }

                    vl_Mensaje_interno = ObjListM[0].CuerpoMensaje_Interno;

                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Num]", monitoreo.Id.ToString());
                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Cargo]", ObjListMonitor[0].Rol.ToLower());

                    notificacion.ModuloId = 130;
                    notificacion.IndicativoId = monitoreo.Id;
                    notificacion.Descripcion = vl_Mensaje_interno;

                    //crear notificacion Monitor
                    notificacion.UsuarioId = Convert.ToInt64(MonitorId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);
                    break;

                case "127"://Compromisos
                    mensajes.TipoMensajeId = 134;
                    ObjListM = mensajes.Read_TipoMensaje(mensajes);

                    vl_Accion = "Compromisos por parte del " + ObjListAgente[0].Rol.ToLower();
                    vl_Titulo = "HORIZON - Compromisos y cierre del monitoreo";

                    //correo Monitor
                    if (ObjListMonitor[0].Correo != "NOAPLICA@CORREO.COM")
                    {
                        vl_User = ObjListMonitor[0].Nombre + " " + ObjListMonitor[0].Apellido;
                        vl_UserA = ObjListAgente[0].Nombre + " " + ObjListAgente[0].Apellido;

                        vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                        vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoA]", ObjListAgente[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserA]", vl_UserA);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                        mails.SendMail(ObjListMonitor[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());
                    }

                    //correo coordinador
                    if (ObjListCoordinador[0].Correo != "NOAPLICA@CORREO.COM")
                    {
                        vl_User = ObjListCoordinador[0].Nombre + " " + ObjListCoordinador[0].Apellido;
                        vl_UserA = ObjListAgente[0].Nombre + " " + ObjListAgente[0].Apellido;

                        vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                        vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoA]", ObjListAgente[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserA]", vl_UserA);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                        mails.SendMail(ObjListCoordinador[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());
                    }

                    vl_Mensaje_interno = ObjListM[0].CuerpoMensaje_Interno;

                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Num]", monitoreo.Id.ToString());
                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Cargo]", ObjListAgente[0].Rol.ToLower());

                    notificacion.ModuloId = 130;
                    notificacion.IndicativoId = monitoreo.Id;
                    notificacion.Descripcion = vl_Mensaje_interno;

                    //crear notificacion Monitor
                    notificacion.UsuarioId = Convert.ToInt64(MonitorId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);

                    //crear notificacion coordinador
                    notificacion.UsuarioId = Convert.ToInt64(CoordinadorId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);
                    break;

                case "128"://Objeción Agente
                    mensajes.TipoMensajeId = 135;
                    ObjListM = mensajes.Read_TipoMensaje(mensajes);

                    vl_Accion = "rechazo por parte del " + ObjListAgente[0].Rol.ToLower();
                    vl_Titulo = "HORIZON - rechazo monitoreo";

                    //correo coordinador
                    if (ObjListCoordinador[0].Correo != "NOAPLICA@CORREO.COM")
                    {
                        vl_User = ObjListCoordinador[0].Nombre + " " + ObjListCoordinador[0].Apellido;
                        vl_UserA = ObjListAgente[0].Nombre + " " + ObjListAgente[0].Apellido;

                        vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                        vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoA]", ObjListAgente[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserA]", vl_UserA);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Rechazo]", Observacion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                        mails.SendMail(ObjListCoordinador[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());
                    }

                    vl_Mensaje_interno = ObjListM[0].CuerpoMensaje_Interno;

                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Num]", monitoreo.Id.ToString());
                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Cargo]", ObjListAgente[0].Rol.ToLower());

                    notificacion.ModuloId = 130;
                    notificacion.IndicativoId = monitoreo.Id;
                    notificacion.Descripcion = vl_Mensaje_interno;

                    //crear notificacion coordinador
                    notificacion.UsuarioId = Convert.ToInt64(CoordinadorId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);
                    break;

                case "129": //Escalar
                    vl_Accion = "Validación por parte del " + ObjListMonitor[0].Rol.ToLower();
                    vl_Titulo = "HORIZON - Eliminar monitoreo";
                    List<C_Usuario> ObjListCliente = new List<C_Usuario>();

                    User.Id = Convert.ToInt64(UsuarioId);
                    ObjListCliente = User.Read_User_IdNotificacion(User);

                    mensajes.TipoMensajeId = 136;
                    ObjListM = mensajes.Read_TipoMensaje(mensajes);

                    //correo cliente
                    if (ObjListCliente[0].Correo != "NOAPLICA@CORREO.COM")
                    {
                        vl_User = ObjListCliente[0].Nombre + " " + ObjListCliente[0].Apellido;
                        vl_UserA = ObjListMonitor[0].Nombre + " " + ObjListMonitor[0].Apellido;

                        vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                        vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", vl_User);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Num]", monitoreo.Id.ToString());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[CargoM]", ObjListAgente[0].Rol.ToLower());
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[UserAM]", vl_UserA);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Rechazo]", Observacion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                        vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                        mails.SendMail(ObjListCoordinador[0].Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());
                    }

                    vl_Mensaje_interno = ObjListM[0].CuerpoMensaje_Interno;

                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Num]", monitoreo.Id.ToString());
                    vl_Mensaje_interno = vl_Mensaje_interno.Replace("[Cargo]", ObjListMonitor[0].Rol.ToLower());


                    notificacion.ModuloId = 130;
                    notificacion.IndicativoId = monitoreo.Id;
                    notificacion.Descripcion = vl_Mensaje_interno;

                    //crear notificacion coordinador
                    notificacion.UsuarioId = Convert.ToInt64(CoordinadorId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);

                    //crear notificacion cliente
                    notificacion.UsuarioId = Convert.ToInt64(UsuarioId);
                    notificacion.Respuesta = notificacion.Create_Notificacion(notificacion);
                    break;
            }
            return new
            {
                data = ObjList,
            };
        }

        /// <summary>
        /// /Asigna la persona que puede eliminar el monitoreo
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="EscaladorId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object AsignarEscalador(string Id,
                                                                          string EscaladorId)
        {

            C_Monitoreo monitoreo = new C_Monitoreo();
            List<C_Monitoreo> ObjList = new List<C_Monitoreo>();

            monitoreo.Id = Convert.ToInt64(Id);
            monitoreo.EstadoId = Convert.ToInt32(EscaladorId);

            monitoreo.Respuesta = monitoreo.UpdateEscalador_Monitoreo(monitoreo);

            int valor;

            monitoreo.Id = (int.TryParse(monitoreo.Respuesta, out valor)) ? Convert.ToInt64(monitoreo.Respuesta) : 0;
            monitoreo.Respuesta = (monitoreo.Id != 0) ? "200" : "500";

            ObjList.Add(monitoreo);

            return new
            {
                data = ObjList,
            };
        }

        /// <summary>
        /// elimina el monitoreo seleccionado
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object DeleteMonitoreo(string Id)
        {

            C_Monitoreo monitoreo = new C_Monitoreo();
            List<C_Monitoreo> ObjList = new List<C_Monitoreo>();

            monitoreo.Id = Convert.ToInt64(Id);

            monitoreo.Respuesta = monitoreo.Delete_Monitoreo(monitoreo);

            int valor;

            monitoreo.Id = (int.TryParse(monitoreo.Respuesta, out valor)) ? Convert.ToInt64(monitoreo.Respuesta) : 0;
            monitoreo.Respuesta = (monitoreo.Id == 0) ? "200" : "500";

            ObjList.Add(monitoreo);

            return new
            {
                data = ObjList,
            };
        }
        #endregion

        #region "FORMULARIO"
        /// <summary>
        ///dispara el evento de traer los formularios por campana
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object List_FormulariosCampana()
        {
            C_Formulario formulario = new C_Formulario();
            List<C_Formulario> ObjList = new List<C_Formulario>();
            formulario.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);

            ObjList = formulario.Read_FormularioCampana(formulario);

            return new
            {
                data = ObjList,
            };

        }

        /// <summary>
        ///  trae los titulos formulario asignados en la campaña
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ListFormulario_Title()
        {
            C_EstructuraFormularioCampana Cls = new C_EstructuraFormularioCampana();
            List<C_EstructuraFormularioCampana> ObjList = new List<C_EstructuraFormularioCampana>();

            Cls.CuentaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);

            ObjList = Cls.Read_EstructuraFormularioCuenta(Cls);

            return new
            {
                data = ObjList
            };
        }

        /// <summary>
        /// dispara el evento de crear los formularios por campaña
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_Formulario(string TypeOperation,
                                                                            string Descripcion,
                                                                            string MaxEvaluacion)
        {
            C_Formulario formulario = new C_Formulario();
            List<C_Formulario> ObjList = new List<C_Formulario>();

            formulario.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            formulario.Descripcion = Descripcion;
            formulario.ValorMaximoEvaluar = Convert.ToInt32(MaxEvaluacion);
            formulario.Estado = 1;

            formulario.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            if (formulario.Id == 0)
            { //crear
                formulario.Respuesta = formulario.Create_Formulario(formulario);
            }
            else
            {
                formulario.Respuesta = formulario.Update_Formulario(formulario);
            }
            ObjList.Add(formulario);
            return new
            {
                data = ObjList,
            };
        }



        /// <summary>
        /// trae los complemento del proceso del formulario
        /// </summary>
        private void ListComplementosFormulario()
        {
            long FormularioId = Convert.ToInt64(Request.Form["FormularioId"]);

            C_CargoEsp cargo = new C_CargoEsp();
            List<C_CargoEsp> ObjList_N0 = new List<C_CargoEsp>();
            C_BloqueEvaluacion evaluacion = new C_BloqueEvaluacion();
            List<C_BloqueEvaluacion> ObjList_N1 = new List<C_BloqueEvaluacion>();
            C_NotasDescriptivas notas = new C_NotasDescriptivas();
            List<C_NotasDescriptivas> ObjList_N2 = new List<C_NotasDescriptivas>();
            C_Puntos_Entrenamiento entrenamiento = new C_Puntos_Entrenamiento();
            List<C_Puntos_Entrenamiento> ObjList_N3 = new List<C_Puntos_Entrenamiento>();
            C_FocoMejora mejora = new C_FocoMejora();
            List<C_FocoMejora> ObjList_N4 = new List<C_FocoMejora>();
            C_FormuConfig_Monitoreo formuConfig = new C_FormuConfig_Monitoreo();
            List<C_FormuConfig_Monitoreo> ObjList_Config = new List<C_FormuConfig_Monitoreo>();

            cargo.FormularioId = FormularioId;
            ObjList_N0 = cargo.Read_Nivel0Formulario(cargo);

            evaluacion.FormularioId = FormularioId;
            ObjList_N1 = evaluacion.Read_Nivel1Formulario(evaluacion);

            notas.Id = FormularioId;
            ObjList_N2 = notas.Read_Nivel2Formulario(notas);

            entrenamiento.Id = FormularioId;
            ObjList_N3 = entrenamiento.Read_Nivel3Formulario(entrenamiento);

            mejora.Id = FormularioId;
            ObjList_N4 = mejora.Read_Nivel4Formulario(mejora);

            formuConfig.FormularioId = FormularioId;
            ObjList_Config = formuConfig.Read_ConfiguracionFormulario(formuConfig);

            string Json_1 = JsonConvert.SerializeObject(ObjList_N0);
            string Json_2 = JsonConvert.SerializeObject(ObjList_N1);
            string Json_3 = JsonConvert.SerializeObject(ObjList_N2);
            string Json_4 = JsonConvert.SerializeObject(ObjList_N3);
            string Json_5 = JsonConvert.SerializeObject(ObjList_N4);
            string Json_6 = JsonConvert.SerializeObject(ObjList_Config);

            string objSerialize = String.Format("[{0},{1},{2},{3},{4},{5}]", Json_1, Json_2, Json_3, Json_4, Json_5, Json_6);

            Response.Write(objSerialize);
        }

        /// <summary>
        /// activa o desctiva el usuario
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="Estado"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Delete_Item(string DeleteId,
                                                             string FormularioId,
                                                             string Modulo)
        {
            C_Formulario formulario = new C_Formulario();

            C_CargoEsp cargo = new C_CargoEsp();
            List<C_CargoEsp> ObjList_N0 = new List<C_CargoEsp>();
            C_BloqueEvaluacion evaluacion = new C_BloqueEvaluacion();
            List<C_BloqueEvaluacion> ObjList_N1 = new List<C_BloqueEvaluacion>();
            C_NotasDescriptivas notas = new C_NotasDescriptivas();
            List<C_NotasDescriptivas> ObjList_N2 = new List<C_NotasDescriptivas>();
            C_Puntos_Entrenamiento entrenamiento = new C_Puntos_Entrenamiento();
            List<C_Puntos_Entrenamiento> ObjList_N3 = new List<C_Puntos_Entrenamiento>();
            C_FocoMejora mejora = new C_FocoMejora();
            List<C_FocoMejora> ObjList_N4 = new List<C_FocoMejora>();


            switch (Modulo)
            {
                case "0":
                    cargo.Id = Convert.ToInt64(DeleteId);
                    cargo.Respuesta = cargo.Delete_Nivel0(cargo);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantCargo";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantBloque";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantNotas";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantPunto";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantFoco";
                    formulario.Update_Contador(formulario);
                    break;

                case "1":
                    evaluacion.Id = Convert.ToInt64(DeleteId);
                    evaluacion.Respuesta = evaluacion.Delete_Nivel1(evaluacion);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantBloque";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantNotas";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantPunto";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantFoco";
                    formulario.Update_Contador(formulario);
                    break;

                case "2":
                    notas.Id = Convert.ToInt64(DeleteId);
                    notas.Respuesta = notas.Delete_Nivel2(notas);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantNotas";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantPunto";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantFoco";
                    formulario.Update_Contador(formulario);
                    break;

                case "3":
                    entrenamiento.Id = Convert.ToInt64(DeleteId);
                    entrenamiento.Respuesta = entrenamiento.Delete_Nivel3(entrenamiento);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantPunto";
                    formulario.Update_Contador(formulario);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantFoco";
                    formulario.Update_Contador(formulario);
                    break;

                case "4":
                    mejora.Id = Convert.ToInt64(DeleteId);
                    mejora.Respuesta = mejora.Delete_Nivel4(mejora);

                    formulario.Id = Convert.ToInt64(FormularioId);
                    formulario.Descripcion = "CantFoco";
                    formulario.Update_Contador(formulario);
                    break;
            }

            cargo.FormularioId = Convert.ToInt64(FormularioId);
            ObjList_N0 = cargo.Read_Nivel0Formulario(cargo);
            evaluacion.FormularioId = Convert.ToInt64(FormularioId);
            ObjList_N1 = evaluacion.Read_Nivel1Formulario(evaluacion);
            notas.Id = Convert.ToInt64(FormularioId);
            ObjList_N2 = notas.Read_Nivel2Formulario(notas);
            entrenamiento.Id = Convert.ToInt64(FormularioId);
            ObjList_N3 = entrenamiento.Read_Nivel3Formulario(entrenamiento);
            mejora.Id = Convert.ToInt64(FormularioId);
            ObjList_N4 = mejora.Read_Nivel4Formulario(mejora);

            return new
            {
                nivel_0 = ObjList_N0,
                nivel_1 = ObjList_N1,
                nivel_2 = ObjList_N2,
                nivel_3 = ObjList_N3,
                nivel_4 = ObjList_N4
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
        public static object Update_FormularioEstado(string FormularioId,
                                                                 string Estado)
        {
            C_Formulario formulario = new C_Formulario();
            List<C_Formulario> ObjList = new List<C_Formulario>();

            formulario.Id = Convert.ToInt64(FormularioId);
            formulario.Estado = Convert.ToInt32(Estado);

            formulario.Update_Estado(formulario);
            formulario.Respuesta = "200";

            ObjList.Add(formulario);


            return new
            {
                data = ObjList
            };

        }

        /// <summary>
        /// metodo que elimina el formulario de la BD
        /// </summary>
        /// <param name="FormularioId"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Delete_Formulario(String FormularioId)
        {
            C_Formulario formulario = new C_Formulario();
            List<C_Formulario> ObjList = new List<C_Formulario>();
            formulario.Id = Convert.ToInt64(FormularioId);

            formulario.Respuesta = formulario.Delete_Formulario(formulario);

            formulario.Respuesta = (formulario.Respuesta == "0") ? "200" : "No elimino";
            ObjList.Add(formulario);
            return new
            {
                data = ObjList,
            };

        }

        #endregion

        #region "NIVEL 0 - CARGO ESPECIALIZADO"
        /// <summary>
        /// dispara el evento de crear los cargos por formulario
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="FormularioId"></param>
        /// <param name="Descripcion"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_Cargo(string TypeOperation,
                                                                             string FormularioId,
                                                                             string Descripcion,
                                                                              string Peso)
        {
            C_CargoEsp cargo = new C_CargoEsp();
            List<C_CargoEsp> ObjList = new List<C_CargoEsp>();
            C_Formulario formulario = new C_Formulario();

            cargo.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            cargo.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
            cargo.FormularioId = Convert.ToInt64(FormularioId);
            cargo.Descripcion = Descripcion;
            cargo.Peso = Peso;
            cargo.Estado = 1;

            formulario.Id = Convert.ToInt64(FormularioId);
            formulario.Descripcion = "CantCargo";

            if (cargo.Id == 0)
            { //crear
                cargo.Respuesta = cargo.Create_Nivel0(cargo);
            }
            else
            {
                cargo.Respuesta = cargo.Update_Nivel0(cargo);
            }

            int valor;

            cargo.Id = (int.TryParse(cargo.Respuesta, out valor)) ? Convert.ToInt64(cargo.Respuesta) : 0;
            if (cargo.Id != 0)
            {
                formulario.Update_Contador(formulario);

                cargo.Respuesta = "200";
                ObjList = cargo.Read_Nivel0Formulario(cargo);
            }
            else
            {
                cargo.Respuesta = "500";
                ObjList.Add(cargo);
            }
            return new
            {
                data = ObjList,
            };
        }

        #endregion

        #region "NIVEL 1 - BLOQUE EVALUACION"
        /// <summary>
        /// crea el bloque de evaluacion
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="FormularioId"></param>
        /// <param name="CargoId"></param>
        /// <param name="Descripcion"></param>
        /// <param name="Peso"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_BloqueEvaluacion(string TypeOperation,
                                                                            string FormularioId,
                                                                            string CargoId,
                                                                            string Descripcion,
                                                                            string Peso,
                                                                            string PesoCargo)
        {
            C_BloqueEvaluacion evaluacion = new C_BloqueEvaluacion();
            List<C_BloqueEvaluacion> ObjList = new List<C_BloqueEvaluacion>();
            C_Formulario formulario = new C_Formulario();

            evaluacion.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            evaluacion.FormularioId = Convert.ToInt64(FormularioId);
            evaluacion.Descripcion = Descripcion;
            evaluacion.CargoId = Convert.ToInt64(CargoId);
            evaluacion.Peso = Peso;
            evaluacion.PesoCargo = (PesoCargo == "") ? "0" : PesoCargo;
            evaluacion.Estado = 1;

            formulario.Id = Convert.ToInt64(FormularioId);
            formulario.Descripcion = "CantBloque";

            evaluacion.Respuesta = (evaluacion.Id == 0) ?/*crear*/ evaluacion.Create_Nivel1(evaluacion) :/*Editar*/  evaluacion.Update_Nivel1(evaluacion);

            int valor;

            evaluacion.Id = (int.TryParse(evaluacion.Respuesta, out valor)) ? Convert.ToInt64(evaluacion.Respuesta) : 0;
            if (evaluacion.Id != 0)
            {
                formulario.Update_Contador(formulario);

                evaluacion.Respuesta = "200";
                ObjList = evaluacion.Read_Nivel1Formulario(evaluacion);
            }
            else
            {
                evaluacion.Respuesta = "500";
                ObjList.Add(evaluacion);
            }


            return new
            {
                data = ObjList,
            };
        }
        #endregion

        #region "NIVEL 2 - NOTAS DESCRIPTIVAS"
        /// <summary>
        ///  crea el bloque notas Nivel 2
        /// </summary>
        private void Create_Nivel2()
        {
            C_NotasDescriptivas notas = new C_NotasDescriptivas();
            List<C_NotasDescriptivas> ObjList = new List<C_NotasDescriptivas>();
            C_Formulario formulario = new C_Formulario();

            long FormularioId = Convert.ToInt64(Request.Form["FormularioId"]);
            string TypeOperation = Request.Form["TypeOperation"];
            long BloqueEvaluacionId = Convert.ToInt64(Request.Form["BloqueEvaluacionId"]);
            string Descripcion = Request.Form["Descripcion"];
            string Peso = Request.Form["Peso"];
            string PesoPonderado = Request.Form["PesoPonderado"];
            long EstadoProcesoId = Convert.ToInt64(Request.Form["EstadoProcesoId"]);

            int ErrorCriticoNivel = Convert.ToInt32(Request.Form["ErrorCriticoNivel"]);
            int PesoPonderadoNivel = Convert.ToInt32(Request.Form["PesoPonderadoNivel"]);

            notas.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            notas.BloqueEvaluacionId = Convert.ToInt64(BloqueEvaluacionId);
            notas.Descripcion = Descripcion;
            notas.Peso = Peso;
            notas.PesoPonderado = PesoPonderado;
            notas.EstadoProcesoId = Convert.ToInt64(EstadoProcesoId);
            notas.Estado = 1;

            formulario.Id = Convert.ToInt64(FormularioId);
            formulario.Descripcion = "CantNotas";
            formulario.ErrorCriticoNivel = ErrorCriticoNivel;
            formulario.PesoPonderadoNivel = PesoPonderadoNivel;

            notas.Respuesta = (notas.Id == 0) ? notas.Create_Nivel2(notas) : notas.Update_Nivel2(notas);

            int valor;

            notas.Id = (int.TryParse(notas.Respuesta, out valor)) ? Convert.ToInt64(notas.Respuesta) : 0;
            if (notas.Id != 0)
            {
                formulario.Update_Contador(formulario);
                formulario.Update_NivelesEvaluacion(formulario);

                notas.Respuesta = "200";
                notas.Id = Convert.ToInt64(FormularioId);
                ObjList = notas.Read_Nivel2Formulario(notas);
            }
            else
            {
                notas.Respuesta = "500";
                ObjList.Add(notas);
            }

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));

        }
        #endregion

        #region "NIVEL 3 - PUNTOS ENTRENAMIENTO"
        /// <summary>
        /// crea los puntos de entrenamiento nivel 3
        /// </summary>
        private void Create_Nivel3()
        {
            C_Puntos_Entrenamiento entrenamiento = new C_Puntos_Entrenamiento();
            List<C_Puntos_Entrenamiento> ObjList = new List<C_Puntos_Entrenamiento>();
            C_Formulario formulario = new C_Formulario();

            long FormularioId = Convert.ToInt64(Request.Form["FormularioId"]);
            string TypeOperation = Request.Form["TypeOperation"];
            long NotasDescriptivasId = Convert.ToInt64(Request.Form["NotasDescriptivasId"]);
            string Descripcion = Request.Form["Descripcion"];
            string Peso = Request.Form["Peso"];
            string PesoPonderado = Request.Form["PesoPonderado"];
            long EstadoProcesoId = Convert.ToInt64(Request.Form["EstadoProcesoId"]);

            int ErrorCriticoNivel = Convert.ToInt32(Request.Form["ErrorCriticoNivel"]);
            int PesoPonderadoNivel = Convert.ToInt32(Request.Form["PesoPonderadoNivel"]);

            entrenamiento.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            entrenamiento.NotasDescriptivasId = NotasDescriptivasId;
            entrenamiento.Descripcion = Descripcion;
            entrenamiento.Peso = Peso;
            entrenamiento.PesoPonderado = PesoPonderado;
            entrenamiento.EstadoProcesoId = EstadoProcesoId;
            entrenamiento.Estado = 1;

            entrenamiento.Respuesta = (entrenamiento.Id == 0) ?/*crear*/entrenamiento.Create_Nivel3(entrenamiento) :/*Editar*/entrenamiento.Respuesta = entrenamiento.Update_Nivel3(entrenamiento);

            formulario.Id = FormularioId;
            formulario.Descripcion = "CantPunto";
            formulario.ErrorCriticoNivel = ErrorCriticoNivel;
            formulario.PesoPonderadoNivel = PesoPonderadoNivel;

            int valor;

            entrenamiento.Id = (int.TryParse(entrenamiento.Respuesta, out valor)) ? Convert.ToInt64(entrenamiento.Respuesta) : 0;
            if (entrenamiento.Id != 0)
            {
                formulario.Update_Contador(formulario);
                formulario.Update_NivelesEvaluacion(formulario);

                entrenamiento.Respuesta = "200";
                entrenamiento.Id = FormularioId;
                ObjList = entrenamiento.Read_Nivel3Formulario(entrenamiento);
            }
            else
            {
                entrenamiento.Respuesta = "500";
                ObjList.Add(entrenamiento);
            }

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }
        #endregion

        #region "NIVEL 4 - FOCOS DE MEJORA"
        /// <summary>
        /// crea los focos de mejora nivel 4
        /// </summary>
        private void Create_Nivel4()
        {
            C_FocoMejora mejora = new C_FocoMejora();
            List<C_FocoMejora> ObjList = new List<C_FocoMejora>();
            C_Formulario formulario = new C_Formulario();

            long FormularioId = Convert.ToInt64(Request.Form["FormularioId"]);
            string TypeOperation = Request.Form["TypeOperation"];
            long PuntosEntrenamientoId = Convert.ToInt64(Request.Form["PuntosEntrenamientoId"]);
            string Descripcion = Request.Form["Descripcion"];
            string Peso = Request.Form["Peso"];

            mejora.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);

            mejora.PuntosEntrenamientoId = PuntosEntrenamientoId;
            mejora.Descripcion = Descripcion;
            mejora.Peso = Peso;
            mejora.Estado = 1;

            mejora.Respuesta = (mejora.Id == 0) ?/*crear*/ mejora.Respuesta = mejora.Create_Nivel4(mejora) :/*editat*/  mejora.Respuesta = mejora.Update_Nivel4(mejora);

            formulario.Id = FormularioId;
            formulario.Descripcion = "CantFoco";

            int valor;

            mejora.Id = (int.TryParse(mejora.Respuesta, out valor)) ? Convert.ToInt64(mejora.Respuesta) : 0;
            if (mejora.Id != 0)
            {
                formulario.Update_Contador(formulario);

                mejora.Respuesta = "200";
                mejora.Id = FormularioId;
                ObjList = mejora.Read_Nivel4Formulario(mejora);
            }
            else
            {
                mejora.Respuesta = "500";
                ObjList.Add(mejora);
            }
            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }
        #endregion

        #region "CONFIGURACION FORMULARIO"
        /// <summary>
        /// 
        /// </summary>
        /// <param name="TypeOperation"></param>
        /// <param name="FormularioId"></param>
        /// <param name="Ope_Nivel_0"></param>
        /// <param name="Ope_Nivel_1"></param>
        /// <param name="Ope_Nivel_2"></param>
        /// <param name="VariosOperadores"></param>
        /// <param name="Ope_Nivel_3"></param>
        /// <param name="Ope_Nivel_4"></param>
        /// <param name="OpcCumple"></param>
        /// <param name="OpcNoCumple"></param>
        /// <param name="OpcNoAplica"></param>
        /// <param name="NoAplicaPeso"></param>
        /// <param name="MonitoreoXDefecto"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object Create_Configuracion(string TypeOperation,
                                                                            string FormularioId,
                                                                            string Ope_Nivel_0,
                                                                            string Ope_Nivel_1,
                                                                            string Ope_Nivel_2,
                                                                            string VariosOperadores,
                                                                            string Ope_Nivel_3,
                                                                            string Ope_Nivel_4,
                                                                            string OpcCumple,
                                                                            string OpcNoCumple,
                                                                            string OpcNoAplica,
                                                                            string NoAplicaPeso,
                                                                            string AplicaErrorCritico,
                                                                            string MonitoreoXDefecto)
        {
            C_FormuConfig_Monitoreo formuConfig = new C_FormuConfig_Monitoreo();
            List<C_FormuConfig_Monitoreo> ObjList = new List<C_FormuConfig_Monitoreo>();

            formuConfig.Id = (TypeOperation == "0") ? 0 : Convert.ToInt64(TypeOperation);
            formuConfig.FormularioId = Convert.ToInt64(FormularioId);
            formuConfig.Ope_Nivel_0 = Convert.ToInt32(Ope_Nivel_0);
            formuConfig.Ope_Nivel_1 = Convert.ToInt32(Ope_Nivel_1);
            formuConfig.Ope_Nivel_2 = Convert.ToInt32(Ope_Nivel_2);
            formuConfig.VariosOperadores = Convert.ToInt32(VariosOperadores);
            formuConfig.Ope_Nivel_3 = Convert.ToInt32(Ope_Nivel_3);
            formuConfig.Ope_Nivel_4 = Convert.ToInt32(Ope_Nivel_4);
            formuConfig.OpcCumple = Convert.ToInt32(OpcCumple);
            formuConfig.OpcNoCumple = Convert.ToInt32(OpcNoCumple);
            formuConfig.OpcNoAplica = Convert.ToInt32(OpcNoAplica);
            formuConfig.NoAplicaPeso = Convert.ToInt32(NoAplicaPeso);
            formuConfig.MonitoreoXDefecto = MonitoreoXDefecto;
            formuConfig.AplicaErrorCritico = Convert.ToInt32(AplicaErrorCritico);

            formuConfig.Respuesta = (formuConfig.Id == 0) ?/*crear*/ formuConfig.Respuesta = formuConfig.Create_FormuConfig_Monitoreo(formuConfig) :/*editat*/  formuConfig.Respuesta = formuConfig.Update_FormuConfig_Monitoreo(formuConfig);

            int valor;

            formuConfig.Id = (int.TryParse(formuConfig.Respuesta, out valor)) ? Convert.ToInt64(formuConfig.Respuesta) : 0;
            formuConfig.Respuesta = (formuConfig.Id != 0) ? "200" : "500";

            ObjList.Add(formuConfig);

            return new
            {
                data = ObjList,
            };
        }
        #endregion

        #region "FUNCIONALIDAD COPIA FORMULARIO"
        /// <summary>
        /// metodo para la creacion de la copia del proyecto
        /// </summary>
        private void Create_ClonarFormulario()
        {
            string vl_resultadoCopia = "CLONADO";
            long vl_FormularioId_Original = Convert.ToInt64(Request.Form["FormularioId"]);
            string vl_FormularioId_Copia = "0";
            string vl_N0Id_Copia = "0";

            try
            {
                List<C_Homolacion> ObjList_Homologacion = new List<C_Homolacion>();

                C_Formulario formulario = new C_Formulario();
                List<C_Formulario> ObjList_FormOriginal = new List<C_Formulario>();
                C_CargoEsp N0 = new C_CargoEsp();
                List<C_CargoEsp> ObjList_N0_Original = new List<C_CargoEsp>();
                C_BloqueEvaluacion N1 = new C_BloqueEvaluacion();
                List<C_BloqueEvaluacion> ObjList_N1_Original = new List<C_BloqueEvaluacion>();
                C_NotasDescriptivas N2 = new C_NotasDescriptivas();
                List<C_NotasDescriptivas> ObjList_N2_Original = new List<C_NotasDescriptivas>();
                C_Puntos_Entrenamiento N3 = new C_Puntos_Entrenamiento();
                List<C_Puntos_Entrenamiento> ObjList_N3_Original = new List<C_Puntos_Entrenamiento>();
                C_FocoMejora N4 = new C_FocoMejora();
                List<C_FocoMejora> ObjList_N4_Original = new List<C_FocoMejora>();
                C_FormuConfig_Monitoreo formuConfig = new C_FormuConfig_Monitoreo();
                List<C_FormuConfig_Monitoreo> ObjList_Config = new List<C_FormuConfig_Monitoreo>();

                formulario.Id = vl_FormularioId_Original;
                N0.Id = vl_FormularioId_Original;
                N1.Id = vl_FormularioId_Original;
                N2.Id = vl_FormularioId_Original;
                N3.Id = vl_FormularioId_Original;
                N4.Id = vl_FormularioId_Original;
                formuConfig.FormularioId = vl_FormularioId_Original;

                //trae el formulario original
                ObjList_FormOriginal = formulario.Read_FormularioCopia(formulario);
                //trae los cargos originales
                ObjList_N0_Original = N0.Read_Nivel0Copia(N0);
                //trae los N1 originales
                ObjList_N1_Original = N1.Read_Nivel1Copia(N1);
                //trae los N2 originales
                ObjList_N2_Original = N2.Read_Nivel2Copia(N2);
                //trae los N3 originales
                ObjList_N3_Original = N3.Read_Nivel3Copia(N3);
                //trae los N4 originales
                ObjList_N4_Original = N4.Read_Nivel4Copia(N4);
                //trae la configuracion del original
                ObjList_Config = formuConfig.Read_ConfiguracionFormulario(formuConfig);

                formulario.CampanaId = ObjList_FormOriginal[0].CampanaId;
                formulario.Descripcion = ObjList_FormOriginal[0].Descripcion + " [Clonado]";
                formulario.ValorMaximoEvaluar = ObjList_FormOriginal[0].ValorMaximoEvaluar;
                formulario.Estado = 1;
                formulario.Nivel_0 = ObjList_FormOriginal[0].Nivel_0;
                formulario.Nivel_1 = ObjList_FormOriginal[0].Nivel_1;
                formulario.Nivel_2 = ObjList_FormOriginal[0].Nivel_2;
                formulario.Nivel_3 = ObjList_FormOriginal[0].Nivel_3;
                formulario.Nivel_4 = ObjList_FormOriginal[0].Nivel_4;
                formulario.ErrorCriticoNivel = ObjList_FormOriginal[0].ErrorCriticoNivel;
                formulario.PesoPonderadoNivel = ObjList_FormOriginal[0].PesoPonderadoNivel;

                //creamos  el formulario de copia y capturamos  el id
                vl_FormularioId_Copia = formulario.Create_Formulario(formulario);

                //Bloque Nivel 0
                if (ObjList_N0_Original.Count != 0)
                {
                    vl_N0Id_Copia = "1";
                    //recorremos los cargos originales
                    foreach (var item_0 in ObjList_N0_Original)
                    {
                        C_Homolacion homolacion = new C_Homolacion();
                        C_CargoEsp saveN0 = new C_CargoEsp();

                        homolacion.Nivel = "N0";
                        homolacion.Id_Old = item_0.Id;

                        saveN0.CampanaId = item_0.CampanaId;
                        saveN0.FormularioId = Convert.ToInt64(vl_FormularioId_Copia);
                        saveN0.Descripcion = item_0.Descripcion;
                        saveN0.Peso = item_0.Peso;
                        saveN0.Estado = item_0.Estado;

                        //creamos los niveles 0 copia y capturamos el id
                        saveN0.Respuesta = N0.Create_Nivel0(saveN0);
                        homolacion.Id_New = Convert.ToInt64(saveN0.Respuesta);

                        ObjList_Homologacion.Add(homolacion);
                    }
                }

                //bloque nivel 1
                foreach (var item_1 in ObjList_N1_Original)
                {
                    C_Homolacion homolacion = new C_Homolacion();
                    C_BloqueEvaluacion saveN1 = new C_BloqueEvaluacion();

                    homolacion.Nivel = "N1";
                    homolacion.Id_Old = item_1.Id;

                    saveN1.FormularioId = Convert.ToInt64(vl_FormularioId_Copia);
                    saveN1.Descripcion = item_1.Descripcion;
                    saveN1.Peso = item_1.Peso;
                    saveN1.PesoCargo = item_1.PesoCargo;
                    saveN1.Estado = item_1.Estado;

                    if (vl_N0Id_Copia == "0")
                    {
                        saveN1.CargoId = 0;
                    }
                    else
                    {
                        foreach (var itemh in ObjList_Homologacion)
                        {
                            if (itemh.Nivel == "N0")
                            {
                                if (itemh.Id_Old == item_1.CargoId)
                                {
                                    saveN1.CargoId = itemh.Id_New;
                                    break;
                                }
                            }
                        }
                    }

                    saveN1.Respuesta = saveN1.Create_Nivel1(saveN1);
                    homolacion.Id_New = Convert.ToInt64(saveN1.Respuesta);

                    ObjList_Homologacion.Add(homolacion);
                }

                //bloque nivel 2
                foreach (var item_2 in ObjList_N2_Original)
                {
                    C_Homolacion homolacion = new C_Homolacion();
                    C_NotasDescriptivas saveN2 = new C_NotasDescriptivas();

                    homolacion.Nivel = "N2";
                    homolacion.Id_Old = item_2.Id;

                    saveN2.Descripcion = item_2.Descripcion;
                    saveN2.Peso = item_2.Peso;
                    saveN2.Estado = item_2.Estado;
                    saveN2.PesoPonderado = item_2.PesoPonderado;
                    saveN2.EstadoProcesoId = item_2.EstadoProcesoId;

                    foreach (var itemh in ObjList_Homologacion)
                    {
                        if (itemh.Nivel == "N1")
                        {
                            if (itemh.Id_Old == item_2.BloqueEvaluacionId)
                            {
                                saveN2.BloqueEvaluacionId = itemh.Id_New;
                                break;
                            }
                        }
                    }

                    saveN2.Respuesta = saveN2.Create_Nivel2(saveN2);
                    homolacion.Id_New = Convert.ToInt64(saveN2.Respuesta);

                    ObjList_Homologacion.Add(homolacion);
                }

                //bloque nivel 3
                foreach (var item_3 in ObjList_N3_Original)
                {
                    C_Homolacion homolacion = new C_Homolacion();
                    C_Puntos_Entrenamiento saveN3 = new C_Puntos_Entrenamiento();

                    homolacion.Nivel = "N3";
                    homolacion.Id_Old = item_3.Id;

                    saveN3.Descripcion = item_3.Descripcion;
                    saveN3.Peso = item_3.Peso;
                    saveN3.PesoPonderado = item_3.PesoPonderado;
                    saveN3.Estado = item_3.Estado;
                    saveN3.EstadoProcesoId = item_3.EstadoProcesoId;

                    foreach (var itemh in ObjList_Homologacion)
                    {
                        if (itemh.Nivel == "N2")
                        {
                            if (itemh.Id_Old == item_3.NotasDescriptivasId)
                            {
                                saveN3.NotasDescriptivasId = itemh.Id_New;
                                break;
                            }
                        }
                    }

                    saveN3.Respuesta = saveN3.Create_Nivel3(saveN3);
                    homolacion.Id_New = Convert.ToInt64(saveN3.Respuesta);

                    ObjList_Homologacion.Add(homolacion);
                }

                //bloque nivel 4
                foreach (var item_4 in ObjList_N4_Original)
                {
                    C_Homolacion homolacion = new C_Homolacion();
                    C_FocoMejora saveN4 = new C_FocoMejora();

                    saveN4.Descripcion = item_4.Descripcion;
                    saveN4.Peso = item_4.Peso;
                    saveN4.Estado = item_4.Estado;

                    foreach (var itemh in ObjList_Homologacion)
                    {
                        if (itemh.Nivel == "N3")
                        {
                            if (itemh.Id_Old == item_4.PuntosEntrenamientoId)
                            {
                                saveN4.PuntosEntrenamientoId = itemh.Id_New;
                                break;
                            }
                        }
                    }

                    saveN4.Respuesta = saveN4.Create_Nivel4(saveN4);
                }

                C_FormuConfig_Monitoreo saveformuConfig = new C_FormuConfig_Monitoreo();

                saveformuConfig.FormularioId = Convert.ToInt64(vl_FormularioId_Copia);
                saveformuConfig.Ope_Nivel_0 = ObjList_Config[0].Ope_Nivel_0;
                saveformuConfig.Ope_Nivel_1 = ObjList_Config[0].Ope_Nivel_1;
                saveformuConfig.Ope_Nivel_2 = ObjList_Config[0].Ope_Nivel_2;
                saveformuConfig.VariosOperadores = ObjList_Config[0].VariosOperadores;
                saveformuConfig.Ope_Nivel_3 = ObjList_Config[0].Ope_Nivel_3;
                saveformuConfig.Ope_Nivel_4 = ObjList_Config[0].Ope_Nivel_4;
                saveformuConfig.OpcCumple = ObjList_Config[0].OpcCumple;
                saveformuConfig.OpcNoCumple = ObjList_Config[0].OpcNoCumple;
                saveformuConfig.OpcNoAplica = ObjList_Config[0].OpcNoAplica;
                saveformuConfig.NoAplicaPeso = ObjList_Config[0].NoAplicaPeso;
                saveformuConfig.AplicaErrorCritico = ObjList_Config[0].AplicaErrorCritico;
                saveformuConfig.MonitoreoXDefecto = ObjList_Config[0].MonitoreoXDefecto;

                saveformuConfig.Respuesta = saveformuConfig.Create_FormuConfig_Monitoreo(saveformuConfig);


                formulario.Id = Convert.ToInt64(vl_FormularioId_Copia);
                formulario.Descripcion = "CantCargo";
                formulario.Update_Contador(formulario);

                formulario.Id = Convert.ToInt64(vl_FormularioId_Copia);
                formulario.Descripcion = "CantBloque";
                formulario.Update_Contador(formulario);

                formulario.Id = Convert.ToInt64(vl_FormularioId_Copia);
                formulario.Descripcion = "CantNotas";
                formulario.Update_Contador(formulario);

                formulario.Id = Convert.ToInt64(vl_FormularioId_Copia);
                formulario.Descripcion = "CantPunto";
                formulario.Update_Contador(formulario);

                formulario.Id = Convert.ToInt64(vl_FormularioId_Copia);
                formulario.Descripcion = "CantFoco";
                formulario.Update_Contador(formulario);

            }
            catch (Exception E)
            {
                vl_resultadoCopia = E.Message.ToString();
            }

            Response.Write(vl_resultadoCopia);
        }


        #endregion

        #region "REPORTES"
        /// <summary>
        /// trae la data del encabezado del proceso en general
        /// </summary>
        private void EncabezadoReport()
        {
            List<C_Reportes> ObjList = new List<C_Reportes>();
            C_Reportes Cls = new C_Reportes();

            Cls.CAMPANA_ID = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);

            Cls.CANT_MONITOREOS = Convert.ToInt64(Cls.TraerCantMonitoreos(Cls));
            Cls.CANT_FORMULARIOS = Convert.ToInt64(Cls.TraerCantFormularios(Cls));

            Cls.PORCENTAJE_PEC = Convert.ToInt64(Cls.TraerPorc_PEC(Cls));
            Cls.PORCENTAJE_PECC = Convert.ToInt64(Cls.TraerPorc_PECC(Cls));
            Cls.PORCENTAJE_PECN = Convert.ToInt64(Cls.TraerPorc_PECN(Cls));
            Cls.PORCENTAJE_PECUF = Convert.ToInt64(Cls.TraerPorc_PECUF(Cls));
            Cls.PROMEDIO_NOTA_FINAL = Cls.TraerPromedio_NotaFinal(Cls);

            ObjList.Add(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae la data del formulario sleccionado
        /// </summary>
        private void Report_GeneralXFormulario()
        {
            List<C_Reportes> ObjList = new List<C_Reportes>();
            C_Reportes Cls = new C_Reportes();

            Cls.F_Formulario = Convert.ToInt64(Request.Form["FormularioId"]);
            
            ObjList = Cls.Read_Monitoreos_Formulario(Cls);
            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }

        /// <summary>
        /// trae la dara de monitores realizador por un monitor
        /// </summary>
        private void Report_MonitoreoRealizados()
        {
            List<C_Reportes> ObjList = new List<C_Reportes>();
            C_Reportes Cls = new C_Reportes();

            Cls.F_Monitor = Convert.ToInt64(Request.Form["MonitorId"]);
            Cls.F_FechaInicial = Request.Form["FechaInicial"].ToString();
            Cls.TipoInforme = Request.Form["TipoInforme"].ToString();

            switch (Request.Form["TipoFiltro"].ToString()) {

                case "1":
                    Cls.PARAMETRO_1 = (Cls.F_FechaInicial =="Vacio") ? "D" : "DF";
                    Cls.F_FechaFinal = (Cls.F_FechaInicial != "Vacio")? Request.Form["FechaFinal"].ToString(): Cls.F_FechaInicial;
                    break;

                case "2":
                    Cls.PARAMETRO_1 = (Cls.F_FechaInicial == "Vacio") ? "S" : "SF";
                    Cls.F_FechaFinal = (Cls.F_FechaInicial != "Vacio") ? Request.Form["FechaFinal"].ToString() : Cls.F_FechaInicial;
                    break;

                case "3":
                    Cls.PARAMETRO_1 = (Cls.F_FechaInicial == "Vacio") ? "M" : "MF";
                    Cls.F_FechaFinal = (Cls.F_FechaInicial != "Vacio") ? Request.Form["FechaFinal"].ToString() : Cls.F_FechaInicial;
                    break;
            }

            ObjList = Cls.Read_CantMonitoreos_Monitor(Cls);

            Response.Write(JsonConvert.SerializeObject(ObjList.ToArray()));
        }
        #endregion

    }
}

public class C_Homolacion
{
    public string Nivel { get; set; }
    public long Id_Old { get; set; }
    public long Id_New { get; set; }
}