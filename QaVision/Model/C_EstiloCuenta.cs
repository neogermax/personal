using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_EstiloCuenta
{
	#region "Objetos Publicos"
	public long Id { get; set; }
	public long CuentaId { get; set; }
	public string Logo { get; set; }
	public string ColorBack { get; set; }
	public string ColorHeaderTitle { get; set; }
	public string ColorLabel { get; set; }
	public string ColorAlerta { get; set; }
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
	public string Create_EstiloCampana(C_EstiloCuenta Obj)
	{

		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'INSERT','0','" +
																						Obj.CuentaId + "','" +
																						Obj.Logo + "','" +
																						Obj.ColorBack + "','" +
																						Obj.ColorHeaderTitle + "','" +
																						Obj.ColorLabel + "','" +
																						Obj.ColorAlerta + "'");
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
	public string Update_EstiloCampana(C_EstiloCuenta Obj)
	{
		List<C_EstiloCuenta> vl_ObjList = new List<C_EstiloCuenta>();

		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'UPDATE','0','" +
																						Obj.CuentaId + "','" +
																						Obj.Logo + "','" +
																						Obj.ColorBack + "','" +
																						Obj.ColorHeaderTitle + "','" +
																						Obj.ColorLabel + "','" +
																						Obj.ColorAlerta + "'");
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
	public List<C_EstiloCuenta> Read_AllStyle_Cliente(C_EstiloCuenta Obj)
	{

		List<C_EstiloCuenta> vl_ObjList = new List<C_EstiloCuenta>();
		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'SELECT_ESTILO_CLIENTE','0','" + Obj.CuentaId + "'");
		string vl_StrQuery = vl_Sql.ToString();

		vl_ObjList = List(vl_StrQuery, "ALL_STYLE");

		return vl_ObjList;
	}

	/// <summary>
	/// TRAE EL ESTILO DE LA EMPRESA SELECCIONADA
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public List<C_EstiloCuenta> Read_STYLE_CAMPANA(C_EstiloCuenta Obj)
	{

		List<C_EstiloCuenta> vl_ObjList = new List<C_EstiloCuenta>();
		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'SELECT_ESTILO_CAMPANA','0','" + Obj.CuentaId + "'");
		string vl_StrQuery = vl_Sql.ToString();

		vl_ObjList = List(vl_StrQuery, "STYLE_CAMPANA");

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
	public List<C_EstiloCuenta> List(string vp_Query, string vp_Type)
	{
		List<C_EstiloCuenta> vl_ObjList = new List<C_EstiloCuenta>();
		string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
		OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

		switch (vp_Type)
		{
			case "ALL_STYLE":
				while (Read_Query.Read())
				{
					C_EstiloCuenta Obj = new C_EstiloCuenta();

					Obj.CuentaId = Convert.ToInt64(Read_Query["CampanaId"].ToString());
					Obj.Logo = Read_Query["Logo"].ToString();
					Obj.ColorBack = Read_Query["ColorBack"].ToString();
					Obj.ColorHeaderTitle = Read_Query["ColorHeaderTitle"].ToString();
					Obj.ColorLabel = Read_Query["ColorLabel"].ToString();
					Obj.ColorAlerta = Read_Query["ColorAlerta"].ToString();

					vl_ObjList.Add(Obj);
				}
				break;
			case "STYLE_CAMPANA":
				while (Read_Query.Read())
				{
					C_EstiloCuenta Obj = new C_EstiloCuenta();

					Obj.Logo = Read_Query["Logo"].ToString();
					Obj.ColorBack = Read_Query["ColorBack"].ToString();
					Obj.ColorHeaderTitle = Read_Query["ColorHeaderTitle"].ToString();
					Obj.ColorLabel = Read_Query["ColorLabel"].ToString();
					Obj.ColorAlerta = Read_Query["ColorAlerta"].ToString();

					vl_ObjList.Add(Obj);
				}
				break;
		}

		vg_ConexionClass.CloseConexion();
		return vl_ObjList;
	}
	#endregion

}
