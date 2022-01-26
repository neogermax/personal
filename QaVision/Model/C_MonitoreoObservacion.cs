using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;
using System.Web;

public class C_MonitoreoObservacion
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long MonitoreoId { get; set; }
    public long UsuarioId { get; set; }
    public int EstadoId { get; set; }
    public string Observacion { get; set; }
    public string FechaObservacion { get; set; }

    public string Usuario { get; set; }
    public string Perfil { get; set; }
    public string Estado { get; set; }
    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion


    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE MonitoreoObservacion (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_MonitoreoObs(C_MonitoreoObservacion Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO_OBSERVACION] 'INSERT','0','" +
                                                                                                                                                                              Obj.MonitoreoId + "','" +
                                                                                                                                                                              Obj.UsuarioId + "','" +
                                                                                                                                                                              Obj.EstadoId + "','" +
                                                                                                                                                                              Obj.Observacion + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// TRAE TODOS LAS OBSERVACIONES AL MONITOREO ASIGNADO (READ)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_MonitoreoObservacion> Read_MonitoreoObservacion(C_MonitoreoObservacion Obj)
    {

        List<C_MonitoreoObservacion> vl_ObjList = new List<C_MonitoreoObservacion>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO_OBSERVACION] 'READ','" + Obj.Id + "','"+ Obj.MonitoreoId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }

    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA OBSERVACION MONITOREOS
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_MonitoreoObservacion> List(string vp_Query, string vp_Type)
    {
        List<C_MonitoreoObservacion> vl_ObjList = new List<C_MonitoreoObservacion>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ":
                while (Read_Query.Read())
                {
                    C_MonitoreoObservacion Obj = new C_MonitoreoObservacion();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.EstadoId = Convert.ToInt32(Read_Query["EstadoId"]);
                    Obj.Perfil = Read_Query["Perfil"].ToString();
                    Obj.Estado = Read_Query["EstadoMonitoreo"].ToString();
                    Obj.UsuarioId = Convert.ToInt64(Read_Query["UsuarioId"]);
                    Obj.Usuario = Read_Query["Personaje"].ToString();
                    Obj.Observacion = Read_Query["Observacion"].ToString();
                    Obj.FechaObservacion = Read_Query["FechaObservacion"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion
}
