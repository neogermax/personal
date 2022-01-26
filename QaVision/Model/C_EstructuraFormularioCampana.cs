using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_EstructuraFormularioCampana
{
	#region "Objetos Publicos"
	public long Id { get; set; }
	public long CuentaId { get; set; }
	public string Title_Nivel0 { get; set; }
	public string Title_Nivel1 { get; set; }
	public string Title_Nivel2 { get; set; }
	public string Title_Nivel3 { get; set; }
	public string Title_Nivel4 { get; set; }


	public string Respuesta { get; set; }
	#endregion

	#region "Procesos Globales"
	C_Conexion vg_ConexionClass = new C_Conexion();
	#endregion

	#region "CRUD"
	/// <summary>
	/// CREA EL REGISTRO EN LA TABLA DE ESTILO CAMPANA (INSERT)
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public string Create_EstructuraFormulario(C_EstructuraFormularioCampana Obj)
	{

		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTRUCTURA_FORM] 'INSERT','0','" +
																						Obj.CuentaId + "','" +
																						Obj.Title_Nivel0 + "','" +
																						Obj.Title_Nivel1 + "','" +
																						Obj.Title_Nivel2 + "','" +
																						Obj.Title_Nivel3 + "','" +
																						Obj.Title_Nivel4 + "'");
		string vl_StrQuery = vl_Sql.ToString();

		string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
		int valor;

		string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
		return vl_index;
	}

	/// <summary>
	/// ACTUALIZA LA DATA DE ESTILO CAMPANA (UPDATE)
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public string Update_EstructuraFormulario(C_EstructuraFormularioCampana Obj)
	{
	
		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTRUCTURA_FORM] 'UPDATE','0','" +
																						Obj.CuentaId + "','" +
																						Obj.Title_Nivel0 + "','" +
																						Obj.Title_Nivel1 + "','" +
																						Obj.Title_Nivel2 + "','" +
																						Obj.Title_Nivel3 + "','" +
																						Obj.Title_Nivel4 + "'");
		string vl_StrQuery = vl_Sql.ToString();

		string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
		int valor;

		string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
		return vl_index;
	}
	#endregion

	#region "Funciones"
	/// <summary>
	/// TRAE TODOS LOS ESTILOS DEL CLIENTE
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public List<C_EstructuraFormularioCampana> Read_EstructuraFormularioCuenta(C_EstructuraFormularioCampana Obj)
	{

		List<C_EstructuraFormularioCampana> vl_ObjList = new List<C_EstructuraFormularioCampana>();
		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTRUCTURA_FORM] 'SELECT_ESTRUCTURA','0','" + Obj.CuentaId + "'");
		string vl_StrQuery = vl_Sql.ToString();

		vl_ObjList = List(vl_StrQuery, "DATA_ESTRUCTURE");

		return vl_ObjList;
	}

	
	#endregion

	#region "LISTAS"
	/// <summary>
	/// CREA LISTADO DE CONSULTA 
	/// </summary>
	/// <param name="vp_Query"></param>
	/// <param name="vp_Type"></param>
	/// <returns></returns>
	public List<C_EstructuraFormularioCampana> List(string vp_Query, string vp_Type)
	{
		List<C_EstructuraFormularioCampana> vl_ObjList = new List<C_EstructuraFormularioCampana>();
		string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
		OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

		switch (vp_Type)
		{
			case "DATA_ESTRUCTURE":
				while (Read_Query.Read())
				{
					C_EstructuraFormularioCampana Obj = new C_EstructuraFormularioCampana();

					Obj.Title_Nivel0 = Read_Query["Title_Nivel0"].ToString();
					Obj.Title_Nivel1 = Read_Query["Title_Nivel1"].ToString();
					Obj.Title_Nivel2 = Read_Query["Title_Nivel2"].ToString();
					Obj.Title_Nivel3 = Read_Query["Title_Nivel3"].ToString();
					Obj.Title_Nivel4 = Read_Query["Title_Nivel4"].ToString();

					vl_ObjList.Add(Obj);
				}
				break;
		}

		vg_ConexionClass.CloseConexion();
		return vl_ObjList;
	}
	#endregion

}
