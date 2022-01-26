jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];
var ObjNivel_0 = []; //cargos
var ObjNivel_1 = []; //evaluacion
var ObjNivel_2 = []; //notas
var ObjNivel_3 = []; //Puntos
var ObjNivel_4 = []; //Focos
var ObjConfig = [];
var Obj_Form = [];
var Obj_Colors = [];
var Obj_Colors_N2 = [];

var vg_FlagEdit = 0;
var vg_flagCargo = 0;
var vg_FlagEditCargo = 0;
var vg_EditFormulario = 0;
var vg_FlagEditEvaluacion = 0;
var vg_FlagEditNotas = 0;
var vg_FlagEditPunto = 0;
var vg_FlagEditFoco = 0;
var vg_FlagEditConfiguracion = 0;

var vg_Modulo = 0;
var vg_DeleteId = 0;

var vg_AplicaVarios = 0;
var vg_AplicaNA = 0;
var vg_AplicaEC = 0;

var vg_Check_N0 = 0;
var vg_Check_N1 = 0;
var vg_Check_N2 = 0;
var vg_Check_N3 = 0;
var vg_Check_N4 = 0;
var vg_OpcC = 0;
var vg_OpcNC = 0;
var vg_OpcNA = 0;
var vg_SelectMonitoreo = "";
var vg_flagErrorCritico = 2;
var vg_flagPesoPonderado = 2;

var vg_EstadoCargo = 0;
var vg_flagAplicaValoracion_N0 = 0;
var vg_flagAplicaValoracion_N1 = 0;
var vg_flagAplicaValoracion_N2 = 0;
var vg_flagAplicaValoracion_N3 = 0;
var vg_flagAplicaValoracion_N4 = 0;

var vg_flag_N5 = 0;
var vg_RutaTemporal = "/Repositorio/Carga/";
var vg_formularioId = 0;

var vg_Title_N0 = "Cargo";
var vg_Title_N1 = "B. Evaluación";
var vg_Title_N2 = "Notas Des.";
var vg_Title_N3 = "Puntos Ent";
var vg_Title_N4 = "Foco de Mejora";

var vg_EstadoFormulario = 0;
var vg_ContPag = 1;
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

    jQuery("#DListErrores").attr("disabled", true);

    document.body.addEventListener("keydown", function (ev) {

        // function to check the detection
        ev = ev || window.event; // Event object 'ev'
        var key = ev.which || ev.keyCode; // Detecting keyCode

        // Detecting Ctrl
        var ctrl = ev.ctrlKey ? ev.ctrlKey : ((key === 17)
            ? true : false);

        // If key pressed is ctrl + tecla.
        if (key == 40 && ctrl) {
            // abajo + ctrl
            jQuery("#ModalFormEliminar").modal("show");
        }


    }, false);

}

//oculta campos para el proceso
function HideObject() {
    jQuery("#BlockForm").fadeOut('fast');
    jQuery("#btn_reg").fadeOut('fast');
    jQuery("#Block_C_Masive").fadeOut('fast');
    jQuery("#Block_C_Manual").fadeOut('fast');
    jQuery("#BlockListCargo").fadeOut('fast');
    jQuery("#BlockContCargo").fadeOut('fast');
    jQuery("#BlockAddCargo").fadeOut('fast');
    jQuery("#BlockCheck_N0").fadeOut('fast');

    jQuery("#BlockPuntos").fadeOut('fast');
    jQuery("#BlockNotas").fadeOut('fast');
    jQuery("#BlockCheck_N4").fadeOut('fast');
    jQuery("#Block_NA").fadeOut('fast');
    jQuery(".DownButton").fadeOut('fast');
    jQuery(".DownUp").fadeOut('fast');

    jQuery("#Block_N3_PP").fadeOut('fast');
    jQuery("#Block_N3_EC").fadeOut('fast');
    jQuery("#BlockPonderado_N3").fadeOut('fast');


}

//inicia la pagina si esta autorizada
function PageLoad() {
    var vl_Parameters = Capture_GET();
    ListFormularioCampana_Transaction();

    ChangueControl();
    Cargue_Droplist("DListErrores", 11, "120", "T", "X");
    Cargue_Droplist("DListErrores_1", 11, "120", "T", "X");

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

            jQuery("#TForm").html("Crear formulario");

            jQuery("#BlockForm").css('display', 'block');
            jQuery("#btn_reg").css('display', 'block');

            jQuery("#BlockView").fadeOut('fast');
            jQuery("#BlockForm").show('slow');
            jQuery("#btn_reg").show('slow');
            jQuery("#btn_cre").fadeOut('fast');
            break;
        case 2:
            vg_FlagEdit = 0;

            Clear(6);
            jQuery("#TForm").html("Ver formularios");
            jQuery("#BlockForm").fadeOut('fast');
            jQuery("#BlockView").show('slow');
            jQuery("#btn_cre").show('slow');
            jQuery("#btn_reg").fadeOut('fast');
            jQuery("#btn_CreManmual").css("display", "block");
            ListFormulariosGrid();
            jQuery(".DownButton").fadeOut('fast');
            jQuery(".DownUp").fadeOut('fast');

            break;
    }
}

//muestra el bloque de creacion seleccionado
function ModalFormCreate(vp_index) {
    switch (vp_index) {
        case 1:
            jQuery("#Block_C_Masive").fadeOut('fast');
            jQuery("#Block_C_Manual").show('slow');

            if (vg_FlagEdit == 0) {
                jQuery("#ModalStart").modal('show');
            }

            break;
        case 2:
            jQuery("#Block_C_Manual").fadeOut('fast');
            jQuery("#Block_C_Masive").show('slow');
            break;
    }
}

//crear formulario
function Btn_CreateFormulario() {
    var vl_Campo_1 = jQuery("#TxtDescripcionForm").val();
    var vl_Campo_2 = jQuery("#TxtvalForm").val();

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "") {
        Message("Error", "Debe diligenciar el campo descripción del formulario.", 4000);
        if (vl_Campo_1 == "") { jQuery("#helpDescripcionForm").html("* Descripción Obligatorio"); jQuery("#helpDescripcionForm").css("display", "block"); } else { jQuery("#helpDescripcionForm").html(""); jQuery("#helpDescripcionForm").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpvalForm").html("* Valor Obligatorio"); jQuery("#helpvalForm").css("display", "block"); } else { jQuery("#helpvalForm").html(""); jQuery("#helpvalForm").css("display", "none"); }

    }
    else {
        jQuery("#helpDescripcionForm").html("");
        jQuery("#helpDescripcionForm").css("display", "none");
        jQuery("#helpvalForm").html("");
        jQuery("#helpvalForm").css("display", "none");

        CreateFormulario_Transaction();
    }
}

//dispara evento de creacion de nivel 0
function Btn_Agrega_N0() {
    var vl_Campo_1 = jQuery("#TxtDescripcion").val();
    var vl_Campo_2 = jQuery("#TxtPeso_N0").val();


    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "") {
        Message("Error", "Debe diligenciar el campo descripción del cargo.", 4000);

        if (vl_Campo_1 == "") { jQuery("#helpDescripcion").html("* Descripción Obligatorio"); jQuery("#helpDescripcion").css("display", "block"); } else { jQuery("#helpDescripcion").html(""); jQuery("#helpDescripcion").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpPesoCargo").html("* Peso Obligatorio"); jQuery("#helpPesoCargo").css("display", "block"); } else { jQuery("#helpPesoCargo").html(""); jQuery("#helpPesoCargo").css("display", "none"); }
    }
    else {
        jQuery("#helpDescripcion").html("");
        jQuery("#helpDescripcion").css("display", "none");
        jQuery("#helpPesoCargo").html("");
        jQuery("#helpPesoCargo").css("display", "none");
        Create_N0_Transaction();
    }
}

//dispara el evento de creacion de nivel 1
function Btn_Agrega_N1() {
    var vl_Campo_1 = jQuery("#TxtDescripcion_N1").val();
    var vl_Campo_2 = jQuery("#TxtPeso_N1").val();
    var vl_Campo_3 = (vg_flagCargo == 0) ? 0 : jQuery("#DList_Nivel_0").val();

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "" ||
        vl_Campo_3 == "-1") {

        Message("Error", "Debe diligenciar los campos del bloque de evaluación.", 4000);
        if (vl_Campo_1 == "") { jQuery("#helpDescripcion_N1").html("* B. Evaluación Obligatorio"); jQuery("#helpDescripcion_N1").css("display", "block"); } else { jQuery("#helpDescripcion_N1").html(""); jQuery("#helpDescripcion_N1").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpPeso_N1").html("* Peso Obligatorio"); jQuery("#helpPeso_N1").css("display", "block"); } else { jQuery("#helpPeso_N1").html(""); jQuery("#helpPeso_N1").css("display", "none"); }
        if (vl_Campo_3 == "-1") { jQuery("#help_N0").html("* Cargo Obligatorio"); jQuery("#help_N0").css("display", "block"); } else { jQuery("#help_N0").html(""); jQuery("#help_N0").css("display", "none"); }

    }
    else {
        jQuery("#helpDescripcion_N1").html("");
        jQuery("#helpDescripcion_N1").css("display", "none");
        jQuery("#helpPeso_N1").html("");
        jQuery("#helpPeso_N1").css("display", "none");
        jQuery("#help_N0").html("");
        jQuery("#help_N0").css("display", "none");

        Create_N1_Transaction();
    }
}

//dispara el evento de creacion de nivel 2
function Btn_Agrega_N2() {
    var CampoAdd = 0;

    var vl_Campo_1 = jQuery("#TxtDescripcion_N2").val();
    var vl_Campo_2 = jQuery("#TxtPeso_N2").val();
    var vl_Campo_3 = jQuery("#DList_Nivel_1").val();

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "" ||
        vl_Campo_3 == "-1") {
        CampoAdd = 1;

        Message("Error", "Debe diligenciar los campos del bloque de Notas.", 4000);
        if (vl_Campo_1 == "") { jQuery("#helpDescripcion_N2").html("* B. Notas Obligatorio"); jQuery("#helpDescripcion_N2").css("display", "block"); } else { jQuery("#helpDescripcion_N2").html(""); jQuery("#helpDescripcion_N2").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpPeso_N2").html("* Peso Obligatorio"); jQuery("#helpPeso_N2").css("display", "block"); } else { jQuery("#helpPeso_N2").html(""); jQuery("#helpPeso_N2").css("display", "none"); }
        if (vl_Campo_3 == "-1") { jQuery("#help_N1").html("* Notas Obligatorio"); jQuery("#help_N1").css("display", "block"); } else { jQuery("#help_N1").html(""); jQuery("#help_N1").css("display", "none"); }

    }
    else {
        jQuery("#helpDescripcion_N2").html("");
        jQuery("#helpDescripcion_N2").css("display", "none");
        jQuery("#helpPeso_N2").html("");
        jQuery("#helpPeso_N2").css("display", "none");
        jQuery("#help_N1").html("");
        jQuery("#help_N1").css("display", "none");
    }

    if (vg_flagErrorCritico == 2) {
        var vl_Campo_4 = jQuery("#DListErrores_1").val();

        if (vl_Campo_4 == "-1") {
            if (vl_Campo_4 == "-1") { jQuery("#helpErrores_1").html("* Error Critico Obligatorio"); jQuery("#helpErrores_1").css("display", "block"); } else { jQuery("#helpErrores_1").html(""); jQuery("#helpErrores_1").css("display", "none"); }
            Message("Error", "Debe diligenciar los campos del bloque de Notas.", 4000);
            CampoAdd = 1;
        }
        else {
            jQuery("#helpErrores_1").html("");
            jQuery("#helpErrores_1").css("display", "none");
        }
    }

    if (vg_flagPesoPonderado == 2) {
        var vl_Campo_5 = jQuery("#TxtPeso_PP2").val();

        if (vl_Campo_5 == "") {
            if (vl_Campo_5 == "") { jQuery("#helpPeso_PP2").html("* Peso Ponderado Obligatorio"); jQuery("#helpPeso_PP2").css("display", "block"); } else { jQuery("#helpPeso_PP2").html(""); jQuery("#helpPeso_PP2").css("display", "none"); }
            Message("Error", "Debe diligenciar los campos del bloque de Notas.", 4000);
            CampoAdd = 1;
        }
        else {
            jQuery("#helpPeso_PP2").html("");
            jQuery("#helpPeso_PP2").css("display", "none");
        }
    }

    if (CampoAdd == 0) {
        Create_N2_Transaction();
    }

}

