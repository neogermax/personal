//https://articulo.mercadolibre.com.co/MCO-479776247-juego-zona-pal-europa-bomberman-hero-n64-_JM#position=37&search_layout=stack&type=item&tracking_id=5fd1f479-2f56-4306-8beb-bd2fc58810b2
/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];

var vg_FlagEdit = 0;
var vg_EstadoUser;
var vg_RutaTemporal = "/Repositorio/Carga/";
var vg_flagGestion = 0;

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {
    jQuery('#BSbtnsuccess').filestyle({
        iconName: 'fa-th-large',
        buttonName: 'btn-success',
        buttonText: ' Seleccione el archivo Excel'
    });
}

//oculta campos para el proceso
function HideObject() {
    jQuery("#BlockForm").fadeOut('fast');
    jQuery("#btn_reg").fadeOut('fast');
    jQuery("#Block_C_Masive").fadeOut('fast');
    jQuery("#Block_C_Manual").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    var vl_Parameters = Capture_GET();
    ListUsers_Transaction();
    ListRol_Transaction();
    ChangeEmail("TxtCorreo", "helpCorreo");
    ChangeControls();

    if (vl_Parameters !== undefined) {
        CapturaVariables(vl_Parameters);

    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION BOTONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ModalForm(vp_index) {
    switch (vp_index) {
        case 1:
            jQuery("#TxtNombreUsuario").attr("disabled", false);

            jQuery("#TForm").html("Crear Usuario");

            jQuery("#BlockForm").css('display', 'block');
            jQuery("#btn_reg").css('display', 'block');

            jQuery("#BlockView").fadeOut('fast');
            jQuery("#BlockForm").show('slow');
            jQuery("#btn_reg").show('slow');
            jQuery("#btn_cre").fadeOut('fast');

            break;
        case 2:
            vg_FlagEdit = 0;

            Clear();

            jQuery("#TForm").html("Ver Usuarios");

            jQuery("#BlockForm").fadeOut('fast');
            jQuery("#BlockView").show('slow');
            jQuery("#btn_cre").show('slow');
            jQuery("#btn_reg").fadeOut('fast');
            jQuery("#btn_CreManmual").css("display", "block");
            break;
    }
}

//muestra el bloque de creacion seleccionado
function ModalFormCreate(vp_index) {
    switch (vp_index) {
        case 1:
            jQuery("#Block_C_Masive").fadeOut('fast');
            jQuery("#Block_C_Manual").show('slow');
            break;
        case 2:
            jQuery("#Block_C_Manual").fadeOut('fast');
            jQuery("#Block_C_Masive").show('slow');
            break;
    }
}

//activa el proceso de guardado
function Btn_Save() {
    var vl_Valida = ValidaCampos();

    (vl_Valida == 1) ? Message("Alert", "Revise por favor los campos obligatorios") : ValidaUser_Transaction();
}

//dispara el proceso de activacion o desactivacion del usuario
function Btn_ActivarDesativar() {
    Des_Activa_Transaction();
}

//descarga la plantilla de trabajo
function Btn_Download_Plantilla() {
    window.location = "/Repositorio/Plantillas/TemplateUser.xlsx";
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//valida los campos del formulario
function ValidaCampos() {

    var vl_Campo_1 = jQuery("#TxtNombre").val();
    var vl_Campo_2 = jQuery("#TxtApellido").val();
    var vl_Campo_3 = jQuery("#TxtCorreo").val();
    var vl_Campo_4 = jQuery("#TxtCedula").val();
    var vl_Campo_5 = jQuery("#DListRol").val();

    var vl_Valida = 0;

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "" ||
        vl_Campo_3 == "" ||
        vl_Campo_4 == "" ||
        vl_Campo_5 == "-1" ||
        vg_Validador == 1) {

        vl_Valida = 1;

        if (vl_Campo_1 == "") { jQuery("#helpNombre").html("* Nombre Obligatorio"); jQuery("#helpNombre").css("display", "block"); } else { jQuery("#helpNombre").html(""); jQuery("#helpNombre").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpApellido").html("* Apellido Obligatorio"); jQuery("#helpApellido").css("display", "block"); } else { jQuery("#helpApellido").html(""); jQuery("#helpApellido").css("display", "none"); }
        if (vl_Campo_3 == "") { jQuery("#helpCorreo").html("* Correo Obligatorio"); jQuery("#helpCorreo").css("display", "block"); } else { jQuery("#helpCorreo").html(""); jQuery("#helpCorreo").css("display", "none"); }
        if (vl_Campo_4 == "") { jQuery("#helpCedula").html("* Cedula Obligatorio"); jQuery("#helpCedula").css("display", "block"); } else { jQuery("#helpCedula").html(""); jQuery("#helpCedula").css("display", "none"); }
        if (vl_Campo_5 == "-1") { jQuery("#helpRol").html("* Perfil Obligatorio"); jQuery("#helpRol").css("display", "block"); } else { jQuery("#helpRol").html(""); jQuery("#helpRol").css("display", "none"); }
    }
    else {
        jQuery("#helpNombre").html("");
        jQuery("#helpNombre").css("display", "none");
        jQuery("#helpApellido").html("");
        jQuery("#helpApellido").css("display", "none");
        jQuery("#helpCorreo").html("");
        jQuery("#helpCorreo").css("display", "none");
        jQuery("#helpCedula").html("");
        jQuery("#helpCedula").css("display", "none");
        jQuery("#helpRol").html("");
        jQuery("#helpRol").css("display", "none");
    }

    return vl_Valida;
}

//evento que controla los eventos de los controles
function ChangeControls() {
    jQuery("#Check_Ges").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagGestion = 1;
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagGestion = 0;
        }
    });

    jQuery("#Check_Correo").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            jQuery("#TxtCorreo").attr("disabled", true)
            jQuery("#TxtCorreo").val("NOAPLICA@CORREO.COM");
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            jQuery("#TxtCorreo").attr("disabled", false)
            jQuery("#TxtCorreo").val("");
        }
    });
}

