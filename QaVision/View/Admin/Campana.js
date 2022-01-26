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
var Obj_Process = [];
var Obj_AutorizarDash = [];
var Obj_Form = [];

var vg_FlagEdit = 0;
var vg_FlagEditPro = 0;
var vg_FlagPro = 0;

var vg_EstadoUser;
var vg_RutaTemporal = "/Repositorio/ImgClientes/";
var vg_NombreArchivo = "";

var vg_Valorfondo = "";
var vg_ValorTitlefondo = "";
var vg_ValorTituloControl = "";
var vg_ValorAlertControl = "";
var vg_flagGestionM = 0;

var vg_PagId_1_3 = 0;
var vg_Visible_1_3 = 0;
var vg_PagId_2_3 = 0;
var vg_Visible_2_3 = 0;
var vg_PagId_2_4 = 0;
var vg_Visible_2_4 = 0;
var vg_PagId_2_5 = 0;
var vg_Visible_2_5 = 0;
var vg_PagId_2_6 = 0;
var vg_Visible_2_6 = 0;
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

    ChangueControl();
}

//oculta campos para el proceso
function HideObject() {
    jQuery("#BlockForm").fadeOut('fast');
    jQuery("#btn_reg").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    ListClientes_Transaction();
    ListCampanas_Transaction();
    Cargue_Droplist("DListPeriodo", 2, "", "T", "X");

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
            jQuery("#BlockParemetrizacion").css("display", "none");

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

    (vl_Valida == 1) ? Message("Alert", "Revise por favor los campos obligatorios") : ValidaCampana_Transaction();
}

//dispara el proceso de activacion o desactivacion del Campana
function Btn_ActivarDesativar() {
    Des_Activa_Transaction();
}

//abre el modar para agregar procesos
function Btn_AddProccess() {
    jQuery("#ModalProccess").modal("show");
}