//dispara evento de creacion Nivel 3
function Btn_Agrega_N3() {
    var CampoAdd = 0;

    var vl_Campo_1 = jQuery("#TxtDescripcion_N3").val();
    var vl_Campo_2 = jQuery("#TxtPeso_N3").val();
    var vl_Campo_3 = jQuery("#DList_Nivel_2").val();

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "" ||
        vl_Campo_3 == "-1") {
        CampoAdd = 1;

        Message("Error", "Debe diligenciar los campos del bloque de Punto de entrenamiento.", 4000);
        if (vl_Campo_1 == "") { jQuery("#helpDescripcion_N3").html("* B. Puntos Ent Obligatorio"); jQuery("#helpDescripcion_N3").css("display", "block"); } else { jQuery("#helpDescripcion_N3").html(""); jQuery("#helpDescripcion_N3").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpPeso_N3").html("* Peso Obligatorio"); jQuery("#helpPeso_N3").css("display", "block"); } else { jQuery("#helpPeso_N3").html(""); jQuery("#helpPeso_N3").css("display", "none"); }
        if (vl_Campo_3 == "-1") { jQuery("#help_N2").html("* Notas Obligatorio"); jQuery("#help_N2").css("display", "block"); } else { jQuery("#help_N2").html(""); jQuery("#help_N2").css("display", "none"); }

    }
    else {
        jQuery("#helpDescripcion_N3").html("");
        jQuery("#helpDescripcion_N3").css("display", "none");
        jQuery("#helpPeso_N3").html("");
        jQuery("#helpPeso_N3").css("display", "none");
        jQuery("#help_N2").html("");
        jQuery("#help_N2").css("display", "none");
    }

    if (vg_flagErrorCritico == 3) {
        var vl_Campo_4 = jQuery("#DListErrores").val();

        if (vl_Campo_4 == "-1") {
            if (vl_Campo_4 == "-1") { jQuery("#helpErrores").html("* Error Obligatorio"); jQuery("#helpErrores").css("display", "block"); } else { jQuery("#helpErrores").html(""); jQuery("#helpErrores").css("display", "none"); }
            Message("Error", "Debe diligenciar los campos del bloque de Notas.", 4000);
            CampoAdd = 1;
        }
        else {
            jQuery("#helpErrores").html("");
            jQuery("#helpErrores").css("display", "none");
        }
    }

    if (vg_flagPesoPonderado == 3) {
        var vl_Campo_5 = jQuery("#TxtPeso_PP3").val();

        if (vl_Campo_5 == "") {
            if (vl_Campo_5 == "") { jQuery("#helpPeso_PP3").html("* Peso Ponderado Obligatorio"); jQuery("#helpPeso_PP3").css("display", "block"); } else { jQuery("#helpPeso_PP3").html(""); jQuery("#helpPeso_PP3").css("display", "none"); }
            Message("Error", "Debe diligenciar los campos del bloque de Notas.", 4000);
            CampoAdd = 1;
        }
        else {
            jQuery("#helpPeso_PP3").html("");
            jQuery("#helpPeso_PP3").css("display", "none");
        }
    }

    if (CampoAdd == 0) {
        Create_N3_Transaction();
    }
}

//dispara evento de creacion Nivel 4
function Btn_Agrega_N4() {
    var vl_Campo_1 = jQuery("#TxtDescripcion_N4").val();
    var vl_Campo_2 = jQuery("#TxtPeso_N4").val();
    var vl_Campo_3 = jQuery("#DList_Nivel_3").val();

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "" ||
        vl_Campo_3 == "-1") {

        Message("Error", "Debe diligenciar los campos del bloque de Foco de Mejora.", 4000);
        if (vl_Campo_1 == "") { jQuery("#helpDescripcion_N4").html("* B. Foco de mejora Obligatorio"); jQuery("#helpDescripcion_N4").css("display", "block"); } else { jQuery("#helpDescripcion_N4").html(""); jQuery("#helpDescripcion_N4").css("display", "none"); }
        if (vl_Campo_2 == "") { jQuery("#helpPeso_N4").html("* Peso Obligatorio"); jQuery("#helpPeso_N4").css("display", "block"); } else { jQuery("#helpPeso_N4").html(""); jQuery("#helpPeso_N4").css("display", "none"); }
        if (vl_Campo_3 == "-1") { jQuery("#help_N3").html("* Punto Obligatorio"); jQuery("#help_N3").css("display", "block"); } else { jQuery("#help_N3").html(""); jQuery("#help_N3").css("display", "none"); }

    }
    else {
        jQuery("#helpDescripcion_N4").html("");
        jQuery("#helpDescripcion_N4").css("display", "none");
        jQuery("#helpPeso_N4").html("");
        jQuery("#helpPeso_N4").css("display", "none");
        jQuery("#help_N3").html("");
        jQuery("#help_N3").css("display", "none");

        Create_N4_Transaction();
    }

}

//dispara evento de  activacion
function Btn_Activate() {

    var leng_N1 = ObjNivel_1.length;
    var leng_N2 = ObjNivel_2.length;
    var leng_N3 = ObjNivel_3.length;

    if (leng_N1 == 0 ||
        leng_N2 == 0 ||
        leng_N3 == 0) {

        if (leng_N1 == 0) {
            Message("Alert", "para realizar pruebas del formulario (" + jQuery("#HtmlTitleForm").val() + ") debe tener almenos un registro en los siguientes bloques " + vg_Title_N1 + ", " + vg_Title_N2 + ", " + vg_Title_N3, 6000);
        }
        else if (leng_N2 == 0) {
            Message("Alert", "para realizar pruebas del formulario (" + jQuery("#HtmlTitleForm").val() + ") debe tener almenos un registro en los siguientes bloques " + vg_Title_N2 + ", " + vg_Title_N3, 6000);
        }
        else if (leng_N3 == 0) {
            Message("Alert", "para realizar pruebas del formulario (" + jQuery("#HtmlTitleForm").val() + ") debe tener almenos un registro en el bloque " + vg_Title_N3, 6000);
        }
    }
    else {
        Update_FormularioEstado_Transaction(2);
    }
}

//dispara evento de creacion de parametros de monitoreo
function Btn_AgregaConfiguracion() {

    var OpcionBOp = 0;
    var OpcionBVa = 0;
    var OpcionBOpcM = 0;

    var Check_N0 = 0;
    var Check_N1 = 0;

    //bloque operadores
    var Check_1 = document.getElementById('checkbox_N0').checked;
    var Check_2 = document.getElementById('checkbox_N1').checked;

    Check_N0 = (Check_1) ? 1 : 0;
    Check_N1 = (Check_2) ? 1 : 0;

    if (Check_N0 == 0 &&
        Check_N1 == 0) {

        OpcionBOp = 1;
        jQuery("#helpBloqueOperadores").html("* B. Operadores Obligatorio");
        jQuery("#helpBloqueOperadores").css("display", "block");
    }
    else {
        jQuery("#helpBloqueOperadores").html("");
        jQuery("#helpBloqueOperadores").css("display", "none");
    }

    var Check_N2 = 0;
    var Check_N3 = 0;
    var Check_N4 = 0;

    //bloque Valores
    var Check_3 = document.getElementById('checkbox_N2').checked;
    var Check_4 = document.getElementById('checkbox_N3').checked;
    var Check_5 = document.getElementById('checkbox_N4').checked;

    Check_N2 = (Check_3) ? 1 : 0;
    Check_N3 = (Check_4) ? 1 : 0;
    Check_N4 = (Check_5) ? 1 : 0;

    if (Check_N2 == 0 &&
        Check_N3 == 0 &&
        Check_N4 == 0) {

        OpcionBVa = 1;
        jQuery("#helpBloqueValores").html("* B. Valores Obligatorio");
        jQuery("#helpBloqueValores").css("display", "block");

    }
    else {
        jQuery("#helpBloqueValores").html("");
        jQuery("#helpBloqueValores").css("display", "none");
    }

    var Check_C = 0;
    var Check_NC = 0;
    var Check_NA = 0;

    //bloque Opciones Monitoreo
    var Check_OpcC = document.getElementById('checkboxC').checked;
    var Check_OpcNC = document.getElementById('checkboxNC').checked;
    var Check_OpcNA = document.getElementById('checkboxNA').checked;

    Check_C = (Check_OpcC) ? 1 : 0;
    Check_NC = (Check_OpcNC) ? 1 : 0;
    Check_NA = (Check_OpcNA) ? 1 : 0;

    if (Check_C == 0 &&
        Check_NC == 0 &&
        Check_NA == 0) {

        OpcionBOpcM = 1;
        jQuery("#helpBloqueOpcMonitoreo").html("* B. Opc Monitoreo Obligatorio");
        jQuery("#helpBloqueOpcMonitoreo").css("display", "block");

    }
    else {
        jQuery("#helpBloqueOpcMonitoreo").html("");
        jQuery("#helpBloqueOpcMonitoreo").css("display", "none");
    }

    if (OpcionBOp == 0 &&
        OpcionBVa == 0 &&
        OpcionBOpcM == 0) {


        if (vg_AplicaVarios == 0) {
            //radio
            vl_radioSelect = jQuery('input:radio[name=checkbox_Opera]:checked').val();

            switch (vl_radioSelect) {
                case "N2":
                    vg_Check_N2 = 1;
                    vg_Check_N3 = 0;
                    vg_Check_N4 = 0;
                    break;
                case "N3":
                    vg_Check_N2 = 0;
                    vg_Check_N3 = 1;
                    vg_Check_N4 = 0;
                    break;
                case "N2":
                    vg_Check_N2 = 0;
                    vg_Check_N3 = 0;
                    vg_Check_N4 = 1;
                    break;
            }
        }

        vl_radioDMonitoreo = jQuery('input:radio[name=DefaultMonitoreo]:checked').val();

        if (vl_radioDMonitoreo === undefined) {
            vg_SelectMonitoreo = "X";
        }
        else {
            vg_SelectMonitoreo = vl_radioDMonitoreo;
        }
        CreateConfiguracion_Transaction();

    }
    else {

        vl_mensaje = ""
        if (OpcionBOp == 1)
            vl_mensaje += "Base Operadores";

        if (OpcionBVa == 1) {
            vl_mensaje += (vl_mensaje == "") ? "Valores a operar" : ", Valores a operar";
        }

        if (OpcionBOpcM == 1) {
            vl_mensaje += (vl_mensaje == "") ? "Opciones de monitoreo" : ", Opciones de monitoreo";
        }

        var vl_MensajeT = "Debe almenos por diligenciar un elemento del bloque (" + vl_mensaje + ")";
        Message("Alert", vl_MensajeT, 6000);
    }

}

//descarga la plantilla de trabajo
function Btn_Download_Plantilla() {
    window.location = "/Repositorio/Plantillas/TemplateForm.xlsx";
}

