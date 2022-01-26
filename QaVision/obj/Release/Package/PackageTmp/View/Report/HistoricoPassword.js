/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];
var ObjHistoryPassword = [];
var ObjUsers = [];


var vg_FlagEdit = 0;
var vg_EstadoUser;
var vg_usuarioId = 0;
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {
    ChangeUsers();
    ChangeCampana();
}

//oculta campos para el proceso
function HideObject() {
    jQuery("#BlockCampana").fadeOut('fast');
    jQuery("#BlockUser").fadeOut('fast');
    jQuery("#BlockDataUser").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    var vl_Parameters = Capture_GET();
    DropListCampana_Transaction();
    DropListUsers_Transaction();
   
    if (vl_Parameters !== undefined) {

        CapturaVariables(vl_Parameters);
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION BOTONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//valida el manejo de botones de cuentas y usuarios
function ModalForm(vp_index) {
    switch (vp_index) {
        case 1:
            jQuery("#TxtNombreAplicacion").attr("disabled", false);

            jQuery("#TForm").html("Ver Usuarios");

            jQuery("#BlockUser").css('display', 'block');
            jQuery("#btn_reg").css('display', 'block');

            jQuery("#BlockCampana").fadeOut('fast');
            jQuery("#BlockUser").show('slow');
            jQuery("#btn_reg").show('slow');
            jQuery("#btn_cre").fadeOut('fast');

            break;
        case 2:
            vg_FlagEdit = 0;

            Clear();

            jQuery("#TForm").html("Ver Cuentas");
            jQuery("#BlockCampana").css('display', 'block');

            jQuery("#BlockUser").fadeOut('fast');
            jQuery("#BlockCampana").show('slow');
            jQuery("#btn_cre").show('slow');
            jQuery("#btn_reg").fadeOut('fast');
            break;
    }
}


/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//evento de cambio del usuario
function ChangeUsers() {
    jQuery("#DListUsers").change(function () {
        vg_usuarioId = jQuery(this).val();
        DataUserCampana(vg_usuarioId);
    });
}

function ChangeCampana() {
    jQuery("#DListCampana").change(function () {
        var vl_CampanaId = jQuery(this).val();
        DataCampanaUser(vl_CampanaId);
    });
}


//asigna la data de la consulta por usuario
function AsignarData() {
    jQuery("#TxtNombreCompleto").val(ObjWork[0].Nombre);
    jQuery("#TxtDocumento").val(ObjWork[0].Documento);
    jQuery("#TxtUsuario").val(ObjWork[0].NombreUsuario);

    CreateGridCampana(ObjWork[0].Nombre);
}

//limpia campos
function Clear() {
    jQuery("#TxtNombre").val("");
    jQuery("#TxtDescripcion").val("");
    jQuery("#TxtComponente").val("");
    jQuery("#DListControlMonitor").val("-1").trigger('chosen:updated');
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GRID                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//Crea el grid de campanasasignadas al usuario
function CreateGridCampana(vp_Nombre) {

    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><div class='col-xs-6 col-sm-6'><strong class='card-title'>Historico de cambio de contraseña de " + vp_Nombre + "</strong></div>" +
        "<div class='col-xs-3 col-sm-3'><button type='button'  class='btn btn-success btn-block Top' onclick='javascript:Descargar_Excel()'><i class='fa fa-th'></i>&nbsp;Descargar Excel</button></div>" +
        "<div class='col-xs-3 col-sm-3'><button type='button'  class='btn btn-danger btn-block Top' onclick='javascript:Descargar_PDF()'><i class='fa fa-file'></i>&nbsp;Descargar PDF</button></div></div>" +
        "<div class='card-body'>" +
        "   <table id='GridHistoryUser' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>IP </th>" +
        "       <th>Tipo de gestión</th>" +
        "       <th>Fecha</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjHistoryPassword) {

        vl_Html += "    <tr id= 'Tr_Aplicacion_" + ObjHistoryPassword[ItemObj].Id + "'>" +
            "     <td>" + ObjHistoryPassword[ItemObj].IP + "</td>" +
            "     <td>" + ObjHistoryPassword[ItemObj].OpcionPassword + "</td>" +
            "     <td>" + FormatFechaWM(parseJsonDate(ObjHistoryPassword[ItemObj].FechaRegistro)) + "</td>" +
            "   </tr>";
    }
    
    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_CampanaUser").html("");
    jQuery("#Grid_CampanaUser").html(vl_Html);

    jQuery("#GridHistoryUser").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
}

//descargar archivo excel
function Descargar_Excel() {
    jQuery("#GridHistoryUser").dataTable({
        "bJQueryUI": true,
        "iDisplayLength": 100000000,
        "bDestroy": true
    });

    tableToExcel('GridHistoryUser', 'Detalle', "HistoricoContraseña");
}

//genera arcivo excel
tableToExcel = (function () {
    var a = document.createElement('a');
    var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table border="2px">{table}</table></body></html>'
        , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
    return function (table, nombreHoja, nombreArchivo) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = { worksheet: nombreHoja || 'Registros', table: table.innerHTML }
        a.href = uri + base64(format(template, ctx));
        var f = new Date();
        var mes = f.getMonth() + 1;
        var token = f.getFullYear() + "" + mes + "" + f.getDate() + "_" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds();
        a.download = nombreArchivo + '_' + token + '.xls';
        a.click();

        jQuery("#GridWork_DetailResult").dataTable({
            "bJQueryUI": true,
            "iDisplayLength": 20,
            "bDestroy": true
        });
    }
})()


//creacion de grid de AplicacionS
function CreateGrid() {

    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>Usuarios de " + jQuery("#Title_Form").html() + "</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridUserCampana' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Nombre</th>" +
        "       <th>Perfil</th>" +
        "       <th>Opción</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjUsers) {

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjUsers[ItemObj].Id + "'>" +
            "     <td>" + ObjUsers[ItemObj].Nombre + " " + ObjUsers[ItemObj].Apellido + "</td>" +
            "     <td>" + ObjUsers[ItemObj].Rol + "</td>" +
            "     <td><div class='col-lg-6 col-md-6' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:SelectUser('" + ItemObj + "')\"><i class='fa fa-check-square-o fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Asignar Cuenta</span></span></div></td>" +
            "   </tr>";
    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_UserCampana").html("");
    jQuery("#Grid_UserCampana").html(vl_Html);


    jQuery("#GridUserCampana").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
}

//mostrar usuario Seleccionado
function SelectUser(vp_ObjIndex) {
    jQuery("#DListUsers").val(ObjUsers[vp_ObjIndex].Id).trigger('chosen:updated');
    jQuery("#BlockCampana").fadeOut('fast');
    jQuery("#BlockUser").show('slow');
    vg_usuarioId = ObjUsers[vp_ObjIndex].Id;
    jQuery("#TForm").html("Ver Usuarios");


    DataUserCampana(ObjUsers[vp_ObjIndex].Id);
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

//trae todos los Aplicacions
function DropListCampana_Transaction() {
    var Obj_Campana = [];

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/DropListCampanas",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Campana = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Campana, "DListCampana", "");
    });
}

