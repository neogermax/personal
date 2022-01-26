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
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {
}

//oculta campos para el proceso
function HideObject() {
    jQuery("#BlockForm").fadeOut('fast');
    jQuery("#btn_reg").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    var vl_Parameters = Capture_GET();
    ListClientes_Transaction();


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
            jQuery("#TxtNombreCliente").attr("disabled", false);

            jQuery("#TForm").html("Crear Cliente");

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

            jQuery("#TForm").html("Ver Clientes");

            jQuery("#BlockForm").fadeOut('fast');
            jQuery("#BlockView").show('slow');
            jQuery("#btn_cre").show('slow');
            jQuery("#btn_reg").fadeOut('fast');
            break;
    }
}

//activa el proceso de guardado
function Btn_Save() {
    var vl_Valida = ValidaCampos();

    (vl_Valida == 1) ? Message("Alert", "Revise por favor los campos obligatorios") : ValidaCliente_Transaction();
}

//dispara el proceso de activacion o desactivacion del Cliente
function Btn_ActivarDesativar() {
    Des_Activa_Transaction();
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
    var vl_Campo_2 = jQuery("#TxtNit").val();
    
    var vl_Valida = 0;

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "" ||
        vg_Validador == 1) {

        vl_Valida = 1;

        if (vl_Campo_1 == "") { jQuery("#helpNombre").html("* Nombre Obligatorio"); jQuery("#helpNombre").css("display", "block"); } else { jQuery("#helpNombre").html(""); jQuery("#helpNombre").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpNit").html("* Nit Obligatorio"); jQuery("#helpNit").css("display", "block"); } else { jQuery("#helpNit").html(""); jQuery("#helpNit").css("display", "none"); }
    }
    else {
        jQuery("#helpNombre").html("");
        jQuery("#helpNombre").css("display", "none");
        jQuery("#helpNit").html("");
        jQuery("#helpNit").css("display", "none");
    }

    return vl_Valida;
}


//limpia campos
function Clear() {
    jQuery("#TxtNombre").val("");
    jQuery("#TxtNit").val("");
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
        "<div class='card-header'><strong class='card-title'>Clientes</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Nombre</th>" +
        "       <th>Nit</th>" +
        "       <th>Estado</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {
        var vl_estado = (ObjWork[ItemObj].Estado == 1) ? "Activo" : "Desactivado";
        var vl_estadoColor = (ObjWork[ItemObj].Estado == 1) ? "#0EEA04" : "#F61313";

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
            "     <td>" + ObjWork[ItemObj].Nombre + "</td>" +
            "     <td>" + ObjWork[ItemObj].Nit + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_estadoColor + "'>" + vl_estado + "</td>" +
            "     <td><div class='col-lg-6 col-md-6' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:EditarGrid('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div></td>" +
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
    jQuery("#TForm").html("Editar Cliente");

    jQuery("#TxtNombre").val(ObjWork[vp_ObjIndex].Nombre);
    jQuery("#TxtNit").val(ObjWork[vp_ObjIndex].Nit);
 }

//activar o desactivar data grid seleccionada
function InactivarGrid(vp_ObjIndex) {
    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;
    vg_EstadoUser = ObjWork[vp_ObjIndex].Estado;

    jQuery("#TxtNombreView").val(ObjWork[vp_ObjIndex].Nombre + " " + ObjWork[vp_ObjIndex].Apellido);

    var vl_MsnEstado = (ObjWork[vp_ObjIndex].Estado == 1) ? "Esta seguro de desactivar este Cliente?" : "Esta seguro de activar este Cliente?";
    jQuery("#LblMsmAdvertencia").html(vl_MsnEstado);

    jQuery("#ModalDesactivar").modal("show");
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

//trae todos los Clientes 
function ListClientes_Transaction() {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListClientes",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjWork = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        CreateGrid();
    });
}

//valida el Cliente creado si existe
function ValidaCliente_Transaction() {
    var vl_flag;
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ValidaCliente",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ Cliente: '" + jQuery("#TxtNombre").val().toLocaleUpperCase() + "' }",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        if (vl_flag == 1) {
            if (vg_FlagEdit != 0) {
                Save_Transaccion();
            }
            else {
                Message("Alert", "¡Disculpenos!, El cliente ya existe en el sistema");
            }
        }
        else {
            Save_Transaccion();
        }
    });
}

//activa o desactiva el Cliente seleccionado
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
                Message("Success", "El Cliente se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ListUsers_Transaction();
                ModalForm(2);
                break;

            case "500":
                Message("Error", "Hubo errores al tratar de desactivar el Cliente.", 5000);
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
        url: "/Controller/GeneralTransaccion.aspx/CreateClientes",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ TypeOperation:'" + vg_FlagEdit +
            "', Nombre:'" + jQuery("#TxtNombre").val().toUpperCase() +
            "', Nit:'" + jQuery("#TxtNit").val() + "'}",
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
                Message("Success", "El Cliente se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ListClientes_Transaction();
                ModalForm(2);
                break;
            case "500":
                Message("Error", "Hubo errores al tratar de crear el Cliente.", 5000);
                break;
            case "501":
                Message("Error", "Hubo errores al darle permisos sobre el cliente asignado.", 5000);
                break;
            case "502":
                Message("Error", "Hubo errores al darle permisos sobre los accesos en la empresa asignada.", 5000);
                break;
            case "503":
                Message("Error", "Hubo errores al tratar de actualizar el Cliente.", 5000);
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




