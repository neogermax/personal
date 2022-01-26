using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;
public class C_Reportes
{
    #region "Objetos Publicos"
    public long CANT_MONITOREOS { get; set; }
    public long CANT_FORMULARIOS { get; set; }
    public long PORCENTAJE_PEC { get; set; }
    public long PORCENTAJE_PECC { get; set; }
    public long PORCENTAJE_PECN { get; set; }
    public long PORCENTAJE_PECUF { get; set; }
    public string PROMEDIO_NOTA_FINAL { get; set; }
    public string PROMEDIO_PECUF { get; set; }
    public long EstadoId { get; set; }
    public long F_SMonitor { get; set; }
    public long F_Monitor { get; set; }
    public long F_Coordinador { get; set; }
    public long F_Agente { get; set; }
    public long F_TipoMonitoreo { get; set; }
    public long F_Proceso { get; set; }
    public long F_Formulario { get; set; }
    public long F_PEC { get; set; }
    public long F_PECUF { get; set; }
    public long F_PECN { get; set; }
    public long F_PECC { get; set; }
    public string F_FechaInicial { get; set; }
    public string F_FechaFinal { get; set; }

    public long CAMPANA_ID { get; set; }
    public string PARAMETRO_1 { get; set; }
    public string PARAMETRO_2 { get; set; }
    public string PARAMETRO_3 { get; set; }
    public string PARAMETRO_4 { get; set; }
    public string PARAMETRO_5 { get; set; }
    public string PARAMETRO_6 { get; set; }
    public string PARAMETRO_7 { get; set; }
    public string PARAMETRO_8 { get; set; }
    public string PARAMETRO_9 { get; set; }
    public string PARAMETRO_10 { get; set; }
    public string PARAMETRO_11 { get; set; }
    public string PARAMETRO_12 { get; set; }


    public string Agente { get; set; }
    public string Monitor { get; set; }
    public string SMonitor { get; set; }
    public string Coordinador { get; set; }
    public string Cliente { get; set; }
    public string TipoMonitoreo { get; set; }
    public string TipoProceso { get; set; }
    public string NotaFinal { get; set; }

    public string TipoInforme { get; set; }
    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"

