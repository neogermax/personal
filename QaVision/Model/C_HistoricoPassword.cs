using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_HistoricoPassword
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long UsuarioId { get; set; }
    public string IP { get; set; }
    public long OpcionPasswordId { get; set; }
    public string OpcionPassword { get; set; }
    public System.DateTime FechaRegistro { get; set; }
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
    public string Create_Historico(C_HistoricoPassword Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_HISTORICO_PASSWORD] 'INSERT' ,'0','" +
                                                                                                                                 Obj.UsuarioId + "','" +
                                                                                                                                 Obj.IP + "','" +
                                                                                                                                 Obj.OpcionPasswordId + "'");
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
    public List<C_HistoricoPassword> Read_Historico_User(C_HistoricoPassword Obj)
    {
        List<C_HistoricoPassword> vl_ObjList = new List<C_HistoricoPassword>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_HISTORICO_PASSWORD] 'READ_USER','0','"+ Obj.UsuarioId+"'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ");

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
    public List<C_HistoricoPassword> List(string vp_Query, string vp_Type)
    {
        List<C_HistoricoPassword> vl_ObjList = new List<C_HistoricoPassword>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ":
                while (Read_Query.Read())
                {
                    C_HistoricoPassword Obj = new C_HistoricoPassword();

                    Obj.IP = Read_Query["IP"].ToString();
                    Obj.OpcionPasswordId = Convert.ToInt64(Read_Query["OpcionPasswordId"]);
                    Obj.FechaRegistro = Convert.ToDateTime( Read_Query["FechaRegistro"]);
                    Obj.OpcionPassword = Read_Query["OpcionPassword"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;


        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
