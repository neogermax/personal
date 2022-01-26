using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_Dato
{

    #region "Objetos Publicos"
    public long Id { get; set; }
    public long TablaId { get; set; }
    public string Codigo { get; set; }
    public string Nombre { get; set; }
    public long Valor { get; set; }
    public int Activo { get; set; }
    public long PadreId { get; set; }
    public string Campo_Add1 { get; set; }
    public string Campo_Add2 { get; set; }
    public string Campo_Add3 { get; set; }
    public string Campo_Add4 { get; set; }
    public string Campo_Add5 { get; set; }
    public Nullable<System.DateTime> FechaRegistro { get; set; }
    public string FiltroQuery { get; set; }
    public string Respuesta { get; set; }

    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// Crea el registo en la tabla Dato (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Dato(C_Dato Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'INSERT','0','" + Obj.PadreId
                                                                                                                                                             + "','" + Obj.TablaId
                                                                                                                                                             + "','" + Obj.Codigo
                                                                                                                                                             + "','" + Obj.Nombre
                                                                                                                                                             + "','" + Obj.Valor
                                                                                                                                                             + "','" + Obj.Activo
                                                                                                                                                             + "','" + Obj.Campo_Add1
                                                                                                                                                             + "','" + Obj.Campo_Add2
                                                                                                                                                             + "','" + Obj.Campo_Add3
                                                                                                                                                             + "','" + Obj.Campo_Add4
                                                                                                                                                             + "','" + Obj.Campo_Add5 + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;

    }

    /// <summary>
    /// actualiza el nombre en la tabla Dato (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Dato(C_Dato Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'UPDATE','" + Obj.Id
                                                                                                                                                             + "','" + Obj.PadreId
                                                                                                                                                             + "','" + Obj.TablaId
                                                                                                                                                             + "','" + Obj.Codigo
                                                                                                                                                             + "','" + Obj.Nombre
                                                                                                                                                             + "','" + Obj.Valor
                                                                                                                                                             + "','" + Obj.Activo
                                                                                                                                                             + "','" + Obj.Campo_Add1
                                                                                                                                                             + "','" + Obj.Campo_Add2
                                                                                                                                                             + "','" + Obj.Campo_Add3
                                                                                                                                                             + "','" + Obj.Campo_Add4
                                                                                                                                                             + "','" + Obj.Campo_Add5 + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");

        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// Activacion o desactivacion de un Dato (DELETE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string InactiveDato(C_Dato Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'INACTIVE_ACTIVE','" + Obj.Id + "','" + Obj.Activo + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    #endregion

    #region "Funciones"
    /// <summary>
    /// TRAE LA lista de tabla dato segun la seleccion
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_DropList(C_Dato Obj)
    {
        List<C_Dato> ObjList = new List<C_Dato>();
        StringBuilder vl_sql = new StringBuilder();
        if (Obj.FiltroQuery == "T")
        {
            vl_sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'TRAER_LIST_TABLA','0','0','" + Obj.TablaId + "'");
        }
        else
        {
            vl_sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'TRAER_LIST_PADRE','0','" + Obj.TablaId + "'");
        }
        string vl_StrQuery = vl_sql.ToString();
        ObjList = List(vl_StrQuery, "TRAER_DATA");
        return ObjList;
    }

    /// <summary>
    /// trae los datos 
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_DropList_Campana(C_Dato Obj)
    {
        List<C_Dato> ObjList = new List<C_Dato>();
        StringBuilder vl_sql = new StringBuilder();

        vl_sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'TRAER_LIST_TABLA_FILTRO','0','" + Obj.Campo_Add1 + "','" + Obj.TablaId + "'");

        string vl_StrQuery = vl_sql.ToString();
        ObjList = List(vl_StrQuery, "TRAER_DATA");
        return ObjList;
    }

    /// <summary>
    /// trae la data para crea las listas de tablas editables
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Dato> Read_DropTabla(C_Dato Obj)
    {
        List<C_Dato> ObjList = new List<C_Dato>();
        StringBuilder vl_sql = new StringBuilder();
        vl_sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_TABLA] 'SELECT_DROP','0'");
        string vl_StrQuery = vl_sql.ToString();
        ObjList = List(vl_StrQuery, "TRAER_LIST");
        return ObjList;
    }

    public List<C_Dato> Read_DataProcesos(C_Dato Obj)
    {
        List<C_Dato> ObjList = new List<C_Dato>();
        StringBuilder vl_sql = new StringBuilder();
        vl_sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'SELECT_DATO_CUENTA','" + Obj.Id + "','0','" + Obj.TablaId + "'");
        string vl_StrQuery = vl_sql.ToString();
        ObjList = List(vl_StrQuery, "TRAER_DATA_PRO");
        return ObjList;
    }

    public List<C_Dato> Read_DataTablaId(C_Dato Obj)
    {
        List<C_Dato> ObjList = new List<C_Dato>();
        StringBuilder vl_sql = new StringBuilder();
        vl_sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'TRAER_LIST_TABLA_ALL','0','0','" + Obj.TablaId + "'");
        string vl_StrQuery = vl_sql.ToString();
        ObjList = List(vl_StrQuery, "TRAER_DATA_PRO");
        return ObjList;
    }

    /// <summary>
    /// valida si el campo digitado existe
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Validate_Dato(C_Dato Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'EXIST_DATO_CUENTA','0','0','" + Obj.TablaId + "','0','" + Obj.Nombre + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA CONFIGURACION.DATO
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <returns></returns>
    public List<C_Dato> List(string vp_Query, string vp_Type)
    {
        List<C_Dato> vl_ObjList = new List<C_Dato>();
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);
        try
        {
            switch (vp_Type)
            {
                case "TRAER_LIST":
                    while (Read_Query.Read())
                    {
                        C_Dato Obj = new C_Dato();
                        Obj.Id = Convert.ToInt32(Read_Query["Id"].ToString());
                        Obj.Nombre = Read_Query["Nombre"].ToString();

                        vl_ObjList.Add(Obj);
                    }
                    break;

                case "TRAER_LIST_2":
                    while (Read_Query.Read())
                    {
                        C_Dato Obj = new C_Dato();
                        Obj.Id = Convert.ToInt32(Read_Query["Id"].ToString());
                        Obj.Nombre = Read_Query["Nombre"].ToString();
                        Obj.Campo_Add1 = Read_Query["ValueRolId"].ToString();
                        Obj.Campo_Add2 = Read_Query["Perfil"].ToString();

                        vl_ObjList.Add(Obj);
                    }
                    break;

                case "TRAER_DATA":
                    while (Read_Query.Read())
                    {
                        C_Dato Obj = new C_Dato();
                        Obj.Id = Convert.ToInt32(Read_Query["Id"].ToString());
                        Obj.Nombre = Read_Query["Nombre"].ToString();
                        Obj.Codigo = Read_Query["Codigo"].ToString();
                        if (!(System.Convert.IsDBNull(Read_Query["PadreId"]))) { Obj.PadreId = Convert.ToInt32(Read_Query["PadreId"]); } else { Obj.PadreId = 0; }
                        if (!(System.Convert.IsDBNull(Read_Query["Campo_Add_1"]))) { Obj.Campo_Add1 = Read_Query["Campo_Add_1"].ToString(); } else { Obj.Campo_Add1 = "NULL"; }

                        vl_ObjList.Add(Obj);
                    }
                    break;

                case "TRAER_DATA_PRO":
                    while (Read_Query.Read())
                    {
                        C_Dato Obj = new C_Dato();
                        Obj.Id = Convert.ToInt32(Read_Query["Id"].ToString());
                        Obj.Nombre = Read_Query["Nombre"].ToString();
                        Obj.Codigo = Read_Query["Codigo"].ToString();
                        if (!(System.Convert.IsDBNull(Read_Query["Campo_Add_1"]))) { Obj.Campo_Add1 = Read_Query["Campo_Add_1"].ToString(); } else { Obj.Campo_Add1 = "NULL"; }
                        if (!(System.Convert.IsDBNull(Read_Query["PadreId"]))) { Obj.PadreId = Convert.ToInt32(Read_Query["PadreId"]); } else { Obj.PadreId = 0; }
                        Obj.Activo = Convert.ToInt32(Read_Query["Activo"].ToString());

                        vl_ObjList.Add(Obj);
                    }
                    break;

            }
        }
        catch (Exception e)
        {
            C_Dato Obj = new C_Dato();
            Obj.Nombre = e.Message;
            vl_ObjList.Add(Obj);
            return vl_ObjList;
        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}



