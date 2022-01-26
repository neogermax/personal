using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_Puntos_Entrenamiento
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long NotasDescriptivasId { get; set; }
    public string Descripcion { get; set; }
    public string Peso { get; set; }
    public string PesoPonderado { get; set; }
    public long EstadoProcesoId { get; set; }
    public int Estado { get; set; }
    public System.DateTime FechaRegistro { get; set; }

    public string NotasDescriptivas { get; set; }
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
    public string Create_Nivel3(C_Puntos_Entrenamiento Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_PUNTOS_ENTR] 'INSERT','0','" +
                                                                             Obj.NotasDescriptivasId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.EstadoProcesoId + "','" +
                                                                             Obj.Peso + "','" +
                                                                             Obj.PesoPonderado + "','" +
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
    public string Update_Nivel3(C_Puntos_Entrenamiento Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_PUNTOS_ENTR] 'UPDATE','" + Obj.Id + "','" +
                                                                             Obj.NotasDescriptivasId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.EstadoProcesoId + "','" +
                                                                             Obj.Peso + "','" +
                                                                             Obj.PesoPonderado + "','" +
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
    public string Delete_Nivel3(C_Puntos_Entrenamiento Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_PUNTOS_ENTR] 'DELETE','" + Obj.Id  + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// TRAE LA DATA DE punto de entrenamiento POR FORMULARIO SELECCIONADO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Puntos_Entrenamiento> Read_Nivel3Formulario(C_Puntos_Entrenamiento Obj)
    {

        List<C_Puntos_Entrenamiento> vl_ObjList = new List<C_Puntos_Entrenamiento>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC  [Proceso].[SP_CRUD_PUNTOS_ENTR] 'READ_FORMULARIO','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_FORMULARIO");

        return vl_ObjList;
    }

    /// <summary>
    /// trae la data de puntos de entrenamiento para la copia
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Puntos_Entrenamiento> Read_Nivel3Copia(C_Puntos_Entrenamiento Obj)
    {

        List<C_Puntos_Entrenamiento> vl_ObjList = new List<C_Puntos_Entrenamiento>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N3','" + Obj.Id + "'");
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
    public List<C_Puntos_Entrenamiento> List(string vp_Query, string vp_Type)
    {
        List<C_Puntos_Entrenamiento> vl_ObjList = new List<C_Puntos_Entrenamiento>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {
            case "READ_COPIA":
                while (Read_Query.Read())
                {
                    C_Puntos_Entrenamiento Obj = new C_Puntos_Entrenamiento();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.NotasDescriptivasId = Convert.ToInt64(Read_Query["NotasDescriptivasId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.EstadoProcesoId = Convert.ToInt64(Read_Query["EstadoProcesoId"]);
                    Obj.Peso = Read_Query["Peso"].ToString();
                    Obj.PesoPonderado = (!(System.Convert.IsDBNull(Read_Query["PesoPonderado"]))) ? Read_Query["PesoPonderado"].ToString() : "0";
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
        
                    vl_ObjList.Add(Obj);
                }
                break;


            case "READ_FORMULARIO":
                while (Read_Query.Read())
                {
                    C_Puntos_Entrenamiento Obj = new C_Puntos_Entrenamiento();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.NotasDescriptivasId = Convert.ToInt64(Read_Query["NotasDescriptivasId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.EstadoProcesoId = (!(System.Convert.IsDBNull(Read_Query["EstadoProcesoId"]))) ? Convert.ToInt64(Read_Query["EstadoProcesoId"]) : 120;
                    Obj.Peso = Read_Query["Peso"].ToString();
                    Obj.PesoPonderado = (!(System.Convert.IsDBNull(Read_Query["PesoPonderado"]))) ? Read_Query["PesoPonderado"].ToString() : "0";
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                    Obj.NotasDescriptivas = Read_Query["NotasDescriptivas"].ToString();
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
