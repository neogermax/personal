using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_CargoEsp
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long CampanaId { get; set; }
    public long FormularioId { get; set; }
    public string Descripcion { get; set; }
    public string Peso { get; set; }
    public int Estado { get; set; }
    public System.DateTime FechaRegistro { get; set; }

    public string Campana { get; set; }
    public string Respuesta { get; set; }
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
    public string Create_Nivel0(C_CargoEsp Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CARGOS] 'INSERT','0','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.FormularioId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.Peso + "','" +
                                                                             Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    ///  actualiza el cargo seleccionado (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Nivel0(C_CargoEsp Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CARGOS] 'UPDATE','" + Obj.Id + "','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.FormularioId + "','" +
                                                                             Obj.Descripcion + "','" +
                                                                             Obj.Peso + "','" +
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
    public string Delete_Nivel0(C_CargoEsp Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CARGOS] 'DELETE','" + Obj.Id + "'");
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
    public List<C_CargoEsp> Read_Nivel0Formulario(C_CargoEsp Obj)
    {

        List<C_CargoEsp> vl_ObjList = new List<C_CargoEsp>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC  [Proceso].[SP_CRUD_CARGOS] 'READ_FORMULARIO','" + Obj.FormularioId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_FORMULARIO");

        return vl_ObjList;
    }

    /// <summary>
    /// trae la data de cargos para la copia
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_CargoEsp> Read_Nivel0Copia(C_CargoEsp Obj)
    {

        List<C_CargoEsp> vl_ObjList = new List<C_CargoEsp>();
     
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N0','" + Obj.Id + "'");
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
    public List<C_CargoEsp> List(string vp_Query, string vp_Type)
    {
        List<C_CargoEsp> vl_ObjList = new List<C_CargoEsp>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {
            case "READ_COPIA":
                while (Read_Query.Read())
                {
                    C_CargoEsp Obj = new C_CargoEsp();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.CampanaId = Convert.ToInt64(Read_Query["CampanaId"]);
                    Obj.FormularioId = Convert.ToInt64(Read_Query["FormularioId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.Peso = Read_Query["Peso"].ToString();
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);


                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_FORMULARIO":
                while (Read_Query.Read())
                {
                    C_CargoEsp Obj = new C_CargoEsp();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.CampanaId = Convert.ToInt64(Read_Query["CampanaId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.Peso = Read_Query["Peso"].ToString();
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_CAMPANA":
                while (Read_Query.Read())
                {
                    C_CargoEsp Obj = new C_CargoEsp();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.FormularioId = Convert.ToInt64(Read_Query["FormularioId"]);
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.Peso = Read_Query["Peso"].ToString();
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
