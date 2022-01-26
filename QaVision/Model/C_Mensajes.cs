using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_Mensajes
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long TipoMensajeId { get; set; }
    public string CuerpoMensaje { get; set; }
    public string CuerpoMensaje_Interno { get; set; }
    public string Url { get; set; }
    public string TipoMensaje { get; set; }
    public string MaquetaMensaje_Head { get; set; }
    public string MaquetaMensaje_Fotter { get; set; }

    public string Respuesta { get; set; }

    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// Crea la data de los mensajes en base de datos (CREATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_Mensaje(C_Mensajes Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Configuracion].[SP_CRUD_MENSAJES] 'INSERT' ,'0','" +
                                                                                                                                 Obj.TipoMensajeId + "','" +
                                                                                                                                 Obj.CuerpoMensaje + "','" +
                                                                                                                                 Obj.CuerpoMensaje_Interno + "','" +
                                                                                                                                 Obj.Url + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    public string Update_Mensaje(C_Mensajes Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Configuracion].[SP_CRUD_MENSAJES] 'UPDATE' ,'"+ Obj.Id +"','" +
                                                                                                                                 Obj.TipoMensajeId + "','" +
                                                                                                                                 Obj.CuerpoMensaje + "','" +
                                                                                                                                 Obj.CuerpoMensaje_Interno + "','" +
                                                                                                                                 Obj.Url + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }


    /// <summary>
    /// Trae toda la data de mensajes (READ)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Mensajes> Read_All(C_Mensajes Obj)
    {
        List<C_Mensajes> vl_ObjList = new List<C_Mensajes>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_MENSAJES] 'SELECT_ALL','0'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

        return vl_ObjList;
    }

    /// <summary>
    /// trae la data por mensaje selecciondo
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Mensajes> Read_TipoMensaje(C_Mensajes Obj)
    {

        List<C_Mensajes> vl_ObjList = new List<C_Mensajes>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC[Configuracion].[SP_CRUD_MENSAJES] 'SELECT_MENSAJE','0','" + Obj.TipoMensajeId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_SELECT");

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
    public List<C_Mensajes> List(string vp_Query, string vp_Type)
    {
        List<C_Mensajes> vl_ObjList = new List<C_Mensajes>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ_SELECT":
                while (Read_Query.Read())
                {
                    C_Mensajes Obj = new C_Mensajes();

                    Obj.CuerpoMensaje = Read_Query["CuerpoMensaje"].ToString();
                    Obj.CuerpoMensaje_Interno = Read_Query["CuerpoMensaje_Interno"].ToString();
                    Obj.Url = Read_Query["Url"].ToString();
                    Obj.MaquetaMensaje_Head = Read_Query["MaquetaMensaje_Head"].ToString();
                    Obj.MaquetaMensaje_Fotter = Read_Query["MaquetaMensaje_Fotter"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ":
                while (Read_Query.Read())
                {
                    C_Mensajes Obj = new C_Mensajes();

                    Obj.Id = Convert.ToInt64(Read_Query["Id"]);
                    Obj.TipoMensajeId = Convert.ToInt64(Read_Query["TipoMensajeId"]);
                    Obj.TipoMensaje = Read_Query["TipoMensaje"].ToString();
                    Obj.CuerpoMensaje = Read_Query["CuerpoMensaje"].ToString();
                    Obj.CuerpoMensaje_Interno = Read_Query["CuerpoMensaje_Interno"].ToString();
                    Obj.Url = Read_Query["Url"].ToString();
                    Obj.MaquetaMensaje_Head = Read_Query["MaquetaMensaje_Head"].ToString();
                    Obj.MaquetaMensaje_Fotter = Read_Query["MaquetaMensaje_Fotter"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;


        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion
    }