    /// <summary>
    /// traer la cantidad de monitoreos
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string TraerCantMonitoreos(C_Reportes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Proceso].[SP_CRUD_REPORTES] 'CANT_MONITOREOS', '" + Obj.CAMPANA_ID + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// Traer la cantidad de formularios
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string TraerCantFormularios(C_Reportes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Proceso].[SP_CRUD_REPORTES] 'CANT_FORMULARIOS', '" + Obj.CAMPANA_ID + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// trar el procentaje golbal del PEC
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string TraerPorc_PEC(C_Reportes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PEC', '" + Obj.CAMPANA_ID + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    ///  trar el procentaje golbal del PECC
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string TraerPorc_PECC(C_Reportes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PECC', '" + Obj.CAMPANA_ID + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    ///  trar el procentaje golbal del PECN
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string TraerPorc_PECN(C_Reportes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PECN', '" + Obj.CAMPANA_ID + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    ///  trar el procentaje golbal del PECUF
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string TraerPorc_PECUF(C_Reportes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PECUF', '" + Obj.CAMPANA_ID + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// trae el promedio de la nota final
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string TraerPromedio_NotaFinal(C_Reportes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Proceso].[SP_CRUD_REPORTES] 'PROMEDIO_NOTALFINAL', '" + Obj.CAMPANA_ID + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// trae la data general por formulario seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Reportes> Read_Monitoreos_Formulario(C_Reportes Obj)
    {

        List<C_Reportes> vl_ObjList = new List<C_Reportes>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'DATA_FORMULARIO_GENERAL','" + Obj.F_Formulario + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_SELECT_MF");

        return vl_ObjList;
    }

    /// <summary>
    /// tra la data del los monitoreos realizados por el monitor segun los filtros precedidos
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Reportes> Read_CantMonitoreos_Monitor(C_Reportes Obj)
    {
        List<C_Reportes> vl_ObjList = new List<C_Reportes>();
        StringBuilder vl_Sql = new StringBuilder();

        if (Obj.TipoInforme == "M")
        {//por filtro monitoreo
            switch (Obj.PARAMETRO_1)
            {
                case "D"://diario
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO','" + Obj.F_Monitor + "'");
                    break;
                case "S"://semanal
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL','" + Obj.F_Monitor + "'");
                    break;
                case "M"://mensual
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL','" + Obj.F_Monitor + "'");
                    break;
                case "DF"://diario filtro fecha
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO_F','" + Obj.F_Monitor + "','" + Obj.F_FechaInicial + "','" + Obj.F_FechaFinal + "'");
                    break;
                case "SF"://semanal filtro fecha
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL_F','" + Obj.F_Monitor + "','" + Obj.F_FechaInicial + "','" + Obj.F_FechaFinal + "'");
                    break;
                case "MF"://mensual filtro fecha
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL_F','" + Obj.F_Monitor + "','" + Obj.F_FechaInicial + "','" + Obj.F_FechaFinal + "'");
                    break;
            }
            string vl_StrQuery = vl_Sql.ToString();

            vl_ObjList = List(vl_StrQuery, "DATA_REPORT_MONITOREO");
        }
        else {//general
            switch (Obj.PARAMETRO_1)
            {
                case "D"://diario
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO_G','" + Obj.F_Monitor + "'");
                    break;
                case "S"://semanal
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL_G','" + Obj.F_Monitor + "'");
                    break;
                case "M"://mensual
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL_G','" + Obj.F_Monitor + "'");
                    break;
                case "DF"://diario filtro fecha
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO_GF','" + Obj.F_Monitor + "','" + Obj.F_FechaInicial + "','" + Obj.F_FechaFinal + "'");
                    break;
                case "SF"://semanal filtro fecha
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL_GF','" + Obj.F_Monitor + "','" + Obj.F_FechaInicial + "','" + Obj.F_FechaFinal + "'");
                    break;
                case "MF"://mensual filtro fecha
                    vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL_GF','" + Obj.F_Monitor + "','" + Obj.F_FechaInicial + "','" + Obj.F_FechaFinal + "'");
                    break;
            }
            string vl_StrQuery = vl_Sql.ToString();

            vl_ObjList = List(vl_StrQuery, "DATA_REPORT_GMONITOREO");
        }

     

        return vl_ObjList;
    }

    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA report
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_Reportes> List(string vp_Query, string vp_Type)
    {
        List<C_Reportes> vl_ObjList = new List<C_Reportes>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {
            case "DATA_REPORT_MONITOREO":
                while (Read_Query.Read())
                {
                    C_Reportes Obj = new C_Reportes();
                    Obj.PARAMETRO_2 = Read_Query["CantMonitoreo"].ToString();
                    Obj.PARAMETRO_3 = Read_Query["ItemDato"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

            case "DATA_REPORT_GMONITOREO":
                while (Read_Query.Read())
                {
                    C_Reportes Obj = new C_Reportes();
                    Obj.PARAMETRO_2 = Read_Query["CantMonitoreo"].ToString();
                    Obj.F_Monitor = Convert.ToInt64(Read_Query["MonitorId"]);
                    Obj.Monitor = Read_Query["Monitor"].ToString();
                    Obj.PARAMETRO_3 = Read_Query["ItemDato"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;
            case "READ_SELECT_MF":
                while (Read_Query.Read())
                {
                    C_Reportes Obj = new C_Reportes();

                    Obj.Agente = Read_Query["Agente"].ToString();
                    Obj.TipoProceso = Read_Query["TipoProceso"].ToString();
                    Obj.TipoMonitoreo = Read_Query["TipoMonitoreo"].ToString();
                    Obj.NotaFinal = Read_Query["NotaFinal"].ToString();
                    Obj.F_PEC = Convert.ToInt64(Read_Query["NotaPEC"]);
                    Obj.F_PECC = Convert.ToInt64(Read_Query["NotaPECC"]);
                    Obj.F_PECN = Convert.ToInt64(Read_Query["NotaPECN"]);
                    Obj.F_PECUF = Convert.ToInt64(Read_Query["NotaPECUF"]);
                    Obj.EstadoId = Convert.ToInt64(Read_Query["EstadoId"]);

                    vl_ObjList.Add(Obj);
                }
                break;


        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
