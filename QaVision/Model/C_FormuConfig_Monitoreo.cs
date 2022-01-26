using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_FormuConfig_Monitoreo
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long FormularioId { get; set; }
    public int Ope_Nivel_0 { get; set; }
    public int Ope_Nivel_1 { get; set; }
    public int Ope_Nivel_2 { get; set; }
    public int Ope_Nivel_3 { get; set; }
    public int Ope_Nivel_4 { get; set; }
    public int VariosOperadores { get; set; }
    public int OpcCumple { get; set; }
    public int OpcNoCumple { get; set; }
    public int OpcNoAplica { get; set; }
    public int NoAplicaPeso { get; set; }
    public int AplicaErrorCritico { get; set; }
    public string MonitoreoXDefecto { get; set; }
    public System.DateTime FechaRegistro { get; set; }

    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    public long vg_Contador = 0;
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE Formulacion_Config_Monitoreo (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_FormuConfig_Monitoreo(C_FormuConfig_Monitoreo Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONFIG_MONITOREO] 'INSERT','0','" +
                                                                                                                                                                Obj.FormularioId + "','" +
                                                                                                                                                                Obj.Ope_Nivel_0 + "','" +
                                                                                                                                                                Obj.Ope_Nivel_1 + "','" +
                                                                                                                                                                Obj.Ope_Nivel_2 + "','" +
                                                                                                                                                                Obj.VariosOperadores + "','" +
                                                                                                                                                                Obj.Ope_Nivel_3 + "','" +
                                                                                                                                                                Obj.Ope_Nivel_4 + "','" +
                                                                                                                                                                Obj.OpcCumple + "','" +
                                                                                                                                                                Obj.OpcNoCumple + "','" +
                                                                                                                                                                Obj.OpcNoAplica + "','" +
                                                                                                                                                                Obj.NoAplicaPeso + "','" +
                                                                                                                                                                Obj.AplicaErrorCritico + "','" +
                                                                                                                                                                Obj.MonitoreoXDefecto + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// ACTUALIZA EL REGISTRO EN LA TABLA DE Formulacion_Config_Monitoreo (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_FormuConfig_Monitoreo(C_FormuConfig_Monitoreo Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONFIG_MONITOREO] 'UPDATE','" + Obj.Id + "','" +
                                                                                                                                                                                     Obj.FormularioId + "','" +
                                                                                                                                                                                     Obj.Ope_Nivel_0 + "','" +
                                                                                                                                                                                     Obj.Ope_Nivel_1 + "','" +
                                                                                                                                                                                     Obj.Ope_Nivel_2 + "','" +
                                                                                                                                                                                     Obj.VariosOperadores + "','" +
                                                                                                                                                                                     Obj.Ope_Nivel_3 + "','" +
                                                                                                                                                                                     Obj.Ope_Nivel_4 + "','" +
                                                                                                                                                                                     Obj.OpcCumple + "','" +
                                                                                                                                                                                     Obj.OpcNoCumple + "','" +
                                                                                                                                                                                     Obj.OpcNoAplica + "','" +
                                                                                                                                                                                     Obj.NoAplicaPeso + "','" +
                                                                                                                                                                                     Obj.AplicaErrorCritico + "','" +
                                                                                                                                                                                     Obj.MonitoreoXDefecto + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// TRAE TODOS LOS REGISTROS DE CONFIGURACION POR FORMULARIO SELECCIONADO (READ)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_FormuConfig_Monitoreo> Read_ConfiguracionFormulario(C_FormuConfig_Monitoreo Obj)
    {

        List<C_FormuConfig_Monitoreo> vl_ObjList = new List<C_FormuConfig_Monitoreo>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONFIG_MONITOREO] 'READ_FORMULARIOID','0','"+ Obj.FormularioId +"'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }
    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA REGISTROS
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_FormuConfig_Monitoreo> List(string vp_Query, string vp_Type)
    {
        List<C_FormuConfig_Monitoreo> vl_ObjList = new List<C_FormuConfig_Monitoreo>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ":
                while (Read_Query.Read())
                {
                    C_FormuConfig_Monitoreo Obj = new C_FormuConfig_Monitoreo();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.Ope_Nivel_0 = Convert.ToInt32(Read_Query["Ope_Nivel_0"]);
                    Obj.Ope_Nivel_1 = Convert.ToInt32(Read_Query["Ope_Nivel_1"]);
                    Obj.Ope_Nivel_2 = Convert.ToInt32(Read_Query["Ope_Nivel_2"]);
                    Obj.VariosOperadores = Convert.ToInt32(Read_Query["VariosOperadores"]);
                    Obj.Ope_Nivel_3 = Convert.ToInt32(Read_Query["Ope_Nivel_3"]);
                    Obj.Ope_Nivel_4 = Convert.ToInt32(Read_Query["Ope_Nivel_4"]);
                    Obj.OpcCumple = Convert.ToInt32(Read_Query["OpcCumple"]);
                    Obj.OpcNoCumple = Convert.ToInt32(Read_Query["OpcNoCumple"]);
                    Obj.OpcNoAplica = Convert.ToInt32(Read_Query["OpcNoAplica"]);
                    Obj.NoAplicaPeso = Convert.ToInt32(Read_Query["NoAplicaPeso"]);
                    Obj.AplicaErrorCritico = Convert.ToInt32(Read_Query["AplicaErrorCritico"]);
                    Obj.MonitoreoXDefecto = Read_Query["MonitoreoXDefecto"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
