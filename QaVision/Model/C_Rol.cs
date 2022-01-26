using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_Rol
{
	#region "Objetos Publicos"
	public long Id { get; set; }
    public long CampanaId { get; set; }
    public long ValueRolId { get; set; }
    public string Nombre { get; set; }
  	public int Estado { get; set; }
	#endregion

	#region "Procesos Globales"
	C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTRO EN LA TABLA DE roles (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Roles(C_Rol Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'INSERT','0','" + 
                                                                                                                                   Obj.CampanaId + "','" +
                                                                                                                                   Obj.ValueRolId + "','" +
                                                                                                                                   Obj.Nombre + "','" +
                                                                                                                                   Obj.Estado + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// ACTUALIZA EL REGISTRO EN LA TABLA DE roles (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_Roles(C_Rol Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'UPDATE','"+ Obj.Id +"','0','0','" +
                                                                                                                                   Obj.Nombre + "','0'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// TRAE TODOS LOS ROLES DE LA CAMPAÑA ASIGNADA (READ)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Rol> Read_Roles(C_Rol Obj)
    {

        List<C_Rol> vl_ObjList = new List<C_Rol>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'READ','0','"+ Obj.CampanaId +"'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }
    #endregion
    
    #region "Funciones"



    /// <summary>
    /// REVISION SI EL ROL ESTA ACTIVO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Validate_Rol(C_Rol Obj) {

		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'REVIEW_ACTIVE','" + Obj.Id + "'");
		string vl_StrQuery = vl_Sql.ToString();

		string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
		int valor;

		string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
		return vl_index;
	}

	/// <summary>
	/// TRAE LA LISTA DE PERFILES 
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public List<C_Dato> Read_DropListRol(C_Rol Obj)
	{
		C_Dato ObjC = new C_Dato();
		List<C_Dato> ObjList = new List<C_Dato>();
		StringBuilder vl_sql = new StringBuilder();

		vl_sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'LIST_ROLES','0','"+ Obj.CampanaId +"'");

		string vl_StrQuery = vl_sql.ToString();
		ObjList = ObjC.List(vl_StrQuery, "TRAER_LIST");

		return ObjList;
	}

    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA USER
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_Rol> List(string vp_Query, string vp_Type)
    {
        List<C_Rol> vl_ObjList = new List<C_Rol>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {
            
            case "READ":
                while (Read_Query.Read())
                {
                    C_Rol Obj = new C_Rol();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.ValueRolId = Convert.ToInt32(Read_Query["ValueRolId"]);
                    Obj.Nombre = Read_Query["Nombre"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion
}
