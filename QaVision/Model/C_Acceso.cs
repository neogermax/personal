using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_Acceso
{

	#region "Objetos Publicos"
	public long Id { get; set; }
	public string IP_Acceso { get; set; }
	public string Usuario { get; set; }
	public int Usuario_Id { get; set; }
	public DateTime Fecha_Acceso { get; set; }
	public DateTime Fecha_FinAcceso { get; set; }
	public string Observacion { get; set; }

	public string FechaIngreso { get; set; }
	public string HoraIngreso { get; set; }
	public string HoraSalida { get; set; }


	public string Respuesta { get; set; }
	#endregion

	#region "Procesos Globales"
	C_Conexion vg_ConexionClass = new C_Conexion();
	#endregion

	#region "CRUD"
	/// <summary>
	/// Crea el registo en la tabla Acceso (INSERT)
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public string Create_Acceso(C_Acceso Obj)
	{
		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ACCESO] 'INSERT','0','" + Obj.IP_Acceso + "','" + Obj.Usuario + "'");
		string vl_StrQuery = vl_Sql.ToString();

		string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
		int valor;

		string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
		return vl_index;

	}


	/// <summary>
	/// Crea el registo en la tabla Acceso (INSERT)
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public List<C_Acceso> Read_Acceso_User(C_Acceso Obj)
	{
		StringBuilder vl_Sql = new StringBuilder();
		List<C_Acceso> vl_ObjList = new List<C_Acceso>();

		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ACCESO] 'LOAD_INGRESO','" + Obj.Usuario_Id + "'");
		string vl_StrQuery = vl_Sql.ToString();

		vl_ObjList = List(vl_StrQuery, "SELECT_ACCESO", "STD");

		return vl_ObjList;
	}
	#endregion

	#region "Funciones"
	/// <summary>
	/// actualiza el tiempo de cierre de la aplicacion
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public string End_Sesion(C_Acceso Obj)
	{
		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ACCESO] 'END_SESION','" + Obj.Id + "'");
		string vl_StrQuery = vl_Sql.ToString();

		string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
		int valor;

		string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
		return vl_index;

	}
	#endregion

	#region "LISTAS"
	/// <summary>
	/// CREA LISTADO DE CONSULTA 
	/// </summary>
	/// <param name="vp_Query"></param>
	/// <param name="vp_Type"></param>
	/// <returns></returns>
	public List<C_Acceso> List(string vp_Query, string vp_Type, string vp_BD)
	{
		var vl_OpenConexion = (vp_BD == "STD") ? 1 : 2;
		List<C_Acceso> vl_ObjList = new List<C_Acceso>();
		string vl_Conexion = vg_ConexionClass.Construye_Conexion(vp_BD);
		OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, vl_OpenConexion);

		switch (vp_Type)
		{
			case "SELECT_ACCESO":
				while (Read_Query.Read())
				{
					C_Acceso Obj = new C_Acceso();

					Obj.IP_Acceso = Read_Query["IP_Acceso"].ToString();
					Obj.FechaIngreso = Read_Query["FechaIngreso"].ToString();
					Obj.HoraIngreso = Read_Query["HoraIngreso"].ToString();
					Obj.HoraSalida = Read_Query["HoraSalida"].ToString();
					Obj.Observacion = Read_Query["Observacion"].ToString();

					vl_ObjList.Add(Obj);
				}
				break;
		}

		vg_ConexionClass.CloseConexion();
		return vl_ObjList;
	}
	#endregion

}