function PaginarLeves(vp_Index) {
    var control = "";

    if (vp_Index == 0) {
        switch (vg_ContPag) {
            case 1:
                control = "BlockEvaluacion";
                break;
            case 2:
                control = "BlockNotas";
                break;
            case 3:
                control = "BlockPuntos";
                break;
            case 4:
                control = "BlockFoco";
                break;
            case 5:
                control = "BlockFormulacion";
                break;
            case 6:
                control = "Block_Activate";
                jQuery(".DownButton").fadeOut('fast');
                jQuery(".DownUp").show('slow');
                break;

            default:
                vg_ContPag = 1;
                break;
        }

        jQuery('html, body').animate({
            scrollTop: jQuery("#" + control).offset().top
        }, 1000);

        vg_ContPag++;
    }
    else {
        jQuery('html, body').animate({
            scrollTop: jQuery("#BlockButton").offset().top
        }, 1000);
        jQuery(".DownUp").fadeOut('fast');
        jQuery(".DownButton").show('slow');
        vg_ContPag = 1;
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//evento de controles
function ChangueControl() {

    jQuery("#Check_Nivel_ErrorCritico").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagErrorCritico = 3;
            jQuery("#Block_N2_EC").fadeOut('fast');
            jQuery("#Block_N3_EC").show('slow');
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagErrorCritico = 2;
            jQuery("#Block_N2_EC").show('slow');
            jQuery("#Block_N3_EC").fadeOut('fast');
        }
        CreateGrid_Nivel_2(0);
        CreateGrid_Nivel_3(0);
    });

    jQuery("#Check_PesoPonderado").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagPesoPonderado = 3;
            jQuery("#Block_N2_PP").fadeOut('fast');
            jQuery("#Block_N3_PP").show('slow');
            jQuery("#BlockPonderado_N3").show('slow');
            jQuery("#BlockPonderado_N2").fadeOut('fast');
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagPesoPonderado = 2;
            jQuery("#Block_N2_PP").show('slow');
            jQuery("#Block_N3_PP").fadeOut('fast');
            jQuery("#BlockPonderado_N3").fadeOut('fast');
            jQuery("#BlockPonderado_N2").show('slow');
        }
        CreateGrid_Nivel_2(0);
        CreateGrid_Nivel_3(0);
    });

    jQuery("#Check_Nivel_0").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagCargo = 1;
            jQuery("#BlockCargo").show('slow');
            jQuery("#BlockListCargo").show('slow');
            jQuery("#BlockContCargo").show('slow');
            jQuery("#BlockAddCargo").show('slow');
            jQuery("#BlockCheck_N0").show('slow');
        }

        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagCargo = 0;
            jQuery("#BlockCargo").fadeOut('fast');
            jQuery("#BlockListCargo").fadeOut('fast');
            jQuery("#BlockContCargo").fadeOut('fast');
            jQuery("#BlockAddCargo").fadeOut('fast');
            jQuery("#BlockCheck_N0").fadeOut('fast');
        }
    });

    jQuery("#Check_Valoracion_N0").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagAplicaValoracion_N0 = 0;
            jQuery("#TxtPeso_N0").attr("disabled", true);
            jQuery("#TxtPeso_N0").val("0");
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagAplicaValoracion_N0 = 1;
            jQuery("#TxtPeso_N0").attr("disabled", false);
            jQuery("#TxtPeso_N0").val("");
        }
    });

    jQuery("#Check_Valoracion_N1").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagAplicaValoracion_N1 = 0;
            jQuery("#TxtPeso_N1").attr("disabled", true);
            jQuery("#TxtPeso_N1").val("0");
            jQuery("#TxtPesoA_N0").attr("disabled", true);
            jQuery("#TxtPesoA_N0").val("0");
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagAplicaValoracion_N1 = 1;
            jQuery("#TxtPeso_N1").attr("disabled", false);
            jQuery("#TxtPeso_N1").val("");
            jQuery("#TxtPesoA_N0").attr("disabled", false);
            jQuery("#TxtPesoA_N0").val("");
        }
    });

    jQuery("#Check_Valoracion_N2").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagAplicaValoracion_N2 = 0;
            jQuery("#TxtPeso_N2").attr("disabled", true);
            jQuery("#TxtPeso_N2").val("0");
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagAplicaValoracion_N2 = 1;
            jQuery("#TxtPeso_N2").attr("disabled", false);
            jQuery("#TxtPeso_N2").val("");
        }
    });

    jQuery("#Check_Valoracion_N3").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagAplicaValoracion_N2 = 0;
            jQuery("#TxtPeso_N3").attr("disabled", true);
            jQuery("#TxtPeso_N3").val("0");
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagAplicaValoracion_N2 = 1;
            jQuery("#TxtPeso_N3").attr("disabled", false);
            jQuery("#TxtPeso_N3").val("");
        }
    });

    jQuery("#Check_Valoracion_N4").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagAplicaValoracion_N4 = 0;
            jQuery("#TxtPeso_N4").attr("disabled", true);
            jQuery("#TxtPeso_N4").val("0");
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagAplicaValoracion_N4 = 1;
            jQuery("#TxtPeso_N4").attr("disabled", false);
            jQuery("#TxtPeso_N4").val("");
        }
    });

    jQuery("#Check_ErrorCritico").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagAplicaValoracion_N3 = 0;
            jQuery("#DListErrores").attr("disabled", false);
            jQuery("#DListErrores").val("-1").trigger('chosen:updated');
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagAplicaValoracion_N3 = 1;
            jQuery("#DListErrores").attr("disabled", true);
            jQuery("#DListErrores").val("120").trigger('chosen:updated');
        }
    });

    jQuery("#Check_ErrorCritico_1").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flagAplicaValoracion_N3 = 0;
            jQuery("#DListErrores_1").attr("disabled", false);
            jQuery("#DListErrores_1").val("-1").trigger('chosen:updated');
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flagAplicaValoracion_N3 = 1;
            jQuery("#DListErrores_1").attr("disabled", true);
            jQuery("#DListErrores_1").val("120").trigger('chosen:updated');
        }
    });

    jQuery("#Check_Aplica_N4").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            vg_flag_N5 = 1;
            jQuery("#BlockFoco").show('slow');
            jQuery("#BlockCheck_N4").show('slow');

        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            vg_flag_N5 = 1;
            jQuery("#BlockFoco").fadeOut('fast');
            jQuery("#BlockCheck_N4").fadeOut('fast');
        }
    });

    jQuery("#DList_Nivel_0").change(function () {
        vl_value = jQuery(this).val();
        var vl_cant = 0;
        for (ItemObj in ObjNivel_1) {

            if (ObjNivel_1[ItemObj].CargoId == vl_value) {
                vl_cant += parseInt(ObjNivel_1[ItemObj].PesoCargo);
            }
        }

        jQuery("#TxtContador_A0").val(vl_cant);
    });

    jQuery("#DList_Nivel_1").change(function () {
        vl_value = jQuery(this).val();
        var vl_cant = 0;
        for (ItemObj in ObjNivel_2) {

            if (ObjNivel_2[ItemObj].BloqueEvaluacionId == vl_value) {
                vl_cant += parseInt(ObjNivel_2[ItemObj].Peso);
            }
        }

        jQuery("#TxtContador_2").val(vl_cant);
    });

    jQuery("#DList_Nivel_2").change(function () {
        vl_value = jQuery(this).val();
        var vl_cant = 0;
        for (ItemObj in ObjNivel_3) {

            if (ObjNivel_3[ItemObj].NotasDescriptivasId == vl_value) {
                vl_cant += parseInt(ObjNivel_3[ItemObj].Peso);
            }
        }

        jQuery("#TxtContador_3").val(vl_cant);
    });

    jQuery("#checkbox_N0").change(function () {
        vg_Check_N0 = (this.checked) ? /* seleccionado*/ 1 :/*no seleccionado*/ 0;

        if (this.checked) {
            var vl_Valor = jQuery("#TxtContador_0").val();
            var vl_Total = jQuery("#Txt_ValorMaximoEvaluar").val();

            if (parseFloat(vl_Valor) != parseFloat(vl_Total)) {
                //al seleccionar si es 0
                Message("Alert", "Para asignar como base de operación el  " + vg_Title_N1 + " el peso total de el debe ser igual al valor maximo a evaluar.");
                jQuery(this).prop('checked', false);
            }
        }
    });

    jQuery("#checkbox_N1").change(function () {
        vg_Check_N1 = (this.checked) ? /* seleccionado*/ 1 :/*no seleccionado*/ 0;

        if (this.checked) {
            var vl_Valor = jQuery("#TxtContador_1").val();
            var vl_Total = jQuery("#Txt_ValorMaximoEvaluar").val();

            if (parseFloat(vl_Valor) != parseFloat(vl_Total)) {
                //al seleccionar si es 0
                Message("Alert", "Para asignar como base de operación el  " + vg_Title_N1 + " el peso total de el debe ser igual al valor maximo a evaluar.");
                jQuery(this).prop('checked', false);
            }
        }

    });

    jQuery("#checkbox_N2").change(function () {
        if (this.checked) {
            // seleccionado
            var vl_Valor = jQuery("#TxtContador_2").val();
            var vl_Total = jQuery("#Txt_ValorMaximoEvaluar").val();
            vg_Check_N2 = 1;
            if (parseFloat(vl_Valor) != parseFloat(vl_Total)) {
                //al seleccionar si es 0
                Message("Alert", "Para asignar como operador el  " + vg_Title_N2 + " el peso total de el debe ser igual al valor maximo a evaluar.");
                jQuery(this).prop('checked', false);
            }
        }
        else {
            //no seleccionado
            vg_Check_N2 = 0;
        }
    });

    jQuery("#checkbox_N3").change(function () {
        if (this.checked) {
            // seleccionado
            var vl_Valor = jQuery("#TxtContador_3").val();
            var vl_Total = jQuery("#Txt_ValorMaximoEvaluar").val();
            vg_Check_N3 = 1;

            if (parseFloat(vl_Valor) != parseFloat(vl_Total)) {
                //al seleccionar si es 0
                Message("Alert", "Para asignar como operador el  " + vg_Title_N3 + " el peso total de el debe ser igual al valor maximo a evaluar.");
                jQuery(this).prop('checked', false);
            }
        }
        else {
            //no seleccionado
            vg_Check_N3 = 0;
        }
    });

    jQuery("#checkbox_N4").change(function () {
        if (this.checked) {
            // seleccionado
            var vl_Valor = jQuery("#TxtContador_N4").val();
            var vl_Total = jQuery("#Txt_ValorMaximoEvaluar").val();
            vg_Check_N4 = 1;

            if (parseFloat(vl_Valor) != parseFloat(vl_Total)) {
                //al seleccionar si es 0
                Message("Alert", "Para asignar como operador el  " + vg_Title_N4 + " el peso total de el debe ser igual al valor maximo a evaluar.");
                jQuery(this).prop('checked', false);
            }
        }
        else {
            //no seleccionado
            vg_Check_N0 = 0;

        }
    });

    jQuery("#checkboxNA").change(function () {
        if (this.checked) {
            // seleccionado
            vg_OpcNA = 1;
            jQuery("#Block_NA").show('slow');
        }
        else {
            //no seleccionado
            jQuery("#Block_NA").fadeOut('fast');
            vg_OpcNA = 0;
        }
    });

    jQuery("#Check_VariosV").on('change', function () {
        if (jQuery(this).is(':checked')) {
            // Hacer algo si el checkbox ha sido seleccionado
            jQuery("#checkbox_N2").get(0).type = 'checkbox';
            jQuery("#checkbox_N3").get(0).type = 'checkbox';
            jQuery("#checkbox_N4").get(0).type = 'checkbox';
            vg_AplicaVarios = 1;
        }
        else {
            // Hacer algo si el checkbox ha sido deseleccionado
            jQuery("#checkbox_N2").get(0).type = 'radio';
            jQuery("#checkbox_N3").get(0).type = 'radio';
            jQuery("#checkbox_N4").get(0).type = 'radio';
            vg_AplicaVarios = 0;
        }
    });

    jQuery("#Check_aplicaNA").on('change', function () {
        vg_AplicaNA = (jQuery(this).is(':checked')) ? /*alert("S");*/ 1 :/*alert("N")*/ 0;
    });

    jQuery("#checkboxC").change(function () {
        vg_OpcC = (this.checked) ?/*seleccionado*/1 : /*no seleccionado*/0;
    });

    jQuery("#checkboxNC").change(function () {
        vg_OpcNC = (this.checked) ?/*seleccionado*/1 : /*no seleccionado*/0;
    });

    jQuery("#checkboxNA").change(function () {
        vg_OpcNA = (this.checked) ?/*seleccionado*/1 : /*no seleccionado*/0;
    });

    jQuery("#DefC").change(function () {
        if (this.checked) {
            // seleccionado
            var isChecked = document.getElementById('checkboxC').checked;
            if (isChecked) {
            }
            else {
                jQuery(this).prop('checked', false);
                Message("Alert", "No puede asignar por defecto (Cumple) porque no esta seleccionado como opción de monitoreo.");
            }
        }
    });

    jQuery("#DefNC").change(function () {
        if (this.checked) {
            // seleccionado
            var isChecked = document.getElementById('checkboxNC').checked;
            if (isChecked) {
            }
            else {
                jQuery(this).prop('checked', false);
                Message("Alert", "No puede asignar por defecto (No Cumple) porque no esta seleccionado como opción de monitoreo.");
            }
        }
    });

    jQuery("#DefNA").change(function () {
        if (this.checked) {
            // seleccionado
            var isChecked = document.getElementById('checkboxNA').checked;
            if (isChecked) {
            }
            else {
                jQuery(this).prop('checked', false);
                Message("Alert", "No puede asignar por defecto (No Aplica) porque no esta seleccionado como opción de monitoreo.");
            }
        }
    });

    jQuery("#Check_ErrorC").on('change', function () {
        vg_AplicaEC = (jQuery(this).is(':checked')) ?/*seleccionado*/ 1 : /*no seleccionado*/ 0;
    });
}

