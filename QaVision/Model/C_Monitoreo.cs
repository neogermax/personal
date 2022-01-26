using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_Monitoreo
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long MonitorId { get; set; }
    public long FormularioId { get; set; }
    public long AgenteId { get; set; }
    public long CoordinadorId { get; set; }
    public long EscaladoId { get; set; }
    public long TipoProcesoId { get; set; }
    public long TipoMonitoreoId { get; set; }
    public string FechaTransaccion { get; set; }
    public string NotaFinal { get; set; }
    public int NotaPEC { get; set; }
    public int NotaPECUF { get; set; }
    public int NotaPECN { get; set; }
    public int NotaPECC { get; set; }
    public int EstadoId { get; set; }

    public string IdTransaccion { get; set; }

    public string Formulario { get; set; }
    public string Monitor { get; set; }
    public string Agente { get; set; }
    public string Coordinador { get; set; }
    public string TipoProceso { get; set; }
    public string TipoMonitoreo { get; set; }
    public string Estado { get; set; }

    public long RolId { get; set; }
    public long IdUser { get; set; }

    public string Respuesta { get; set; }

    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE MONITOREO (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Monitoreo(C_Monitoreo Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'INSERT','0','" +
                                                                             Obj.FormularioId + "','" +
                                                                             Obj.MonitorId + "','" +
                                                                             Obj.AgenteId + "','" +
                                                                             Obj.CoordinadorId + "','" +
                                                                             Obj.TipoProcesoId + "','" +
                                                                             Obj.TipoMonitoreoId + "','" +
                                                                             Obj.FechaTransaccion + "','" +
                                                                             Obj.NotaFinal + "','" +
                                                                             Obj.NotaPEC + "','" +
                                                                             Obj.NotaPECUF + "','" +
                                                                             Obj.NotaPECN + "','" +
                                                                             Obj.NotaPECC + "','" +
                                                                             "124" + "','" +
                                                                             Obj.IdTransaccion + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// actualiza el estado de monitoreo
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string UpdateEstado_Monitoreo(C_Monitoreo Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'UPDATE_MONITOREO','" +
                                                                             Obj.Id + "','" +
                                                                             Obj.EstadoId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// agrega la persona que debe eliminar el monitoreo
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string UpdateEscalador_Monitoreo(C_Monitoreo Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'UPDATE_ESCALADO','" +
                                                                             Obj.Id + "','" +
                                                                             Obj.EstadoId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// trae los monitoreos seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Monitoreo> Read_Monitoreos(C_Monitoreo Obj)
    {

        List<C_Monitoreo> vl_ObjList = new List<C_Monitoreo>();
        StringBuilder vl_Sql = new StringBuilder();

        string vl_consult = (Obj.RolId == 1) ? "SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'READ','" + Obj.Id + "'" : "SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'READ_USER','" + Obj.Id + "','" + Obj.RolId + "','" + Obj.IdUser + "'";
        vl_Sql.Append(vl_consult);

        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }


    /// <summary>
    /// elimina el monitoreo seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Delete_Monitoreo(C_Monitoreo Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'DELETE_MONITOREO','" +
                                                                             Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }
    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA MONITOREO
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_Monitoreo> List(string vp_Query, string vp_Type)
    {
        List<C_Monitoreo> vl_ObjList = new List<C_Monitoreo>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ":
                while (Read_Query.Read())
                {
                    C_Monitoreo Obj = new C_Monitoreo();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.FormularioId = Convert.ToInt64(Read_Query["FormularioId"]);
                    Obj.MonitorId = Convert.ToInt64(Read_Query["MonitorId"]);
                    Obj.Monitor = Read_Query["Monitor"].ToString();
                    Obj.AgenteId = Convert.ToInt64(Read_Query["AgenteId"]);
                    Obj.Agente = Read_Query["Agente"].ToString();
                    Obj.CoordinadorId = Convert.ToInt64(Read_Query["CoordinadorId"]);
                    Obj.Coordinador = Read_Query["Coordinador"].ToString();
                    Obj.TipoProcesoId = Convert.ToInt64(Read_Query["TipoProcesoId"]);
                    Obj.TipoProceso = Read_Query["TipoProceso"].ToString();
                    Obj.TipoMonitoreoId = Convert.ToInt64(Read_Query["TipoMonitoreoId"]);
                    Obj.TipoMonitoreo = Read_Query["TipoMonitoreo"].ToString();
                    Obj.FechaTransaccion = Read_Query["FechaTransaccion"].ToString();
                    Obj.NotaFinal = Read_Query["NotaFinal"].ToString();
                    Obj.NotaPEC = Convert.ToInt32(Read_Query["NotaPEC"]);
                    Obj.NotaPECUF = Convert.ToInt32(Read_Query["NotaPECUF"]);
                    Obj.NotaPECN = Convert.ToInt32(Read_Query["NotaPECN"]);
                    Obj.NotaPECC = Convert.ToInt32(Read_Query["NotaPECC"]);
                    Obj.EstadoId = Convert.ToInt32(Read_Query["EstadoId"]);
                    Obj.Estado = Read_Query["Estado"].ToString();
                    Obj.IdTransaccion = Read_Query["IdTransaccion"].ToString();
                    Obj.Formulario = Read_Query["Formulario"].ToString();
                    Obj.EscaladoId = Convert.ToInt64(Read_Query["EscaladoId"]);

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion
}
