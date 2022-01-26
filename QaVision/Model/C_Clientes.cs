using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_Clientes
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public string Nombre { get; set; }
    public string Nit { get; set; }
    public int Estado { get; set; }
    public System.DateTime FechaRegistro { get; set; }

    public string Respuesta { get; set; }
    #endregion
    
    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE CLIENTES (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Cliente(C_Clientes Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'INSERT','0','" + Obj.Nombre + "','" + Obj.Nit + "'");
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
    public string Update_Cliente(C_Clientes Obj)
    {
        List<C_Clientes> vl_ObjList = new List<C_Clientes>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'UPDATE','" + Obj.Id + "','" + Obj.Nombre + "','" + Obj.Nit + "'");
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
    public List<C_Clientes> Read_Clientes(C_Clientes Obj)
    {

        List<C_Clientes> vl_ObjList = new List<C_Clientes>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'READ','0'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> List_Clientes()
    {
        C_Dato ObjC = new C_Dato();
        List<C_Dato> vl_ObjList = new List<C_Dato>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'LIST_CLIENTES','0'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = ObjC.List(vl_StrQuery, "TRAER_LIST");

        return vl_ObjList;
    }


    /// <summary>
    /// valida si el cliente ya existe
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string ValidaCliente(C_Clientes Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'EXISTE_CLIENTE' ,'0','" + Obj.Nombre + "'");
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
    public List<C_Clientes> List(string vp_Query, string vp_Type)
    {
        List<C_Clientes> vl_ObjList = new List<C_Clientes>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "DROP_LIST":
                while (Read_Query.Read())
                {
                    C_Clientes Obj = new C_Clientes();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.Nombre = Read_Query["Nombre"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ":
                while (Read_Query.Read())
                {
                    C_Clientes Obj = new C_Clientes();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.Nombre = Read_Query["Nombre"].ToString();
                    Obj.Estado = Convert.ToInt32(Read_Query["Estado"]);
                    Obj.Nit = Read_Query["Nit"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