///limpiar campos de procesos
function Clear(vp_Index) {

    switch (vp_Index) {
        case 0:
            vg_EditFormulario = 0;
            jQuery("#TxtDescripcionForm").val("");
            jQuery("#TxtvalForm").val("");
            break;

        case 1:
            vg_FlagEditCargo = 0;
            jQuery("#TxtDescripcion").val("");

            (vg_flagAplicaValoracion_N0 == 0) ? jQuery("#TxtPeso_N0").val("0") : jQuery("#TxtPeso_N0").val("0");

            break;

        case 2:
            vg_FlagEditEvaluacion = 0;
            jQuery("#TxtDescripcion_N1").val("");

            (vg_flagAplicaValoracion_N1 == 0) ? jQuery("#TxtPeso_N1").val("0") : jQuery("#TxtPeso_N1").val("0");
            (vg_flagAplicaValoracion_N1 == 0) ? jQuery("#TxtPesoA_N0").val("0") : jQuery("#TxtPesoA_N0").val("0");

            //  jQuery("#DList_Nivel_0").val("-1").trigger('chosen:updated');

            break;

        case 3:
            vg_FlagEditNotas = 0;
            jQuery("#TxtDescripcion_N2").val("");

            (vg_flagAplicaValoracion_N2 == 0) ? jQuery("#TxtPeso_N2").val("0") : jQuery("#TxtPeso_N2").val("0");
            jQuery("#DListErrores_1").val("120").trigger('chosen:updated');
            jQuery("#DListErrores_1").attr("disabled", true);
            document.getElementById("Check_ErrorCritico_1").checked = false;
            jQuery("#TxtPeso_PP2").val("0");
            // jQuery("#DList_Nivel_1").val("-1").trigger('chosen:updated');
            break;

        case 4:
            vg_FlagEditPunto = 0;
            jQuery("#TxtDescripcion_N3").val("");

            (vg_flagAplicaValoracion_N3 == 0) ? jQuery("#TxtPeso_N3").val("0") : jQuery("#TxtPeso_N3").val("0");
            jQuery("#DListErrores").val("120").trigger('chosen:updated');
            jQuery("#DListErrores").attr("disabled", true);
            document.getElementById("Check_ErrorCritico").checked = false;
            jQuery("#TxtPeso_PP3").val("0");
            //  jQuery("#DList_Nivel_2").val("-1").trigger('chosen:updated');
            break;

        case 5:
            vg_FlagEditFoco = 0;
            jQuery("#TxtDescripcion_N4").val("");

            (vg_flagAplicaValoracion_N4 == 0) ? jQuery("#TxtPeso_N4").val("0") : jQuery("#TxtPeso_N4").val("0");
            // jQuery("#DList_Nivel_3").val("-1").trigger('chosen:updated');

            break;

        case 6:

            jQuery("#HtmlTitleForm").val("");
            jQuery("#TxtNunFormulario").val("0");
            jQuery("#TxtAvance").val("0");

            vg_EditFormulario = 0;
            jQuery("#TxtDescripcionForm").val("");
            vg_FlagEditCargo = 0;
            jQuery("#TxtDescripcion").val("");
            jQuery("#TxtPeso_N0").val("");
            vg_FlagEditEvaluacion = 0;
            jQuery("#TxtDescripcion_N1").val("");
            jQuery("#TxtPeso_N1").val("");
            jQuery("#TxtPesoA_N0").val("");
            jQuery("#DList_Nivel_0").val("-1").trigger('chosen:updated');
            vg_FlagEditNotas = 0;
            jQuery("#TxtDescripcion_N2").val("");
            jQuery("#TxtPeso_N2").val("");
            jQuery("#DList_Nivel_1").val("-1").trigger('chosen:updated');
            vg_FlagEditPunto = 0;
            jQuery("#TxtDescripcion_N3").val("");
            jQuery("#TxtPeso_N3").val("");
            jQuery("#DList_Nivel_2").val("-1").trigger('chosen:updated');
            jQuery("#DListErrores").val("120").trigger('chosen:updated');
            jQuery("#DListErrores").attr("disabled", true);
            vg_FlagEditFoco = 0;
            jQuery("#TxtDescripcion_N4").val("");
            jQuery("#TxtPeso_N4").val("");
            jQuery("#DList_Nivel_3").val("-1").trigger('chosen:updated');

            ObjNivel_0 = []; //cargos
            ObjNivel_1 = []; //evaluacion
            ObjNivel_2 = []; //notas
            ObjNivel_3 = []; //Puntos
            ObjNivel_4 = []; //Focos

            CreateGrid_Nivel_0();
            CreateGrid_Nivel_1();
            CreateGrid_Nivel_2();
            CreateGrid_Nivel_3();
            CreateGrid_Nivel_4();

            jQuery("#BlockPuntos").fadeOut('fast');
            jQuery("#BlockNotas").fadeOut('fast');
            jQuery("#TitleBienvenida").html("Bienvenido al módulo para la creación de formularios para iniciar presione el botón start");

            jQuery('#checkbox_N0').prop('checked', false);
            jQuery('#checkbox_N1').prop('checked', false);
            jQuery('#checkbox_N2').prop('checked', false);
            jQuery('#checkbox_N3').prop('checked', false);
            jQuery('#checkbox_N4').prop('checked', false);
            jQuery('#checkboxC').prop('checked', false);
            jQuery('#checkboxNC').prop('checked', false);
            jQuery('#checkboxNA').prop('checked', false);
            jQuery('#DefC').prop('checked', false);
            jQuery('#DefNC').prop('checked', false);
            jQuery('#DefNA').prop('checked', false);

            document.getElementById("Check_VariosV").checked = false;
            document.getElementById("Check_aplicaNA").checked = false;
            document.getElementById("Check_ErrorC").checked = false;

            vg_Check_N0 = 0;
            vg_Check_N1 = 0;
            vg_Check_N2 = 0;
            vg_Check_N3 = 0;
            vg_Check_N4 = 0;
            vg_OpcC = 0;
            vg_OpcNC = 0;
            vg_OpcNA = 0;
            vg_SelectMonitoreo = "";
            vg_FlagEditConfiguracion = 0;

            break;
    }
}

//habilita la ventana emergente para la edicion del titulo
function EditTitle() {
    vg_EditFormulario = jQuery("#TxtNunFormulario").val();
    jQuery("#TitleBienvenida").html("editar el titulo del formulario");
    jQuery("#TxtDescripcionForm").val(jQuery("#HtmlTitleForm").val());
    jQuery("#TxtvalForm").val(jQuery("#Txt_ValorMaximoEvaluar").val());

    jQuery("#ModalStart").modal('show');
}

//valida los estados del formulario
function ValidaEstadoForm() {

    switch (vg_EstadoFormulario) {
        case 0:
            jQuery("#BlockForm :input").removeAttr('disabled')
            break;

        case 1:
            jQuery("#BlockForm :input").removeAttr('disabled')
            break;

        case 2:
            jQuery("#BlockForm :input").attr('disabled', true);

            jQuery(".opcLink").each(function () {
                jQuery(this).attr("data-oldhref", jQuery(this).attr("href"));
                jQuery(this).removeAttr("href");
            });

            break;
    }

}

