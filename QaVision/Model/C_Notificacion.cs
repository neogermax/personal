using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_Notificacion
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long ModuloId { get; set; }
    public long UsuarioId { get; set; }
    public long IndicativoId { get; set; }
    public string Descripcion { get; set; }
    public int Flag_Visto { get; set; }


    public string Modulo { get; set; }
    public string Usuario { get; set; }


    public string Respuesta { get; set; }

    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion


    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE NOTIFICACION (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Notificacion(C_Notificacion Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'INSERT','0','" +
                                                                             Obj.ModuloId + "','" +
                                                                             Obj.UsuarioId + "','" +
                                                                             Obj.IndicativoId + "','" +
                                                                             Obj.Descripcion + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// ACTUALIZA LA BANDERA DE LEIDO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Flag_Notificacion(C_Notificacion Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'UPDATE_FLAG','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// trae la cantidad de registros por usuario
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Read_Count_Notificacion(C_Notificacion Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'COUNT_USER','" + Obj.UsuarioId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// trae las notificacionespor usuario
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Notificacion> Read_NotificacionesUser(C_Notificacion Obj)
    {

        List<C_Notificacion> vl_ObjList = new List<C_Notificacion>();
        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'READ_USER','" + Obj.UsuarioId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }

    #endregion


    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA MONITOREO
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_Notificacion> List(string vp_Query, string vp_Type)
    {
        List<C_Notificacion> vl_ObjList = new List<C_Notificacion>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ":
                while (Read_Query.Read())
                {
                    C_Notificacion Obj = new C_Notificacion();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.ModuloId = Convert.ToInt64(Read_Query["ModuloId"]);
                    Obj.Modulo = Read_Query["Modulo"].ToString();
                    Obj.UsuarioId = Convert.ToInt64(Read_Query["UsuarioId"]);
                    Obj.Usuario = Read_Query["Personaje"].ToString();
                    Obj.IndicativoId = Convert.ToInt64(Read_Query["IndicativoId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.Flag_Visto = Convert.ToInt32(Read_Query["Flag_Visto"]);

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion
}