//agrega los procesos asignados a la campaña
function Btn_AddProceso() {
    if (jQuery("#TxtProceso").val() == "") {
        Message("Alert", "campo Nombre del proceso obligatorio", 5000);
    }
    else {
        var MSM = "";

        if (vg_FlagPro == 0) {
            MSM = "creado";

            var JSON = {
                "Id": 0,
                "Nombre": jQuery("#TxtProceso").val().toUpperCase(),
                "Campo_Add1": Obj_Data[0].IdCuenta,
                "TablaId": 8,
                "Activo": 1
            }

            Obj_Process.push(JSON);
        }
        else {
            MSM = "modificado";

            vg_FlagPro = 0;
            Obj_Process[vg_FlagEditPro].Nombre = jQuery("#TxtProceso").val().toUpperCase();
        }

        jQuery("#TxtProceso").val("");
        Message("Success", "El proceso se ha " + MSM + " satisfactoriamente.", 5000);
        CreateGridProcesos();
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//valida los campos del formulario
function ValidaCampos() {

    var vl_Campo_1 = jQuery("#DListCliente").val();
    var vl_Campo_2 = jQuery("#TxtNombre").val();
    var vl_Campo_3 = jQuery("#TxtCantidadMonitoreo").val();
    var vl_Campo_4 = jQuery("#DListPeriodo").val();

    var vl_Campo_5 = jQuery("#TxtRol1").val();
    var vl_Campo_6 = jQuery("#TxtRol2").val();
    var vl_Campo_7 = jQuery("#TxtRol3").val();
    var vl_Campo_8 = jQuery("#TxtRol4").val();
    var vl_Campo_9 = jQuery("#TxtRol5").val();
    var vl_Campo_10 = jQuery("#TxtRol6").val();

    var vl_Campo_11 = jQuery("#TxtEMAIL_FROM").val();
    var vl_Campo_12 = jQuery("#TxtSMTP").val();
    var vl_Campo_13 = jQuery("#TxtEMAIL_CONFIG").val();
    var vl_Campo_14 = jQuery("#TxtEMAIL_PASS").val();

    var vl_Campo_15 = jQuery("#TxtNivel_0").val();
    var vl_Campo_16 = jQuery("#TxtNivel_1").val();
    var vl_Campo_17 = jQuery("#TxtNivel_2").val();
    var vl_Campo_18 = jQuery("#TxtNivel_3").val();
    var vl_Campo_19 = jQuery("#TxtNivel_4").val();
    var vl_Valida = 0;

    if (vl_Campo_1 == "-1" ||
        vl_Campo_2 == "" ||
        vl_Campo_3 == "" ||
        vl_Campo_4 == "-1" ||
        vl_Campo_5 == "" ||
        vl_Campo_6 == "" ||
        vl_Campo_7 == "" ||
        vl_Campo_8 == "" ||
        vl_Campo_9 == "" ||
        vl_Campo_10 == "" ||
        vl_Campo_11 == "" ||
        vl_Campo_12 == "" ||
        vl_Campo_13 == "" ||
        vl_Campo_14 == "" ||
        vl_Campo_15 == "" ||
        vl_Campo_16 == "" ||
        vl_Campo_17 == "" ||
        vl_Campo_18 == "" ||
        vl_Campo_19 == "" ||
        vg_Valorfondo == "" ||
        vg_ValorTitlefondo == "" ||
        vg_ValorTituloControl == "" ||
        vg_ValorAlertControl == "" ||
        vg_Validador == 1) {

        vl_Valida = 1;

        if (vl_Campo_1 == "-1") { jQuery("#helpCliente").html("* Cliente Obligatorio"); jQuery("#helpCliente").css("display", "block"); } else { jQuery("#helpCliente").html(""); jQuery("#helpCliente").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpNombre").html("* Campaña Obligatorio"); jQuery("#helpNombre").css("display", "block"); } else { jQuery("#helpNombre").html(""); jQuery("#helpNombre").css("display", "none"); }
        if (vl_Campo_3 == "") { jQuery("#helpCantidadMonitoreo").html("* Cantidad Obligatorio"); jQuery("#helpCantidadMonitoreo").css("display", "block"); } else { jQuery("#helpCantidadMonitoreo").html(""); jQuery("#helpIntervaloHora").css("display", "none"); }
        if (vl_Campo_4 == "-1") { jQuery("#helpPeriodo").html("* Frecuencia Obligatorio"); jQuery("#helpPeriodo").css("display", "block"); } else { jQuery("#helpPeriodo").html(""); jQuery("#helpPeriodo").css("display", "none"); }
        if (vl_Campo_5 == "") { jQuery("#helpRol1").html("* Rol 1 Obligatorio"); jQuery("#helpRol1").css("display", "block"); } else { jQuery("#helpRol1").html(""); jQuery("#helpRol1").css("display", "none"); }
        if (vl_Campo_6 == "") { jQuery("#helpRol2").html("* Rol 2 Obligatorio"); jQuery("#helpRol2").css("display", "block"); } else { jQuery("#helpRol2").html(""); jQuery("#helpRol2").css("display", "none"); }
        if (vl_Campo_7 == "") { jQuery("#helpRol3").html("* Rol 3 Obligatorio"); jQuery("#helpRol3").css("display", "block"); } else { jQuery("#helpRol3").html(""); jQuery("#helpRol3").css("display", "none"); }
        if (vl_Campo_8 == "") { jQuery("#helpRol4").html("* Rol 4 Obligatorio"); jQuery("#helpRol4").css("display", "block"); } else { jQuery("#helpRol4").html(""); jQuery("#helpRol4").css("display", "none"); }
        if (vl_Campo_9 == "") { jQuery("#helpRol5").html("* Rol 5 Obligatorio"); jQuery("#helpRol5").css("display", "block"); } else { jQuery("#helpRol5").html(""); jQuery("#helpRol5").css("display", "none"); }
        if (vl_Campo_10 == "") { jQuery("#helpRol6").html("* Rol 6 Obligatorio"); jQuery("#helpRol6").css("display", "block"); } else { jQuery("#helpRol6").html(""); jQuery("#helpRol6").css("display", "none"); }
        if (vl_Campo_11 == "") { jQuery("#helpEMAIL_FROM").html("* Envio Obligatorio"); jQuery("#helpEMAIL_FROM").css("display", "block"); } else { jQuery("#helpEMAIL_FROM").html(""); jQuery("#helpEMAIL_FROM").css("display", "none"); }
        if (vl_Campo_12 == "") { jQuery("#helpSMTP").html("* SMTP Obligatorio"); jQuery("#helpSMTP").css("display", "block"); } else { jQuery("#helpSMTP").html(""); jQuery("#helpSMTP").css("display", "none"); }
        if (vl_Campo_13 == "") { jQuery("#helpEMAIL_CONFIG").html("* Configuración Obligatorio"); jQuery("#helpEMAIL_CONFIG").css("display", "block"); } else { jQuery("#helpEMAIL_CONFIG").html(""); jQuery("#helpEMAIL_CONFIG").css("display", "none"); }
        if (vl_Campo_14 == "") { jQuery("#helpEMAIL_PASS").html("* Contraseña Obligatorio"); jQuery("#helpEMAIL_PASS").css("display", "block"); } else { jQuery("#helpEMAIL_PASS").html(""); jQuery("#helpEMAIL_PASS").css("display", "none"); }
        if (vl_Campo_15 == "") { jQuery("#helpNivel_0").html("* Nivel 0 Obligatorio"); jQuery("#helpNivel_0").css("display", "block"); } else { jQuery("#helpNivel_0").html(""); jQuery("#helpNivel_0").css("display", "none"); }
        if (vl_Campo_16 == "") { jQuery("#helpNivel_1").html("* Nivel 1 Obligatorio"); jQuery("#helpNivel_1").css("display", "block"); } else { jQuery("#helpNivel_1").html(""); jQuery("#helpNivel_1").css("display", "none"); }
        if (vl_Campo_17 == "") { jQuery("#helpNivel_2").html("* Nivel 2 Obligatorio"); jQuery("#helpNivel_2").css("display", "block"); } else { jQuery("#helpNivel_2").html(""); jQuery("#helpNivel_2").css("display", "none"); }
        if (vl_Campo_18 == "") { jQuery("#helpNivel_3").html("* Nivel 3 Obligatorio"); jQuery("#helpNivel_3").css("display", "block"); } else { jQuery("#helpNivel_3").html(""); jQuery("#helpNivel_3").css("display", "none"); }
        if (vl_Campo_19 == "") { jQuery("#helpNivel_4").html("* Nivel 4 Obligatorio"); jQuery("#helpNivel_4").css("display", "block"); } else { jQuery("#helpNivel_4").html(""); jQuery("#helpNivel_4").css("display", "none"); }

        if (vg_Valorfondo == "") { jQuery("#helpColorBack").html("*Color Fondo Obligatorio"); jQuery("helpColorBack").css("display", "block"); } else { jQuery("#helpColorBack").html(""); jQuery("#helpColorBack").css("display", "none"); }
        if (vg_ValorTitlefondo == "") { jQuery("#helpColorHeaderTitle").html("*Color Titulo Obligatorio"); jQuery("helpColorHeaderTitle").css("display", "block"); } else { jQuery("#helpColorHeaderTitle").html(""); jQuery("#helpColorHeaderTitle").css("display", "none"); }
        if (vg_ValorTituloControl == "") { jQuery("#helpColorLabel").html("* Color Control Obligatorio"); jQuery("helpColorLabel").css("display", "block"); } else { jQuery("#helpColorLabel").html(""); jQuery("#helpColorLabel").css("display", "none"); }
        if (vg_ValorAlertControl == "") { jQuery("#helpColorAlerta").html("* Color Alerta Obligatorio"); jQuery("helpColorAlerta").css("display", "block"); } else { jQuery("#helpColorAlerta").html(""); jQuery("#helpColorAlerta").css("display", "none"); }
    }
    else {
        jQuery("#helpNombre").html("");
        jQuery("#helpNombre").css("display", "none");
        jQuery("#helpCliente").html("");
        jQuery("#helpCliente").css("display", "none");
        jQuery("#helpCantidadMonitoreo").html("");
        jQuery("#helpCantidadMonitoreo").css("display", "none");
        jQuery("#helpPeriodo").html("");
        jQuery("#helpPeriodo").css("display", "none");
        jQuery("#helpColorBack").html("");
        jQuery("#helpColorBack").css("display", "none");
        jQuery("#helpColorHeaderTitle").html("");
        jQuery("#helpColorHeaderTitle").css("display", "none");
        jQuery("#helpColorLabel").html("");
        jQuery("#helpColorLabel").css("display", "none");
        jQuery("#helpColorAlerta").html("");
        jQuery("#helpColorAlerta").css("display", "none");
        jQuery("#helpRol1").html("");
        jQuery("#helpRol1").css("display", "none");
        jQuery("#helpRol2").html("");
        jQuery("#helpRol2").css("display", "none");
        jQuery("#helpRol3").html("");
        jQuery("#helpRol3").css("display", "none");
        jQuery("#helpRol4").html("");
        jQuery("#helpRol4").css("display", "none");
        jQuery("#helpRol5").html("");
        jQuery("#helpRol5").css("display", "none");
        jQuery("#helpRol6").html("");
        jQuery("#helpRol6").css("display", "none");
        jQuery("#helpEMAIL_FROM").html("");
        jQuery("#helpEMAIL_FROM").css("display", "none");
        jQuery("#helpSMTP").html("");
        jQuery("#helpSMTP").css("display", "none");
        jQuery("#helpEMAIL_CONFIG").html("");
        jQuery("#helpEMAIL_CONFIG").css("display", "none");
        jQuery("#helpEMAIL_PASS").html("");
        jQuery("#helpEMAIL_PASS").css("display", "none");
        jQuery("#helpNivel_0").html("");
        jQuery("#helpNivel_0").css("display", "none");
        jQuery("#helpNivel_1").html("");
        jQuery("#helpNivel_1").css("display", "none");
        jQuery("#helpNivel_2").html("");
        jQuery("#helpNivel_2").css("display", "none");
        jQuery("#helpNivel_3").html("");
        jQuery("#helpNivel_3").css("display", "none");
        jQuery("#helpNivel_4").html("");
        jQuery("#helpNivel_4").css("display", "none");
    }

    return vl_Valida;
}

//evento de controles
function ChangueControl() {

    jQuery("#TxtColorBack").change(function () {
        vg_Valorfondo = jQuery(this).val();
        jQuery("#DivHeader").css("background", vg_Valorfondo);
    });

    jQuery("#TxtColorHeaderTitle").change(function () {
        vg_ValorTitlefondo = jQuery(this).val();
        jQuery("#DivHeader").css("color", vg_ValorTitlefondo);
    });

    jQuery("#TxtColorLabel").change(function () {
        vg_ValorTituloControl = jQuery(this).val();
        jQuery("#Txtejemplo").css("color", vg_ValorTituloControl);
    });

    jQuery("#TxtColorAlerta").change(function () {
        vg_ValorAlertControl = jQuery(this).val();
        jQuery("#helpColor1").css("color", vg_ValorAlertControl);
    });

    jQuery("#Check_Nivel_0M").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagGestionM = 1;
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagGestionM = 0;
        }
    });

    jQuery("#Check_Dash_Rol3").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            UpdatePermisosPag_Transaction(vg_PagId_1_3, 1);
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            UpdatePermisosPag_Transaction(vg_PagId_1_3, 0);
        }
    });

    jQuery("#Check_Dash_Rol3M").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_3, 1);
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_3, 0);
        }
    });

    jQuery("#Check_Dash_Rol4M").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_4, 1);
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_4, 0);
        }
    });

    jQuery("#Check_Dash_Rol5M").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_5, 1);
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_5, 0);
        }
    });

    jQuery("#Check_Dash_Rol6M").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_6, 1);
        } else {
            // Hacer algo si el checkbox ha sido deseleccionado
            UpdatePermisosPag_Transaction(vg_PagId_2_6, 0);
        }
    });
}