//limpia campos
function Clear() {
    document.getElementById("Check_Ges").checked = false;
    jQuery("#TxtNombre").val("");
    jQuery("#TxtApellido").val("");
    jQuery("#TxtNombreUsuario").val("");
    jQuery("#TxtCedula").val("");
    jQuery("#TxtCorreo").val("");
    jQuery("#DListRol").val("-1").trigger('chosen:updated');
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GRID                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//creacion de grid de CLIENTES
function CreateGrid() {

    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>Usuarios de " + jQuery("#Title_Form").html() + "</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th  style='width:250px;'>Nombre</th>" +
        "       <th  style='width:100px;'>Documento</th>" +
        "       <th  style='width:150px;'>Perfil</th>" +
        "       <th  style='width:100px;'>Estado</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {
        var vl_estado = (ObjWork[ItemObj].Estado == 1) ? "Activo" : "Desactivado";
        var vl_estadoColor = (ObjWork[ItemObj].Estado == 1) ? "#0EEA04" : "#F61313";

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
            "     <td>" + ObjWork[ItemObj].Nombre + " " + ObjWork[ItemObj].Apellido + "</td>" +
            "     <td>" + ObjWork[ItemObj].Documento + "</td>" +
            "     <td>" + ObjWork[ItemObj].Rol + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_estadoColor + "'>" + vl_estado + "</td>" +
            "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:InactivarGrid('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Activar - Desactivar</span></span></div>" +
            "         <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:EditarGrid('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
            "         <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:CambiarPass('" + ItemObj + "')\"><i class='fa fa-retweet fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Cambiar Contraseña</span></span></div></td>" +
            "   </tr>";
    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_Work").html("");
    jQuery("#Grid_Work").html(vl_Html);


    jQuery("#GridWork").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
}

//editar data grid seleccionada
function EditarGrid(vp_ObjIndex) {
    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;

    ModalForm(1);
    ModalFormCreate(1);

    jQuery("#TForm").html("Editar Usuario");

    jQuery("#TxtNombre").val(ObjWork[vp_ObjIndex].Nombre);
    jQuery("#TxtApellido").val(ObjWork[vp_ObjIndex].Apellido);
    jQuery("#TxtCedula").val(ObjWork[vp_ObjIndex].Documento);
    jQuery("#TxtCorreo").val(ObjWork[vp_ObjIndex].Correo);
    jQuery("#DListRol").val(ObjWork[vp_ObjIndex].RolId).trigger('chosen:updated');
    document.getElementById("Check_Ges").checked = (ObjWork[vp_ObjIndex].Gestionable == 1) ? true : false;
    document.getElementById("Check_Correo").checked = (ObjWork[vp_ObjIndex].Correo == "NOAPLICA@CORREO.COM") ? true : false;

    if (ObjWork[vp_ObjIndex].Correo == "NOAPLICA@CORREO.COM") {
        jQuery("#TxtCorreo").attr("disabled", true);
    }
    else {
        jQuery("#TxtCorreo").attr("disabled", false);
    }

    jQuery("#btn_CreManmual").css("display", "none");
}

//activar o desactivar data grid seleccionada
function InactivarGrid(vp_ObjIndex) {
    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;
    vg_EstadoUser = ObjWork[vp_ObjIndex].Estado;

    jQuery("#TxtNombreView").val(ObjWork[vp_ObjIndex].Nombre + " " + ObjWork[vp_ObjIndex].Apellido);
    jQuery("#TxtNombreUsuarioView").val(ObjWork[vp_ObjIndex].Documento).attr("disabled", true);

    var vl_MsnEstado = (ObjWork[vp_ObjIndex].Estado == 1) ? "Esta seguro de desactivar este usuario?" : "Esta seguro de activar este usuario?";
    jQuery("#LblMsmAdvertencia").html(vl_MsnEstado);

    jQuery("#ModalDesactivar").modal("show");
}

//cambio de contrseña 
function CambiarPass(vp_ObjIndex) {

    var vl_Nombre = ObjWork[vp_ObjIndex].Nombre + " " + ObjWork[vp_ObjIndex].Apellido;
    var vl_Documento = ObjWork[vp_ObjIndex].Documento;
    var vl_Correo = ObjWork[vp_ObjIndex].Correo;

    CambioPassword_Transaction(vl_Nombre, vl_Documento, vl_Correo);
}

//creacion de grid de cargue
function CreateGrid_Result() {
    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><div class='col-xs-9 col-sm-9'><strong class='card-title'>Resultado del cargue<strong></div><div class='col-xs-3 col-sm-3''><button type='button'  class='btn btn-info btn-block Top' onclick='javascript:View_DetailChargue()'><i class='fa fa-th'></i>&nbsp;Ver detalle de cargue</button></div></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork_Result' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Cargue</th>" +
        "       <th>Cantidad Registros</th>" +
        "       <th>Registros Creados</th>" +
        "       <th>Registros Actualizados</th>" +
        "       <th>Registros sin Docuemto</th>" +
        "       <th>Registros sin Nombre</th>" +
        "       <th>Registros No Guardados</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in Obj_Chargue) {


        vl_Html += "    <tr id= 'Tr_Cliente_" + Obj_Chargue[ItemObj].Id + "'>" +
            "     <td>" + Obj_Chargue[ItemObj].Id + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadRegistros + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadRegistrosCreados + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadRegistrosActualizados + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadError_1 + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadError_2 + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadRegistros_NoInsertados + "</td>" +
            "   </tr>";

    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_Result_Chargue").html("");
    jQuery("#Grid_Result_Chargue").html(vl_Html);

    jQuery("#GridWork_Result").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    FormatStyle();
    ListUsers_Transaction();
}

//creacion de grid de cargue
function CreateGrid_DetailResult() {
    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><div class='col-xs-9 col-sm-9'><strong class='card-title'>Registros No Cargados<strong></div><div class='col-xs-3 col-sm-3''><button type='button'  class='btn btn-success btn-block Top' onclick='javascript:Descargar_Excel()'><i class='fa fa-download'></i>&nbsp;Descargar Excel</button></div></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork_DetailResult' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Nombre</th>" +
        "       <th>Apellido</th>" +
        "       <th>Cedula</th>" +
        "       <th>Descripción del error</th>" +
        "   </tr></thead><tbody>";


    for (ItemObj in Obj_ErrorChargue) {


        vl_Html += "    <tr id= 'Tr_Cliente_" + ItemObj + "'>" +
            "     <td>" + Obj_ErrorChargue[ItemObj].Nombre + "</td>" +
            "     <td>" + Obj_ErrorChargue[ItemObj].Apellido + "</td>" +
            "     <td>" + Obj_ErrorChargue[ItemObj].Documento + "</td>" +
            "     <td>" + Obj_ErrorChargue[ItemObj].Respuesta + "</td>" +
            "   </tr>";

    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_Result_DetailsChargue").html("");
    jQuery("#Grid_Result_DetailsChargue").html(vl_Html);

    jQuery("#GridWork_DetailResult").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    FormatStyle();
}

//visualiza el control para descargar de errorres en el cargue
function View_DetailChargue() {
    jQuery("#ModalViewDetail").modal("show");
}

//descargar archivo excel
function Descargar_Excel() {
    jQuery("#GridWork_DetailResult").dataTable({
        "bJQueryUI": true,
        "iDisplayLength": 100000000,
        "bDestroy": true
    });

    tableToExcel('GridWork_DetailResult', 'Detalle', "UsuariosNoCargados");
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

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//Cierra la sesion
function ListRol_Transaction() {
    var ObjData = [];

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListRoles",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjData = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(ObjData, "DListRol", "");
    });
}

//trae todos los usuarios de la empresa asignada
function ListUsers_Transaction() {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ListUsuarios_Campana"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjWork = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        CreateGrid();
    });
}

