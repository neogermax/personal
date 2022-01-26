using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_Formulario
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long CampanaId { get; set; }
    public string Descripcion { get; set; }
    public int ValorMaximoEvaluar { get; set; }
    public int Estado { get; set; }
    public System.DateTime FechaRegistro { get; set; }

    public int Nivel_0 { get; set; }
    public int Nivel_1 { get; set; }
    public int Nivel_2 { get; set; }
    public int Nivel_3 { get; set; }
    public int Nivel_4 { get; set; }
    public int ErrorCriticoNivel { get; set; }
    public int PesoPonderadoNivel { get; set; }
    public string Campana { get; set; }
    public string Respuesta { get; set; }

    public string StrNivel_0 { get; set; }
    public string StrNivel_1 { get; set; }
    public string StrNivel_2 { get; set; }
    public string StrNivel_3 { get; set; }
    public string StrNivel_4 { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    public long vg_Contador = 0;
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE FORMULARIO (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Formulario(C_Formulario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'INSERT','0','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.ValorMaximoEvaluar + "','" +
                                                                             Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// actualiza la descripcion del formulario
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Formulario(C_Formulario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'UPDATE','" + Obj.Id + "','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.ValorMaximoEvaluar + "','" +
                                                                             Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// ACTUALIZA EL CONTADOR DEL BLOQUE SELECCIONADO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Contador(C_Formulario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'UPDATE_CONTADOR','" + Obj.Id + "','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.ValorMaximoEvaluar + "','" +
                                                                             Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// actualiza los niveles de evaluacion para el peso ponderado y error critico
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_NivelesEvaluacion(C_Formulario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'UPDATE_NIVELES','" + Obj.Id + "','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.PesoPonderadoNivel + "','" +
                                                                             Obj.ErrorCriticoNivel  + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// actualiza el estado del formulario
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Estado(C_Formulario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'UPDATE_ESTADO','" + Obj.Id + "','" + Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// TRAE LA DATA POR CAMPAÑA
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Formulario> Read_FormularioCampana(C_Formulario Obj)
    {

        List<C_Formulario> vl_ObjList = new List<C_Formulario>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_CAMPANA','0','" + Obj.CampanaId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_CAMPANA");

        return vl_ObjList;
    }

    /// <summary>
    /// TRAE LA DATA POR CAMPAÑA
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Formulario> Read_FormularioId(C_Formulario Obj)
    {

        List<C_Formulario> vl_ObjList = new List<C_Formulario>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_ID','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_ID");

        return vl_ObjList;
    }

    /// <summary>
    /// trae los formularios para los monitoreos
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Formulario> Read_FormularioDroplist(C_Formulario Obj)
    {

        List<C_Formulario> vl_ObjList = new List<C_Formulario>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_FORM_LIST','0','" + Obj.CampanaId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_CAMPANA");

        return vl_ObjList;
    }

    /// <summary>
    /// ELIMINA TODO EL FORMULARIO SELECCIONADO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Delete_Formulario(C_Formulario Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'DELETE_FORM','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    #endregion

    #region "FUNCIONES"

    /// <summary>
    /// trae la data del formulario seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Formulario> Read_FormularioCopia(C_Formulario Obj)
    {

        List<C_Formulario> vl_ObjList = new List<C_Formulario>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_FORMULARIO','" + Obj.Id + "'");
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
    public List<C_Formulario> List(string vp_Query, string vp_Type)
    {
        List<C_Formulario> vl_ObjList = new List<C_Formulario>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ_COPIA":
                while (Read_Query.Read())
                {
                    C_Formulario Obj = new C_Formulario();

                    Obj.CampanaId = Convert.ToInt64(Read_Query["CampanaId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.ValorMaximoEvaluar = Convert.ToInt32(Read_Query["ValorMaximoEvaluar"]);
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                    Obj.Nivel_0 = Convert.ToInt32(Read_Query["Nivel_0"]);
                    Obj.Nivel_1 = Convert.ToInt32(Read_Query["Nivel_1"]);
                    Obj.Nivel_2 = Convert.ToInt32(Read_Query["Nivel_2"]);
                    Obj.Nivel_3 = Convert.ToInt32(Read_Query["Nivel_3"]);
                    Obj.Nivel_4 = Convert.ToInt32(Read_Query["Nivel_4"]);
                    Obj.ErrorCriticoNivel = Convert.ToInt32(Read_Query["ErrorCriticoNivel"]);
                    Obj.PesoPonderadoNivel = Convert.ToInt32(Read_Query["PesoPonderadoNivel"]);

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_TEMP":
                while (Read_Query.Read())
                {
                    C_Formulario Obj = new C_Formulario();

                    Obj.StrNivel_0 = (!(System.Convert.IsDBNull(Read_Query["Nivel_0"]))) ? Read_Query["Nivel_0"].ToString() : "";
                    Obj.StrNivel_1 = (!(System.Convert.IsDBNull(Read_Query["Nivel_1"]))) ? Read_Query["Nivel_1"].ToString() : "";
                    Obj.StrNivel_2 = (!(System.Convert.IsDBNull(Read_Query["Nivel_2"]))) ? Read_Query["Nivel_2"].ToString() : "";
                    Obj.StrNivel_3 = (!(System.Convert.IsDBNull(Read_Query["Nivel_3"]))) ? Read_Query["Nivel_3"].ToString() : "";
                    Obj.StrNivel_4 = (!(System.Convert.IsDBNull(Read_Query["Nivel_4"]))) ? Read_Query["Nivel_4"].ToString() : "";

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_CAMPANA":
                while (Read_Query.Read())
                {
                    C_Formulario Obj = new C_Formulario();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.ValorMaximoEvaluar = Convert.ToInt32(Read_Query["ValorMaximoEvaluar"]);
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                    Obj.Nivel_0 = Convert.ToInt32(Read_Query["Nivel_0"]);
                    Obj.Nivel_1 = Convert.ToInt32(Read_Query["Nivel_1"]);
                    Obj.Nivel_2 = Convert.ToInt32(Read_Query["Nivel_2"]);
                    Obj.Nivel_3 = Convert.ToInt32(Read_Query["Nivel_3"]);
                    Obj.Nivel_4 = Convert.ToInt32(Read_Query["Nivel_4"]);
                    Obj.ErrorCriticoNivel = Convert.ToInt32(Read_Query["ErrorCriticoNivel"]);
                    Obj.PesoPonderadoNivel = Convert.ToInt32(Read_Query["PesoPonderadoNivel"]);

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_ID":
                while (Read_Query.Read())
                {
                    C_Formulario Obj = new C_Formulario();

                    Obj.CampanaId = Convert.ToInt64(Read_Query["CampanaId"]);
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);

                    vl_ObjList.Add(Obj);
                }
                break;


        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