//limpia campos
function Clear() {
    jQuery("#TxtNombre").val("");
    jQuery("#TxtApellido").val("");
    jQuery("#TxtCantidadMonitoreo").val("");
    jQuery("#DListRol").val("-1").trigger('chosen:updated');
    jQuery("#DListPeriodo").val("-1").trigger('chosen:updated');

    jQuery("#TxtColorBack").val("#CCC");
    jQuery("#TxtColorHeaderTitle").val("#CCC");
    jQuery("#TxtColorLabel").val("#CCC");
    jQuery("#TxtColorAlerta").val("#CCC");

    vg_Valorfondo = "";
    vg_ValorTitlefondo = "";
    vg_ValorTituloControl = "";
    vg_ValorAlertControl = "";

    jQuery("#TxtRol1").val("ADMINISTRADOR");
    jQuery("#TxtRol2").val("SUPERVISOR MONITOR");
    jQuery("#TxtRol3").val("MONITOR");
    jQuery("#TxtRol4").val("COORDINADOR");
    jQuery("#TxtRol5").val("AGENTE");
    jQuery("#TxtRol6").val("CLIENTE");

    jQuery("#TxtEMAIL_FROM").val("");
    jQuery("#TxtSMTP").val("");
    jQuery("#TxtEMAIL_CONFIG").val("");
    jQuery("#TxtEMAIL_PASS").val("");

    document.getElementById("Check_Nivel_0M").checked = false;
    Obj_Process = [];
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
        "       <th>Cliente</th>" +
        "       <th>Campana</th>" +
        "       <th>Monitoreo</th>" +
        "       <th>Estado</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {
        var vl_estado = (ObjWork[ItemObj].Estado == 1) ? "Activo" : "Desactivado";
        var vl_estadoColor = (ObjWork[ItemObj].Estado == 1) ? "#0EEA04" : "#F61313";

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
            "     <td>" + ObjWork[ItemObj].Cliente + "</td>" +
            "     <td>" + ObjWork[ItemObj].Nombre + "</td>" +
            "     <td>" + ObjWork[ItemObj].CantidadMonitoreos + "  " + ObjWork[ItemObj].FrecuenciaMonitoreo + "</td>" +
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
    jQuery("#TForm").html("Editar Cuenta");

    jQuery("#DListCliente").val(ObjWork[vp_ObjIndex].ClienteId).trigger('chosen:updated');
    jQuery("#TxtNombre").val(ObjWork[vp_ObjIndex].Nombre);
    jQuery("#TxtCantidadMonitoreo").val(ObjWork[vp_ObjIndex].CantidadMonitoreos);
    jQuery("#DListPeriodo").val(ObjWork[vp_ObjIndex].FrecuenciaMonitoreoId).trigger('chosen:updated');

    jQuery("#TxtColorBack").val(ObjWork[vp_ObjIndex].ColorBack);
    jQuery("#TxtColorHeaderTitle").val(ObjWork[vp_ObjIndex].ColorHeaderTitle);
    jQuery("#TxtColorLabel").val(ObjWork[vp_ObjIndex].ColorLabel);
    jQuery("#TxtColorAlerta").val(ObjWork[vp_ObjIndex].ColorAlerta);

    jQuery("#TxtEMAIL_FROM").val(ObjWork[vp_ObjIndex].EMAIL_FROM);
    jQuery("#TxtSMTP").val(ObjWork[vp_ObjIndex].SMTP);
    jQuery("#TxtEMAIL_CONFIG").val(ObjWork[vp_ObjIndex].EMAIL_CONFIG);
    jQuery("#TxtEMAIL_PASS").val(ObjWork[vp_ObjIndex].EMAIL_PASS);

    vg_Valorfondo = ObjWork[vp_ObjIndex].ColorBack;
    vg_ValorTitlefondo = ObjWork[vp_ObjIndex].ColorHeaderTitle;
    vg_ValorTituloControl = ObjWork[vp_ObjIndex].ColorLabel;
    vg_ValorAlertControl = ObjWork[vp_ObjIndex].ColorAlerta;

    document.getElementById("Check_Nivel_0M").checked = (ObjWork[vp_ObjIndex].CoordinadorMonitorea == 1) ? true : false;

    jQuery("#IF_Visor").attr("src", vg_RutaTemporal + ObjWork[vp_ObjIndex].Logo);

    ListRolesCampana_Transaction(vg_FlagEdit);
    ListProcesoCampana_Transaction(vg_FlagEdit);
    ListFormularioCampana_Transaction(vg_FlagEdit);
    ListPermisoPaginaCampana_Transaction(vg_FlagEdit);

    jQuery("#BlockParemetrizacion").css("display", "block");
}

