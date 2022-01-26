using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_NotasDescriptivas
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long BloqueEvaluacionId { get; set; }
    public string Descripcion { get; set; }
    public string Peso { get; set; }
    public string PesoPonderado { get; set; }
    public long EstadoProcesoId { get; set; }
    public int Estado { get; set; }
    public System.DateTime FechaRegistro { get; set; }

    public string BloqueEvaluacion { get; set; }
    public string EstadoProceso { get; set; }
    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE BLOQUE EVALUACION (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Nivel2(C_NotasDescriptivas Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'INSERT','0','" +
                                                                             Obj.BloqueEvaluacionId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.Peso + "','" +
                                                                             Obj.PesoPonderado  + "','" +
                                                                             Obj.EstadoProcesoId + "','" +
                                                                             Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    ///  actualiza el bloque evaluacion seleccionado (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Nivel2(C_NotasDescriptivas Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'UPDATE','" + Obj.Id + "','" +
                                                                             Obj.BloqueEvaluacionId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.Peso + "','" +
                                                                             Obj.PesoPonderado + "','" +
                                                                             Obj.EstadoProcesoId + "','" + 
                                                                             Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// activa o desactiva el cargo seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Delete_Nivel2(C_NotasDescriptivas Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'DELETE','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// TRAE LA DATA DE CARGOS POR FORMULARIO SELECCIONADO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_NotasDescriptivas> Read_Nivel2Formulario(C_NotasDescriptivas Obj)
    {

        List<C_NotasDescriptivas> vl_ObjList = new List<C_NotasDescriptivas>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC  [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'READ_FORMULARIO','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_FORMULARIO");

        return vl_ObjList;
    }

    /// <summary>
    /// trae la data de notas descriptivas para la copia
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_NotasDescriptivas> Read_Nivel2Copia(C_NotasDescriptivas Obj)
    {

        List<C_NotasDescriptivas> vl_ObjList = new List<C_NotasDescriptivas>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N2','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_COPIA");

        return vl_ObjList;
    }

    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA USER
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_NotasDescriptivas> List(string vp_Query, string vp_Type)
    {
        List<C_NotasDescriptivas> vl_ObjList = new List<C_NotasDescriptivas>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ_COPIA":
                while (Read_Query.Read())
                {
                    C_NotasDescriptivas Obj = new C_NotasDescriptivas();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.BloqueEvaluacionId = Convert.ToInt64(Read_Query["BloqueEvaluacionId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.Peso = Read_Query["Peso"].ToString();
                    Obj.PesoPonderado = (!(System.Convert.IsDBNull(Read_Query["PesoPonderado"]))) ? Read_Query["PesoPonderado"].ToString() : "0";
                    Obj.EstadoProcesoId = (!(System.Convert.IsDBNull(Read_Query["EstadoProcesoId"]))) ? Convert.ToInt64(Read_Query["EstadoProcesoId"]) : 120;
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                 
                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_FORMULARIO":
                while (Read_Query.Read())
                {
                    C_NotasDescriptivas Obj = new C_NotasDescriptivas();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.BloqueEvaluacionId = Convert.ToInt64(Read_Query["BloqueEvaluacionId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.Peso = Read_Query["Peso"].ToString();
                    Obj.PesoPonderado = (!(System.Convert.IsDBNull(Read_Query["PesoPonderado"]))) ? Read_Query["PesoPonderado"].ToString() : "0";
                    Obj.EstadoProcesoId = (!(System.Convert.IsDBNull(Read_Query["EstadoProcesoId"]))) ? Convert.ToInt64(Read_Query["EstadoProcesoId"]) :120;
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                    Obj.BloqueEvaluacion = Read_Query["BloqueEvaluacion"].ToString();
                    Obj.EstadoProceso = (!(System.Convert.IsDBNull(Read_Query["EstadoProceso"]))) ? Read_Query["EstadoProceso"].ToString() : "No Aplica";

                    vl_ObjList.Add(Obj);
                }
                break;

        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion
}
