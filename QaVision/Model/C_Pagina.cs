using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

public class C_Pagina
{
    #region "Objetos Publicos PAGINA"
    public long Id { get; set; }
    public long PadreId { get; set; }
    public string Nombre { get; set; }
    public string Descripcion { get; set; }
    public long Orden { get; set; }
    public string Url { get; set; }
    public string Imagen { get; set; }
    public long Color { get; set; }
    public long TipoMenuId { get; set; }
    public System.DateTime FechaRegistro { get; set; }
    #endregion

    #region "Objetos Publicos PERMISO PAGINA"
    public long RolId { get; set; }
    public long ValueRol { get; set; }
    public long CuentaId { get; set; }
    public long PaginaId { get; set; }
    public long Visible { get; set; }

    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTO EN LA TABLA DE PERMISOPAGINA (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_PermisosPagina(C_Pagina Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'INSERT','0','" +
                                                                             Obj.RolId + "','" +
                                                                             Obj.CuentaId + "','" +
                                                                             Obj.PaginaId + "','" +
                                                                             Obj.Visible + "','" +
                                                                             Obj.ValueRol + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// actualiza el estado de visibilidad del perfil seleccionado
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_PermisosPagina(C_Pagina Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'UPDATE_PERMISOS','" + Obj.Id + "','" + Obj.Visible + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// crea los ingresos de dashboard del proceso
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_PermisosIniciales(C_Pagina Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'PAGINAS_INICIALES','" + Obj.CuentaId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }
    #endregion

    #region "Funciones"
    /// <summary>
    /// TREA LOS MODULOS ASIGNADOS POR ROL Y EMPRESA SELECCIONADOS
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Pagina> Read_DataModulos(C_Pagina Obj)
    {

        List<C_Pagina> vl_ObjList = new List<C_Pagina>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'SELECT_DASH','0','" + Obj.RolId + "','" + Obj.CuentaId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "DATA_MODULOS");

        return vl_ObjList;
    }

    /// <summary>
    /// trae la data de los perfiles del dash board para administracion
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Pagina> Read_PerfilesDash(C_Pagina Obj)
    {

        List<C_Pagina> vl_ObjList = new List<C_Pagina>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'PAGINAS_ESTABLECIDAS','" + Obj.CuentaId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "DATA_PAGINAS_ESTABLECIDAS");

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
    public List<C_Pagina> List(string vp_Query, string vp_Type)
    {
        List<C_Pagina> vl_ObjList = new List<C_Pagina>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {
            case "DATA_MODULOS":
                while (Read_Query.Read())
                {
                    C_Pagina Obj = new C_Pagina();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"].ToString());
                    if (!(System.Convert.IsDBNull(Read_Query["PadreId"]))) { Obj.PadreId = Convert.ToInt32(Read_Query["PadreId"]); } else { Obj.PadreId = 0; }
                    Obj.Nombre = Read_Query["Nombre"].ToString();
                    Obj.Descripcion = Read_Query["Descripcion"].ToString();
                    Obj.Orden = Convert.ToInt32(Read_Query["Orden"]);
                    Obj.Url = Read_Query["Url"].ToString();
                    Obj.Imagen = Read_Query["Imagen"].ToString();
                    Obj.Color = Convert.ToInt32(Read_Query["Color"]);
                    Obj.TipoMenuId = Convert.ToInt32(Read_Query["TipoMenuId"]);

                    vl_ObjList.Add(Obj);
                }
                break;

            case "DATA_PAGINAS_ESTABLECIDAS":
                while (Read_Query.Read())
                {
                    C_Pagina Obj = new C_Pagina();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"].ToString());
                    Obj.ValueRol = Convert.ToInt64(Read_Query["ValueRol"].ToString());
                    Obj.PaginaId = Convert.ToInt64(Read_Query["PaginaId"].ToString());
                    Obj.Visible = Convert.ToInt32(Read_Query["Visible"]);

                    vl_ObjList.Add(Obj);
                }
                break;
        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