//activar o desactivar data grid seleccionada
function InactivarGrid(vp_ObjIndex) {
    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;
    vg_EstadoUser = ObjWork[vp_ObjIndex].Estado;

    jQuery("#TxtNombreView").val(ObjWork[vp_ObjIndex].Nombre + " " + ObjWork[vp_ObjIndex].Apellido);
    jQuery("#TxtNombreCampanaView").val(ObjWork[vp_ObjIndex].NombreCampana).attr("disabled", true);

    var vl_MsnEstado = (ObjWork[vp_ObjIndex].Estado == 1) ? "Esta seguro de desactivar este Campana?" : "Esta seguro de activar este Campana?";
    jQuery("#LblMsmAdvertencia").html(vl_MsnEstado);

    jQuery("#ModalDesactivar").modal("show");
}

//Crea la grilla de procesos
function CreateGridProcesos() {

    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>Procesos</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWorkPro' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Proceso</th>" +
        "       <th>Estado</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in Obj_Process) {
        var vl_estado = (Obj_Process[ItemObj].Activo == 1) ? "Activo" : "Desactivado";
        var vl_estadoColor = (Obj_Process[ItemObj].Activo == 1) ? "#0EEA04" : "#F61313";

        vl_Html += "    <tr id= 'Tr_Cliente_" + Obj_Process[ItemObj].Id + "'>" +
            "     <td>" + Obj_Process[ItemObj].Nombre + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_estadoColor + "'>" + vl_estado + "</td>" +
            "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:InactivarProceso('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Activar - Desactivar</span></span></div>" +
            "      <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:EditarProceso('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div></td>" +
            "   </tr>";
    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Container_GridProcesos").html("");
    jQuery("#Container_GridProcesos").html(vl_Html);


    jQuery("#GridWorkPro").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
}

