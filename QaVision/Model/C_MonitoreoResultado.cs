using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_MonitoreoResultado
{

    #region "Objetos Publicos"
    public long Id { get; set; }
    public long MonitoreoId { get; set; }
    public int OpeNivel { get; set; }
    public long NivelId { get; set; }
    public string Opc { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE FORMULARIO (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_MonitoreoResultado(C_MonitoreoResultado Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_RESULTADO_MONITOREO] 'INSERT','0','" +
                                                                             Obj.MonitoreoId + "','" +
                                                                             Obj.OpeNivel + "','" +
                                                                             Obj.NivelId + "','" +
                                                                             Obj.Opc + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    public List<C_MonitoreoResultado> Read_MonitoreoResultado(C_MonitoreoResultado Obj)
    {

        List<C_MonitoreoResultado> vl_ObjList = new List<C_MonitoreoResultado>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_RESULTADO_MONITOREO] 'READ','" + Obj.MonitoreoId + "'");
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
    public List<C_MonitoreoResultado> List(string vp_Query, string vp_Type)
    {
        List<C_MonitoreoResultado> vl_ObjList = new List<C_MonitoreoResultado>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ":
                while (Read_Query.Read())
                {
                    C_MonitoreoResultado Obj = new C_MonitoreoResultado();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.OpeNivel = Convert.ToInt32(Read_Query["OpeNivel"]);
                    Obj.NivelId = Convert.ToInt64(Read_Query["NivelId"]);
                    Obj.Opc = Read_Query["Opc"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
