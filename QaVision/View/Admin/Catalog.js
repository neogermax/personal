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
var vg_RutaTemporal = "/Repositorio/ImgClientes/";
var vg_NombreArchivo = "";

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {
    jQuery('#BSbtnsuccess').filestyle({
        iconName: 'glyphicon glyphicon-file',
        buttonName: 'btn-warning',
        buttonText: ' Seleccione una imagen'
    });
 }

//oculta campos para el proceso
function HideObject() {
    jQuery("#BlockForm").fadeOut('fast');
    jQuery("#btn_reg").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    DropLisCatalog_Transaction();
    ChangeControls();

    var vl_Parameters = Capture_GET();

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
            jQuery("#TxtNombreCampana").attr("disabled", false);

            jQuery("#TForm").html("Crear Campaña");

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

            jQuery("#TForm").html("Ver Campaña");

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

    (vl_Valida == 1) ? Message("Alert", "Revise por favor los campos obligatorios") : ValidaItem_Transaction();
}

//dispara el proceso de activacion o desactivacion del usuario
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

    var vl_Campo_1 = jQuery("#DListCatalog").val();
    var vl_Campo_2 = jQuery("#TxtNombre").val();

    var vl_Valida = 0;

    if (vl_Campo_1 == "-1" ||
        vl_Campo_2 == "" ||
        vg_Validador == 1) {

        vl_Valida = 1;

        if (vl_Campo_1 == "-1") { jQuery("#helpCatalog").html("* Catalogo Obligatorio"); jQuery("#helpCatalog").css("display", "block"); } else { jQuery("#helpCatalog").html(""); jQuery("#helpCliente").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpNombre").html("* Nombre Obligatorio"); jQuery("#helpNombre").css("display", "block"); } else { jQuery("#helpNombre").html(""); jQuery("#helpNombre").css("display", "none"); }

    }
    else {
        jQuery("#helpNombre").html("");
        jQuery("#helpNombre").css("display", "none");
        jQuery("#helpCatalog").html("");
        jQuery("#helpCatalog").css("display", "none");

    }

    return vl_Valida;
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ChangeControls() {

    jQuery("#DListCatalog").change(function () {
        vl_value = jQuery(this).val();

        DataCatalog_Transaction(vl_value);
    });
}

function Clear() {
    jQuery("#TxtNombre").val("");
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
        "<div class='card-header'><strong class='card-title'>Cuentas</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Nombre</th>" +
        "       <th>Estado</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {
        var vl_estado = (ObjWork[ItemObj].Activo == 1) ? "Activo" : "Desactivado";
        var vl_estadoColor = (ObjWork[ItemObj].Activo == 1) ? "#0EEA04" : "#F61313";

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
            "     <td>" + ObjWork[ItemObj].Nombre + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_estadoColor + "'>" + vl_estado + "</td>" +
            "     <td><div class='col-lg-3 col-md-3' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:InactivarGrid('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Activar - Desactivar</span></span></div>" +
             "      <div class='col-lg-3 col-md-3' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:EditarGrid('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div></td>" +
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
    jQuery("#TForm").html("Editar ");

    jQuery("#TxtNombre").val(ObjWork[vp_ObjIndex].Nombre);

}

//activar o desactivar item seleccionado
function InactivarGrid(vp_ObjIndex) {

    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;
    vg_EstadoUser = ObjWork[vp_ObjIndex].Activo;

    jQuery("#TxtNombreView").val(ObjWork[vp_ObjIndex].Nombre);
   
    var vl_MsnEstado = (ObjWork[vp_ObjIndex].Estado == 1) ? "Esta seguro de desactivar este Item?" : "Esta seguro de activar este Item?";
    jQuery("#LblMsmAdvertencia").html(vl_MsnEstado);

    jQuery("#ModalDesactivar").modal("show");
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GRID                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//Cierra la sesion
function DropLisCatalog_Transaction() {
    var ObjData = [];

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/DropListCatalogo",
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
        Carga_CatalogList(ObjData, "DListCatalog", "");
    });
}

function DataCatalog_Transaction(vp_index) {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListDataCatalogo",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{TablaId: '" + vp_index + "'}",
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

function GeneraCodigo(vp_index) {
    let acronym = vp_index.split(/\s/).reduce((response, Word) => response += Word.slice(0, 1), '')
    return acronym;
}

//valida el dato creado si existe
function ValidaItem_Transaction() {
    var vl_flag;
    var vl_TablaId = jQuery("#DListCatalog").val();
    var vl_Nombre = jQuery("#TxtNombre").val();

    if (vg_FlagEdit == 0) {
        jQuery.ajax({
            url: "/Controller/GeneralTransaccion.aspx/ValidaDato",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            //crear json
            data: "{TablaId: '" + vl_TablaId + "', Nombre: '" + vl_Nombre + "'}",
            //Transaccion Ajax en proceso
            success: function (result) {
                vl_flag = result.d.data[0].Respuesta;
            },
            error: function () {
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
            },
        }).done(function () {
            (vl_flag == 1) ? Message("Alert", "¡Disculpenos!, El dato ya existe en el sistema") : Save_Transaccion();
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
    var vl_TablaId = jQuery("#DListCatalog").val();

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ActiveInactiveDato",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ TypeOperation:'" + vg_FlagEdit +
            "',Activo:'" + vg_EstadoUser + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
            vl_Estado = result.d.data[0].Activo;
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

                DataCatalog_Transaction(vl_TablaId);
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


function Save_Transaccion() {
    var vl_flag;
    var codigo = GeneraCodigo(jQuery("#DListCatalog option:selected").html());
    var vl_conplementoMSM = "";
    var vl_TablaId = jQuery("#DListCatalog").val();

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/Create_Dato",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{TypeOperation:'" + vg_FlagEdit +
            "', TablaId: '" + jQuery("#DListCatalog").val() +
            "', Nombre: '" + jQuery("#TxtNombre").val() +
            "', Codigo: '" + codigo + "'}",
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
                 vl_conplementoMSM = (vg_FlagEdit == 0) ? "creado" : "actualizado";
                Message("Success", "El dato se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ModalForm(2);
                DataCatalog_Transaction(vl_TablaId);
                break;
            case "500":
                vl_conplementoMSM = (vg_FlagEdit == 0) ? "crear" : "actualizar";
                Message("Error", "Hubo errores al tratar de " + vl_conplementoMSM + " el dato.", 5000);
                break;
            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}