//edita el proceso seleccionado
function EditarProceso(vp_Index) {

    vg_FlagEditPro = vp_Index;
    vg_FlagPro = 1;

    jQuery("#TxtProceso").val(Obj_Process[vp_Index].Nombre);
    jQuery("#ModalProccess").modal("show");
}

//inactiva el proceso seleccionado
function InactivarProceso(vp_Index) {
    var vl_estado = Obj_Process[vp_Index].Activo;

    if (vl_estado == 1) {
        Obj_Process[vp_Index].Activo = 0;
    }
    else {
        Obj_Process[vp_Index].Activo = 1;
    }

    CreateGridProcesos();
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//trae la lista de clientes
function ListClientes_Transaction() {
    var ObjData = [];

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/DropClientes",
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
        Carga_CatalogList(ObjData, "DListCliente", "");
    });
}

//trae todos los Campanas de la empresa asignada
function ListCampanas_Transaction() {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListCampanas",
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

//trae los roles de la campaña
function ListRolesCampana_Transaction(vp_campana) {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListRolCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Campana:'" + vp_campana + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjN_Rol = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery("#TxtRol1").val(ObjN_Rol[0].Nombre);
        jQuery("#TxtRol2").val(ObjN_Rol[1].Nombre);
        jQuery("#TxtRol3").val(ObjN_Rol[2].Nombre);
        jQuery("#TxtRol4").val(ObjN_Rol[3].Nombre);
        jQuery("#TxtRol5").val(ObjN_Rol[4].Nombre);
        jQuery("#TxtRol6").val(ObjN_Rol[5].Nombre);
    });
}