//valida el usuario creado si existe
function ValidaUser_Transaction() {
    var vl_flag;

    if (vg_FlagEdit == 0) {
        jQuery.ajax({
            url: "/Controller/GeneralTransaccion.aspx/ValidaUser",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            //crear json
            data: "{Documento:'" + jQuery("#TxtCedula").val() + "'}",
            //Transaccion Ajax en proceso
            success: function (result) {
                vl_flag = result.d.data[0].Respuesta;
            },
            error: function () {
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
            },
        }).done(function () {
            if (vl_flag == "") {
                Save_Transaccion();
            }
            else {
                Message("Alert", "¡Atencion!,El usuario ya existe en el sistema.");
            }
        });
    }
    else {
        Save_Transaccion();
    }

}

//activa o desactiva el usuario seleccionado
function Des_Activa_Transaction() {
    var vl_flag;
    var vl_Estado;

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ActiveInactiveUser",
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
                Message("Success", "El usuario se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ListUsers_Transaction();
                ModalForm(2);
                break;

            case "500":
                Message("Error", "Hubo errores al tratar de desactivar el usuario.", 5000);
                break;

            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}

//activa o desactiva el usuario seleccionado
function CambioPassword_Transaction(vp_Nombre, vp_Documento, vp_Correo) {
    var vl_flag;

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ActivacionCambioPassword",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ Nombre:'" + vp_Nombre +
            "',Documento: '" + vp_Documento +
            "',Correo:'" + vp_Correo + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
    }).done(function () {
        switch (vl_flag) {
            case "200":

                Message("Success", "Se ha realizado la activación de cambio de contraseña satisfactoriamente.", 5000);
                break;

            case "500":
                Message("Error", "Hubo errores al tratar de cambiar la contraseña.", 5000);
                break;

            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}

//ingresa los datos registrados
function Save_Transaccion() {
    var vl_flag;
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/CreateUser",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ TypeOperation:'" + vg_FlagEdit +
            "',CampanaId:'" + vg_CuentaId +
            "',Nombres:'" + jQuery("#TxtNombre").val().toUpperCase() +
            "',Apellidos:'" + jQuery("#TxtApellido").val().toUpperCase() +
            "',Correo:'" + jQuery("#TxtCorreo").val().toUpperCase() +
            "',Gestionable:'" + vg_flagGestion +
            "',Documento:'" + jQuery("#TxtCedula").val() +
            "',RolId:'" + jQuery("#DListRol").val() + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
    }).done(function () {
        switch (vl_flag) {
            case "200":
                var vl_conplementoMSM = (vg_FlagEdit == 0) ? "creado" : "actualizado";
                Message("Success", "El usuario se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ListUsers_Transaction();
                ModalForm(2);
                break;
            case "500":
                Message("Error", "Hubo errores al tratar de crear el usuario.", 5000);
                break;
            case "501":
                Message("Error", "Hubo errores al darle permisos sobre el cliente asignado.", 5000);
                break;
            case "502":
                Message("Error", "Hubo errores al darle permisos sobre los accesos en la empresa asignada.", 5000);
                break;
            case "503":
                Message("Error", "Hubo errores al tratar de actualizar el usuario.", 5000);
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




