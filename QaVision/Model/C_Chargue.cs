using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

public class C_Chargue
{
    #region "Objetos Publicos"
    public long CampanaId { get; set; }
    public long TipoCargueId { get; set; }
    public long UsuarioId { get; set; }
    public long CantidadRegistros { get; set; }
    public long CantidadRegistrosCreados { get; set; }
    public long CantidadRegistrosActualizados { get; set; }
    public long CantidadRegistros_NoInsertados { get; set; }

    public long CantidadError_1 { get; set; }
    public long CantidadError_2 { get; set; }
    public long CantidadError_3 { get; set; }
    public long CantidadError_4 { get; set; }
    public long CantidadError_5 { get; set; }

    public System.DateTime FechaRegistro { get; set; }

    public string Respuesta { get; set; }

    public string Llave_Primaria { get; set; }
    public string Cedula { get; set; }
    public string Id { get; set; }
    public string Nombres { get; set; }
    public string Coordinador { get; set; }
    public string cc_coordinador { get; set; }
    public string Fecha { get; set; }
    public string Día { get; set; }
    public string HIP { get; set; }
    public string HFP { get; set; }
    public string HI { get; set; }
    public string HF { get; set; }
    public string HID1 { get; set; }
    public string HFD1 { get; set; }
    public string HID2 { get; set; }
    public string HFD2 { get; set; }
    public string HID3 { get; set; }
    public string HFD3 { get; set; }
    public string HIPA { get; set; }
    public string HFPA { get; set; }
    public string HIA { get; set; }
    public string HFA { get; set; }
    public string HIC { get; set; }
    public string HFC { get; set; }
    public string Hrs_Prog { get; set; }
    public string Skill { get; set; }
    public string Cuenta { get; set; }
    public string Año { get; set; }
    public string Mes { get; set; }
    public string Semana { get; set; }
    public string Sede { get; set; }
    public string Festivo { get; set; }
    public string Contrato { get; set; }
    public string Login { get; set; }
    public string Extension { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    public long vg_Contador = 0;
    #endregion

    #region "CRUD"
    /// <summary>
    /// CREA EL REGISTO EN LA TABLA DE CONTREOL CARGUE (INSERT)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_ControlCargue(C_Chargue Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();

        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONTROLCARGUE] 'INSERT','0','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.UsuarioId + "','" +
                                                                             Obj.CantidadRegistros + "','" +
                                                                             Obj.CantidadRegistrosCreados + "','" +
                                                                             Obj.CantidadRegistrosActualizados + "','" +
                                                                             Obj.CantidadRegistros_NoInsertados + "','" +
                                                                             Obj.TipoCargueId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// ACTUALIZA EL CONTADOR DE REGISTROS CARGUE
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_Chargue> Update_ControlCargue(C_Chargue Obj)
    {
        List<C_Chargue> vl_ObjList = new List<C_Chargue>();
        StringBuilder vl_Sql = new StringBuilder();
        string vl_StrQuery = "";

        switch (Obj.TipoCargueId)
        {
            case 123:
                vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONTROLCARGUE] 'UPDATE','" + Obj.Id + "','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.UsuarioId + "','" +
                                                                             Obj.CantidadRegistros + "','" +
                                                                             Obj.CantidadRegistrosCreados + "','" +
                                                                             Obj.CantidadRegistrosActualizados + "','" +
                                                                             Obj.CantidadRegistros_NoInsertados + "'");
                vl_StrQuery = vl_Sql.ToString();
                vl_ObjList = List(vl_StrQuery, "READ_CONTROL");
                break;