//trae los roles de la campaña
function ListProcesoCampana_Transaction(vp_campana) {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListProcesoCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Campana:'" + vp_campana + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Process = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        CreateGridProcesos();
    });
}

//trae los roles de la permisos de las paginas del dashboard
function ListPermisoPaginaCampana_Transaction(vp_campana) {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListPermisoPaginaCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Campana:'" + vp_campana + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_AutorizarDash = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery(Obj_AutorizarDash).each(function (ItemObj) {

            if (Obj_AutorizarDash[ItemObj].PaginaId == 1 &&
                Obj_AutorizarDash[ItemObj].ValueRol == 3) {
                vg_PagId_1_3 = Obj_AutorizarDash[ItemObj].Id;
                vg_Visible_1_3 = Obj_AutorizarDash[ItemObj].Visible;
            }

            if (Obj_AutorizarDash[ItemObj].PaginaId == 2 &&
                Obj_AutorizarDash[ItemObj].ValueRol == 3) {
                vg_PagId_2_3 = Obj_AutorizarDash[ItemObj].Id;
                vg_Visible_2_3 = Obj_AutorizarDash[ItemObj].Visible;
            }

            if (Obj_AutorizarDash[ItemObj].PaginaId == 2 &&
                Obj_AutorizarDash[ItemObj].ValueRol == 4) {
                vg_PagId_2_4 = Obj_AutorizarDash[ItemObj].Id;
                vg_Visible_2_4 = Obj_AutorizarDash[ItemObj].Visible;
            }

            if (Obj_AutorizarDash[ItemObj].PaginaId == 2 &&
                Obj_AutorizarDash[ItemObj].ValueRol == 5) {
                vg_PagId_2_5 = Obj_AutorizarDash[ItemObj].Id;
                vg_Visible_2_5 = Obj_AutorizarDash[ItemObj].Visible;
            }

            if (Obj_AutorizarDash[ItemObj].PaginaId == 2 &&
                Obj_AutorizarDash[ItemObj].ValueRol == 6) {
                vg_PagId_2_6 = Obj_AutorizarDash[ItemObj].Id;
                vg_Visible_2_6 = Obj_AutorizarDash[ItemObj].Visible;
            }

        }).promise().done(function () {
            document.getElementById("Check_Dash_Rol3").checked = (vg_Visible_1_3 == 1) ? true : false;
            document.getElementById("Check_Dash_Rol3M").checked = (vg_Visible_2_3 == 1) ? true : false;
            document.getElementById("Check_Dash_Rol4M").checked = (vg_Visible_2_4 == 1) ? true : false;
            document.getElementById("Check_Dash_Rol5M").checked = (vg_Visible_2_5 == 1) ? true : false;
            document.getElementById("Check_Dash_Rol6M").checked = (vg_Visible_2_6 == 1) ? true : false;
        });
    });
}

