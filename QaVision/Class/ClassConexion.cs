/// =============================================
/// AUTOR:		    GERMAN ALEJANDRO RODRIGUEZ
/// FECHA CREACION: 11-04-2017
/// DESCIPCIÓN:     METODO PARAMETRIZABLE DESDE APPCONFIG EL WEB.CONFIG
///                 PARA CONEXIONES OLEBD
///                 
///             CONTIENE
///             
///     1.   Construye_Conexion();
///     2.   OpenConexion();
///     3.   CloseConexion();
///     4.   Insert_Update_General();
/// =============================================
using System;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;

public class C_Conexion
{
    #region "Procesos Globales"
    /*CAPTURA DE LLAVES DESDE EL WEB.CONFIG*/
    string vg_TypeConexion = System.Web.Configuration.WebConfigurationManager.AppSettings["CONN"];

    string vg_Servidor = System.Web.Configuration.WebConfigurationManager.AppSettings["SERVER"];
    string vg_Data = System.Web.Configuration.WebConfigurationManager.AppSettings["DATA"];
    string vg_User = System.Web.Configuration.WebConfigurationManager.AppSettings["USER"];
    string vg_Paswword = System.Web.Configuration.WebConfigurationManager.AppSettings["PASS"];

    string vg_Servidor_BD2 = System.Web.Configuration.WebConfigurationManager.AppSettings["SERVER_DB2"];
    string vg_Data_BD2 = System.Web.Configuration.WebConfigurationManager.AppSettings["DATA_DB2"];
    string vg_User_BD2 = System.Web.Configuration.WebConfigurationManager.AppSettings["USER_DB2"];
    string vg_Paswword_BD2 = System.Web.Configuration.WebConfigurationManager.AppSettings["PASS_DB2"];


    /*INSTANCIA DE OLECONEXION GLOBALES*/
    OleDbConnection vg_ObjConexBD = null;
    OleDbDataReader vg_Read_Query = null;
    string vg_error_BD;
    #endregion

    #region "Conexion"
    /// <summary>
    /// CONTRUYE EL STRING DE CONECCION A LA BASE DATOS -- OLEBD
    /// </summary>
    /// <returns></returns>
    public string Construye_Conexion(string vp_Type)
    {
        try
        {
            string vl_Conexion = "";

            switch (vp_Type)
            {
                case "STD":
                    switch (vg_TypeConexion)
                    {
                        case "OLE_SQL": /*CONEXION OLEBD USER*/
                            vl_Conexion = "provider=SQLOLEDB; " +
                                          ";Data source=" + vg_Servidor +
                                          ";database=" + vg_Data +
                                          ";User ID=" + vg_User +
                                          ";password=" + vg_Paswword + ";";
                            break;

                        case "OLE": /*CONEXION OLEBD IP*/
                            vl_Conexion = " Provider=SQLOLEDB" +
                                          ";Data source=" + vg_Servidor +
                                          ";Network Library=DBMSSOCN" +
                                          ";Initial Catalog=" + vg_Data +
                                          ";User ID=" + vg_User +
                                          ";password=" + vg_Paswword + ";";
                            break;

                    }
                    break;

                case "ALTER_2":
                    vl_Conexion = " Provider=SQLOLEDB" +
                                  ";Data source=" + vg_Servidor_BD2 +
                                  ";Initial Catalog=" + vg_Data_BD2 +
                                  ";User ID=" + vg_User_BD2 +
                                  ";password=" + vg_Paswword_BD2 + ";";
                    break;

                case "NORMAL":
                    vl_Conexion = " Data source=" + vg_Servidor +
                                  ";Network Library=DBMSSOCN" +
                                  ";Initial Catalog=" + vg_Data +
                                  ";User ID=" + vg_User +
                                  ";password=" + vg_Paswword + ";";
                    break;

                case "EXCEL":
                    /* vl_Conexion = " Data source=" + vg_Servidor +
                                   ";Network Library=DBMSSOCN" +
                                   ";Initial Catalog=" + vg_Data +
                                   ";User ID=" + vg_User +
                                   ";Password=" + vg_Paswword + ";";*/
                    vl_Conexion = " Data source=" + vg_Servidor +
                                  ";database=" + vg_Data +
                                  ";User ID=" + vg_User +
                                  ";password=" + vg_Paswword + ";";

                    break;

            }

            return vl_Conexion;
        }
        catch (Exception)
        {

            throw;
        }

    }


