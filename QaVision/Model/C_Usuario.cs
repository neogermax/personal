using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_Usuario
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Password { get; set; }
    public string Correo { get; set; }
    public int Gestionable { get; set; }

    public string PasswordNew { get; set; }
    public int CambioPassword { get; set; }
    public System.DateTime FechaPassword { get; set; }
    public int Estado { get; set; }
    public System.DateTime FechaRegistro { get; set; }
    public long RolId { get; set; }
    public string Documento { get; set; }
    public string NormalPassword { get; set; }
    public string Respuesta { get; set; }
    public string Estado_User { get; set; }
    public string Rol { get; set; }
    public long ColorId { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// Crea el usuario en base de datos (CREATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_User(C_Usuario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'INSERT' ,'0','" +
                                                                             Obj.Documento + "','" +
                                                                             Obj.Password + "','" +
                                                                             Obj.Nombre + "','" +
                                                                             Obj.Apellido + "','1','" +
                                                                             Obj.RolId + "','0','" +
                                                                             Obj.Correo + "','" +
                                                                             Obj.Gestionable + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// TRAE TODOS LOS USUARIO DE LA CAMPAÑA ASIGNADA (READ)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Usuario> Read_Users_Campana(C_Usuario Obj)
    {

        List<C_Usuario> vl_ObjList = new List<C_Usuario>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USERS_CAMPANA','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "USERS_CAMPANA", "STD");

        return vl_ObjList;
    }

    /// <summary>
    /// Actualizacion de dstos del usuario (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_User(C_Usuario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'UPDATE_WEB' ,'" +
                                                                             Obj.Id + "','" +
                                                                             Obj.Documento + "','3609510b5e784ebf9a38cb5d56a1813dc14ae84db362326d95dd137828807a4e','" +
                                                                             Obj.Nombre + "','" +
                                                                             Obj.Apellido + "','1','" +
                                                                             Obj.RolId + "','" +
                                                                             Obj.ColorId + "','" +
                                                                             Obj.Correo + "','" +
                                                                             Obj.Gestionable + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// Activacion o desactivacion de un usuario (DELETE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string InactiveUser(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'INACTIVE_ACTIVE','" + Obj.Id + "','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }
    #endregion

    #region "Funciones"
    /// <summary>
    /// trae todo los usuarios para un drop list
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_Users_All(C_Usuario Obj)
    {

        List<C_Dato> vl_ObjList = new List<C_Dato>();
        C_Dato Cls = new C_Dato();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USERS_ALL','0'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = Cls.List(vl_StrQuery, "TRAER_LIST");

        return vl_ObjList;
    }

    /// <summary>
    /// trae todo los usuarios para un drop list
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_UsersPerfil(C_Usuario Obj)
    {

        List<C_Dato> vl_ObjList = new List<C_Dato>();
        C_Dato Cls = new C_Dato();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USER_PERFIL','" + Obj.Id + "','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = Cls.List(vl_StrQuery, "TRAER_LIST");

        return vl_ObjList;
    }

    public List<C_Dato> Read_UsersEscalador(C_Usuario Obj)
    {

        List<C_Dato> vl_ObjList = new List<C_Dato>();
        C_Dato Cls = new C_Dato();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USER_ESCALADORES','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = Cls.List(vl_StrQuery, "TRAER_LIST");

        return vl_ObjList;
    }


    /// <summary>
    /// 
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_Users_Cuenta(C_Usuario Obj)
    {

        List<C_Dato> vl_ObjList = new List<C_Dato>();
        C_Dato Cls = new C_Dato();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USERS_CUENTA','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = Cls.List(vl_StrQuery, "TRAER_LIST");

        return vl_ObjList;
    }

    /// <summary>
    /// TRAE DATA DEL USUARIO POR EL ID
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Usuario> Read_User_Id(C_Usuario Obj)
    {
        List<C_Usuario> vl_ObjList = new List<C_Usuario>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USER_ID','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_USER_ID", "STD");

        return vl_ObjList;

    }

   

    /// <summary>
    /// traer data por medio del documento
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Usuario> Read_User_Documento(C_Usuario Obj)
    {
        List<C_Usuario> vl_ObjList = new List<C_Usuario>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_NAME_COLABORADOR','0','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_USER_DOC", "STD");

        return vl_ObjList;

    }

    /// <summary>
    /// tra los datos del usuario por id
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Usuario> Read_User_IdNotificacion(C_Usuario Obj)
    {
        List<C_Usuario> vl_ObjList = new List<C_Usuario>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_NAME_COLABORADOR_ID','" + Obj.Id + "','" + Obj.ColorId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_USER_NOTIF", "STD");

        return vl_ObjList;

    }


    /// <summary>
    /// ACTIVACION DE CONTRASEÑA AL USUARIO SELECCIONADO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string ActivateUpdatePassword_User(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'ACTIVAR_CHANGEPASS','0','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;

    }

    /// <summary>
    /// trae la cantidad de supervisores en la campaña
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string BuscarSupervisorr(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'EXIST_SUPERM','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;

    }

    /// <summary>
    /// ACTUALIZACION DE CONTRASEÑA PROPORCIONADA POR EL LDAP
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string UpdatePassword_User(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'UPDATE_PASS','0','" + Obj.Documento + "','" + Obj.Password + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;

    }


    public string UpdateColor_User(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'ASIGN_COLOR','" + Obj.ColorId + "','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    public string ValidaColor_User(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'VALIDA_COLOR','" + Obj.ColorId + "','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }



    /// <summary>
    /// VALIDA SI EXISTE EL USUARIO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Read_User(C_Usuario Obj)
    {
        string vl_User = Obj.Documento;
        string vl_Pass = Obj.Password;
        string vl_Respuesta = "0";

        List<C_Usuario> vl_ObjList = new List<C_Usuario>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USER','0','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "USER", "STD");
        int vl_Estado = 0;
        int vl_Cambio = 0;
        string vl_Password = "";

        if (vl_ObjList.Count != 0)//VALIDA SI EXISTE USUARIO
        {
            vl_Estado = vl_ObjList[0].Estado;
            vl_Cambio = vl_ObjList[0].CambioPassword;
            vl_Password = vl_ObjList[0].Password;

            if (vl_Estado == 1) //SI ESTA ACTIVO
            {
                if (vl_Password != vl_Pass)// ERROR DE CONTRASEÑA
                {
                    vl_Respuesta = "1";
                }
                else
                {
                    if (vl_Cambio == 1)
                    {
                        vl_Respuesta = "5";//CAMBIO DE CONTRASEÑA
                    }
                }

                C_Rol ObjR = new C_Rol
                {
                    Id = vl_ObjList[0].RolId
                };
                string vl_estadoRol = ObjR.Validate_Rol(ObjR);
                //validamos el rol del usuario
                if (vl_estadoRol == "0")
                {
                    vl_Respuesta = "6"; //ROL INACTIVO
                }
            }
            else
            {
                vl_Respuesta = "2";
            }
        }
        else
        {
            vl_Respuesta = "1";
        }

        return vl_Respuesta;
    }

    /// <summary>
    /// TRAE TODOS LOS USUARIO DE LA CAMPAÑA ASIGNADA (READ)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Usuario> Read_Users_Campana_Web(C_Usuario Obj)
    {

        List<C_Usuario> vl_ObjList = new List<C_Usuario>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USERS_CAMPANA_WEB','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "USER_TURNOS", "STD");

        return vl_ObjList;
    }

    /// <summary>
    /// valida si el usuarioNombre ya existe
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Validate_Usuario(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'USER_EXISTE' ,'0','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// trea el id del usuario por cedula
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Retorna_IdUsuario(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'RETURN_ID','0','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// VALIDAR SI EL USUARIO PUEDE GESTIONAR LA CONTRASEÑA
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Gestiona_Usuario(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'RETURN_GESTIONABLE','0','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// Bloquea auto gestion del usuario
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string BloqueaGestion_Usuario(C_Usuario Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'BLOQUEO_GESTION','0','" + Obj.Documento + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }
    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA USER
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_Usuario> List(string vp_Query, string vp_Type, string vp_BD)
    {
        List<C_Usuario> vl_ObjList = new List<C_Usuario>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion(vp_BD);
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ_USER_ID":
                while (Read_Query.Read())
                {
                    C_Usuario Obj = new C_Usuario
                    {
                        Nombre = Read_Query["Nombre"].ToString(),
                        Documento = Read_Query["Documento"].ToString(),
                        RolId = Convert.ToInt64(Read_Query["RolId"])
                    };

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_PERSONAL":
                while (Read_Query.Read())
                {
                    C_Usuario Obj = new C_Usuario
                    {
                        Id = Convert.ToInt64(Read_Query["Id"]),
                        Nombre = Read_Query["Nombre"].ToString(),
                        Rol = Read_Query["Perfil"].ToString(),
                        RolId = Convert.ToInt64(Read_Query["RolId"]),
                    };
                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_USER_DOC":
                while (Read_Query.Read())
                {
                    C_Usuario Obj = new C_Usuario
                    {
                        Nombre = Read_Query["Nombres"].ToString(),
                        Apellido = Read_Query["Apellidos"].ToString(),
                        Correo = Read_Query["Correo"].ToString()
                    };

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_USER_NOTIF":
                while (Read_Query.Read())
                {
                    C_Usuario Obj = new C_Usuario
                    {
                        Nombre = Read_Query["Nombres"].ToString(),
                        Apellido = Read_Query["Apellidos"].ToString(),
                        Correo = Read_Query["Correo"].ToString(),
                        Rol = Read_Query["Perfil"].ToString()
                    };

                    vl_ObjList.Add(Obj);
                }
                break;

            case "USER":
                while (Read_Query.Read())
                {
                    C_Usuario Obj = new C_Usuario
                    {
                        Password = Read_Query.GetValue(0).ToString(),
                        Estado = Convert.ToInt32(Read_Query.GetValue(1)),
                        RolId = Convert.ToInt32(Read_Query.GetValue(2)),
                        CambioPassword = Convert.ToInt32(Read_Query.GetValue(3))
                    };

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_TEMP":
                while (Read_Query.Read())
                {
                    C_Usuario Obj = new C_Usuario
                    {
                        Nombre = Read_Query["Nombre"].ToString().ToUpper(),
                        Apellido = Read_Query["Apellido"].ToString().ToUpper(),
                        Documento = Read_Query["Documento"].ToString(),
                        Correo = Read_Query["Correo"].ToString().ToUpper(),
                        Gestionable = (Read_Query["Gestionable"].ToString() == "S") ? 1 : 0,
                    };

                    vl_ObjList.Add(Obj);
                }
                break;

            case "USERS_CAMPANA":
                while (Read_Query.Read())
                {
                    C_Usuario Obj = new C_Usuario
                    {
                        Id = Convert.ToInt64(Read_Query["Id"].ToString()),
                        Documento = Read_Query["Documento"].ToString(),
                        Nombre = Read_Query["Nombres"].ToString(),
                        Apellido = Read_Query["Apellidos"].ToString(),
                        Estado = Convert.ToInt32(Read_Query["Estado"].ToString()),
                        RolId = Convert.ToInt32(Read_Query["ValueRolId"].ToString()),
                        Gestionable = (!(System.Convert.IsDBNull(Read_Query["Gestionable"]))) ? Convert.ToInt32(Read_Query["Gestionable"]) : 0,
                        Correo = Read_Query["Correo"].ToString(),
                        Rol = Read_Query["Perfil"].ToString(),
                    };

                    vl_ObjList.Add(Obj);
                }
                break;
        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