//trae los titulos de formulario de la campaña
function ListFormularioCampana_Transaction(vp_campana) {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListFormularioCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Campana:'" + vp_campana + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Form = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery("#TxtNivel_0").val(Obj_Form[0].Title_Nivel0);
        jQuery("#TxtNivel_1").val(Obj_Form[0].Title_Nivel1);
        jQuery("#TxtNivel_2").val(Obj_Form[0].Title_Nivel2);
        jQuery("#TxtNivel_3").val(Obj_Form[0].Title_Nivel3);
        jQuery("#TxtNivel_4").val(Obj_Form[0].Title_Nivel4);
    });
}

//valida el Campana creado si existe
function ValidaCampana_Transaction() {
    var vl_flag;
    if (vg_FlagEdit == 0) {

        jQuery.ajax({
            url: "/Controller/GeneralTransaccion.aspx/ValidaCampana",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            //crear json
            data: "{Campana:'" + jQuery("#TxtNombre").val().toLocaleUpperCase() +
                "', ClienteId: '" + jQuery("#DListCliente").val() + "'}",
            //Transaccion Ajax en proceso
            success: function (result) {
                vl_flag = result.d.data[0].Respuesta;
            },
            error: function () {
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
            },
        }).done(function () {
            if (vl_flag == 1) {
                Message("Alert", "¡Disculpenos!, La Cuenta ya existe en el sistema");
            }
            else {
                Save_Transaccion();
            }
        });
    }
    else {
        Save_Transaccion();
    }
}

