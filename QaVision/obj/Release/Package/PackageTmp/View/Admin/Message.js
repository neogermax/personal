/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];
var ObjN_Rol = [];

var vg_FlagEdit = 0;
var vg_EstadoUser;
var vg_RutaTemporal = "/Repositorio/ImgClientes/";
var vg_NombreArchivo = "";

var vg_Valorfondo = "";
var vg_ValorTitlefondo = "";
var vg_ValorTituloControl = "";
var vg_ValorAlertControl = "";
var vg_flagGestionM = 0;
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {

    jQuery(document).ready(function () {
        jQuery("#txtEditor").Editor();
    });
    //ChangueControl();
}

//oculta campos para el proceso
function HideObject() {
    jQuery("#BlockForm").fadeOut('fast');
    jQuery("#btn_reg").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    ListMensajes_Transaction();

    var vl_Parameters = Capture_GET();

    if (vl_Parameters !== undefined) {
        CapturaVariables(vl_Parameters);
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION BOTONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ModalForm(vp_index) {
    switch (vp_index) {
        case 1:
            jQuery("#TxtNombreCampana").attr("disabled", false);

            jQuery("#TForm").html("Crear Mensaje");

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

            jQuery("#TForm").html("Ver Mensaje");

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

    (vl_Valida == 1) ? Message("Alert", "Revise por favor los campos obligatorios") : Save_Transaction();
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
    var vl_Campo_2 = jQuery("#textareaCuerpoMensaje_Interno").val();
    var vl_Campo_3 = jQuery("#TxtUrl").val();
    
    var vl_Valida = 0;

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "" ||
        vl_Campo_3 == "" ||
        vg_Validador == 1) {

        vl_Valida = 1;

        if (vl_Campo_1 == "") { jQuery("#helpNombre").html("* Titulo Obligatorio"); jQuery("#helpNombre").css("display", "block"); } else { jQuery("#helpNombre").html(""); jQuery("#helpNombre").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpCuerpoMensaje_Interno").html("* cuerpo mensaje Obligatorio"); jQuery("#helpCuerpoMensaje_Interno").css("display", "block"); } else { jQuery("#helpCuerpoMensaje_Interno").html(""); jQuery("#helpCuerpoMensaje_Interno").css("display", "none"); }
        if (vl_Campo_3 == "") { jQuery("#helpUrl").html("* Url Obligatorio"); jQuery("#helpUrl").css("display", "block"); } else { jQuery("#helpUrl").html(""); jQuery("#helpUrl").css("display", "none"); }
    }
    else {
        jQuery("#helpNombre").html("");
        jQuery("#helpNombre").css("display", "none");
        jQuery("#helpNit").html("");
        jQuery("#helpNit").css("display", "none");
    }

    return vl_Valida;
}

//lipier campos
function Clear() {
    jQuery("#TxtNombre").val("");
    jQuery("#textareaCuerpoMensaje_Interno").val("");
    jQuery("#TxtUrl").val("");
    jQuery(".Editor-editor").html("");
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
        "       <th>Tipo Mensaje</th>" +
        "       <th>Mensaje interno</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {
     
        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
            "     <td>" + ObjWork[ItemObj].TipoMensaje + "</td>" +
            "     <td>" + ObjWork[ItemObj].CuerpoMensaje_Interno + "</td>" +
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
    jQuery("#TForm").html("Editar Mensaje");

    jQuery("#TxtNombre").val(ObjWork[vp_ObjIndex].TipoMensaje);
    jQuery("#textareaCuerpoMensaje_Interno").val(ObjWork[vp_ObjIndex].CuerpoMensaje_Interno);
    jQuery("#TxtUrl").val(ObjWork[vp_ObjIndex].Url);
    jQuery(".Editor-editor").html(ObjWork[vp_ObjIndex].CuerpoMensaje);
}


/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//trae todos los Clientes 
function ListMensajes_Transaction() {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "List_Mensajes"
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

//ingresa los datos registrados
function Save_Transaction() {
    var vl_flag;
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/CreateMensaje",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ TypeOperation:'" + vg_FlagEdit +
            "', Titulo:'" + jQuery("#TxtNombre").val() +
            "', CuerpoMensaje_Interno:'" + jQuery("#textareaCuerpoMensaje_Interno").val() +
            "', Url:'" + jQuery("#TxtUrl").val() +
            "', CuerpoMensaje:'" + jQuery(".Editor-editor").html().toString() + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function (result) {
            vl_flag = result;
        },
    }).done(function () {
        switch (vl_flag) {
            case "200":
                var vl_conplementoMSM = (vg_FlagEdit == 0) ? "creado" : "actualizado";
                Message("Success", "El Mensaje se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ListMensajes_Transaction();
                ModalForm(2);
                break;
            case "500":
                Message("Error", "Hubo errores al tratar de crear el Mensaje.", 5000);
                break;
            case "503":
                Message("Error", "Hubo errores al tratar de actualizar el Mensaje.", 5000);
                break;
            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}
