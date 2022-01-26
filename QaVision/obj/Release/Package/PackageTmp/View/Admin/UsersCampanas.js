/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];
var ObjUserCuentas = [];
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
    ListRol_Transaction();

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

//valida y asigna al usuario las campañas asignadas
function Btn_AddCampanas() {

    var vl_Campanas = jQuery("#DListSelectCampanaAdd").val();
    var vl_Rol = jQuery("#DListRol").val();

    if (vl_Campanas == "-1" ||
        vl_Rol  == "-1") {
        Message("Error", "¡Debe seleccionar empresa y rol!", 5000, "Campos Obligatorios");
    }
    else {
        console.log(vl_Campanas.length);
        var vl_Msn = "";
        for (var item = 0; item < vl_Campanas.length; item++) {
            var vl_Flag = 0;
            var vl_compare = vl_Campanas[item];

            for (var ObjI in ObjUserCuentas) {
                if (ObjUserCuentas[ObjI].CuentaId == vl_compare) {
                    vl_Flag = 1;
                    vl_Msn += ObjUserCuentas[ObjI].Campana + ", ";
                    break;
                }
            }

            if (vl_Flag == 0) {
                Save_CampanaUser_Transaction(vl_compare, jQuery("#DListRol").val());
            }
            else {
                console.log("repetido: " + vl_Msn);
            }
        }
        if (vl_Msn == "") {
            Message("Success", "La cuenta se asigno satisfactoriamente.", 5000);
        }
        else {
            Message("Info", "La cuenta se asigno satisfactoriamente, con la anotacion que la siguiente cuenta ya estaba asignada (" + vl_Msn + ")", 7000);
        }
        setTimeout(function () { DataUserCampana(vg_usuarioId); }, 1000);
        jQuery("#ModalAddCampanas").modal("hide");
    }
}

//dispara el proceso de activacion o desactivacion del Aplicacion
function Btn_ActivarDesativar() {
    Des_Activa_Transaction();
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
        "<div class='card-header'><div class='col-xs-8 col-sm-8'><strong class='card-title'>Cuentas asignadas a " + vp_Nombre + "</strong></div><div class='col-xs-4 col-sm-4'><button type='button'  class='btn btn-success btn-block Top' onclick='javascript:View_AddCampanas()'><i class='fa fa-plus-square'></i>&nbsp;Asignar Cuentas</button></div></div>" +
        "<div class='card-body'>" +
        "   <table id='GridCampanaUser' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Cuenta </th>" +
        "       <th>Perfil</th>" +
        "       <th>Estado</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjUserCuentas) {
        var vl_estado = (ObjUserCuentas[ItemObj].Estado == 1) ? "Activo" : "Desactivado";
        var vl_estadoColor = (ObjUserCuentas[ItemObj].Estado == 1) ? "#0EEA04" : "#F61313";

        vl_Html += "    <tr id= 'Tr_Aplicacion_" + ObjUserCuentas[ItemObj].Id + "'>" +
            "     <td>" + ObjUserCuentas[ItemObj].Campana + "</td>" +
            "     <td>" + ObjUserCuentas[ItemObj].Rol + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_estadoColor + "'>" + vl_estado + "</td>" +
            "     <td><div class='col-lg-6 col-md-6' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:InactivarGrid('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Activar - Desactivar</span></span></div></td>" +
            "   </tr>";
    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_CampanaUser").html("");
    jQuery("#Grid_CampanaUser").html(vl_Html);

    jQuery("#GridCampanaUser").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
}

//visualiza el control para la asignacion de las campañas
function View_AddCampanas() {
    jQuery("#ModalAddCampanas").modal("show");
}

//activar o desactivar data grid seleccionada
function InactivarGrid(vp_ObjIndex) {
    vg_FlagEdit = ObjUserCuentas[vp_ObjIndex].Id;
    vg_EstadoUser = ObjUserCuentas[vp_ObjIndex].Estado;

    jQuery("#TxtNombreView").val(ObjUserCuentas[vp_ObjIndex].Campana);

    var vl_MsnEstado = (ObjUserCuentas[vp_ObjIndex].Estado == 1) ? "Esta seguro de desasignar esta cuenta al usuario?" : "Esta seguro de asignar esta cuenta al usuario?";
    jQuery("#LblMsmAdvertencia").html(vl_MsnEstado);

    jQuery("#ModalDesactivar").modal("show");
}

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
            "     <td>" + ObjUsers[ItemObj].Nombre + " " + ObjUsers[ItemObj].Apellido +  "</td>" +
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
        Carga_CatalogList(Obj_Campana, "DListSelectCampanaAdd", "", "X");
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
        url: "/Controller/GeneralTransaccion.aspx/DataUserCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{UsuarioId: " + vp_index + "}",
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjWork = result.d.data;
            ObjUserCuentas = result.d.campanasAsigned;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery("#BlockDataUser").show('slow');
        AsignarData();
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
            ObjUsers =  JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        CreateGrid();
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




