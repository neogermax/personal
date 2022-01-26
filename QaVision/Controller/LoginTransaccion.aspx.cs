using System;
using System.Collections.Generic;
using System.Net;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace QaVision.Controller
{
    public partial class LoginTransaccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object IniciarSesion(string User,
                                         string Password)
        {
            try
            {

                Encriptar ClsEncriptar = new Encriptar();
                C_Usuario Obj = new C_Usuario();
                List<C_Usuario> ObjList = new List<C_Usuario>();

                Obj.Documento = User;
                string vl_Password_Encrip = ClsEncriptar.SHA256_Certificado(Password);
                Obj.Password = vl_Password_Encrip;

                Obj.Estado_User = Obj.Read_User(Obj);

                if (Obj.Estado_User == "0")
                {
                    HttpContext.Current.Session["Sesion_User_QA"] = Obj.Documento;
                    HttpContext.Current.Session["Work_Campana_QA"] = 0;
                    HttpContext.Current.Session["Work_Rol_QA"] = 0;
                    HttpContext.Current.Session["Work_RolId_QA"] = 0;
                    Obj.Estado_User = "4";
                }

                if (Obj.Estado_User == "5")
                {
                    HttpContext.Current.Session["SelectChange_User_QA"] = 1;
                    HttpContext.Current.Session["Cambio_Pass1ra_QA"] = (User.ToUpper() == Password.ToUpper()) ? 1 : 0;
                    HttpContext.Current.Session["Change_User_QA"] = Obj.Documento;
                }
                else
                {
                    HttpContext.Current.Session["Cambio_Pass1ra_QA"] = 0;
                    HttpContext.Current.Session["Change_User_QA"] = "VACIO";
                    HttpContext.Current.Session["SelectChange_User_QA"] = 0;
                }

                ObjList.Add(Obj);
                return new
                {
                    data = ObjList,
                };

            }
            catch (Exception ex)
            {
                C_Usuario Obj = new C_Usuario();
                List<C_Usuario> ObjList = new List<C_Usuario>();

                Obj.Estado_User = ex.Message.ToString();
                ObjList.Add(Obj);
                return new
                {
                    data = ObjList,
                };
            }
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ValidaChange()
        {
            try
            {
                C_Sesion Cls = new C_Sesion();
                List<C_Sesion> ObjListS = new List<C_Sesion>();
                C_Dato dato = new C_Dato();
                List<C_Dato> ObjListC = new List<C_Dato>();

                C_Usuario Obj = new C_Usuario();
                List<C_Usuario> ObjList = new List<C_Usuario>();

                if (HttpContext.Current.Session["Change_User_QA"].ToString() == "VACIO")
                {
                    Cls.EstadoSesion = "404";
                    ObjListS.Add(Cls);

                    Obj.Documento = "VACIO";
                    ObjList.Add(Obj);
                }
                else
                {
                    Cls.EstadoSesion = "200";
                    ObjListS.Add(Cls);


                    dato.FiltroQuery = "T";
                    dato.TablaId = 7;

                    ObjListC = dato.Read_DropList(dato);

                    Obj.Documento = HttpContext.Current.Session["Change_User_QA"].ToString();
                    ObjList = Obj.Read_User_Documento(Obj);

                    Obj.Respuesta = (HttpContext.Current.Session["Cambio_Pass1ra_QA"].ToString() == "1") ? "New" : "Old";
                    ObjList.Add(Obj);

                }

                return new
                {
                    data = ObjListS,
                    user = ObjList,
                    colores = ObjListC
                };

            }
            catch (Exception ex)
            {
                C_Usuario Obj = new C_Usuario();
                List<C_Usuario> ObjList = new List<C_Usuario>();

                Obj.Estado_User = ex.Message.ToString();
                ObjList.Add(Obj);
                return new
                {
                    data = ObjList,
                };
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ChangePassword(string PasswordNew,
                                                                                  string Color,
                                                                                  string Estado)
        {
            try
            {
                Encriptar encriptar = new Encriptar();
                C_Usuario Obj = new C_Usuario();
                List<C_Usuario> ObjList = new List<C_Usuario>();

                Obj.Documento = HttpContext.Current.Session["Change_User_QA"].ToString();
                Obj.Password = encriptar.SHA256_Certificado(PasswordNew);
                Obj.ColorId = Convert.ToInt64(Color);
                C_HistoricoPassword historicoPassword = new C_HistoricoPassword();

                if (Estado == "New")
                {
                    //inserta el color
                    Obj.Respuesta = Obj.UpdateColor_User(Obj);
                    Obj.Respuesta = (Obj.Respuesta == Color) ? Obj.UpdatePassword_User(Obj) : "303";
                    historicoPassword.OpcionPasswordId = 74;
                }
                else
                {
                    //valida el color
                    Obj.Respuesta = Obj.ValidaColor_User(Obj);
                    Obj.Respuesta = (Obj.Respuesta == "1") ? Obj.UpdatePassword_User(Obj) : "404";
                    historicoPassword.OpcionPasswordId = (HttpContext.Current.Session["SelectChange_User_QA"].ToString() == "1") ? 73 : 72;
                }


                string strHostName = string.Empty;

                // Tomamos la dirección IP de la maquina actual
                // Primero tomamos el nombre del host de la maquina local
                strHostName = Dns.GetHostName();
                // Luego, utilizando el nombre del host tomamos la dirección IP de la lista
                IPAddress[] hostIPs = Dns.GetHostAddresses(strHostName);
                string vl_IpAcceso = "0";
                for (int i = 0; i < hostIPs.Length; i++)
                {
                    vl_IpAcceso = hostIPs[i].ToString();
                }

                historicoPassword.IP = vl_IpAcceso;
                historicoPassword.UsuarioId = Convert.ToInt64(Obj.Validate_Usuario(Obj));

                historicoPassword.Create_Historico(historicoPassword);

                ObjList.Add(Obj);
                return new
                {
                    data = ObjList
                };

            }
            catch (Exception ex)
            {
                C_Usuario Obj = new C_Usuario();
                List<C_Usuario> ObjList = new List<C_Usuario>();

                Obj.Estado_User = ex.Message.ToString();
                ObjList.Add(Obj);
                return new
                {
                    data = ObjList,
                };
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object BloqueoPassword(string Documento)
        {
            C_Usuario Obj = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();

            Obj.Documento = Documento;

            Obj.Respuesta = Obj.BloqueaGestion_Usuario(Obj);

            Obj.Respuesta = (Obj.Respuesta == "1") ? "200" : "500";
            ObjList.Add(Obj);
            return new
            {
                data = ObjList
            };
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false)]
        public static object ValidaDataChange(string Documento)
        {
            C_Usuario Obj = new C_Usuario();
            List<C_Usuario> ObjList = new List<C_Usuario>();
            C_Dato dato = new C_Dato();
            List<C_Dato> ObjListPE = new List<C_Dato>();
            C_UsuarioAcceso usuarioAcceso = new C_UsuarioAcceso();
            List<C_Dato> ObjListUE = new List<C_Dato>();

            Obj.Documento = Documento;
            Obj.Gestionable = Convert.ToInt32(Obj.Gestiona_Usuario(Obj));

            if (Obj.Gestionable != 0)
            {
                Obj.Respuesta = "200";
                dato.FiltroQuery = "T";
                dato.TablaId = 5;

                ObjListPE = dato.Read_DropList(dato);

                usuarioAcceso.Documento = Documento;
                ObjListUE = usuarioAcceso.Read_ClienteAsig(usuarioAcceso);
                HttpContext.Current.Session["Change_User_QA"] = Documento;
                HttpContext.Current.Session["Cambio_Pass1ra_QA"] = 0;
                HttpContext.Current.Session["SelectChange_User_QA"] = 0;
            }
            else
            {
                Obj.Respuesta = "404";
                dato.FiltroQuery = "VACIO";

                ObjListPE.Add(dato);
                ObjListUE.Add(dato);

            }
            ObjList.Add(Obj);

            return new
            {
                data = ObjList,
                empresas = ObjListPE,
                empresa = ObjListUE
            };
        }
    }
}