//activa o desactiva el Campana seleccionado
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
                Message("Success", "El Campana se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ListUsers_Transaction();
                ModalForm(2);
                break;

            case "500":
                Message("Error", "Hubo errores al tratar de desactivar el Campana.", 5000);
                break;

            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}

//activa o desactiva el permiso del panel del dashboard
function UpdatePermisosPag_Transaction(vp_Id, vp_Opc) {
    var vl_flag;

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/UpdatePermisosPag",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ IdSelect:'" + vp_Id +
            "',Opcion:'" + vp_Opc + "'}",
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
                Message("Success", "Se actualizo el permiso satisfactoriamente.", 5000);
                break;

            case "500":
                Message("Error", "Hubo errores al tratar de desactivar el Campana.", 5000);
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

    var ListProcesos = [];
    var vl_lengthP = Obj_Process.length;

    ListProcesos = (vl_lengthP != 0) ? JSON.stringify(Obj_Process) : "VACIO";

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/CreateCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ TypeOperation:'" + vg_FlagEdit +
            "',Cliente:'" + jQuery("#DListCliente").val() +
            "',Nombre:'" + jQuery("#TxtNombre").val().toUpperCase() +
            "',CantidadMonitoreo:'" + jQuery("#TxtCantidadMonitoreo").val() +
            "',FrecuenciaMonitoreo:'" + jQuery("#DListPeriodo").val() +
            "',ColorBack:'" + vg_Valorfondo +
            "',ColorHeaderTitle:'" + vg_ValorTitlefondo +
            "',ColorLabel:'" + vg_ValorTituloControl +
            "',ColorAlerta:'" + vg_ValorAlertControl +
            "',Rol1:'" + jQuery("#TxtRol1").val() +
            "',Rol2:'" + jQuery("#TxtRol2").val() +
            "',Rol3:'" + jQuery("#TxtRol3").val() +
            "',Rol4:'" + jQuery("#TxtRol4").val() +
            "',Rol5:'" + jQuery("#TxtRol5").val() +
            "',Rol6:'" + jQuery("#TxtRol6").val() +
            "',Nivel0:'" + jQuery("#TxtNivel_0").val() +
            "',Nivel1:'" + jQuery("#TxtNivel_1").val() +
            "',Nivel2:'" + jQuery("#TxtNivel_2").val() +
            "',Nivel3:'" + jQuery("#TxtNivel_3").val() +
            "',Nivel4:'" + jQuery("#TxtNivel_4").val() +
            "',CoordinadorMonitorea:'" + vg_flagGestionM +
            "',Logo:'" + vg_NombreArchivo.toUpperCase() +
            "',EmailFrom:'" + jQuery("#TxtEMAIL_FROM").val() +
            "',Smtp:'" + jQuery("#TxtSMTP").val() +
            "',EmailConfig:'" + jQuery("#TxtEMAIL_CONFIG").val() +
            "',EmailPass:'" + jQuery("#TxtEMAIL_PASS").val() +
            "',ListProcesos:'" + ListProcesos + "'}",
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
                Message("Success", "El Campana se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                ListCampanas_Transaction();
                ModalForm(2);
                break;
            case "500":
                Message("Error", "Hubo errores al tratar de crear el Campana.", 5000);
                break;
            case "501":
                Message("Error", "Hubo errores al darle permisos sobre el cliente asignado.", 5000);
                break;
            case "502":
                Message("Error", "Hubo errores al darle permisos sobre los accesos en la empresa asignada.", 5000);
                break;
            case "503":
                Message("Error", "Hubo errores al tratar de actualizar el Campana.", 5000);
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