//ajusta los check segun lo encontrado en BD
function EditConfig() {
    vg_FlagEditConfiguracion = ObjConfig[0].Id;

    if (ObjConfig[0].Ope_Nivel_0 == 1) {
        jQuery('#checkbox_N0').prop('checked', true);
        vg_Check_N0 = 1;
    }
    if (ObjConfig[0].Ope_Nivel_1 == 1) {
        jQuery('#checkbox_N1').prop('checked', true);
        vg_Check_N1 = 1;
    }
    if (ObjConfig[0].Ope_Nivel_2 == 1) {
        jQuery('#checkbox_N2').prop('checked', true);
        vg_Check_N2 = 1;
    }
    if (ObjConfig[0].Ope_Nivel_3 == 1) {
        jQuery('#checkbox_N3').prop('checked', true);
        vg_Check_N3 = 1;
    }
    if (ObjConfig[0].Ope_Nivel_4 == 1) {
        jQuery('#checkbox_N4').prop('checked', true);
        vg_Check_N4 = 1;
    }

    if (ObjConfig[0].OpcCumple == 1) {
        jQuery('#checkboxC').prop('checked', true);
        vg_OpcC = 1;
    }
    if (ObjConfig[0].OpcNoCumple == 1) {
        jQuery('#checkboxNC').prop('checked', true);
        vg_OpcNC = 1;
    }
    if (ObjConfig[0].OpcNoAplica == 1) {
        jQuery("#Block_NA").show('slow');
        jQuery('#checkboxNA').prop('checked', true);
        vg_OpcNA = 1;
    }

    switch (ObjConfig[0].MonitoreoXDefecto) {
        case "C":
            jQuery('#DefC').prop('checked', true);
            break;
        case "NC":
            jQuery('#DefNC').prop('checked', true);
            break;
        case "NA":
            jQuery('#DefNA').prop('checked', true);
            break;
    }

    document.getElementById("Check_VariosV").checked = (ObjConfig[0].VariosOperadores == 1) ? true : false;
    vg_AplicaVarios = ObjConfig[0].VariosOperadores;
    document.getElementById("Check_aplicaNA").checked = (ObjConfig[0].NoAplicaPeso == 1) ? true : false;
    vg_AplicaNA = ObjConfig[0].NoAplicaPeso;
    document.getElementById("Check_ErrorC").checked = (ObjConfig[0].AplicaErrorCritico == 1) ? true : false;
    vg_AplicaEC = ObjConfig[0].AplicaErrorCritico;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GRID                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//creacion de grid de formularios
function CreateGrid() {
    var vl_tipoContador = "";

    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>Formularios</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th class='Tamano'>Formulario</th>" +
        "       <th class='Tamano_S'>B. " + vg_Title_N0 + "</th>" +
        "       <th class='Tamano_S'>B. " + vg_Title_N1 + "</th>" +
        "       <th class='Tamano_S'>B. " + vg_Title_N2 + ".</th>" +
        "       <th class='Tamano_S'>B. " + vg_Title_N3 + "</th>" +
        "       <th class='Tamano_S'>B. " + vg_Title_N4 + "</th>" +
        "       <th class='Tamano_S'>Progreso</th>" +
        "       <th class='Tamano_S'>Estado</th>" +
        "       <th class='Tamano1'>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {

        var vl_Cargo = (ObjWork[ItemObj].Nivel_0 == 0) ? "No Aplica" : "Cant [" + ObjWork[ItemObj].Nivel_0 + "]";
        var vl_estadoCargo = (ObjWork[ItemObj].Nivel_0 == 0) ? "#f2f2f2" : "#1b8219";
        var vl_colorCargo = (ObjWork[ItemObj].Nivel_0 == 0) ? "#000" : "#FFF";

        var vl_Evaluacion = (ObjWork[ItemObj].Nivel_1 == 0) ? "Incompleto" : "Cant [" + ObjWork[ItemObj].Nivel_1 + "]";
        var vl_estadoEvaluacion = (ObjWork[ItemObj].Nivel_1 == 0) ? "#f12828" : "#1b8219";
        var vl_Notas = (ObjWork[ItemObj].Nivel_2 == 0) ? "Incompleto" : "Cant [" + ObjWork[ItemObj].Nivel_2 + "]";
        var vl_estadoNotas = (ObjWork[ItemObj].Nivel_2 == 0) ? "#f12828" : "#1b8219";
        var vl_Punto = (ObjWork[ItemObj].Nivel_3 == 0) ? "Incompleto" : "Cant [" + ObjWork[ItemObj].Nivel_3 + "]";
        var vl_estadoPunto = (ObjWork[ItemObj].Nivel_3 == 0) ? "#f12828" : "#1b8219";

        var vl_Foco = (ObjWork[ItemObj].Nivel_4 == 0) ? "No Aplica" : "Cant [" + ObjWork[ItemObj].Nivel_4 + "]";
        var vl_estadoFoco = (ObjWork[ItemObj].Nivel_4 == 0) ? "#f2f2f2" : "#1b8219";
        var vl_colorFoco = (ObjWork[ItemObj].Nivel_4 == 0) ? "#000" : "#FFF";
        var vl_estado = "";
        var vl_estadoColor = "";

        switch (ObjWork[ItemObj].Estado) {
            case 0:
                vl_estado = "Inactivo";
                vl_estadoColor = "#F61313";
                break;

            case 1:
                vl_estado = "Parcial";
                vl_estadoColor = "#AD9104";
                break;

            case 2:
                vl_estado = "Prueba";
                vl_estadoColor = "#010558";
                break;

            case 3:
                vl_estado = "Activo";
                vl_estadoColor = "#0EEA04";
                break;
        }

        var vl_Porcentaje = "";
        var vl_estadoPorcentaje = "";

        if (ObjWork[ItemObj].Nivel_0 == 0 && ObjWork[ItemObj].Nivel_1 != 0) {
            vl_tipoContador = 0;
        }
        else {
            vl_tipoContador = 1;
        }

        if (vl_tipoContador == 0) {
            //sin cargo
            if (ObjWork[ItemObj].Nivel_1 == 0) {
                vl_Porcentaje = "25%";
                vl_estadoPorcentaje = "#a99220";
            }
            else if (ObjWork[ItemObj].Nivel_2 == 0) {
                vl_Porcentaje = "50%";
                vl_estadoPorcentaje = "#d0b429";
            }
            else if (ObjWork[ItemObj].Nivel_3 == 0) {
                vl_Porcentaje = "75%";
                vl_estadoPorcentaje = "#2936d0";
            }
            else {
                vl_Porcentaje = "100%";
                vl_estadoPorcentaje = "#1b8219";
            }
        }
        else {
            if (ObjWork[ItemObj].Nivel_0 == 0) {
                vl_Porcentaje = "5%";
                vl_estadoPorcentaje = "#f12828";
            }
            else if (ObjWork[ItemObj].Nivel_1 == 0) {
                vl_Porcentaje = "10%";
                vl_estadoPorcentaje = "#a99220";
            }
            else if (ObjWork[ItemObj].Nivel_2 == 0) {
                vl_Porcentaje = "40%";
                vl_estadoPorcentaje = "#d0b429";
            }
            else if (ObjWork[ItemObj].Nivel_3 == 0) {
                vl_Porcentaje = "70%";
                vl_estadoPorcentaje = "#2936d0";
            }
            else {
                vl_Porcentaje = "100%";
                vl_estadoPorcentaje = "#1b8219";
            }
        }


        vl_Html += "    <tr id='Tr_Cliente_" + ObjWork[ItemObj].Id + "' style='text-align: center;'>" +
            "     <td>" + ObjWork[ItemObj].Id + " - " + ObjWork[ItemObj].Descripcion + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_colorCargo + "; background: " + vl_estadoCargo + "' >" + vl_Cargo + "</td>" +
            "     <td style='font-weight: bold; color:#FFF; background: " + vl_estadoEvaluacion + "'>" + vl_Evaluacion + "</td>" +
            "     <td style='font-weight: bold; color:#FFF; background: " + vl_estadoNotas + "'>" + vl_Notas + "</td>" +
            "     <td style='font-weight: bold; color:#FFF; background: " + vl_estadoPunto + "'>" + vl_Punto + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_colorFoco + "; background: " + vl_estadoFoco + "' >" + vl_Foco + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_estadoPorcentaje + "'>" + vl_Porcentaje + "</td>" +
            "     <td style='font-weight: bold; color:" + vl_estadoColor + "'>" + vl_estado + "</td>" +
            "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:InactivarGrid('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Inactivar</span></span></div>" +
            "    <div class='col-lg-2 col-md-2' ><span class='ToolTip_Ver'><a href=\"javascript:EditarGrid('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
            "   <div class='col-lg-2 col-md-2' ><span class='ToolTip_Ver'><a href=\"javascript:ClonarGrid('" + ItemObj + "')\"><i class='fa fa-copy fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Clonar Formulario</span></span></div> " +
            "   <div class='col-lg-2 col-md-2' ><span class='ToolTip_Ver'><a href=\"javascript:ActivarGrid('" + ItemObj + "')\"><i class='fa fa-check-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Activar</span></span></div></td> " +
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

    jQuery(".Tamano").css("width", "300px");
    jQuery(".Tamano1").css("width", "120px");
    jQuery(".Tamano_S").css("width", "50px");

}

//editar el formulario seleccionada
function EditarGrid(vp_ObjIndex) {
    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;

    ModalForm(1);
    ModalFormCreate(1);

    jQuery(".DownButton").show('slow');
    jQuery("#TForm").html("Editar Formulario");
    jQuery("#TxtNunFormulario").val(ObjWork[vp_ObjIndex].Id);
    jQuery("#HtmlTitleForm").val(ObjWork[vp_ObjIndex].Descripcion);
    jQuery("#Txt_ValorMaximoEvaluar").val(ObjWork[vp_ObjIndex].ValorMaximoEvaluar);

    var vl_Porcentaje = "";
    var vl_estadoPorcentaje = "";

    if (ObjWork[vp_ObjIndex].Nivel_0 == 0) {
        vl_Porcentaje = "5%";
        vl_estadoPorcentaje = "#f12828";
    }
    else if (ObjWork[vp_ObjIndex].Nivel_1 == 0) {
        vl_Porcentaje = "10%";
        vl_estadoPorcentaje = "#a99220";
    }
    else if (ObjWork[vp_ObjIndex].Nivel_2 == 0) {
        vl_Porcentaje = "40%";
        vl_estadoPorcentaje = "#d0b429";
    }
    else if (ObjWork[vp_ObjIndex].Nivel_3 == 0) {
        vl_Porcentaje = "70%";
        vl_estadoPorcentaje = "#2936d0";
    }
    else {
        vl_Porcentaje = "100%";
        vl_estadoPorcentaje = "#1b8219";
    }
    jQuery("#TxtAvance").css("background", vl_estadoPorcentaje);
    jQuery("#TxtAvance").val(vl_Porcentaje);

    if (ObjWork[vp_ObjIndex].Nivel_0 != 0) {
        vg_flagCargo = 1;
        jQuery("#BlockCargo").show('slow');
        jQuery("#BlockListCargo").show('slow');
        jQuery("#BlockListCargo").show('slow');
        jQuery("#BlockContCargo").show('slow');
        jQuery("#BlockAddCargo").show('slow');
        jQuery("#BlockCheck_N0").show('slow');
        document.getElementById("Check_Nivel_0").checked = true;
    }
    else {
        jQuery("#BlockCargo").fadeOut('fast');
        jQuery("#BlockListCargo").fadeOut('fast');
        jQuery("#BlockListCargo").fadeOut('fast');
        jQuery("#BlockListCargo").fadeOut('fast');
        jQuery("#BlockListCargo").fadeOut('fast');
        jQuery("#BlockCheck_N0").fadeOut('fast');
        document.getElementById("Check_Nivel_0").checked = false;
    }

    if (ObjWork[vp_ObjIndex].Nivel_4 != 0) {
        document.getElementById("Check_Aplica_N4").checked = true;
        jQuery("#BlockEvaluacion").show('slow');
        jQuery("#BlockNotas").show('slow');
        jQuery("#BlockPuntos").show('slow');
        jQuery("#BlockFoco").show('slow');
        jQuery("#BlockCheck_N4").show('slow');
    }
    else if (ObjWork[vp_ObjIndex].Nivel_3 != 0) {
        document.getElementById("Check_Aplica_N4").checked = false;
        jQuery("#BlockEvaluacion").show('slow');
        jQuery("#BlockNotas").show('slow');
        jQuery("#BlockPuntos").show('slow');
    }
    else if (ObjWork[vp_ObjIndex].Nivel_2 != 0) {
        document.getElementById("Check_Aplica_N4").checked = false;
        jQuery("#BlockEvaluacion").show('slow');
        jQuery("#BlockNotas").show('slow');
        jQuery("#BlockPuntos").show('slow');
    }
    else if (ObjWork[vp_ObjIndex].Nivel_1 != 0) {
        document.getElementById("Check_Aplica_N4").checked = false;
        jQuery("#BlockEvaluacion").show('slow');
        jQuery("#BlockNotas").show('slow');
    }

    jQuery("#LabelNA").html("Desea que el peso que tenga al selecionar (No aplica) en el monitoreo sea repartido en partes iguales a las demas opciones del bloque en evaluación?")
    vg_EstadoFormulario = ObjWork[vp_ObjIndex].Estado;

    document.getElementById("Check_PesoPonderado").checked = (ObjWork[vp_ObjIndex].PesoPonderadoNivel == 2) ? false : true;
    document.getElementById("Check_Nivel_ErrorCritico").checked = (ObjWork[vp_ObjIndex].ErrorCriticoNivel == 2) ? false : true;

    vg_flagPesoPonderado = ObjWork[vp_ObjIndex].PesoPonderadoNivel;
    vg_flagErrorCritico = ObjWork[vp_ObjIndex].ErrorCriticoNivel;

    if (ObjWork[vp_ObjIndex].PesoPonderadoNivel == 2) {
        jQuery("#Block_N2_PP").show('slow');
        jQuery("#Block_N3_PP").fadeOut('fast');
    }
    else {
        jQuery("#Block_N2_PP").fadeOut('fast');
        jQuery("#Block_N3_PP").show('slow');
    }

    if (ObjWork[vp_ObjIndex].ErrorCriticoNivel == 2) {
        jQuery("#Block_N2_EC").show('slow');
        jQuery("#Block_N3_EC").fadeOut('fast');
    }
    else {
        jQuery("#Block_N2_EC").fadeOut('fast');
        jQuery("#Block_N3_EC").show('slow');
    }

    Read_Complementos_Transaction(ObjWork[vp_ObjIndex].Id);
}

//inactiva el formulario seleccionado
function InactivarGrid(vp_ObjIndex) {
    vg_DeleteId = ObjWork[vp_ObjIndex].Descripcion;
    jQuery("#TxtNunFormulario").val(ObjWork[vp_ObjIndex].Id);
    jQuery("#HtmlTitleForm").val(ObjWork[vp_ObjIndex].Descripcion);


    jQuery("#TitleFormDessactivar").html("Desactivar formulario seleccionado ");
    jQuery("#TxtNombreForm").val(ObjWork[vp_ObjIndex].Descripcion);
    jQuery("#LblMsmAdvertenciaForm").html("Esta seguro de inactivar el formulario");
    jQuery("#LblMsmAdvertenciaForm2").html("al inactivar el formulari tendra la opcion de volver a editar el mismo " + vg_Title_N1);

    jQuery("#ModalFormDesactivar").modal("show");
}

//pasa de prueba a activo
function ActivarGrid(vp_ObjIndex) {
    jQuery("#TxtNunFormulario").val(ObjWork[vp_ObjIndex].Id);

    var vl_estado = ObjWork[vp_ObjIndex].Estado;
    if (vl_estado != 2) {
        Message("Info", "Para activar el formulario debe estar en estado de (prueba)");
    }
    else {
        Update_FormularioEstado_Transaction(3);
    }

}

//clonar el formulario seleccionado
function ClonarGrid(vp_ObjIndex) {
    vl_FormularioId = ObjWork[vp_ObjIndex].Id;

    ClonarProyecto_Transaction(vl_FormularioId);
}

//creacion de grid de cargos
function CreateGrid_Nivel_0() {
    var vl_Contador = 0;

    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>" + vg_Title_N0 + "</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWorkN_0' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>" + vg_Title_N0 + "</th>" +
        "       <th>Peso</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjNivel_0) {
        vl_Contador += parseFloat(ObjNivel_0[ItemObj].Peso);

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjNivel_0[ItemObj].Id + "'>" +
            "     <td>" + ObjNivel_0[ItemObj].Descripcion + "</td>" +
            "     <td>" + ObjNivel_0[ItemObj].Peso + "</td>" +
            "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EliminarGrid_Nivel_0('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Eliminar</span></span></div>" +
            "     <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EditarGrid_Nivel_0('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
            "    </td>" +
            "   </tr>";
    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Container_Grid_Nivel_0").html("");
    jQuery("#Container_Grid_Nivel_0").html(vl_Html);

    jQuery("#GridWorkN_0").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
    Carga_CatalogList(ObjNivel_0, "DList_Nivel_0", "");
    jQuery("#TxtContador_0").val(vl_Contador);
}

//editar el  cargo seleccionado
function EditarGrid_Nivel_0(vp_ObjIndex) {
    vg_FlagEditCargo = ObjNivel_0[vp_ObjIndex].Id;
    var vl_Contador = jQuery("#TxtContador_0").val();

    jQuery("#TxtDescripcion").val(ObjNivel_0[vp_ObjIndex].Descripcion);
    jQuery("#TxtPeso_N0").val(ObjNivel_0[vp_ObjIndex].Peso);

    vl_Contador = vl_Contador - parseFloat(ObjNivel_0[vp_ObjIndex].Peso);
    jQuery("#TxtContador_0").val(vl_Contador);
}

//activa o inactiva cargo
function EliminarGrid_Nivel_0(vp_ObjIndex) {
    vg_DeleteId = ObjNivel_0[vp_ObjIndex].Id;
    vg_Modulo = 0;

    jQuery("#TitleDelete").html("Eliminar elemento Nivel 0 - " + vg_Title_N0);
    jQuery("#TxtNombreView").val(ObjNivel_0[vp_ObjIndex].Descripcion);
    jQuery("#LblMsmAdvertencia").html("Esta seguro de eliminar " + vg_Title_N0);
    jQuery("#LblMsmAdvertencia2").html("Recuerda al eliminar este dato eliminara en cascada todos los datos relacionado con " + vg_Title_N1);

    jQuery("#ModalEliminar").modal("show");
}

//creacion de grid de evaluacion
function CreateGrid_Nivel_1(vl_value) {
    var vl_Contador = 0;

    var lengCargo = ObjNivel_0.length;
    var vl_Html = "";

    if (lengCargo != 0) {
        vl_Html = "<div class='card'>" +
            "<div class='card-header'><strong class='card-title'>" + vg_Title_N1 + "</strong></div>" +
            "<div class='card-body'>" +
            "   <table id='GridWork_N1' class='table table-striped table-bordered'>" +
            "   <thead><tr>" +
            "       <th>" + vg_Title_N0 + "</th>" +
            "       <th>" + vg_Title_N1 + "</th>" +
            "       <th>Peso</th>" +
            "       <th>Peso " + vg_Title_N0 + "</th>" +
            "       <th>Opciones</th>" +
            "   </tr></thead><tbody>";

        for (ItemObj in ObjNivel_1) {
            var vl_DescripCargo = (ObjNivel_1[ItemObj].CargoId == 0) ? "No Aplica" : ObjNivel_1[ItemObj].Cargo;
            vl_Contador += parseFloat(ObjNivel_1[ItemObj].Peso);

            var randomBackColor = Math.floor(Math.random() * 16777215).toString(16);
            var randomColor = LightenDarkenColor(randomBackColor, 15);

            var CantCaracteres = randomColor.length;
            randomColor = (CantCaracteres == 5) ? "0" + randomColor : randomColor;

            var Json = {
                "Obj_N1_Id": ObjNivel_1[ItemObj].Id,
                "background": randomBackColor,
                "color": randomColor
            }

            Obj_Colors.push(Json);

            vl_Html += "    <tr id= 'Tr_Cliente_" + ObjNivel_1[ItemObj].Id + "'>" +
                "     <td>" + ObjNivel_1[ItemObj].CargoId + " - " + vl_DescripCargo + "</td>" +
                "     <td>" + ObjNivel_1[ItemObj].Descripcion + "</td>" +
                "     <td>" + ObjNivel_1[ItemObj].Peso + "</td>" +
                "     <td>" + ObjNivel_1[ItemObj].PesoCargo + "</td>" +
                "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EliminarGrid_Nivel_1('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Eliminar</span></span></div>" +
                "     <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EditarGrid_Nivel_1('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
                "    </td>" +
                "   </tr>";
        }
        vl_Html += "</tbody></table></div></div>";
    }
    else {
        vl_Html = "<div class='card'>" +
            "<div class='card-header'><strong class='card-title'>" + vg_Title_N1 + "</strong></div>" +
            "<div class='card-body'>" +
            "   <table id='GridWork_N1' class='table table-striped table-bordered'>" +
            "   <thead><tr>" +
            "       <th>" + vg_Title_N1 + "</th>" +
            "       <th>Peso</th>" +
            "       <th>Opciones</th>" +
            "   </tr></thead><tbody>";

        for (ItemObj in ObjNivel_1) {
            vl_Contador += parseFloat(ObjNivel_1[ItemObj].Peso);

            var randomBackColor = Math.floor(Math.random() * 16777215).toString(16);
            var randomColor = LightenDarkenColor(randomBackColor, 40);

            var Json = {
                "Obj_N1_Id": ObjNivel_1[ItemObj].Id,
                "background": randomBackColor,
                "color": randomColor
            }

            Obj_Colors.push(Json);
            vl_Html += "    <tr id= 'Tr_Cliente_" + ObjNivel_1[ItemObj].Id + "'>" +
                "     <td>" + ObjNivel_1[ItemObj].Descripcion + "</td>" +
                "     <td>" + ObjNivel_1[ItemObj].Peso + "</td>" +
                "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EliminarGrid_Nivel_1('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Eliminar</span></span></div>" +
                "     <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EditarGrid_Nivel_1('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
                "    </td>" +
                "   </tr>";
        }
        vl_Html += "</tbody></table></div></div>";
    }

    jQuery("#Container_Grid_Nivel_1").html("");
    jQuery("#Container_Grid_Nivel_1").html(vl_Html);

    jQuery("#GridWork_N1").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    jQuery("#TxtContador_A0").val("0");
    jQuery("#TxtContador_1").val(vl_Contador);
    setTimeout(function () { FormatStyle(); }, 500);
    Carga_CatalogList(ObjNivel_1, "DList_Nivel_1", "");

}

//editar el  evaluacion seleccionado
function EditarGrid_Nivel_1(vp_ObjIndex) {
    vg_FlagEditEvaluacion = ObjNivel_1[vp_ObjIndex].Id;
    var SelectCargo = ObjNivel_1[vp_ObjIndex].CargoId;
    var vl_cant = 0;

    for (ItemObj in ObjNivel_1) {
        if (ObjNivel_1[ItemObj].CargoId == SelectCargo) {
            vl_cant += parseFloat(ObjNivel_1[ItemObj].PesoCargo);
        }
    }

    jQuery("#TxtContador_A0").val(parseFloat(vl_cant) - parseFloat(ObjNivel_1[vp_ObjIndex].PesoCargo));

    var vl_Contador = jQuery("#TxtContador_1").val();
    var vl_ContadorC = jQuery("#TxtContador_A0").val();

    jQuery("#TxtDescripcion_N1").val(ObjNivel_1[vp_ObjIndex].Descripcion);
    jQuery("#TxtPeso_N1").val(ObjNivel_1[vp_ObjIndex].Peso);
    jQuery("#DList_Nivel_0").val(ObjNivel_1[vp_ObjIndex].CargoId).trigger('chosen:updated');
    jQuery("#TxtPesoA_N0").val(ObjNivel_1[vp_ObjIndex].PesoCargo);

    vl_Contador = vl_Contador - parseFloat(ObjNivel_1[vp_ObjIndex].Peso);
    vl_ContadorC = vl_ContadorC - parseFloat(ObjNivel_1[vp_ObjIndex].PesoCargo);
    jQuery("#TxtContador_1").val(vl_Contador);

}

//activa o inactiva cargo
function EliminarGrid_Nivel_1(vp_ObjIndex) {
    vg_DeleteId = ObjNivel_1[vp_ObjIndex].Id;
    vg_Modulo = 1;

    jQuery("#TitleDelete").html("Eliminar elemento Nivel 1 - " + vg_Title_N1);
    jQuery("#TxtNombreView").val(ObjNivel_1[vp_ObjIndex].Descripcion);
    jQuery("#LblMsmAdvertencia").html("Esta seguro de eliminar " + vg_Title_N1);
    jQuery("#LblMsmAdvertencia2").html("Recuerda al eliminar este dato eliminara en cascada todos los datos relacionado con " + vg_Title_N2);

    jQuery("#ModalEliminar").modal("show");
}

//creacion de grid de notas
function CreateGrid_Nivel_2(vl_value) {
    var vl_Contador = 0;
    var vl_ContadorPondera = 0;
    var vl_Html = "";

    vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>" + vg_Title_N2 + "</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork_N2' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>" + vg_Title_N1 + "</th>" +
        "       <th>" + vg_Title_N2 + "</th>" +
        "       <th>Peso</th>";
    if (vg_flagPesoPonderado == 2) {
        vl_Html += "<th>Peso Ponderado</th>";
    }
    if (vg_flagErrorCritico == 2) {
        vl_Html += "<th>Error Critico</th>";
    }
    vl_Html += "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjNivel_2) {

        var randomBackColor2 = Math.floor(Math.random() * 16777215).toString(16);
        var randomColor2 = LightenDarkenColor(randomBackColor2, 40);

        vl_ContadorPondera += parseFloat(ObjNivel_2[ItemObj].PesoPonderado);

        var Json = {
            "Obj_N2_Id": ObjNivel_2[ItemObj].Id,
            "background": randomBackColor2,
            "color": randomColor2
        }

        Obj_Colors_N2.push(Json);

        if (vl_value != 0) {
            if (ObjNivel_2[ItemObj].BloqueEvaluacionId == vl_value) {
                vl_Contador += parseFloat(ObjNivel_2[ItemObj].Peso);
            }
        }

        var randomColor = "";
        var randomBackColor = "";

        for (ItemColor in Obj_Colors) {
            if (ObjNivel_2[ItemObj].BloqueEvaluacionId == Obj_Colors[ItemColor].Obj_N1_Id) {
                randomColor = Obj_Colors[ItemColor].color;
                randomBackColor = Obj_Colors[ItemColor].background;
                break;
            }
        }

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjNivel_2[ItemObj].Id + "'>" +
            "     <td style='color: #" + randomColor + " ;background: #" + randomBackColor + ";'>" + ObjNivel_2[ItemObj].BloqueEvaluacionId + " - " + ObjNivel_2[ItemObj].BloqueEvaluacion + "</td>" +
            "     <td>" + ObjNivel_2[ItemObj].Descripcion + "</td>" +
            "     <td>" + ObjNivel_2[ItemObj].Peso + "</td>";
        if (vg_flagPesoPonderado == 2) {
            vl_Html += "     <td>" + ObjNivel_2[ItemObj].PesoPonderado + "</td>";
        }
        if (vg_flagErrorCritico == 2) {
            vl_Html += "     <td>" + ObjNivel_2[ItemObj].EstadoProceso + "</td>";
        }
        vl_Html += "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EliminarGrid_Nivel_2('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Eliminar</span></span></div>" +
            "     <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EditarGrid_Nivel_2('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
            "    </td>" +
            "   </tr>";
    }
    vl_Html += "</tbody></table></div></div>";

    jQuery("#Container_Grid_Nivel_2").html("");
    jQuery("#Container_Grid_Nivel_2").html(vl_Html);

    jQuery("#GridWork_N2").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
    Carga_CatalogList(ObjNivel_2, "DList_Nivel_2", "");
    jQuery("#TxtContador_2").val(vl_Contador);
    jQuery("#TxtContador_Pon2").val(vl_ContadorPondera);
}