//trae todos los usuario para el control
function DropListUsers_Transaction() {
    var Obj_Users = [];

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "DropListUsers"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Users = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Users, "DListUsers", "");
    });
}

//trae la dat del usuario y campaña
function DataUserCampana(vp_index) {
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/DataUserHistoricoPassword",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{UsuarioId: " + vp_index + "}",
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjWork = result.d.data;
            ObjHistoryPassword = result.d.historyPasword;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery("#BlockDataUser").show('slow');
        AsignarData();
    });
}

function Descargar_PDF() {

    var ListData = [];
    var vl_IdUser = jQuery("#DListUsers").val();
    var vl_NameUser = jQuery("#TxtNombreCompleto").val();
    var vl_DocumentUser = jQuery("#TxtDocumento").val();

    ListData = JSON.stringify(ObjHistoryPassword);

    var vl_flag = "";
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/GenerarHistoricoPDF",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{IdUser:'" + vl_IdUser +
            "', NameUser: '" + vl_NameUser +
            "', DocumentUser: '" + vl_DocumentUser +
            "', ListData:'" + ListData +
            "', Logo: '" + Obj_Style[0].Logo +"'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        if (vl_flag == "GENERADO") {
            jQuery("#IF_Visor").attr("src", "");
            jQuery("#IF_Visor").attr("width", "100%");
            jQuery("#IF_Visor").attr("height", "500px");
           
            var vl_View_Image = '/Repositorio/PDF/HistoricoContraseña_' + vl_DocumentUser + ".pdf";
            jQuery("#IF_Visor").attr("src", vl_View_Image);

            jQuery("#ModalPDF").modal("show");
        }
    });

}


//trae los usuarios de la campaña seleccionada
function DataCampanaUser(vp_index) {
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ListUsuarios_Campana_UC",
            "CampanaId": vp_index
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjUsers = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        //CreateGrid();
    });
}

//guarda la campaña asignada al usuario
function Save_CampanaUser_Transaction(vp_Campana, vp_Rol) {
    var vl_flag;

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/AddUsuarioCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{CampanaId: '" + vp_Campana +
            "',UsuarioId: '" + vg_usuarioId +
            "', RolId:'" + vp_Rol + "' }",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        switch (vl_flag) {
            case "200":
                DataUserCampana(vg_usuarioId);
                break;
            case "500":
                Message("Error", "Hubo errores al tratar de crear el el permiso en la Cuenta asignada.", 5000);
                break;
            case "501":
                Message("Error", "Hubo errores al darle permisos sobre el Aplicacion asignado.", 5000);
                break;
            case "502":
                Message("Error", "Hubo errores al darle permisos sobre los accesos en la Cuenta asignada.", 5000);
                break;
            case "503":
                Message("Error", "Hubo errores al tratar de actualizar el Aplicacion.", 5000);
                break;
            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}

//activa o desactiva el Aplicacion seleccionado
function Des_Activa_Transaction() {
    var vl_flag;
    var vl_Estado;

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ActiveInactiveUserCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ TypeOperation:'" + vg_FlagEdit +
            "',Estado:'" + vg_EstadoUser + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
            vl_Estado = result.d.data[0].Estado;
        },
        error: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
    }).done(function () {
        switch (vl_flag) {
            case "200":
                jQuery("#ModalDesactivar").modal("hide");

                var vl_conplementoMSM = (vl_Estado == 0) ? "desactivado" : "activado";
                Message("Success", "La cuenta se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                DataUserCampana(vg_usuarioId);
                break;

            case "500":
                Message("Error", "Hubo errores al tratar de desactivar la cuenta.", 5000);
                break;

            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/




