using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_CorreoCampana
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long CampanaId { get; set; }
    public string EMAIL_FROM { get; set; }
    public string SMTP { get; set; }
    public string EMAIL_CONFIG { get; set; }
    public string EMAIL_PASS { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// crea el registro a que campaña va atado el correo (CREATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_CorreoCampana(C_CorreoCampana Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_CORREO_CAMPANA] 'INSERT','0','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.EMAIL_FROM + "','" +
                                                                             Obj.SMTP + "','" +
                                                                             Obj.EMAIL_CONFIG + "','" +
                                                                             Obj.EMAIL_PASS + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// actualiz el registro a que campaña va atado el correo (UPDATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_CorreoCampana(C_CorreoCampana Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_CORREO_CAMPANA] 'UPDATE','0','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.EMAIL_FROM + "','" +
                                                                             Obj.SMTP + "','" +
                                                                             Obj.EMAIL_CONFIG + "','" +
                                                                             Obj.EMAIL_PASS + "'");
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
    public List<C_CorreoCampana> Read_DatosCorreo(C_CorreoCampana Obj)
    {

        List<C_CorreoCampana> vl_ObjList = new List<C_CorreoCampana>();
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_CORREO_CAMPANA] 'READ_CAMPANA','0','" + Obj.CampanaId +"'");
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
    public List<C_CorreoCampana> List(string vp_Query, string vp_Type)
    {
        List<C_CorreoCampana> vl_ObjList = new List<C_CorreoCampana>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

           
            case "READ":
                while (Read_Query.Read())
                {
                    C_CorreoCampana Obj = new C_CorreoCampana();

                    Obj.EMAIL_FROM = Read_Query["EMAIL_FROM"].ToString();
                    Obj.SMTP = Read_Query["SMTP"].ToString();
                    Obj.EMAIL_CONFIG = Read_Query["EMAIL_CONFIG"].ToString();
                    Obj.EMAIL_PASS = Read_Query["EMAIL_PASS"].ToString();

                    vl_ObjList.Add(Obj);
                }
                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}