//Editar nota seleccionada
function EditarGrid_Nivel_2(vp_ObjIndex) {
    vg_FlagEditNotas = ObjNivel_2[vp_ObjIndex].Id;
    var vl_Contador = 0
    var vl_ContadorPondera = 0;

    jQuery(ObjNivel_2).each(function (ItemObj) {
        vl_ContadorPondera += parseFloat(ObjNivel_2[ItemObj].PesoPonderado);

        if (ObjNivel_2[ItemObj].BloqueEvaluacionId == ObjNivel_2[vp_ObjIndex].BloqueEvaluacionId) {
            vl_Contador += parseFloat(ObjNivel_2[ItemObj].Peso);
        }
    }).promise().done(function () {
        jQuery("#TxtDescripcion_N2").val(ObjNivel_2[vp_ObjIndex].Descripcion);
        jQuery("#TxtPeso_N2").val(ObjNivel_2[vp_ObjIndex].Peso);
        jQuery("#DList_Nivel_1").val(ObjNivel_2[vp_ObjIndex].BloqueEvaluacionId).trigger('chosen:updated');
        jQuery("#DListErrores_1").val(ObjNivel_2[vp_ObjIndex].EstadoProcesoId).trigger('chosen:updated');
        jQuery("#TxtPeso_PP2").val(ObjNivel_2[vp_ObjIndex].PesoPonderado);

        vl_Contador = parseFloat(vl_Contador) - parseFloat(ObjNivel_2[vp_ObjIndex].Peso);
        vl_ContadorPondera = parseFloat(vl_ContadorPondera) - parseFloat(ObjNivel_2[vp_ObjIndex].PesoPonderado);
        jQuery("#TxtContador_2").val(vl_Contador);
        jQuery("#TxtContador_Pon2").val(vl_ContadorPondera);
    });


}

//elimina dato del nivel 2
function EliminarGrid_Nivel_2(vp_ObjIndex) {
    vg_DeleteId = ObjNivel_2[vp_ObjIndex].Id;
    vg_Modulo = 2;

    jQuery("#TitleDelete").html("Eliminar elemento Nivel 2 - " + vg_Title_N2);
    jQuery("#TxtNombreView").val(ObjNivel_2[vp_ObjIndex].Descripcion);
    jQuery("#LblMsmAdvertencia").html("Esta seguro de eliminar " + vg_Title_N2);
    jQuery("#LblMsmAdvertencia2").html("Recuerda al eliminar este dato eliminara en cascada todos los datos relacionado con " + vg_Title_N3);

    jQuery("#ModalEliminar").modal("show");
}

//creacion de grid de puntos
function CreateGrid_Nivel_3(vl_value) {
    var vl_Contador = 0;
    var vl_ContadorPondera = 0;

    var vl_Html = "";

    vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>" + vg_Title_N3 + "</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork_N3' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>" + vg_Title_N2 + "</th>" +
        "       <th>" + vg_Title_N3 + "</th>" +
        "       <th>Peso</th>";
    if (vg_flagPesoPonderado == 3) {
        vl_Html += "<th>Peso Ponderado</th>";
    }
    if (vg_flagErrorCritico == 3) {
        vl_Html += "<th>Error Critico</th>";
    }
    vl_Html += " <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjNivel_3) {
        var vl_PesoPonderado = (ObjNivel_3[ItemObj].PesoPonderado == "") ? "0" : ObjNivel_3[ItemObj].PesoPonderado;
        vl_ContadorPondera += parseFloat(vl_PesoPonderado);

        if (vl_value != 0) {
            if (ObjNivel_3[ItemObj].NotasDescriptivasId == vl_value) {
                vl_Contador += parseFloat(ObjNivel_3[ItemObj].Peso);
            }
        }

        var randomColor = "";
        var randomBackColor = "";

        for (ItemColor in Obj_Colors_N2) {
            if (ObjNivel_3[ItemObj].NotasDescriptivasId == Obj_Colors_N2[ItemColor].Obj_N2_Id) {
                randomColor = Obj_Colors_N2[ItemColor].color;
                randomBackColor = Obj_Colors_N2[ItemColor].background;
                break;
            }
        }


        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjNivel_3[ItemObj].Id + "'>" +
            "     <td style='color: #" + randomColor + " ;background: #" + randomBackColor + ";'>" + ObjNivel_3[ItemObj].NotasDescriptivasId + " - " + ObjNivel_3[ItemObj].NotasDescriptivas + "</td>" +
            "     <td>" + ObjNivel_3[ItemObj].Descripcion + "</td>" +
            "     <td>" + ObjNivel_3[ItemObj].Peso + "</td>";
        if (vg_flagPesoPonderado == 3) {
            vl_Html += "     <td>" + vl_PesoPonderado + "</td>";
        }
        if (vg_flagErrorCritico == 3) {
            vl_Html += "     <td>" + ObjNivel_3[ItemObj].EstadoProceso + "</td>";
        }
        vl_Html += "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EliminarGrid_Nivel_3('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Eliminar</span></span></div>" +
            "     <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EditarGrid_Nivel_3('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
            "    </td>" +
            "   </tr>";
    }
    vl_Html += "</tbody></table></div></div>";

    jQuery("#Container_Grid_Nivel_3").html("");
    jQuery("#Container_Grid_Nivel_3").html(vl_Html);

    jQuery("#GridWork_N3").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
    Carga_CatalogList(ObjNivel_3, "DList_Nivel_3", "");
    jQuery("#TxtContador_3").val(vl_Contador);
    jQuery("#TxtContador_Pon3").val(vl_ContadorPondera);
}

