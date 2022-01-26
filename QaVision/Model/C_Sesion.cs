using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

	public class C_Sesion
	{

	#region "Objetos Publicos"
	public long IdUser { get; set; }
	public string Usuario { get; set; }
	public long IdRol { get; set; }
	public long IdCliente { get; set; }
	public long QCampanasAsignadas { get; set; }
	public long IdCuenta { get; set; }
	public string EstadoSesion { get; set; }
	public string NombreUser { get; set; }
	public string PerfilUser { get; set; }
	#endregion

	#region "Procesos Globales"
	C_Conexion vg_ConexionClass = new C_Conexion();
	#endregion

	#region "Funciones"
	/// <summary>
	/// TRAE TODA LA DATA PARA SESION DEL USUARIO
	/// </summary>
	/// <param name="Obj"></param>
	/// <returns></returns>
	public List<C_Sesion> Read_Data(C_Sesion Obj)
	{

		List<C_Sesion> vl_ObjList = new List<C_Sesion>();
		StringBuilder vl_Sql = new StringBuilder();
		vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_SESION] 'T_SESION','" + Obj.Usuario + "'");
		string vl_StrQuery = vl_Sql.ToString();

		vl_ObjList = List(vl_StrQuery, "TABLE_SESION");

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
	public List<C_Sesion> List(string vp_Query, string vp_Type)
	{
		List<C_Sesion> vl_ObjList = new List<C_Sesion>();
		string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
		OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

		switch (vp_Type)
		{
			case "TABLE_SESION":
				while (Read_Query.Read())
				{
					C_Sesion Obj = new C_Sesion();

					Obj.IdUser = Convert.ToInt64(Read_Query["IdUser"].ToString());
					Obj.Usuario = Read_Query["Document"].ToString();
					Obj.IdRol = Convert.ToInt32(Read_Query["IdRol"]);
					Obj.IdCliente = Convert.ToInt32(Read_Query["IdCliente"]);
					Obj.QCampanasAsignadas = Convert.ToInt32(Read_Query["QCampanasAsignadas"]);
					Obj.IdCuenta = Convert.ToInt32(Read_Query["IdCampana"]);
					Obj.NombreUser = Read_Query["NombreUser"].ToString();
					Obj.PerfilUser = Read_Query["PerfilUser"].ToString();
					Obj.EstadoSesion = "ON";

					vl_ObjList.Add(Obj);
				}
				break;
		}

		vg_ConexionClass.CloseConexion();
		return vl_ObjList;
	}
	#endregion

}
