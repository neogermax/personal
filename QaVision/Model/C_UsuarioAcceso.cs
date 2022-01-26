using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_UsuarioAcceso
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long ClienteId { get; set; }
    public long CuentaId { get; set; }
    public string Documento { get; set; }
    public long UsuarioId { get; set; }
    public long CoordinadorId { get; set; }
    public long RolId { get; set; }
    public long ValueRolId { get; set; }
    public int Estado { get; set; }
    public string Campana { get; set; }
    public string Rol { get; set; }
    public string Coordinador { get; set; }

    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD Usuario Cliente"
    /// <summary>
    /// crea el registro a que campaña va atado el usuario (CREATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_UserClientCampana(C_UsuarioAcceso Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'INSERT','0','" +
                                                                             Obj.Documento + "','" +
                                                                             Obj.CuentaId + "','" +
                                                                             Obj.UsuarioId + "','" +
                                                                             Obj.Estado + "','" +
                                                                             Obj.ValueRolId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// Activacion o desactivacion de un usuario_campaña (DELETE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string InactiveUserCampana(C_UsuarioAcceso Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'INACTIVE_ACTIVE','" + Obj.Id + "','" + Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    public string ExistUserCampana(C_UsuarioAcceso Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("   SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_EXIST_CAMPANA','0','0','" + Obj.CuentaId + "','" + Obj.UsuarioId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");

        return vl_Status;
    }
    #endregion

    #region "CRUD Usuario Acceso"
    /// <summary>
    /// Crea el acceso a la empresa Asignada
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public String Create_UserAccess(C_UsuarioAcceso Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO_ACCESO] 'INSERT','0','" +
                                                                             Obj.ClienteId + "','" +
                                                                             Obj.CuentaId + "','" +
                                                                             Obj.UsuarioId + "','" +
                                                                             1 + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;

    }
    #endregion

    #region "Funciones"
    /// <summary>
    /// TRAE LA LISTA DE EMPRESA ASIGNADAS
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_DropListEmpresas(C_UsuarioAcceso Obj)
    {
        C_Dato ObjC = new C_Dato();
        List<C_Dato> ObjList = new List<C_Dato>();
        StringBuilder vl_sql = new StringBuilder();
        string vl_StrQuery = "";
        if (Obj.RolId == 1)
        {
            vl_sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ_ALL_CAMPANAS','0'");

            vl_StrQuery = vl_sql.ToString();
            ObjList = ObjC.List(vl_StrQuery, "TRAER_LIST");
        }
        else
        {
            vl_sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_ACCESO_USER','0','U','0','" + Obj.UsuarioId + "'");

            vl_StrQuery = vl_sql.ToString();
            ObjList = ObjC.List(vl_StrQuery, "TRAER_LIST_2");
        }

        return ObjList;
    }

    /// <summary>
    /// trae todas las campañas del usuario seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_UsuarioAcceso> Read_UsersCampanas_All(C_UsuarioAcceso Obj)
    {
        List<C_UsuarioAcceso> ObjList = new List<C_UsuarioAcceso>();
        StringBuilder vl_sql = new StringBuilder();

        vl_sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_ACCESO_USER_ALL','0','U','1','" + Obj.UsuarioId + "'");

        string vl_StrQuery = vl_sql.ToString();
        ObjList = List(vl_StrQuery, "USERS_CAMPANAS", "STD");

        return ObjList;
    }

    /// <summary>
    /// trae todas las campañas del usuario seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_ClienteAsig(C_UsuarioAcceso Obj)
    {
        List<C_Dato> ObjList = new List<C_Dato>();
        StringBuilder vl_sql = new StringBuilder();
        C_Dato dato = new C_Dato();

        vl_sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_CLIENTE','0','" + Obj.Documento + "'");

        string vl_StrQuery = vl_sql.ToString();
        ObjList = dato.List(vl_StrQuery, "TRAER_LIST");

        return ObjList;
    }


    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA USER
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_UsuarioAcceso> List(string vp_Query, string vp_Type, string vp_BD)
    {
        List<C_UsuarioAcceso> vl_ObjList = new List<C_UsuarioAcceso>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion(vp_BD);
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "USERS_CAMPANAS":
                while (Read_Query.Read())
                {
                    C_UsuarioAcceso Obj = new C_UsuarioAcceso();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.CuentaId = Convert.ToInt64(Read_Query["CampanaId"]);
                    Obj.Campana = Read_Query["Nombre"].ToString();
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                    Obj.Rol = Read_Query["Perfil"].ToString();

                    vl_ObjList.Add(Obj);
                }

                break;
        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