    /// <summary>
    /// ABRE CONEXION Y REALIZA CONSULTA A LA BASE
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <returns></returns>
    public OleDbDataReader OpenConexionNew(string vp_Query, int vp_Conexion, Dictionary<string, object> Parameters)
    {
        string vl_Conexion = (vp_Conexion == 1) ? Construye_Conexion("STD") : Construye_Conexion("ALTER_2");
        OleDbCommand ObjCmd = null;

        try
        {
            vg_ObjConexBD = new OleDbConnection(vl_Conexion.ToString());
            ObjCmd = vg_ObjConexBD.CreateCommand();



            //ABRIMOS LA CONEXION
            vg_ObjConexBD.Open();
            foreach (KeyValuePair<string, object> param in Parameters)
            {
                DbParameter dbParameter = ObjCmd.CreateParameter();
                dbParameter.ParameterName = param.Key;
                dbParameter.Value = param.Value;
                ObjCmd.Parameters.Add(dbParameter);
            }

            ObjCmd.CommandText = vp_Query.ToString();
            vg_Read_Query = ObjCmd.ExecuteReader();

            return vg_Read_Query;

        }
        catch (Exception)
        {
            return vg_Read_Query;

        }

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Conexion"></param>
    /// <param name="parametros"></param>
    /// <returns></returns>
    public OleDbDataReader OpenConexion(string vp_Query, int vp_Conexion)
    {
        string vl_Conexion = (vp_Conexion == 1) ? Construye_Conexion("STD") : Construye_Conexion("ALTER_2");
        OleDbCommand ObjCmd = null;

        try
        {
            vg_ObjConexBD = new OleDbConnection(vl_Conexion.ToString());

            ObjCmd = vg_ObjConexBD.CreateCommand();




            //ABRIMOS LA CONEXION
            vg_ObjConexBD.Open();

            ObjCmd.CommandText = vp_Query.ToString();
            vg_Read_Query = ObjCmd.ExecuteReader();

            return vg_Read_Query;

        }
        catch (Exception e)
        {
            vg_error_BD = e.Message.ToString();
            return vg_Read_Query;

        }

    }

    /// <summary>
    /// CIERRA CONEXION
    /// </summary>
    public void CloseConexion()
    {
        vg_Read_Query.Close();
        vg_ObjConexBD.Close();
    }

    /// <summary>
    /// PROCESO PARA INSERTAR O ACTUALIZAR EN LA BD
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <returns></returns>
    public string Insert_Update_General(string vp_Query, string vp_Type)
    {
        string vl_Proccess_BD;
        string vl_Conexion = Construye_Conexion(vp_Type);
        vg_ObjConexBD = new OleDbConnection(vl_Conexion.ToString());
        OleDbCommand ObjCmd = null;

        try
        {
            //ABRIMOS LA CONEXION
            vg_ObjConexBD.Open();
            //CARGAMOS LA CARGA Y LA CONEXION
            ObjCmd = new OleDbCommand(vp_Query.ToString(), vg_ObjConexBD);
            //EJECUTAMOS LA CARGA
            ObjCmd.ExecuteNonQuery();
            //CERRAMOS CONEXIONES
            vg_ObjConexBD.Close();
            vl_Proccess_BD = "SUS";
        }
        catch (Exception ex)
        {
            vl_Proccess_BD = "ERR_" + ex.Message.ToString();
        }

        return vl_Proccess_BD;
    }

    /// <summary>
    /// PROCESO PARA INSERTAR O ACTUALIZAR EN LA BD
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <returns></returns>
    public string Return_BD2alue(string vp_Query)
    {
        string vl_Proccess_BD = "";
        string vl_Conexion = Construye_Conexion("STD");
        vg_ObjConexBD = new OleDbConnection(vl_Conexion.ToString());
        OleDbCommand ObjCmd = null;

        try
        {
            //ABRIMOS LA CONEXION
            vg_ObjConexBD.Open();
            //CARGAMOS LA CARGA Y LA CONEXION
            ObjCmd = vg_ObjConexBD.CreateCommand();

            ObjCmd.CommandText = vp_Query.ToString();
            vg_Read_Query = ObjCmd.ExecuteReader();

            while (vg_Read_Query.Read())
            {
                vl_Proccess_BD = Convert.ToString(vg_Read_Query.GetValue(0));
            }

            //CERRAMOS CONEXIONES
            vg_ObjConexBD.Close();
        }
        catch (Exception ex)
        {
            vl_Proccess_BD = "ERR_" + ex.Message.ToString();
        }

        return vl_Proccess_BD;
    }

    /// <summary>
    /// PROCESO PARA INSERTAR O ACTUALIZAR EN LA BD
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <returns></returns>
    public string Insert_Update_ScopeIdentity(string vp_Query)
    {
        string vl_ID;
        string vl_Conexion = Construye_Conexion("STD");
        vg_ObjConexBD = new OleDbConnection(vl_Conexion.ToString());
        OleDbCommand ObjCmd = null;

        try
        {
            //ABRIMOS LA CONEXION
            vg_ObjConexBD.Open();
            //CARGAMOS LA CARGA Y LA CONEXION
            ObjCmd = new OleDbCommand(vp_Query.ToString(), vg_ObjConexBD);
            //EJECUTAMOS LA CARGA
            ObjCmd.ExecuteNonQuery();

            vl_ID = Convert.ToString(ObjCmd.ExecuteScalar());

            if (vg_ObjConexBD.State == System.Data.ConnectionState.Open)
            {
                vg_ObjConexBD.Close();
            }
            //CERRAMOS CONEXIONES

        }
        catch (Exception ex)
        {
            vl_ID = "ERR_" + ex.Message.ToString();
        }

        return vl_ID;
    }

    /// <summary>
    /// TRAE EL DATO SELECCIONADO STRNG
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <returns></returns>
    public string Search_Date(string vp_Query, string vp_Type)
    {

        string vl_Conexion = Construye_Conexion(vp_Type);
        string resultQuery = "";

        OleDbCommand ObjCmd = null;
        vg_ObjConexBD = new OleDbConnection(vl_Conexion.ToString());
        ObjCmd = vg_ObjConexBD.CreateCommand();

        try
        {
            //ABRIMOS LA CONEXION
            vg_ObjConexBD.Open();

            ObjCmd.CommandText = vp_Query.ToString();
            vg_Read_Query = ObjCmd.ExecuteReader();

            while (vg_Read_Query.Read())
            {
                if (!(Convert.IsDBNull(vg_Read_Query.GetValue(0)))) { resultQuery = Convert.ToString(vg_Read_Query.GetValue(0)); } else { resultQuery = "N/A"; }
            }

            //CERRAMOS CONEXIONES
            vg_ObjConexBD.Close();
        }
        catch (Exception ex)
        {
            resultQuery = "ERR_" + ex.Message.ToString();
        }

        return resultQuery;
    }
    #endregion

    #region "Funciones"
    public string Custom_ScopeIdentity(string vp_Tabla, string vp_Campo)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SELECT MAX(" + vp_Campo + ") FROM " + vp_Tabla);
        string vl_StrQuery = vl_Sql.ToString();
        string vl_index = Search_Date(vl_StrQuery, "STD");
        return vl_index;
    }

    #endregion


}