//edita el punto seleccionado
function EditarGrid_Nivel_3(vp_ObjIndex) {
    vg_FlagEditPunto = ObjNivel_3[vp_ObjIndex].Id;
    var vl_Contador = 0
    var vl_ContadorPondera = 0;

    jQuery(ObjNivel_3).each(function (ItemObj) {
        var vl_PesoPonderado = (ObjNivel_3[ItemObj].PesoPonderado == "") ? "0" : ObjNivel_3[ItemObj].PesoPonderado;
        vl_ContadorPondera += parseFloat(vl_PesoPonderado);

        if (ObjNivel_3[ItemObj].NotasDescriptivasId == ObjNivel_3[vp_ObjIndex].NotasDescriptivasId) {
            vl_Contador += parseFloat(ObjNivel_3[ItemObj].Peso);
        }
    }).promise().done(function () {
        jQuery("#TxtDescripcion_N3").val(ObjNivel_3[vp_ObjIndex].Descripcion);
        jQuery("#TxtPeso_N3").val(ObjNivel_3[vp_ObjIndex].Peso);
        jQuery("#DList_Nivel_2").val(ObjNivel_3[vp_ObjIndex].NotasDescriptivasId).trigger('chosen:updated');
        jQuery("#DListErrores").val(ObjNivel_3[vp_ObjIndex].EstadoProcesoId).trigger('chosen:updated');

        var vl_PesoPonderado2 = (ObjNivel_3[vp_ObjIndex].PesoPonderado == "") ? "0" : ObjNivel_3[vp_ObjIndex].PesoPonderado;
        jQuery("#TxtPeso_PP3").val(vl_PesoPonderado2);


        vl_ContadorPondera = parseFloat(vl_ContadorPondera) - parseFloat(vl_PesoPonderado2);
        vl_Contador = parseFloat(vl_Contador) - parseFloat(ObjNivel_3[vp_ObjIndex].Peso);
        jQuery("#TxtContador_3").val(vl_Contador);
        jQuery("#TxtContador_Pon3").val(vl_ContadorPondera);
    });

}

//elimina dato del nivel 3
function EliminarGrid_Nivel_3(vp_ObjIndex) {
    vg_DeleteId = ObjNivel_3[vp_ObjIndex].Id;
    vg_Modulo = 3;

    jQuery("#TitleDelete").html("Eliminar elemento Nivel 3 - " + vg_Title_N3);
    jQuery("#TxtNombreView").val(ObjNivel_3[vp_ObjIndex].Descripcion);
    jQuery("#LblMsmAdvertencia").html("Esta seguro de eliminar " + vg_Title_N3);
    jQuery("#LblMsmAdvertencia2").html("Recuerda al eliminar este dato eliminara en cascada todos los datos relacionadon con " + vg_Title_N4);

    jQuery("#ModalEliminar").modal("show");
}

//creacion de grid de puntos
function CreateGrid_Nivel_4() {
    var vl_Contador = 0;
    var vl_Html = "";

    vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>" + vg_Title_N4 + "</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork_N4' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>" + vg_Title_N3 + "</th>" +
        "       <th>" + vg_Title_N4 + "</th>" +
        "       <th>Peso</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjNivel_4) {
        vl_Contador += parseFloat(ObjNivel_4[ItemObj].Peso);

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjNivel_4[ItemObj].Id + "'>" +
            "     <td>" + ObjNivel_4[ItemObj].PuntosEntrenamientoId + " - " + ObjNivel_4[ItemObj].PuntosEntrenamiento + "</td>" +
            "     <td>" + ObjNivel_4[ItemObj].Descripcion + "</td>" +
            "     <td>" + ObjNivel_4[ItemObj].Peso + "</td>" +
            "     <td><div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EliminarGrid_Nivel_4('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Eliminar</span></span></div>" +
            "     <div class='col-lg-2 col-md-2' style='text-align: center;'><span class='ToolTip_Ver'><a class='opcLink' href=\"javascript:EditarGrid_Nivel_4('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>" +
            "    </td>" +
            "   </tr>";
    }
    vl_Html += "</tbody></table></div></div>";

    jQuery("#Container_Grid_Nivel_4").html("");
    jQuery("#Container_Grid_Nivel_4").html(vl_Html);

    jQuery("#GridWork_N4").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
    jQuery("#TxtContador_N4").val(vl_Contador);
}

//edita el foco de mejora
function EditarGrid_Nivel_4(vp_ObjIndex) {
    vg_FlagEditFoco = ObjNivel_4[vp_ObjIndex].Id;
    var vl_Contador = jQuery("#TxtContador_N4").val();

    jQuery("#TxtDescripcion_N4").val(ObjNivel_4[vp_ObjIndex].Descripcion);
    jQuery("#TxtPeso_N4").val(ObjNivel_4[vp_ObjIndex].Peso);
    jQuery("#DList_Nivel_3").val(ObjNivel_4[vp_ObjIndex].PuntosEntrenamientoId).trigger('chosen:updated');

    vl_Contador = parseFloat(vl_Contador) - parseFloat(ObjNivel_4[vp_ObjIndex].Peso);
    jQuery("#TxtContador_N4").val(vl_Contador);
}

//elimina dato del nivel 4
function EliminarGrid_Nivel_4(vp_ObjIndex) {
    vg_DeleteId = ObjNivel_4[vp_ObjIndex].Id;
    vg_Modulo = 4;

    jQuery("#TitleDelete").html("Eliminar elemento Nivel 4 - " + vg_Title_N4);
    jQuery("#TxtNombreView").val(ObjNivel_4[vp_ObjIndex].Descripcion);
    jQuery("#LblMsmAdvertencia").html("Esta seguro de eliminar " + vg_Title_N4);
    jQuery("#LblMsmAdvertencia2").html("");

    jQuery("#ModalEliminar").modal("show");
}

//creacion de grid de cargue
function CreateGrid_Result() {
    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><div class='col-xs-9 col-sm-9'><strong class='card-title'>Resultado del cargue<strong></div><div class='col-xs-3 col-sm-3''></div></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork_Result' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>N° Cargue</th>" +
        "       <th>Cantidad Registros</th>" +
        "       <th>Registros Creados</th>" +
        "       <th>Registros  " + vg_Title_N0 + "</th>" +
        "       <th>Registros  " + vg_Title_N1 + "</th>" +
        "       <th>Registros  " + vg_Title_N2 + "</th>" +
        "       <th>Registros  " + vg_Title_N3 + "</th>" +
        "       <th>Registros  " + vg_Title_N4 + "</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in Obj_Chargue) {


        vl_Html += "    <tr id= 'Tr_Cliente_" + Obj_Chargue[ItemObj].Id + "'>" +
            "     <td>" + Obj_Chargue[ItemObj].Id + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadRegistros + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadRegistrosCreados + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadError_1 + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadError_2 + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadError_3 + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadError_4 + "</td>" +
            "     <td>" + Obj_Chargue[ItemObj].CantidadError_5 + "</td>" +
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
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//trae los titulos de formulario de la campaña
function ListFormularioCampana_Transaction() {

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/ListFormulario_Title",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Form = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        vg_Title_N0 = Obj_Form[0].Title_Nivel0;
        jQuery(".TN_0").html(Obj_Form[0].Title_Nivel0);
        vg_Title_N1 = Obj_Form[0].Title_Nivel1;
        jQuery(".TN_1").html(Obj_Form[0].Title_Nivel1);
        vg_Title_N2 = Obj_Form[0].Title_Nivel2;
        jQuery(".TN_2").html(Obj_Form[0].Title_Nivel2);
        vg_Title_N3 = Obj_Form[0].Title_Nivel3;
        jQuery(".TN_3").html(Obj_Form[0].Title_Nivel3);
        vg_Title_N4 = Obj_Form[0].Title_Nivel4;
        jQuery(".TN_4").html(Obj_Form[0].Title_Nivel4);
        ListFormulariosGrid();
    });
}

//crga formularios creados
function ListFormulariosGrid() {
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/List_FormulariosCampana",
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

//trae todos los usuario para el control
function Read_Complementos_Transaction(vp_Index) {
    jQuery("#Carga").css("display", "block");

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ReadComplementos",
            "FormularioId": vp_Index
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            jQuery("#Carga").css("display", "none");
            result = JSON.parse(result);

            ObjNivel_0 = result[0];
            ObjNivel_1 = result[1];
            ObjNivel_2 = result[2];
            ObjNivel_3 = result[3];
            ObjNivel_4 = result[4];
            ObjConfig = result[5];

        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {

        CreateGrid_Nivel_0();
        CreateGrid_Nivel_1();
        CreateGrid_Nivel_2(0);
        CreateGrid_Nivel_3(0);
        CreateGrid_Nivel_4();
        EditConfig();

        setTimeout(function () { ValidaEstadoForm(); }, 500);
    });
}

//Crea el formulario
function CreateFormulario_Transaction() {

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/Create_Formulario",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{TypeOperation: '" + vg_EditFormulario +
            "', Descripcion: '" + jQuery("#TxtDescripcionForm").val() +
            "', MaxEvaluacion: '" + jQuery("#TxtvalForm").val() + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vg_formularioId = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery("#TxtAvance").css("background", "#f12828");
        jQuery("#TxtAvance").val("5%");

        jQuery("#TxtNunFormulario").val(vg_formularioId);
        jQuery("#HtmlTitleForm").val(jQuery("#TxtDescripcionForm").val());
        jQuery("#Txt_ValorMaximoEvaluar").val(jQuery("#TxtvalForm").val());
        jQuery("#ModalStart").modal('hide');
        Clear(0);
    });
}

//activa o desactiva el cargo seleccionado
function Des_Activa_Cargo_Transaction() {
    var vl_Contador = jQuery("#TxtContador_0").val();
    vl_Contador = parseInt(vl_Contador) + parseInt(jQuery("#TxtPeso_N0").val());

    var vl_flag;
    var vl_Estado;

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/ActiveInactiveCargo",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ TypeOperation:'" + vg_FlagEditCargo +
            "',Estado:'" + vg_EstadoCargo + "'}",
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

                var vl_conplementoMSM = (vl_Estado == 0) ? "desactivado" : "activado";
                Message("Success", "El cargo se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);

                Read_Complementos_Transaction(jQuery("#TxtNunFormulario").val());
                break;

            case "500":
                Message("Error", "Hubo errores al tratar de desactivar el cargo.", 5000);
                break;

            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                break;
        }
    });
}