            case 10:
                vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONTROLCARGUE] 'UPDATE_2','" + Obj.Id + "','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.UsuarioId + "','" +
                                                                             Obj.CantidadRegistros + "','" +
                                                                             Obj.CantidadRegistrosCreados + "','" +
                                                                             Obj.CantidadRegistrosActualizados + "','" +
                                                                             Obj.CantidadRegistros_NoInsertados + "','" +
                                                                             Obj.TipoCargueId + "','" +
                                                                             Obj.CantidadError_1 + "','" +
                                                                             Obj.CantidadError_2 + "','" +
                                                                             Obj.CantidadError_3 + "'");
                vl_StrQuery = vl_Sql.ToString();
                vl_ObjList = List(vl_StrQuery, "READ_CONTROL_USERS");
                break;

        }


        return vl_ObjList;
    }


    #endregion

    #region "CARGUE MASIVO"
    /// <summary>
    /// DISPARA EVENTO PARA CARGA MASIVA
    /// </summary>
    /// <param name="vp_H_files"></param>
    /// <param name="vp_S_Ruta"></param>
    /// <param name="vl_S_Nombre"></param>
    /// <returns></returns>
    public string Chargue_Masivo_Excel(string vp_Path, string vp_File_Name, string vp_Modulo)
    {
        string vl_fullPath = HttpContext.Current.Request.PhysicalApplicationPath + vp_Path;
        string vp_Hoja = "BD";
        string vl_State;
        //instancia conexion
        OleDbConnection Conexion_Excel = new OleDbConnection("");
        //instancia conexion string excel
        OleDbConnection Obj_Excel = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + vl_fullPath + vp_File_Name + "; Extended Properties='Excel 12.0 Xml;HDR=Yes';");

        try
        {
            //asignamos elobjeto string excel a la conexion        
            Conexion_Excel = Obj_Excel;
            //Despues de conectarse al archivo excel seleccionamos los datos de la hoja por el nombre
            OleDbCommand Cmd_Excel = new OleDbCommand("select * from [" + vp_Hoja + "$]", Obj_Excel);
            //Abrimos conexion al Excel
            Obj_Excel.Open();
            //ejecutamos la captura de la informacion del excel
            OleDbDataReader Obj_DataExcel = Cmd_Excel.ExecuteReader();
            //instanciamos conexion a la BD
            string vl_Conexion = vg_ConexionClass.Construye_Conexion("EXCEL");
            // utilizamos el bulkcopy para cargar la tabla de la base de datos
            SqlBulkCopy Obj_Copy = new SqlBulkCopy(vl_Conexion);
            //llamamos la tabla destino en la base de datos

            switch (vp_Modulo)
            {

                case "Users":
                    Obj_Copy.DestinationTableName = "[Configuracion].[Temp_CargaMasivaUsers]";
                    //copiamos los datos del excel en la tabla
                    SqlBulkCopyColumnMapping Nombre = new SqlBulkCopyColumnMapping("Nombre", "[Nombre]"); Obj_Copy.ColumnMappings.Add(Nombre);
                    SqlBulkCopyColumnMapping Apellido = new SqlBulkCopyColumnMapping("Apellido", "[Apellido]"); Obj_Copy.ColumnMappings.Add(Apellido);
                    SqlBulkCopyColumnMapping Documento = new SqlBulkCopyColumnMapping("Documento", "[Documento]"); Obj_Copy.ColumnMappings.Add(Documento);
                    SqlBulkCopyColumnMapping Correo = new SqlBulkCopyColumnMapping("Correo", "[Correo]"); Obj_Copy.ColumnMappings.Add(Correo);
                    SqlBulkCopyColumnMapping Gestionable = new SqlBulkCopyColumnMapping("Gestionable", "[Gestionable]"); Obj_Copy.ColumnMappings.Add(Gestionable);

                    break;

                case "Forms":
                    Obj_Copy.DestinationTableName = "[Configuracion].[Temp_CargaForm]";
                    //copiamos los datos del excel en la tabla
                    SqlBulkCopyColumnMapping Nivel_0 = new SqlBulkCopyColumnMapping("Nivel_0", "[Nivel_0]"); Obj_Copy.ColumnMappings.Add(Nivel_0);
                    SqlBulkCopyColumnMapping Nivel_1 = new SqlBulkCopyColumnMapping("Nivel_1", "[Nivel_1]"); Obj_Copy.ColumnMappings.Add(Nivel_1);
                    SqlBulkCopyColumnMapping Nivel_2 = new SqlBulkCopyColumnMapping("Nivel_2", "[Nivel_2]"); Obj_Copy.ColumnMappings.Add(Nivel_2);
                    SqlBulkCopyColumnMapping Nivel_3 = new SqlBulkCopyColumnMapping("Nivel_3", "[Nivel_3]"); Obj_Copy.ColumnMappings.Add(Nivel_3);
                    SqlBulkCopyColumnMapping Nivel_4 = new SqlBulkCopyColumnMapping("Nivel_4", "[Nivel_4]"); Obj_Copy.ColumnMappings.Add(Nivel_4);

                    break;
            }
            Obj_Copy.WriteToServer(Obj_DataExcel);
            vl_State = "OK";
            //Cerramos conexion al Excel
            Obj_Excel.Close();

            C_Files Obj_File = new C_Files();
            Obj_File.Delete_File(vp_Path, vp_File_Name);
        }
        catch (Exception ex)
        {
            Obj_Excel.Close();
            vl_State = ex.Message.ToString();
        }

        return vl_State;

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="CampanaId"></param>
    public string Delete_CargaMasiva(string CampanaId, string Modulo)
    {

        //borramos data de la temporal
        StringBuilder vl_Sql = new StringBuilder();
        string vl_Status = "";
        string vl_StrQuery = "";

        switch (Modulo)
        {
            case "Users":

                vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'DELETE_CARGUE_USERS'");
                vl_StrQuery = vl_Sql.ToString();
                vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
                break;

            case "Forms":
                vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'DELETE_CARGUE_FORM'");
                vl_StrQuery = vl_Sql.ToString();
                vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
                break;
        }

        return vl_Status;
    }

    #endregion

    #region "FUNCIONES"
    /// <summary>
    /// carga masiva de usuarios
    /// </summary>
    /// <param name="vp_CargueId"></param>
    /// <param name="vp_CampanaId"></param>
    /// <returns></returns>
    public string CargueUsers(string vp_CargueId, string vp_CampanaId)
    {
        StringBuilder vl_Sql = new StringBuilder();
        List<C_Chargue> ObjList_result = new List<C_Chargue>();
        C_Chargue chargue = new C_Chargue();
        C_Usuario usuario = new C_Usuario();
        List<C_Usuario> ObjList = new List<C_Usuario>();
        List<C_Usuario> ObjListDetalleError = new List<C_Usuario>();

        long Cont_RCreate = 0;
        long Cont_RUpdate = 0;
        long Cont_RNO = 0;
        long Cont_R1 = 0;
        long Cont_R2 = 0;
        long Cont_R3 = 0;

        string vl_StrQuery = "";
        string vl_errorChargue = "";
        string objSerialize = "";

        // (1) ELIMINAR LOS NULLS DEL CARGUE
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'DELETE_NULL_USERS'");
        vl_StrQuery = vl_Sql.ToString();
        vg_ConexionClass.Insert_Update_General(vl_StrQuery, "STD");

        vl_Sql = new StringBuilder();
        // (2) TRAER LA CANTIDAD DE REGISTROS CARGADOS
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'COUNT_CARGUE_TEMP_USERS'");
        vl_StrQuery = vl_Sql.ToString();
        chargue.CantidadRegistros = Convert.ToInt64(vg_ConexionClass.Search_Date(vl_StrQuery, "STD"));

        vl_Sql = new StringBuilder();
        // (3) TRAER LOS REGISTROS CARGADOS
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'SELECT_CARGUE_TEMP_USER'");
        vl_StrQuery = vl_Sql.ToString();
        ObjList = usuario.List(vl_StrQuery, "READ_TEMP", "STD");

        //RECORRER LOS REGISTROS
        foreach (var Item in ObjList)
        {

            if (Item.Documento == "")
            {
                //falta documento
                Cont_R1++;

                C_Usuario CE = new C_Usuario();

                CE.Nombre = Item.Nombre.ToUpper();
                CE.Apellido = Item.Apellido.ToUpper();
                CE.Documento = Item.Documento;
                CE.Respuesta = "falta Documento";

                ObjListDetalleError.Add(CE);
            }
            else
            {
                if (Item.Nombre == "")
                {
                    //falta nombre
                    Cont_R2++;

                    C_Usuario CE = new C_Usuario();

                    CE.Nombre = Item.Nombre.ToUpper();
                    CE.Apellido = Item.Apellido.ToUpper();
                    CE.Documento = Item.Documento;
                    CE.Respuesta = "falta nombre";

                    ObjListDetalleError.Add(CE);

                }
                else
                {
                    if (Item.Gestionable == null)
                    {
                        //falta Documento
                        Cont_R3++;

                        C_Usuario CE = new C_Usuario();

                        CE.Nombre = Item.Nombre.ToUpper();
                        CE.Apellido = Item.Apellido.ToUpper();
                        CE.Documento = Item.Documento;
                        CE.Respuesta = "falta Gestionable";

                        ObjListDetalleError.Add(CE);

                    }
                    else
                    {
                        Encriptar Enc = new Encriptar();

                        usuario.RolId = 5;
                        usuario.Password = Enc.SHA256_Certificado(Item.Documento);
                        usuario.Nombre = Item.Nombre.ToUpper();
                        usuario.Apellido = Item.Apellido.ToUpper();
                        usuario.Documento = Item.Documento;
                        usuario.Gestionable = Item.Gestionable;
                        usuario.Correo = Item.Correo;

                        string vl_existe_User = usuario.Validate_Usuario(usuario);

                        if (vl_existe_User == "")
                        {
                            //crea usuario
                            usuario.Respuesta = usuario.Create_User(usuario);

                            int valor;

                            usuario.Id = (int.TryParse(usuario.Respuesta, out valor)) ? Convert.ToInt64(usuario.Respuesta) : 0;

                            if (usuario.Id != 0)
                            {
                                C_UsuarioAcceso ClsUA = new C_UsuarioAcceso();
                                C_GroupWork groupWork = new C_GroupWork();

                                ClsUA.CuentaId = Convert.ToInt64(vp_CampanaId);
                                ClsUA.UsuarioId = usuario.Id;
                                ClsUA.ValueRolId = 5;
                                ClsUA.Documento = Item.Documento;
                                ClsUA.Estado = 1;

                                ClsUA.Id = Convert.ToInt64(ClsUA.Create_UserClientCampana(ClsUA));

                                groupWork.CampanaId = Convert.ToInt64(CampanaId);
                                groupWork.CoordinadorId = usuario.Id;
                                groupWork.UsuarioId = usuario.Id;
                                groupWork.ValueRolId = Convert.ToInt64(5);

                                groupWork.Id = Convert.ToInt64(groupWork.Create_GrupoTrabajo(groupWork));

                                if (Item.Correo != "NOAPLICA@CORREO.COM")
                                {
                                    C_Mensajes mensajes = new C_Mensajes();
                                    List<C_Mensajes> ObjListM = new List<C_Mensajes>();
                                    C_EstiloCampana estiloCampana = new C_EstiloCampana();
                                    List<C_EstiloCampana> ObjListEC = new List<C_EstiloCampana>();

                                    Mails mails = new Mails();
                                    mensajes.TipoMensajeId = 12;
                                    estiloCampana.CampanaId = Convert.ToInt64(HttpContext.Current.Session["Work_Campana_QA"]);
                                    var vl_mensajeCanal = "";

                                    ObjListM = mensajes.Read_TipoMensaje(mensajes);
                                    ObjListEC = estiloCampana.Read_STYLE_CAMPANA(estiloCampana);

                                    string vl_Accion = "Nuevo Usuario";
                                    string vl_Titulo = "HORIZON - Nuevo usuario de la plataforma";
                                    string FechaHoy = DateTime.Now.ToString("yyyy-MM-dd");

                                    vl_mensajeCanal = ObjListM[0].MaquetaMensaje_Head + ObjListM[0].CuerpoMensaje + ObjListM[0].MaquetaMensaje_Fotter;

                                    vl_mensajeCanal = vl_mensajeCanal.Replace("[User]", Item.Nombre.ToUpper() + " " + Item.Apellido.ToUpper());
                                    vl_mensajeCanal = vl_mensajeCanal.Replace("[accion]", vl_Accion);
                                    vl_mensajeCanal = vl_mensajeCanal.Replace("[Date_Now]", FechaHoy);
                                    vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_BGColor]", ObjListEC[0].ColorBack);
                                    vl_mensajeCanal = vl_mensajeCanal.Replace("[vl_TitleColor]", ObjListEC[0].ColorHeaderTitle);
                                    vl_mensajeCanal = vl_mensajeCanal.Replace("[Url]", ObjListM[0].Url);

                                    mails.SendMail(Item.Correo, "", "", vl_Titulo, vl_mensajeCanal, "", estiloCampana.CampanaId.ToString());

                                }

                                if (ClsUA.Id != 0)
                                {

                                    if (ClsUA.Id != 0)
                                    {
                                        Cont_RCreate++;
                                    }
                                    else
                                    {
                                        Cont_RNO++;
                                    }
                                }
                                else
                                {
                                    Cont_RNO++;
                                }
                            }

                        }
                        else
                        {
                            usuario.Id = Convert.ToInt64(vl_existe_User);
                            //edita usuario
                            usuario.Respuesta = usuario.Update_User(usuario);

                            int valor;

                            C_UsuarioAcceso ClsUA = new C_UsuarioAcceso();

                            ClsUA.CuentaId = Convert.ToInt64(vp_CampanaId);
                            ClsUA.UsuarioId = usuario.Id;

                            string ValidaExist = ClsUA.ExistUserCampana(ClsUA);

                            if (ValidaExist == "0")
                            {
                                ClsUA.ValueRolId = 5;
                                ClsUA.Documento = Item.Documento;
                                ClsUA.Estado = 1;

                                ClsUA.Id = Convert.ToInt64(ClsUA.Create_UserClientCampana(ClsUA));
                            }

                            usuario.Id = (int.TryParse(usuario.Respuesta, out valor)) ? Convert.ToInt64(usuario.Respuesta) : 0;

                            if (usuario.Id != 0)
                            {
                                Cont_RUpdate++;
                            }
                            else
                            {
                                Cont_RNO++;
                            }
                        }

                    }
                }
            }
        }


        if (vl_errorChargue == "")
        {
            List<C_Chargue> ObjList_resultValidacion = new List<C_Chargue>();

            chargue.CantidadRegistrosActualizados = Cont_RUpdate;
            chargue.CantidadRegistrosCreados = Cont_RCreate;
            chargue.CantidadRegistros_NoInsertados = (Cont_R1 + Cont_R2 + Cont_R3 + Cont_RNO);
            chargue.Id = vp_CargueId;
            chargue.CantidadError_1 = Cont_R1;
            chargue.CantidadError_2 = Cont_R2;
            chargue.CantidadError_3 = Cont_R3;

            chargue.TipoCargueId = 10;
            chargue.Respuesta = "OK";

            ObjList_resultValidacion = chargue.Update_ControlCargue(chargue);

            chargue.Id = ObjList_resultValidacion[0].Id;
            chargue.CantidadRegistrosActualizados = Cont_RUpdate;
            chargue.CantidadRegistrosCreados = Cont_RCreate;
            chargue.CantidadRegistros_NoInsertados = Cont_RNO;
            chargue.Respuesta = "OK";

            ObjList_result.Add(chargue);

            List<C_Chargue> ObjList_Respuesta = new List<C_Chargue>();

            C_Chargue Rta = new C_Chargue();
            Rta.Respuesta = "OK";

            ObjList_Respuesta.Add(Rta);

            string Json_1 = JsonConvert.SerializeObject(ObjList_result);
            string Json_2 = JsonConvert.SerializeObject(ObjListDetalleError);
            string Json_3 = JsonConvert.SerializeObject(ObjList_Respuesta);

            objSerialize = String.Format("[{0},{1},{2}]", Json_1, Json_2, Json_3);
        }

        return objSerialize;
    }

    /// <summary>
    /// convierte la hora a formato BD
    /// </summary>
    /// <param name="vp_index"></param>
    /// <returns></returns>
    public string ConvertHora(string vp_index)
    {
        string value = "";
        string[] cadena = vp_index.Split(' ');
        string[] cadena_2 = cadena[1].Split(':');

        string strHora = cadena_2[0];
        string strMinuto = cadena_2[1];

        strHora = (strHora.Length == 1) ? "0" + strHora : strHora;
        strMinuto = (strMinuto.Length == 1) ? "0" + strMinuto : strMinuto;

        if (cadena[2] == "p.")
        {
            switch (strHora)
            {
                case "01":
                    strHora = "13";
                    break;
                case "02":
                    strHora = "14";
                    break;
                case "03":
                    strHora = "15";
                    break;
                case "04":
                    strHora = "16";
                    break;
                case "05":
                    strHora = "17";
                    break;
                case "06":
                    strHora = "18";
                    break;
                case "07":
                    strHora = "19";
                    break;
                case "08":
                    strHora = "20";
                    break;
                case "09":
                    strHora = "21";
                    break;
                case "10":
                    strHora = "22";
                    break;
                case "11":
                    strHora = "23";
                    break;
            }
        }
        else
        {
            switch (strHora)
            {
                case "12":
                    strHora = "00";
                    break;
            }
        }
        return value = strHora + ":" + strMinuto;
    }

    /// <summary>
    /// convierte la fecha formato BD
    /// </summary>
    /// <param name="vp_Index"></param>
    /// <returns></returns>
    public string ConvertFecha(string vp_Index)
    {
        string value = "";
        string[] cadena = vp_Index.Split('/');

        string strdia = cadena[0];
        string strmes = cadena[1];
        string stranio = cadena[2];


        return value = stranio + "-" + strmes + "-" + strdia;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="vp_CargueId"></param>
    /// <param name="vp_CuenatId"></param>
    /// <returns></returns>
    public string CargueForm(string vp_CargueId, string vp_CuenatId)
    {
        string objSerialize = "";
        StringBuilder vl_Sql = new StringBuilder();
        C_Chargue chargue = new C_Chargue();
        C_Formulario formulario = new C_Formulario();


        List<C_Chargue> ObjList_result = new List<C_Chargue>();
        List<C_Formulario> ObjList = new List<C_Formulario>();

        List<ContainerForm> ObjList_Container = new List<ContainerForm>();
        List<ContainerN0> ObjList_C0 = new List<ContainerN0>();
        List<ContainerN1> ObjList_C1 = new List<ContainerN1>();
        List<ContainerN2> ObjList_C2 = new List<ContainerN2>();
        List<ContainerN3> ObjList_C3 = new List<ContainerN3>();
        List<ContainerN4> ObjList_C4 = new List<ContainerN4>();

        string vl_StrQuery = "";
        formulario.Descripcion = "Cargue_Masivo_" + vp_CargueId;
        formulario.CampanaId = Convert.ToInt64(vp_CuenatId);
        formulario.Estado = 1;

        // (1) ELIMINAR LOS NULLS DEL CARGUE
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'DELETE_NULL_FORM'");
        vl_StrQuery = vl_Sql.ToString();
        vg_ConexionClass.Insert_Update_General(vl_StrQuery, "STD");

        vl_Sql = new StringBuilder();
        // (2) TRAER LA CANTIDAD DE REGISTROS CARGADOS
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'COUNT_CARGUE_TEMP_FORM'");
        vl_StrQuery = vl_Sql.ToString();
        chargue.CantidadRegistros = Convert.ToInt64(vg_ConexionClass.Search_Date(vl_StrQuery, "STD"));

        vl_Sql = new StringBuilder();
        // (3) TRAER LOS REGISTROS CARGADOS
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'SELECT_CARGUE_TEMP_FORM'");
        vl_StrQuery = vl_Sql.ToString();
        ObjList = formulario.List(vl_StrQuery, "READ_TEMP");

        int Cont_0 = 0;
        int Cont_1 = 0;
        int Cont_2 = 0;
        int Cont_3 = 0;
        int Cont_4 = 0;


        if (ObjList.Count != 0)
        {
            int Contador = 1;

            string vl_Nivel_0 = "";
            string vl_Nivel_1 = "";
            string vl_Nivel_2 = "";
            string vl_Nivel_3 = "";
            string vl_Nivel_4 = "";

            //recorremos y construimos el array de validacion
            foreach (var R1 in ObjList)
            {
                ContainerForm form = new ContainerForm();

                form.Num = Contador;
                if (R1.StrNivel_0 != "")
                {
                    ContainerN0 n0 = new ContainerN0();

                    vl_Nivel_0 = R1.StrNivel_0;
                    n0.StrNivel_0 = R1.StrNivel_0;
                    ObjList_C0.Add(n0);
                    Cont_0++;
                }

                if (R1.StrNivel_1 != "")
                {
                    ContainerN1 n1 = new ContainerN1();

                    vl_Nivel_1 = R1.StrNivel_1;
                    n1.StrNivel_1 = R1.StrNivel_1;
                    n1.NumContainer = Contador;

                    ObjList_C1.Add(n1);
                    Cont_1++;
                }

                if (R1.StrNivel_2 != "")
                {
                    ContainerN2 n2 = new ContainerN2();

                    vl_Nivel_2 = R1.StrNivel_2;
                    n2.StrNivel_2 = R1.StrNivel_2;
                    n2.NumContainer = Contador;

                    ObjList_C2.Add(n2);
                    Cont_2++;
                }

                if (R1.StrNivel_3 != "")
                {
                    ContainerN3 n3 = new ContainerN3();

                    vl_Nivel_3 = R1.StrNivel_3;
                    n3.StrNivel_3 = R1.StrNivel_3;
                    n3.NumContainer = Contador;

                    ObjList_C3.Add(n3);
                    Cont_3++;
                }

                if (R1.StrNivel_4 != "")
                {
                    ContainerN4 n4 = new ContainerN4();

                    vl_Nivel_4 = R1.StrNivel_4;
                    n4.StrNivel_4 = R1.StrNivel_4;
                    n4.NumContainer = Contador;

                    ObjList_C4.Add(n4);
                    Cont_4++;
                }

                form.StrNivel_0 = vl_Nivel_0;
                form.StrNivel_1 = vl_Nivel_1;
                form.StrNivel_2 = vl_Nivel_2;
                form.StrNivel_3 = vl_Nivel_3;
                form.StrNivel_4 = vl_Nivel_4;

                ObjList_Container.Add(form);
                Contador++;
            }


            vl_Sql = new StringBuilder();
            //crear formulario
            formulario.Respuesta = formulario.Create_Formulario(formulario);
            int valor;

            string FormularioId = (int.TryParse(formulario.Respuesta, out valor)) ? formulario.Respuesta : "0";

            formulario.Id = Convert.ToInt64(FormularioId);
            string vl_Flag_N0 = "";


            if (ObjList_C0.Count != 0)
            {
                vl_Flag_N0 = "1";

                //crea desde nivel 0
                foreach (var ItemN0 in ObjList_C0)
                {
                    C_CargoEsp cargo = new C_CargoEsp();

                    cargo.CampanaId = Convert.ToInt64(vp_CuenatId);
                    cargo.FormularioId = Convert.ToInt64(FormularioId);
                    cargo.Descripcion = ItemN0.StrNivel_0;
                    cargo.Peso = "0";
                    cargo.Estado = 1;

                    cargo.Respuesta = cargo.Create_Nivel0(cargo);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_0 == ItemN0.StrNivel_0)
                        {
                            itemContainer.Id_0 = Convert.ToInt64(cargo.Respuesta);
                        }
                    }
                }
                formulario.Descripcion = "CantCargo";
                formulario.Update_Contador(formulario);
            }
            else
            {
                vl_Flag_N0 = "0";
                //crea desde el nivel 1
                foreach (var ItemN1 in ObjList_C1)
                {
                    C_BloqueEvaluacion evaluacion = new C_BloqueEvaluacion();

                    evaluacion.FormularioId = Convert.ToInt64(FormularioId);
                    evaluacion.Descripcion = ItemN1.StrNivel_1;
                    evaluacion.CargoId = 0;
                    evaluacion.Peso = "0";
                    evaluacion.PesoCargo = "0";
                    evaluacion.Estado = 1;

                    evaluacion.Respuesta = evaluacion.Create_Nivel1(evaluacion);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_1 == ItemN1.StrNivel_1)
                        {
                            itemContainer.Id_1 = Convert.ToInt64(evaluacion.Respuesta);
                        }
                    }
                }
                formulario.Descripcion = "CantBloque";
                formulario.Update_Contador(formulario);

            }

            string vl_Flag_N1 = "";

            if (vl_Flag_N0 == "1")
            {
                vl_Flag_N1 = "1";
                //si el flag esta en uno tiene nivel 0
                foreach (var ItemN1 in ObjList_C1)
                {
                    C_BloqueEvaluacion evaluacion = new C_BloqueEvaluacion();

                    evaluacion.FormularioId = Convert.ToInt64(FormularioId);
                    evaluacion.Descripcion = ItemN1.StrNivel_1;
                    evaluacion.Peso = "0";
                    evaluacion.PesoCargo = "0";
                    evaluacion.Estado = 1;


                    foreach (var ItemContiner in ObjList_Container)
                    {
                        if (ItemContiner.Num == ItemN1.NumContainer &&
                                 ItemContiner.StrNivel_1 == ItemN1.StrNivel_1)
                        {
                            evaluacion.CargoId = ItemContiner.Id_0;
                        }
                    }

                    evaluacion.Respuesta = evaluacion.Create_Nivel1(evaluacion);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_1 == ItemN1.StrNivel_1)
                        {
                            itemContainer.Id_1 = Convert.ToInt64(evaluacion.Respuesta);
                        }
                    }
                }
                formulario.Descripcion = "CantBloque";
                formulario.Update_Contador(formulario);
            }
            else
            {
                vl_Flag_N1 = "0";

                foreach (var ItemN2 in ObjList_C2)
                {
                    C_NotasDescriptivas notas = new C_NotasDescriptivas();

                    notas.Descripcion = ItemN2.StrNivel_2;
                    notas.Peso = "0";
                    notas.Estado = 1;
                    notas.PesoPonderado = "0";
                    notas.EstadoProcesoId = 120;

                    foreach (var ItemContiner in ObjList_Container)
                    {
                        if (ItemContiner.Num == ItemN2.NumContainer &&
                                 ItemContiner.StrNivel_2 == ItemN2.StrNivel_2)
                        {
                            notas.BloqueEvaluacionId = ItemContiner.Id_1;
                        }
                    }

                    notas.Respuesta = notas.Create_Nivel2(notas);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_2 == ItemN2.StrNivel_2)
                        {
                            itemContainer.Id_2 = Convert.ToInt64(notas.Respuesta);
                        }
                    }
                }
                formulario.Descripcion = "CantNotas";
                formulario.Update_Contador(formulario);
            }
            string vl_Flag_N2 = "";

            if (vl_Flag_N1 == "1")
            {
                vl_Flag_N2 = "1";

                foreach (var ItemN2 in ObjList_C2)
                {
                    C_NotasDescriptivas notas = new C_NotasDescriptivas();

                    notas.Descripcion = ItemN2.StrNivel_2;
                    notas.Peso = "0";
                    notas.Estado = 1;
                    notas.PesoPonderado = "0";
                    notas.EstadoProcesoId = 120;

                    foreach (var ItemContiner in ObjList_Container)
                    {
                        if (ItemContiner.Num == ItemN2.NumContainer &&
                                 ItemContiner.StrNivel_2 == ItemN2.StrNivel_2)
                        {
                            notas.BloqueEvaluacionId = ItemContiner.Id_1;
                        }
                    }

                    notas.Respuesta = notas.Create_Nivel2(notas);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_2 == ItemN2.StrNivel_2)
                        {
                            itemContainer.Id_2 = Convert.ToInt64(notas.Respuesta);
                        }
                    }
                }
                formulario.Descripcion = "CantNotas";
                formulario.Update_Contador(formulario);
            }
            else
            {
                vl_Flag_N2 = "0";

                C_Puntos_Entrenamiento entrenamiento = new C_Puntos_Entrenamiento();

                foreach (var ItemN3 in ObjList_C3)
                {
                    entrenamiento.Descripcion = ItemN3.StrNivel_3;
                    entrenamiento.Peso = "0";
                    entrenamiento.EstadoProcesoId = 120;
                    entrenamiento.Estado = 1;
                    entrenamiento.PesoPonderado = "0";

                    foreach (var ItemContiner in ObjList_Container)
                    {
                        if (ItemContiner.Num == ItemN3.NumContainer &&
                                 ItemContiner.StrNivel_3 == ItemN3.StrNivel_3)
                        {
                            entrenamiento.NotasDescriptivasId = ItemContiner.Id_2;
                        }
                    }

                    entrenamiento.Respuesta = entrenamiento.Create_Nivel3(entrenamiento);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_3 == ItemN3.StrNivel_3)
                        {
                            itemContainer.Id_3 = Convert.ToInt64(entrenamiento.Respuesta);
                        }
                    }
                }
                formulario.Descripcion = "CantPunto";
                formulario.Update_Contador(formulario);
            }

            if (vl_Flag_N2 == "1")
            {
                C_Puntos_Entrenamiento entrenamiento = new C_Puntos_Entrenamiento();

                foreach (var ItemN3 in ObjList_C3)
                {
                    entrenamiento.Descripcion = ItemN3.StrNivel_3;
                    entrenamiento.Peso = "0";
                    entrenamiento.EstadoProcesoId = 120;
                    entrenamiento.Estado = 1;
                    entrenamiento.PesoPonderado = "0";

                    foreach (var ItemContiner in ObjList_Container)
                    {
                        if (ItemContiner.Num == ItemN3.NumContainer &&
                                 ItemContiner.StrNivel_3 == ItemN3.StrNivel_3)
                        {
                            entrenamiento.NotasDescriptivasId = ItemContiner.Id_2;
                        }
                    }

                    entrenamiento.Respuesta = entrenamiento.Create_Nivel3(entrenamiento);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_3 == ItemN3.StrNivel_3)
                        {
                            itemContainer.Id_3 = Convert.ToInt64(entrenamiento.Respuesta);
                        }
                    }
                }
                formulario.Descripcion = "CantPunto";
                formulario.Update_Contador(formulario);
            }

            if (ObjList_C4.Count != 0)
            {
                C_FocoMejora mejora = new C_FocoMejora();
                foreach (var ItemN4 in ObjList_C4)
                {
                    mejora.Descripcion = ItemN4.StrNivel_4;
                    mejora.Peso = "0";
                    mejora.Estado = 1;

                    foreach (var ItemContiner in ObjList_Container)
                    {
                        if (ItemContiner.Num == ItemN4.NumContainer &&
                                 ItemContiner.StrNivel_4 == ItemN4.StrNivel_4)
                        {
                            mejora.PuntosEntrenamientoId = ItemContiner.Id_3;
                        }
                    }

                    mejora.Respuesta = mejora.Create_Nivel4(mejora);

                    foreach (var itemContainer in ObjList_Container)
                    {

                        if (itemContainer.StrNivel_4 == ItemN4.StrNivel_4)
                        {
                            itemContainer.Id_4 = Convert.ToInt64(mejora.Respuesta);
                        }
                    }
                }
            }

        }

        List<C_Chargue> ObjList_resultValidacion = new List<C_Chargue>();

        chargue.CantidadRegistrosActualizados = 0;
        chargue.CantidadRegistrosCreados = (Cont_0 + Cont_1 + Cont_2 + Cont_3 + Cont_4);
        chargue.CantidadRegistros_NoInsertados = 0;
        chargue.Id = vp_CargueId;
        chargue.CantidadError_1 = 0;
        chargue.CantidadError_2 = 0;
        chargue.CantidadError_3 = 0;

        chargue.TipoCargueId = 123;
        chargue.Respuesta = "OK";

        ObjList_resultValidacion = chargue.Update_ControlCargue(chargue);

        chargue.Id = ObjList_resultValidacion[0].Id;
        chargue.CantidadRegistrosActualizados = 0;
        chargue.CantidadRegistrosCreados = (Cont_0 + Cont_1 + Cont_2 + Cont_3 + Cont_4);
        chargue.CantidadRegistros_NoInsertados = 0;
        chargue.CantidadError_1 = Cont_0;
        chargue.CantidadError_2 = Cont_1;
        chargue.CantidadError_3 = Cont_2;
        chargue.CantidadError_4 = Cont_3;
        chargue.CantidadError_5 = Cont_4;

        chargue.Respuesta = "OK";

        ObjList_result.Add(chargue);

        List<C_Chargue> ObjList_Respuesta = new List<C_Chargue>();

        C_Chargue Rta = new C_Chargue();
        Rta.Respuesta = "OK_Form";

        ObjList_Respuesta.Add(Rta);

        string Json_1 = JsonConvert.SerializeObject(ObjList_result);
        string Json_2 = JsonConvert.SerializeObject(ObjList_Container);
        string Json_3 = JsonConvert.SerializeObject(ObjList_Respuesta);

        objSerialize = String.Format("[{0},{1},{2}]", Json_1, Json_2, Json_3);


        return objSerialize;
    }

    #endregion

    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA USER
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_Chargue> List(string vp_Query, string vp_Type)
    {
        List<C_Chargue> vl_ObjList = new List<C_Chargue>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion("STD");
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {
            case "READ_CONTROL":
                while (Read_Query.Read())
                {
                    C_Chargue Obj = new C_Chargue();
                    Obj.Id = Read_Query["Id"].ToString();
                    Obj.CantidadRegistros = Convert.ToInt64(Read_Query["CantidadRegistros"]);
                    Obj.CantidadRegistrosActualizados = Convert.ToInt64(Read_Query["CantidadRegistrosActualizados"]);
                    Obj.CantidadRegistrosCreados = Convert.ToInt64(Read_Query["CantidadRegistrosCreados"]);
                    Obj.CantidadRegistros_NoInsertados = Convert.ToInt64(Read_Query["CantidadRegistros_NoInsertados"]);

                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_CONTROL_USERS":
                while (Read_Query.Read())
                {
                    C_Chargue Obj = new C_Chargue();
                    Obj.Id = Read_Query["Id"].ToString();
                    Obj.CantidadRegistros = Convert.ToInt64(Read_Query["CantidadRegistros"]);
                    Obj.CantidadRegistrosActualizados = Convert.ToInt64(Read_Query["CantidadRegistrosActualizados"]);
                    Obj.CantidadRegistrosCreados = Convert.ToInt64(Read_Query["CantidadRegistrosCreados"]);
                    Obj.CantidadRegistros_NoInsertados = Convert.ToInt64(Read_Query["CantidadRegistros_NoInsertados"]);
                    Obj.CantidadError_1 = Convert.ToInt64(Read_Query["CantidadError_1"]);
                    Obj.CantidadError_2 = Convert.ToInt64(Read_Query["CantidadError_2"]);
                    Obj.CantidadError_3 = Convert.ToInt64(Read_Query["CantidadError_3"]);

                    vl_ObjList.Add(Obj);
                }
                break;



        }
        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}

public class ContainerForm
{
    public long Num { get; set; }
    public long Id_0 { get; set; }
    public string StrNivel_0 { get; set; }
    public long Id_1 { get; set; }
    public string StrNivel_1 { get; set; }
    public long Id_2 { get; set; }
    public string StrNivel_2 { get; set; }
    public long Id_3 { get; set; }
    public string StrNivel_3 { get; set; }
    public long Id_4 { get; set; }
    public string StrNivel_4 { get; set; }
}

public class ContainerN0
{
    public string StrNivel_0 { get; set; }
}

public class ContainerN1
{
    public int NumContainer { get; set; }
    public string StrNivel_1 { get; set; }
}

public class ContainerN2
{
    public int NumContainer { get; set; }
    public string StrNivel_2 { get; set; }
}

public class ContainerN3
{
    public int NumContainer { get; set; }
    public string StrNivel_3 { get; set; }
}

public class ContainerN4
{
    public int NumContainer { get; set; }
    public string StrNivel_4 { get; set; }
}