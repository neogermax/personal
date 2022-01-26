using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_Campanas
{

    #region "Objetos Publicos"
    public long Id { get; set; }
    public long ClienteId { get; set; }
    public string Nombre { get; set; }
    public int Estado { get; set; }
    public int CantidadMonitoreos { get; set; }
    public long FrecuenciaMonitoreoId { get; set; }
    public string Logo { get; set; }
    public string ColorBack { get; set; }
    public string ColorHeaderTitle { get; set; }
    public string ColorLabel { get; set; }
    public string ColorAlerta { get; set; }
    public int CoordinadorMonitorea { get; set; }
    public string EMAIL_FROM { get; set; }
    public string SMTP { get; set; }
    public string EMAIL_CONFIG { get; set; }
    public string EMAIL_PASS { get; set; }
    public string Cliente { get; set; }
    public string FrecuenciaMonitoreo { get; set; }
    public System.DateTime FechaRegistro { get; set; }

    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    public long vg_Contador = 0;
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE CLIENTES (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Campana(C_Campanas Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'INSERT','0','" +
                                                                             Obj.ClienteId + "','" +
                                                                             Obj.Nombre + "','1','" +
                                                                             Obj.CantidadMonitoreos + "','" +
                                                                             Obj.FrecuenciaMonitoreoId + "','" +
                                                                             Obj.CoordinadorMonitorea + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// ACTUALIZA LA DATA DE CLIENTE (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Campana(C_Campanas Obj)
    {
        List<C_Campanas> vl_ObjList = new List<C_Campanas>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'UPDATE','" +
                                                                                Obj.Id + "','" +
                                                                                Obj.ClienteId + "','" +
                                                                                Obj.Nombre + "','1','" +
                                                                                Obj.CantidadMonitoreos + "','" +
                                                                                 Obj.FrecuenciaMonitoreoId + "','" +
                                                                                 Obj.CoordinadorMonitorea + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// Trae si el coordinador monitorea segun la campaña asignada
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Coodinador_Monitorea(C_Campanas Obj)
    {
        List<C_Campanas> vl_ObjList = new List<C_Campanas>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ_COORDI_MONITO','" + Obj.Id  + "'");
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
    public List<C_Campanas> Read_Campanas(C_Campanas Obj)
    {

        List<C_Campanas> vl_ObjList = new List<C_Campanas>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ_ALL','0'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }

    /// <summary>
    /// TRAE TODOS LOS USUARIO DE LA CAMPAÑA ASIGNADA (READ)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_Campanas_All(C_Campanas Obj)
    {

        List<C_Dato> vl_ObjList = new List<C_Dato>();
        C_Dato cls = new C_Dato();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ_ALL_CAMPANAS','0'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = cls.List(vl_StrQuery, "TRAER_LIST");

        return vl_ObjList;
    }



    /// <summary>
    /// valida si el cliente ya existe
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string ValidaCampana(C_Campanas Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'EXISTE_CAMPANA' ,'0','" + Obj.ClienteId + "','" + Obj.Nombre + "'");
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
    public List<C_Campanas> List(string vp_Query, string vp_Type)
    {
        List<C_Campanas> vl_ObjList = new List<C_Campanas>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ":
                while (Read_Query.Read())
                {
                    C_Campanas Obj = new C_Campanas();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.ClienteId = Convert.ToInt64(Read_Query["ClienteId"]);
                    Obj.Cliente = Read_Query["Cliente"].ToString();
                    Obj.Nombre = Read_Query["Campana"].ToString();
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                    Obj.CantidadMonitoreos = Convert.ToInt32(Read_Query["CantidadMonitoreos"]);
                    Obj.FrecuenciaMonitoreoId = Convert.ToInt64(Read_Query["FrecuenciaMonitoreoId"]);
                    Obj.FrecuenciaMonitoreo = Read_Query["FrecuenciaMonitoreo"].ToString();
                    Obj.CoordinadorMonitorea = Convert.ToInt32(Read_Query["CoordinadorMonitorea"]);

                    Obj.Logo = Read_Query["Logo"].ToString();
                    Obj.ColorBack = Read_Query["ColorBack"].ToString();
                    Obj.ColorHeaderTitle = Read_Query["ColorHeaderTitle"].ToString();
                    Obj.ColorLabel = Read_Query["ColorLabel"].ToString();
                    Obj.ColorAlerta = Read_Query["ColorAlerta"].ToString();
                    Obj.EMAIL_FROM = Read_Query["EMAIL_FROM"].ToString();
                    Obj.EMAIL_CONFIG = Read_Query["EMAIL_CONFIG"].ToString();
                    Obj.EMAIL_PASS = Read_Query["EMAIL_PASS"].ToString();
                    Obj.SMTP = Read_Query["SMTP"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;


        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