//crea el cargo
function Create_N0_Transaction() {
    var vl_Contador = jQuery("#TxtContador_0").val();
    vl_Contador = parseFloat(vl_Contador) + parseFloat(FormatDecimals(jQuery("#TxtPeso_N0").val()));

    vl_Cargo = (vg_flagCargo == 0) ? 0 : jQuery("#DList_Nivel_0").val();
    var vl_maxEval = jQuery("#Txt_ValorMaximoEvaluar").val();

    if (vl_Contador > vl_maxEval) {
        Message("Alert", "la sumatoria de porcentajes no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_Contador);
    }
    else {
        jQuery.ajax({
            url: "/Controller/ProcesoTransaccion.aspx/Create_Cargo",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            //crear json
            data: "{TypeOperation: '" + vg_FlagEditCargo +
                "', FormularioId: '" + jQuery("#TxtNunFormulario").val() +
                "', Descripcion: '" + jQuery("#TxtDescripcion").val() +
                "', Peso: '" + FormatDecimals(jQuery("#TxtPeso_N0").val()) + "'}",
            //Transaccion Ajax en proceso
            success: function (result) {
                ObjNivel_0 = result.d.data;
            },
            error: function () {
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
            },
        }).done(function () {
            Clear(1);
            CreateGrid_Nivel_0();
        });
    }
}

//crea el bloque evaluacion
function Create_N1_Transaction() {
    var vl_ContCargo = ObjNivel_0.length;
    var vl_Contador = jQuery("#TxtContador_1").val();
    vl_Contador = parseFloat(vl_Contador) + parseFloat(FormatDecimals(jQuery("#TxtPeso_N1").val()));

    vl_Cargo = (vg_flagCargo == 0) ? 0 : jQuery("#DList_Nivel_0").val();
    var vl_maxEval = jQuery("#Txt_ValorMaximoEvaluar").val();

    if (parseFloat(vl_Contador) > parseFloat(vl_maxEval)) {
        Message("Alert", "la sumatoria de porcentajes no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_Contador);
    }
    else {
        if (vl_ContCargo != 0) {
            var vl_Contador2 = jQuery("#TxtContador_A0").val();
            vl_Contador2 = parseFloat(vl_Contador2) + parseFloat(FormatDecimals(jQuery("#TxtPesoA_N0").val()));

            var vl_maxEval = jQuery("#Txt_ValorMaximoEvaluar").val();

            if (vl_Contador2 > vl_maxEval) {
                Message("Alert", "la sumatoria de porcentajes del cargo no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_Contador2);
            }
            else {
                jQuery.ajax({
                    url: "/Controller/ProcesoTransaccion.aspx/Create_BloqueEvaluacion",
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    //crear json
                    data: "{TypeOperation: '" + vg_FlagEditEvaluacion +
                        "', FormularioId: '" + jQuery("#TxtNunFormulario").val() +
                        "', CargoId: '" + vl_Cargo +
                        "', Descripcion: '" + jQuery("#TxtDescripcion_N1").val() +
                        "', Peso: '" + FormatDecimals(jQuery("#TxtPeso_N1").val()) +
                        "', PesoCargo: '" + FormatDecimals(jQuery("#TxtPesoA_N0").val()) + "'}",
                    //Transaccion Ajax en proceso
                    success: function (result) {
                        ObjNivel_1 = result.d.data;
                    },
                    error: function () {
                        Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                    },
                }).done(function () {
                    Clear(2);
                    CreateGrid_Nivel_1();
                    jQuery("#BlockNotas").show('slow');
                });
            }
        }
        else {
            jQuery.ajax({
                url: "/Controller/ProcesoTransaccion.aspx/Create_BloqueEvaluacion",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                //crear json
                data: "{TypeOperation: '" + vg_FlagEditEvaluacion +
                    "', FormularioId: '" + jQuery("#TxtNunFormulario").val() +
                    "', CargoId: '" + vl_Cargo +
                    "', Descripcion: '" + jQuery("#TxtDescripcion_N1").val() +
                    "', Peso: '" + FormatDecimals(jQuery("#TxtPeso_N1").val()) +
                    "', PesoCargo: '" + FormatDecimals(jQuery("#TxtPesoA_N0").val()) + "'}",
                //Transaccion Ajax en proceso
                success: function (result) {
                    ObjNivel_1 = result.d.data;
                },
                error: function () {
                    Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                },
            }).done(function () {
                Clear(2);
                CreateGrid_Nivel_1();
                jQuery("#BlockNotas").show('slow');
            });
        }
    }
}

//crea el bloque notas
function Create_N2_Transaction() {
    var vl_ValueId = jQuery("#DList_Nivel_1").val();
    var vl_Contador = jQuery("#TxtContador_2").val();
    var vl_ContadorPonde = jQuery("#TxtContador_Pon2").val();

    vl_Contador = parseFloat(vl_Contador) + parseFloat(FormatDecimals(jQuery("#TxtPeso_N2").val()));
    vl_ContadorPonde = parseFloat(vl_ContadorPonde) + parseFloat(FormatDecimals(jQuery("#TxtPeso_PP2").val()));

    var vl_maxEval = jQuery("#Txt_ValorMaximoEvaluar").val();

    if (vl_Contador > vl_maxEval) {
        Message("Alert", "la sumatoria de porcentajes no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_Contador);
    }
    else {
        if (vl_ContadorPonde > vl_maxEval) {
            Message("Alert", "la sumatoria de porcentajes del peso ponderado no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_ContadorPonde);
        }
        else {
            var vl_PesoPonderado = (vg_flagPesoPonderado == 2) ? jQuery("#TxtPeso_PP2").val() : 0;
            var vl_ErrorCritico = (vg_flagErrorCritico == 2) ? jQuery("#DListErrores_1").val() : 120;

            jQuery.ajax({
                url: "/Controller/ProcesoTransaccion.aspx",
                type: "POST",
                //crear json
                data: {
                    "Action": "CreateNivel2",
                    "TypeOperation": vg_FlagEditNotas,
                    "FormularioId": jQuery("#TxtNunFormulario").val(),
                    "BloqueEvaluacionId": jQuery("#DList_Nivel_1").val(),
                    "Descripcion": jQuery("#TxtDescripcion_N2").val(),
                    "Peso": FormatDecimals(jQuery("#TxtPeso_N2").val()),
                    "PesoPonderado": FormatDecimals(vl_PesoPonderado),
                    "EstadoProcesoId": vl_ErrorCritico,
                    "PesoPonderadoNivel": vg_flagPesoPonderado,
                    "ErrorCriticoNivel": vg_flagErrorCritico
                },
                //Transaccion Ajax en proceso
                success: function (result) {
                    ObjNivel_2 = JSON.parse(result);
                },
                error: function () {
                    Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                },
            }).done(function () {
                Clear(3);
                CreateGrid_Nivel_2(vl_ValueId);
                jQuery("#BlockPuntos").show('slow');
            });
        }
    }
}

//crea el bloque puntos
function Create_N3_Transaction() {
    var vl_ValueId = jQuery("#DList_Nivel_2").val();
    var vl_Contador = jQuery("#TxtContador_3").val();
    var vl_ContadorPonde = jQuery("#TxtContador_Pon3").val();

    vl_Contador = parseFloat(vl_Contador) + parseFloat(FormatDecimals(jQuery("#TxtPeso_N3").val()));
    vl_ContadorPonde = parseFloat(vl_ContadorPonde) + parseFloat(FormatDecimals(jQuery("#TxtPeso_PP3").val()));

    var vl_maxEval = jQuery("#Txt_ValorMaximoEvaluar").val();

    if (vl_Contador > vl_maxEval) {
        Message("Alert", "la sumatoria de porcentajes no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_Contador);
    }
    else {
        if (vl_ContadorPonde > vl_maxEval) {
            Message("Alert", "la sumatoria de porcentajes del peso ponderado no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_ContadorPonde);
        }
        else {
            var vl_PesoPonderado = (vg_flagPesoPonderado == 3) ? jQuery("#TxtPeso_PP3").val() : 0;
            var vl_ErrorCritico = (vg_flagErrorCritico == 3) ? jQuery("#DListErrores").val() : 120;

            jQuery.ajax({
                url: "/Controller/ProcesoTransaccion.aspx",
                type: "POST",
                //crear json
                data: {
                    "Action": "CreateNivel3",
                    "TypeOperation": vg_FlagEditPunto,
                    "FormularioId": jQuery("#TxtNunFormulario").val(),
                    "NotasDescriptivasId": jQuery("#DList_Nivel_2").val(),
                    "Descripcion": jQuery("#TxtDescripcion_N3").val(),
                    "EstadoProcesoId": vl_ErrorCritico,
                    "Peso": jQuery("#TxtPeso_N3").val(),
                    "PesoPonderado": vl_PesoPonderado,
                    "PesoPonderadoNivel": vg_flagPesoPonderado,
                    "ErrorCriticoNivel": vg_flagErrorCritico
                },
                //Transaccion Ajax en proceso
                success: function (result) {

                    ObjNivel_3 = JSON.parse(result);

                },
                error: function () {
                    Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
                },
            }).done(function () {

                Clear(4);
                CreateGrid_Nivel_3(vl_ValueId);
            });
        }
    }
}

//crea el bloque puntos
function Create_N4_Transaction() {
    var vl_Contador = jQuery("#TxtContador_N4").val();
    vl_Contador = parseFloat(vl_Contador) + parseFloat(FormatDecimals(jQuery("#TxtPeso_N4").val()));
    var vl_maxEval = jQuery("#Txt_ValorMaximoEvaluar").val();

    if (vl_Contador > vl_maxEval) {
        Message("Alert", "la sumatoria de porcentajes no puede pasar del " + vl_maxEval + "% actualmente esta en : " + vl_Contador);
    }
    else {
        jQuery.ajax({
            url: "/Controller/ProcesoTransaccion.aspx",
            type: "POST",
            //crear json
            data: {
                "Action": "CreateNivel4",
                "TypeOperation": vg_FlagEditFoco,
                "FormularioId": jQuery("#TxtNunFormulario").val(),
                "PuntosEntrenamientoId": jQuery("#DList_Nivel_3").val(),
                "Descripcion": jQuery("#TxtDescripcion_N4").val(),
                "Peso": FormatDecimals(jQuery("#TxtPeso_N4").val())
            },
            //Transaccion Ajax en proceso
            success: function (result) {

                ObjNivel_4 = JSON.parse(result);

            },
            error: function () {
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
            },
        }).done(function () {

            Clear(5);
            CreateGrid_Nivel_4();
        });
    }
}

//crea el bloque de configuracion
function CreateConfiguracion_Transaction() {
    var vl_flag = "";
    var vl_IdConf = 0;

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/Create_Configuracion",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{TypeOperation: '" + vg_FlagEditConfiguracion +
            "', FormularioId: '" + jQuery("#TxtNunFormulario").val() +
            "', Ope_Nivel_0: '" + vg_Check_N0 +
            "', Ope_Nivel_1: '" + vg_Check_N1 +
            "', Ope_Nivel_2: '" + vg_Check_N2 +
            "', VariosOperadores: '" + vg_AplicaVarios +
            "', Ope_Nivel_3: '" + vg_Check_N3 +
            "', Ope_Nivel_4: '" + vg_Check_N4 +
            "', OpcCumple: '" + vg_OpcC +
            "', OpcNoCumple: '" + vg_OpcNC +
            "', OpcNoAplica: '" + vg_OpcNA +
            "', NoAplicaPeso: '" + vg_AplicaNA +
            "', AplicaErrorCritico: '" + vg_AplicaEC +
            "', MonitoreoXDefecto: '" + vg_SelectMonitoreo + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
            vl_IdConf = result.d.data[0].Id;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        switch (vl_flag) {
            case "200":
                var vl_conplementoMSM = (vg_FlagEditConfiguracion == 0) ? "creado" : "actualizado";

                Message("Success", "la configuración del formulario se ha " + vl_conplementoMSM + " satisfactoriamente.", 5000);
                vg_FlagEditConfiguracion = vl_IdConf;
                break;

            default:
                Message("Error", "no se realizao la transacci'on de la configuración del formulario.");
                break;
        }
    });
}

//elimina item del modulo celeecionado
function Delete_Transaction() {

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/Delete_Item",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{DeleteId: '" + vg_DeleteId +
            "', FormularioId: '" + jQuery("#TxtNunFormulario").val() +
            "', Modulo: '" + vg_Modulo + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            switch (vg_Modulo) {
                case 0:
                    ObjNivel_0 = result.d.nivel_0;
                    ObjNivel_1 = result.d.nivel_1;
                    ObjNivel_2 = result.d.nivel_2;
                    ObjNivel_3 = result.d.nivel_3;
                    ObjNivel_4 = result.d.nivel_4;
                    break;
                case 1:
                    ObjNivel_1 = result.d.nivel_1;
                    ObjNivel_2 = result.d.nivel_2;
                    ObjNivel_3 = result.d.nivel_3;
                    ObjNivel_4 = result.d.nivel_4;
                    break;
                case 2:
                    ObjNivel_2 = result.d.nivel_2;
                    ObjNivel_3 = result.d.nivel_3;
                    ObjNivel_4 = result.d.nivel_4;
                    break;
                case 3:
                    ObjNivel_3 = result.d.nivel_3;
                    ObjNivel_4 = result.d.nivel_4;
                    break;
                case 4:
                    ObjNivel_4 = result.d.nivel_4;
                    break;
            }
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        switch (vg_Modulo) {
            case 0:
                CreateGrid_Nivel_0();
                CreateGrid_Nivel_1();
                CreateGrid_Nivel_2(0);
                CreateGrid_Nivel_3(0);
                CreateGrid_Nivel_4();
                break;
            case 1:
                CreateGrid_Nivel_1();
                CreateGrid_Nivel_2(0);
                CreateGrid_Nivel_3(0);
                CreateGrid_Nivel_4();
                break;
            case 2:
                CreateGrid_Nivel_2(0);
                CreateGrid_Nivel_3(0);
                CreateGrid_Nivel_4();
                break;
            case 3:
                CreateGrid_Nivel_3(0);
                CreateGrid_Nivel_4();
                break;
            case 4:
                CreateGrid_Nivel_4();
                break;
        }
        jQuery("#ModalEliminar").modal("hide");
    });
}

//Cambio de estado del formulario
function Update_FormularioEstado_Transaction(vp_Index) {
    var vg_flag = ""
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/Update_FormularioEstado",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{FormularioId: '" + jQuery("#TxtNunFormulario").val()
            + "', Estado: '" + vp_Index + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vg_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {

        if (vg_flag == "200") {
            if (vp_Index == 2) {
                Message("Success", "El formulario se ha activado satisfactoriamente, recuerde que activo el formulario no puede editarlo.", 5000);
            }
            else {
                Message("Success", "El formulario se ha inactivado satisfactoriamente, recuerde que en este estado puede editar el formulario no puede editarlo.", 5000);
                jQuery("#ModalFormDesactivar").modal("hide")
            }

            Clear(6);
            ModalForm(2);
        }
        else {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        }
    });
}

//trae todos los usuario para el control
function ClonarProyecto_Transaction(vp_Index) {
    var vl_Flag = "";

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ClonarForm",
            "FormularioId": vp_Index
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_Flag = result;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {

        if (vl_Flag == "CLONADO") {
            ModalForm(2);
        }
        else {
            Message("Error", "Se generó un error al realizar la clonación. Error al detalle [" + vl_Flag + "]", 6000);
        }
    });
}

//dispara el evento de eliminar formulario
function DeleteForm_Transaction() {
    if (jQuery("#TxtDigito").val() == "") {
        Message("Error", "Debe diligenciar el campo FormularioId .", 4000);
    }
    else {
        jQuery.ajax({
            url: "/Controller/ProcesoTransaccion.aspx/Delete_Formulario",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            //crear json
            data: "{FormularioId: '" + jQuery("#TxtDigito").val() + "'}",
            //Transaccion Ajax en proceso
            success: function (result) {
                vg_flag = result.d.data[0].Respuesta;
            },
            error: function () {
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
            },
        }).done(function () {

            if (vg_flag == "200") {
                Message("Success", "El formulario se ha eliminado satisfactoriamente.", 5000);
                jQuery("#ModalFormEliminar").modal("hide")

                ModalForm(2);
            }
            else {
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
            }
        });
    }
}

