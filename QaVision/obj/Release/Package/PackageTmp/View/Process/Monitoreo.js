//const jqueryValidate = require("../../Content/Template/vendors/jquery-validation/dist/jquery.validate");

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
var Obj_DLForm = [];
var Obj_ObservacionMo = [];

var Obj_Contadores = [];
var vg_NotaFinal = 0;

var Obj_RespuestasForm = [];
var Obj_ErroresC = [];

var vg_CoordinadorId = 0;

var vg_FlagEdit = 0;
var vg_flagCargo = 0;
var vg_FlagEditCargo = 0;
var vg_EditFormulario = 0;
var vg_FlagEditEvaluacion = 0;
var vg_FlagEditNotas = 0;
var vg_FlagEditPunto = 0;
var vg_FlagEditFoco = 0;
var vg_Modulo = 0;
var vg_DeleteId = 0;

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
var vg_OperadorBase = 0;
var vg_ValorMaximo = 0;
var vg_ECN = 0;
var vg_PPN = 0;
var vg_EstadoNivel = 0;

var vg_Cont_ECUF = 0;
var vg_Cont_ECN = 0;
var vg_Cont_ECC = 0;
var vg_EstadoMonitoreo = 0;
var vg_CantSupervisorM = 0;


var vg_SaveAgenteId = 0;
var vg_SaveCoordinadorId = 0;
var vg_CoorMonitorea = 0;
var vg_SaveMonitorId = 0;

var vg_ContM = 0;
var vg_ContR = 0;
var vg_ContOC = 0;
var vg_ContOA = 0;
var vg_ContC = 0;
var vg_ContE = 0;
var vg_AplicaErrorCritico = 0;
var vg_ValorPoint = 0;
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


    var maxDate = new Date();
    var minDate = new Date();
    var DaySum = parseInt(0);
    var DayREstum = parseInt(15);

    maxDate.setDate(maxDate.getDate() + DaySum);
    minDate.setDate(minDate.getDate() - DayREstum);

    jQuery('#TxtFecha').datepicker({
        dateFormat: 'yyyy-mm-dd',
        maxDate: maxDate,
        minDate: minDate
    });
    jQuery('#TxtFecha').data('datepicker');




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
    jQuery("#Block_Seg_monitoreo").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    var vl_Parameters = Capture_GET();
    ListRol_Transaction();
    ListFormularioCampana_Transaction();
    ValidaRol();

    DropListAgent_Transaction();
    Cargue_Droplist("DList_TipoMonitoreo", 9, "", "T", "X");
    Cargue_Droplist_FiltrerCuenta("DList_Proceso", 8, "", "T", "X");
    DropListFomularios_Transaction();

    ChangueControl();

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
            jQuery("#Block_Seg_monitoreo").fadeOut('fast');
            jQuery("#Block_Create_monitoreo").show('slow');

            jQuery("#TForm").html("Crear Monitoreo");

            jQuery("#BlockForm").css('display', 'block');
            jQuery("#btn_reg").css('display', 'block');
            jQuery("#Block_Calificacion").css('display', 'block');

            jQuery("#BlockView").fadeOut('fast');
            jQuery("#BlockForm").show('slow');
            jQuery("#btn_reg").show('slow');
            jQuery("#btn_cre").fadeOut('fast');
            jQuery("#Block_SegMonitoreo").css('display', 'none');
            jQuery("#talkbubble").css('display', 'none');
            break;

        case 2:
            vg_FlagEdit = 0;

            //Clear(6);
            jQuery("#TForm").html("Ver Monitoreo");
            jQuery("#BlockForm").fadeOut('fast');
            jQuery("#BlockView").show('slow');
            jQuery("#btn_reg").fadeOut('fast');
            jQuery("#btn_CreManmual").css("display", "block");
            jQuery("#Block_Calificacion").css('display', 'none');


            break;
    }
}

//evento de monitoreo
function Btn_Save() {
    var IdMonitoreo = jQuery("#TxtNunFormulario").val();
    var Avance = jQuery("#ContAvance").html();
    var Observacion = jQuery("#TxtObservacion").val();

    if (IdMonitoreo == 0) {
        //crear monitoreo
        (Avance != "100 %" || Observacion == "") ? Message("Alert", "Para Crear el monitoreo debe estar al 100 % diligenciado el formulario y dejar una observación") : jQuery("#ModalConfirmar").modal("show");
    }
    else {
        //seguir monitoreo
    }
}

//evento de avance 
function Btn_Avance(vp_Type) {

    if (jQuery("#TxtCapturaObservacion").val() == "") {
        Message("Error", "El campo observación esta vacio");
    }
    else {
        if (vp_Type == "S") {
            //acepta
            switch (vg_EstadoMonitoreo) {
                case 126:
                    GuardarAvance(124, jQuery("#TxtCapturaObservacion").val());//Monitoreo nuevamente
                    break;
                case 124:
                case 128:
                    GuardarAvance(125, jQuery("#TxtCapturaObservacion").val());//retroalimentacion
                    break;
                case 125:
                    GuardarAvance(127, jQuery("#TxtCapturaObservacion").val());//compromiso
                    break;
            }
        }
        else {
            //objecion
            switch (vg_EstadoMonitoreo) {
                case 124:
                case 128:
                    GuardarAvance(126, jQuery("#TxtCapturaObservacion").val());//objecion cor
                    break;
                case 125:
                    GuardarAvance(128, jQuery("#TxtCapturaObservacion").val());//objecion Agen
                    break;
                case 126:
                    DropListEscaladores_Transaction();
                    jQuery("#ModalEscalar").modal("show");
                    jQuery("#LblMsmEscalar").html(jQuery("#TxtCapturaObservacion").val());
                    break;

            }
        }
    }

}

//evento de escalamiento
function Btn_Escalar() {
    var vl_evaluar = jQuery("#DList_Resposable").val();

    (vl_evaluar == "-1") ? Message("Alert", "Debe seleccionar un persona") : AsignarEscalador_Transaction();
}

//dispara el evento de eliminacion del monitoreo
function Btn_EliminarMonitoreo() {
    DeleteMonitoreo_Transaction();
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION VALIDACIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ValidaCampos() {

    var vl_Campo_1 = jQuery("#DList_Agente").val();
    var vl_Campo_2 = jQuery("#DList_TipoMonitoreo").val();
    var vl_Campo_3 = jQuery("#DList_Proceso").val();
    var vl_Campo_4 = jQuery("#TxtFecha").val();

    var vl_Valida = 0;

    if (vl_Campo_1 == "-1" ||
        vl_Campo_2 == "-1" ||
        vl_Campo_3 == "-1" ||
        vl_Campo_4 == "") {
        vl_Valida = 1;

        if (vl_Campo_1 == "-1") { jQuery("#help_Agente").html("* Agente Obligatorio"); jQuery("#help_Agente").css("display", "block"); } else { jQuery("#help_Agente").html(""); jQuery("#help_Agente").css("display", "none"); }
        if (vl_Campo_2 == "-1") { jQuery("#help_TipoMonitoreo").html("* Tipo Monitoreo Obligatorio"); jQuery("#help_TipoMonitoreo").css("display", "block"); } else { jQuery("#help_TipoMonitoreo").html(""); jQuery("#help_TipoMonitoreo").css("display", "none"); }
        if (vl_Campo_3 == "-1") { jQuery("#help_Proceso").html("* Proceso Obligatorio"); jQuery("#help_Proceso").css("display", "block"); } else { jQuery("#help_Proceso").html(""); jQuery("#help_Proceso").css("display", "none"); }
        if (vl_Campo_4 == "") { jQuery("#helpFecha").html("* Fecha Obligatorio"); jQuery("#helpFecha").css("display", "block"); } else { jQuery("#helpFecha").html(""); jQuery("#helpFecha").css("display", "none"); }

    }
    else {
        jQuery("#help_Agente").html("");
        jQuery("#help_Agente").css("display", "none");
        jQuery("#help_TipoMonitoreo").html("");
        jQuery("#help_TipoMonitoreo").css("display", "none")
        jQuery("#help_Proceso").html("");
        jQuery("#help_Proceso").css("display", "none");
        jQuery("#helpFecha").html("");
        jQuery("#helpFecha").css("display", "none");

    }

    return vl_Valida;
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ValidaRol() {
    switch (Obj_Data[0].IdRol) {
        case 1: //administrador
            jQuery("#btn_cre").css("display", "block");
            break;
        case 2: //Super monitor
            jQuery("#btn_cre").css("display", "block");
            break;
        case 3: //monitor
            (vg_CantSupervisorM == 0) ? jQuery("#btn_cre").css("display", "block") : jQuery("#btn_cre").css("display", "none");
            break;
        case 4: //coordinador
            (vg_CoorMonitorea == 1) ? jQuery("#btn_cre").css("display", "block") : jQuery("#btn_cre").css("display", "none");
            break;
        case 5: //agente
            break;
        case 6: //clente
            break;
    }
}

//evento de chances en controles
function ChangueControl() {
    var vl_ValidaCampo = "";
    jQuery("#DList_Agente").change(function () {
        var vl_value = jQuery(this).val();

        TraerCoordinador_Transaction(vl_value);
    });

    jQuery("#DList_Formulario").change(function () {
        vg_formularioId = jQuery(this).val();
        var nombreForm = jQuery('#DList_Formulario option:selected').html().toUpperCase();
        jQuery("#Title_formulario").html(nombreForm);

        vl_ValidaCampo = ValidaCampos();

        (vl_ValidaCampo == 1) ? Message("Error", "Revisar Campos obligatorios.") : TraerForm_Transaction(vg_formularioId);

        jQuery("#BlockPECUF").css("margin-top", "5px");
        jQuery("#BlockPECC").css("margin-top", "-33px");

        AsignaValores();

    });

    jQuery("#Check_Graphics").on('change', function () {
        (jQuery(this).is(':checked')) ? PaintGraficas('pie') : PaintGraficas('bar');
    });
}

//asigna valores del formulario seleccionado
function AsignaValores() {

    for (Item in Obj_DLForm) {
        if (Obj_DLForm[Item].Id == vg_formularioId) {

            vg_ValorMaximo = Obj_DLForm[Item].ValorMaximoEvaluar;

            vg_ECN = Obj_DLForm[Item].ErrorCriticoNivel;
            vg_PPN = Obj_DLForm[Item].PesoPonderadoNivel;
            vg_EstadoNivel = Obj_DLForm[Item].Estado;
        }
    }
}

//dispara la crecion del formulario
function CreateForm() {

    var vl_html_Form = " <div class='ziehharmonika'>";
    if (ObjNivel_0.length != 0) {
        //con nivel 0
        for (var item_N0 in ObjNivel_0) {
            var vl_container = "Container_N0_" + ObjNivel_0[item_N0].Id;

            vl_html_Form += "" +
                "   <h3>" + ObjNivel_0[item_N0].Descripcion + "<span id='Peso_" + ObjNivel_0[item_N0].Id + "'> " + ObjNivel_0[item_N0].Peso + "</span> </h3>" +
                "		<div  id=" + vl_container + " style='width: 100%'></div> " +
                "";
        }

        if (vg_FlagEdit != 0) {
            vl_html_Form += "   <h3>Historico Monitoreo</span> </h3>" +
                "  <div  id='History' style='width: 100%'>" +
                "       <div id='talkbubble''></div>" +
                "		<div id='Container_time' style='width: 100%'></div>" +
                "</div>";
        }

        vl_html_Form += "</div>";
        jQuery("#Container_Form").html(vl_html_Form);
        setTimeout(function () { formNivel_1(); }, 500)
    }
    else {
        //nivel 1
        for (var item_N1 in ObjNivel_1) {
            var vl_container = "Container_N1_" + ObjNivel_1[item_N1].Id;

            vl_html_Form += "" +
                "   <h3>" + ObjNivel_1[item_N1].Descripcion + "  <span id='Peso_" + ObjNivel_1[item_N1].Id + "'>" + ObjNivel_1[item_N1].Peso + "</span> </h3>" +
                "		<div  id=" + vl_container + " style='width: 100%'></div> " +
                "";
        }
        if (vg_FlagEdit != 0) {
            vl_html_Form += "   <h3>Historico Monitoreo</span> </h3>" +
                "  <div  id='History' style='width: 100%'>" +
                "       <div id='talkbubble''></div>" +
                "		<div id='Container_time' style='width: 100%'></div>" +
                "</div>";
        }

        vl_html_Form += "</div>";
        jQuery("#Container_Form").html(vl_html_Form);
        setTimeout(function () { formNivel_2(); }, 500);
    }

    jQuery('.ziehharmonika').ziehharmonika({
        collapsible: true,
        prefix: '➥'
    });


    setTimeout(function () { FormatStyle(); }, 500);
}

//construye el bloque de primer nivel
function formNivel_1() {
    for (IN0 in ObjNivel_0) {
        var vl_html_Form = "";
        for (IN1 in ObjNivel_1) {
            if (ObjNivel_0[IN0].Id == ObjNivel_1[IN1].CargoId) {
                var vl_container = "Container_N1_" + ObjNivel_1[IN1].Id;

                vl_html_Form += "" +
                    "   <div class='card' style='margin-left: -8px; margin-right: -8px;'>" +
                    "       <div class='card-header'>" +
                    "           <strong>" + ObjNivel_1[IN1].Descripcion + "</strong>" +
                    "       </div>" +
                    "       <div class='card-body card-block'>" +
                    "             <div class='col-xs-12 col-sm-12'>" +
                    "                   <div id='" + vl_container + "' style='width: 100%'>" +
                    "                    </div>" +
                    "            </div>" +
                    "       </div>" +
                    "   </div>";
            }
        }
        jQuery("#Container_N0_" + ObjNivel_0[IN0].Id).html(vl_html_Form);
        setTimeout(function () { FormatStyle(); }, 500);
    }

    setTimeout(function () { formNivel_2(); }, 500);
}

//construye bloque segundo nivel
function formNivel_2() {
    for (IN1 in ObjNivel_1) {
        var vl_html_Form = "";
        for (IN2 in ObjNivel_2) {
            if (ObjNivel_1[IN1].Id == ObjNivel_2[IN2].BloqueEvaluacionId) {
                var vl_container = "Container_N2_" + ObjNivel_2[IN2].Id;

                vl_html_Form += "" +
                    "   <div class='card' style='margin-left: -27px; margin-right: -27px;'>" +
                    "       <div class='card-header'>" +
                    "           <strong>" + ObjNivel_2[IN2].Descripcion + "</strong>" +
                    "       </div>" +
                    "       <div class='card-body card-block'>" +
                    "             <div class='col-xs-12 col-sm-12'>" +
                    "                   <div id='" + vl_container + "' style='width: 100%'>" +
                    "                    </div>" +
                    "            </div>" +
                    "       </div>" +
                    "   </div>";
            }
        }
        jQuery("#Container_N1_" + ObjNivel_1[IN1].Id).html(vl_html_Form);
        setTimeout(function () { FormatStyle(); }, 500);
    }
    setTimeout(function () { FormNivel_3(); }, 500);
}

//construye bloque tercer nivel de preguntas 
function FormNivel_3() {


    var vl_contadorItems = 1;
    var vl_create = 0;

    for (IN2 in ObjNivel_2) {
        var count_N4 = ObjNivel_4.length;
        var vl_html_Form = "";

        if (count_N4 != 0) {

            vl_html_Form = "   <div class='row'>" +
                "       <div class='col-6 col-md-6' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'>" +
                "           <label for='select' class='form-control-label'>Item</label>" +
                "       </div>";
            if (ObjConfig[0].OpcCumple == 1) {
                vl_html_Form += "       <div class='col-1 col-md-1' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'> " +
                    "           <label for='select' class='form-control-label'>Cumple</label>" +
                    "        </div>";
            }
            if (ObjConfig[0].OpcNoCumple == 1) {
                vl_html_Form += "       <div class='col-1 col-md-1' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'>" +
                    "           <label for='select' class='form-control-label'>No Cumple</label>" +
                    "        </div>";
            }
            if (ObjConfig[0].OpcNoAplica == 1) {
                vl_html_Form += "       <div class='col-1 col-md-1' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'>" +
                    "           <label for='select' class='form-control-label'>No Aplica</label>" +
                    "        </div>";
            }
            vl_html_Form += "       <div class='col-3 col-md-3' style='border: solid 1px #e8e3e3;  background: #cacaca; font-weight: bold;'>" +
                "           <label for='select' class='form-control-label'>Foco Mejora</label>" +
                "        </div>" +
                "    </div>";

            for (IN3 in ObjNivel_3) {
                if (ObjNivel_2[IN2].Id == ObjNivel_3[IN3].NotasDescriptivasId) {

                    var vl_container = "Container_N3_" + ObjNivel_3[IN3].Id;

                    for (itemT in Obj_Contadores) {

                        if (Obj_Contadores[itemT].NotasDescriptivasId == ObjNivel_3[IN3].NotasDescriptivasId) {
                            Obj_Contadores[itemT].Contador = vl_contadorItems;
                            vl_create = 1;
                            break;
                        }
                    }

                    if (vl_create == 0) {
                        var json = {
                            "NotasDescriptivasId": ObjNivel_3[IN3].NotasDescriptivasId,
                            "Peso": (vg_ECN == 2) ? ObjNivel_2[IN2].Peso : ObjNivel_3[IN3].Peso,
                            "Contador": vl_contadorItems,
                            "PesoIndividual": 0
                        }

                        Obj_Contadores.push(json);
                        vl_create = 0;
                    }
                    vl_contadorItems++;

                    vl_html_Form += "" +
                        "   <div class='row'>" +
                        "       <div  id='Block_ND_" + ObjNivel_3[IN3].Id + "' class='col-5 col-md-5' style='border: solid 1px #e8e3e3;'>" +
                        "           <label for='select' class='form-control-label'>" + ObjNivel_3[IN3].Descripcion + "</label>" +
                        "       </div>" +
                        "       <div   class='col-1 col-md-1' style='border: solid 1px #e8e3e3;font-size: 11px; font-weight: bold;'>";
                    var StrEC = "";

                    if (vg_ECN == 2) {

                        switch (ObjNivel_2[IN2].EstadoProcesoId) {
                            case 117:
                                StrEC = "ECUF";
                                break;
                            case 118:
                                StrEC = "ECN";
                                break;
                            case 119:
                                StrEC = "ECC";
                                break;
                            case 120:
                                StrEC = "-";
                                break;
                        }
                    }
                    else {
                        switch (ObjNivel_3[IN3].EstadoProcesoId) {
                            case 117:
                                StrEC = "ECUF";
                                break;
                            case 118:
                                StrEC = "ECN";
                                break;
                            case 119:
                                StrEC = "ECC";
                                break;
                            case 120:
                                StrEC = "-";
                                break;
                        }
                    }
                    vl_html_Form += "           <label for='select' class='form-control-label'>" + StrEC + "</label>" +
                        "       </div>";

                    if (ObjConfig[0].OpcCumple == 1) {
                        vl_html_Form += "       <div class='col-1 col-md-1 Block_Cumple' style=' text-align: center; padding-top: 12px;'> " +
                            "            <label class='containerX'>" +
                            "               <input type='radio' id='OpC_" + ObjNivel_3[IN3].Id + "' name='Valida_" + ObjNivel_3[IN3].Id + "' value='C' style='display:none;' >" +
                            "                <span class='checkmark'></span> " +
                            "            </label>" +
                            "        </div>";
                    }
                    if (ObjConfig[0].OpcNoCumple == 1) {
                        vl_html_Form += "       <div class='col-1 col-md-1 Block_NoCumple' style='border: solid 1px #e8e3e3; text-align: center; padding-top: 12px;'>" +
                            "            <label class='containerX'>" +
                            "           <input type='radio' id='OpNC_" + ObjNivel_3[IN3].Id + "' name='Valida_" + ObjNivel_3[IN3].Id + "' value='NC' style='display:none;'>" +
                            "                <span class='checkmark'></span> " +
                            "            </label>" +
                            "        </div>";
                    }
                    if (ObjConfig[0].OpcNoAplica == 1) {
                        vl_html_Form += "       <div class='col-1 col-md-1 Block_NoAplica' style='border: solid 1px #e8e3e3; text-align: center; padding-top: 12px;'>" +
                            "            <label class='containerX'>" +
                            "           <input type='radio' id='OpNA_" + ObjNivel_3[IN3].Id + "' name='Valida_" + ObjNivel_3[IN3].Id + "' value='NA' style='display:none;'>" +
                            "                <span class='checkmark'></span> " +
                            "            </label>" +
                            "        </div>";
                    }
                    vl_html_Form += "       <div class='col-3 col-md-3' style='border: solid 1px #e8e3e3; text-align: center; padding-top: 12px;'>" +
                        "             <select id='DList_FM_" + ObjNivel_3[IN3].Id + "' data-placeholder='Seleccione Item.' class='standardSelect'>" +
                        "                   <div id='" + vl_container + " style='width: 100%'>" +
                        "             </select>" +
                        "        </div>" +
                        "   </div>";
                }
                else {
                    vl_create = 0;
                    vl_contadorItems = 1;
                }
            }
        }
        else {
            vl_html_Form += "   <div class='row'>" +
                "       <div class='col-9 col-md-9' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'>" +
                "           <label for='select' class='form-control-label'>Item</label>" +
                "       </div>";
            if (ObjConfig[0].OpcCumple == 1) {
                vl_html_Form += "       <div class='col-1 col-md-1' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'> " +
                    "           <label for='select' class='form-control-label'>Cumple</label>" +
                    "        </div>";
            }
            if (ObjConfig[0].OpcNoCumple == 1) {
                vl_html_Form += "       <div class='col-1 col-md-1' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'>" +
                    "           <label for='select' class='form-control-label'>No Cumple</label>" +
                    "        </div>";
            }
            if (ObjConfig[0].OpcNoAplica == 1) {
                vl_html_Form += "       <div class='col-1 col-md-1' style='border: solid 1px #e8e3e3; background: #cacaca; font-weight: bold;'>" +
                    "           <label for='select' class='form-control-label'>No Aplica</label>" +
                    "        </div>";
            }
            vl_html_Form += "    </div>";

            for (IN3 in ObjNivel_3) {
                if (ObjNivel_2[IN2].Id == ObjNivel_3[IN3].NotasDescriptivasId) {

                    for (itemT in Obj_Contadores) {

                        if (Obj_Contadores[itemT].NotasDescriptivasId == ObjNivel_3[IN3].NotasDescriptivasId) {
                            Obj_Contadores[itemT].Contador = vl_contadorItems;
                            vl_create = 1;
                            break;
                        }
                    }

                    if (vl_create == 0) {

                        var json = {
                            "NotasDescriptivasId": ObjNivel_3[IN3].NotasDescriptivasId,
                            "Peso": (vg_ECN == 2) ? ObjNivel_2[IN2].PesoPonderado : ObjNivel_3[IN3].PesoPonderado,
                            "Contador": vl_contadorItems,
                            "PesoIndividual": 0
                        }

                        console.log(vg_ECN);
                        Obj_Contadores.push(json);
                        vl_create = 0;
                    }
                    vl_contadorItems++;

                    var vl_container = "Container_N3_" + ObjNivel_3[IN3].Id;

                    vl_html_Form += "" +
                        "   <div class='row'>" +
                        "       <div  id='Block_ND_" + ObjNivel_3[IN3].Id + "' class='col-8 col-md-8' style='border: solid 1px #e8e3e3;'>" +
                        "           <label for='select' class='form-control-label'>" + ObjNivel_3[IN3].Descripcion + "</label>" +
                        "       </div>" +
                        "       <div   class='col-1 col-md-1' style='border: solid 1px #e8e3e3;font-size: 11px; font-weight: bold;'>";

                    var StrEC = "";

                    if (vg_ECN == 2) {
                        switch (ObjNivel_2[IN2].EstadoProcesoId) {
                            case 117:
                                StrEC = "ECUF";
                                vg_Cont_ECUF++;
                                break;
                            case 118:
                                StrEC = "ECN";
                                vg_Cont_ECN++;
                                break;
                            case 119:
                                StrEC = "ECC";
                                vg_Cont_ECC++;
                                break;
                            case 120:
                                StrEC = "-";
                                break;
                        }
                    }
                    else {
                        switch (ObjNivel_3[IN3].EstadoProcesoId) {
                            case 117:
                                StrEC = "ECUF";
                                vg_Cont_ECUF++;
                                break;
                            case 118:
                                StrEC = "ECN";
                                vg_Cont_ECN++;
                                break;
                            case 119:
                                StrEC = "ECC";
                                vg_Cont_ECC++;
                                break;
                            case 120:
                                StrEC = "-";
                                break;
                        }
                    }

                    if (StrEC != "-") {
                        var JSON = {
                            "Id": ObjNivel_3[IN3].Id,
                            "Opc": StrEC
                        }
                        Obj_ErroresC.push(JSON);
                    }

                    vl_html_Form += "           <label for='select' class='form-control-label'>" + StrEC + "</label>" +
                        "       </div>";

                    if (ObjConfig[0].OpcCumple == 1) {
                        vl_html_Form += "       <div class='col-1 col-md-1 Block_Cumple' style='border: solid 1px #e8e3e3; text-align: center; padding-top: 12px;'> " +
                            "            <label class='containerX'>" +
                            "               <input type='radio'  name='Valida_" + ObjNivel_3[IN3].Id + "' value='C_" + ObjNivel_3[IN3].Id + "' style='display:none;' >" +
                            "                <span class='checkmark'></span> " +
                            "            </label>" +
                            "        </div>";
                    }
                    if (ObjConfig[0].OpcNoCumple == 1) {
                        vl_html_Form += "       <div class='col-1 col-md-1 Block_NoCumple' style='border: solid 1px #e8e3e3; text-align: center; padding-top: 12px;'>" +
                            "            <label class='containerX'>" +
                            "           <input type='radio'  name='Valida_" + ObjNivel_3[IN3].Id + "' value='NC_" + ObjNivel_3[IN3].Id + "' style='display:none;'>" +
                            "                <span class='checkmark'></span> " +
                            "            </label>" +
                            "        </div>";
                    }
                    if (ObjConfig[0].OpcNoAplica == 1) {
                        vl_html_Form += "       <div class='col-1 col-md-1 ' style='border: solid 1px #e8e3e3; text-align: center; padding-top: 12px;'>" +
                            "            <label class='containerX'>" +
                            "           <input type='radio'  name='Valida_" + ObjNivel_3[IN3].Id + "' value='NA_" + ObjNivel_3[IN3].Id + "' style='display:none;'>" +
                            "                <span class='checkmark'></span> " +
                            "            </label>" +
                            "        </div>";
                    }
                    vl_html_Form += "   </div>";
                }
                else {
                    vl_create = 0;
                    vl_contadorItems = 1;
                }
            }
        }

        jQuery("#Container_N2_" + ObjNivel_2[IN2].Id).html(vl_html_Form);

        jQuery('.standardSelect').chosen({
            disable_search_threshold: 5,
            no_results_text: 'Oops, no hay Datos!',
            width: '100%'
        });
    }

    switch (ObjConfig[0].MonitoreoXDefecto) {
        case "C":
            setTimeout(function () { ChangeControlForm(); }, 500);
            break;

        case "NC":
        case "NA":
            setTimeout(function () { ChangeControlFormRest(); }, 500);
            break;
    }

    setTimeout(function () { AplicaDefault(); }, 700);
    setTimeout(function () { AsignarValorIndividual(); }, 700);

}

//evento de calculos y changue de los opftions
function ChangeControlForm() {

    var vl_lentPreguntas = ObjNivel_3.length;
    var vl_ValorPregunta = 100 / parseInt(vl_lentPreguntas);

    vl_ValorPregunta = vl_ValorPregunta.toFixed(1);
    var vl_calificacion = 0;

    var vl_ValorMax = vg_ValorMaximo;
    var padreSuperior = 0;
    var objBloque = "";

    for (IN3 in ObjNivel_3) {

        jQuery("input[name='Valida_" + ObjNivel_3[IN3].Id + "']").change(function () {
            var vl_select = jQuery(this).val();
            var vl_SplitD = vl_select.split("_");
            var vl_exist = 0;
            var vl_valor_Ind = "0.0";

            if (jQuery("#TxtCalificacion").html() == "0") {
                switch (vl_SplitD[0]) {
                    case "C":
                        vl_calificacion = vg_ValorMaximo;
                        break;
                    case "NC":
                    case "NA":
                        vl_calificacion = "0";
                        break;
                }
            }


            for (IC in Obj_Contadores) {
                if (ObjNivel_3[IN3].NotasDescriptivasId == Obj_Contadores[IC].NotasDescriptivasId) {
                    vl_valor_Ind = Obj_Contadores[IC].PesoIndividual;
                    break;
                }
            }

            //  Obj_RespuestasForm
            for (IT in Obj_RespuestasForm) {
                if (Obj_RespuestasForm[IT].NivelId == vl_SplitD[1]) {
                    Obj_RespuestasForm[IT].Opc = vl_SplitD[0];

                    for (IEC in Obj_ErroresC) {
                        if (vl_SplitD[1] == Obj_ErroresC[IEC].Id) {
                            var OpcError = Obj_ErroresC[IEC].Opc;

                            switch (OpcError) {
                                case "ECUF":
                                    (vg_Cont_ECUF > 0) ? vg_Cont_ECUF-- : vg_Cont_ECUF++;

                                    if (vg_AplicaErrorCritico == 1) {
                                    }
                                    break;
                                case "ECN":
                                    (vg_Cont_ECN > 0) ? vg_Cont_ECN-- : vg_Cont_ECN++;
                                    if (vg_AplicaErrorCritico == 1) {
                                    }
                                    break;
                                case "ECC":
                                    (vg_Cont_ECC > 0) ? vg_Cont_ECC-- : vg_Cont_ECC++;
                                    //if (vg_AplicaErrorCritico == 1) {
                                    //    alert("aplica error critico");
                                    //}
                                    break;
                            }
                            break;
                        }
                    }

                    (vg_Cont_ECUF == 0) ? jQuery("#PECUF").val("100") : jQuery("#PECUF").val("0");
                    (vg_Cont_ECN == 0) ? jQuery("#PECN").val("100") : jQuery("#PECN").val("0");
                    //(vg_Cont_ECC == 0) ? jQuery("#PECC").val("100") : jQuery("#PECC").val("0");

                    //trabajando
                    if (vg_Cont_ECC == 0) {
                        jQuery("#PECC").val("100");
                    }
                    else {
                        if (vg_AplicaErrorCritico == 1) {
                            jQuery("#PECC").val("0");
                            vg_ValorPoint = jQuery("TxtCalificacion").html();
                            jQuery("TxtCalificacion").html("0");
                            
                        }
                        else {
                            jQuery("#PECC").val("0");
                            jQuery("TxtCalificacion").html(vg_ValorPoint);
                        }
                    }

                    (vg_Cont_ECUF == 0 && vg_Cont_ECN == 0 && vg_Cont_ECC == 0) ? jQuery("#PEC").val("100") : jQuery("#PEC").val("0");

                    vl_exist = 1;
                    break;
                }
            }

            if (vl_exist == 0) {
                var JSON = {
                    "Id": 0,
                    "NivelId": vl_SplitD[1],
                    "Opc": vl_SplitD[0]
                }
                Obj_RespuestasForm.push(JSON);
            }

            var vl_valorInd = 0;
            for (itemT in Obj_Contadores) {
                for (IN3_a in ObjNivel_3) {
                    if (vl_SplitD[1] == ObjNivel_3[IN3_a].Id) {
                        var vl_NDEs = ObjNivel_3[IN3_a].NotasDescriptivasId;
                        if (vl_NDEs == Obj_Contadores[itemT].NotasDescriptivasId) {
                            vl_valor_Ind = Obj_Contadores[itemT].PesoIndividual;
                            break;
                        }
                    }
                }
            }

            padreSuperior = jQuery(this).parent('').parent('').parent('').parent('').parent('').parent('').parent('').parent('').attr('id');
            var vl_PId = padreSuperior.split("_");
            objBloque = "#Peso_" + vl_PId[2];

            var vl_calificacionBloque = jQuery(objBloque).html();

            switch (vl_SplitD[0]) {
                case "C":
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("color", "#14480a");
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("background", "#6cd459");

                    if (vl_calificacion != vl_ValorMax) {
                        //sumamos directamente
                        vl_calificacionBloque = parseFloat(vl_calificacionBloque) + parseFloat(vl_valor_Ind)
                        vl_calificacion = parseFloat(vl_calificacion) + parseFloat(vl_valor_Ind);
                    }
                    else if (vl_calificacion >= 0) {
                        //sumamos directamente
                        vl_calificacionBloque = parseFloat(vl_calificacionBloque) + parseFloat(vl_valor_Ind)
                        vl_calificacion = parseFloat(vl_calificacion) + parseFloat(vl_valor_Ind);
                    }

                    break;
                case "NC":
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("color", "#6f0000");
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("background", "#d65555");

                    if (vl_calificacion == vl_ValorMax) {
                        //restamos directamente
                        vl_calificacionBloque = parseFloat(vl_calificacionBloque) - parseFloat(vl_valor_Ind)
                        vl_calificacion = parseFloat(vl_calificacion) - parseFloat(vl_valor_Ind);
                    }
                    else if (vl_calificacion >= 0) {
                        //restamos directamente
                        vl_calificacionBloque = parseFloat(vl_calificacionBloque) - parseFloat(vl_valor_Ind)
                        vl_calificacion = parseFloat(vl_calificacion) - parseFloat(vl_valor_Ind);
                    }

                    break;
                case "NA":
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("color", "#403737");
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("background", "#FFF");
                    break;
            }
            vl_avance = vl_ValorPregunta * Obj_RespuestasForm.length;

            vl_avance = (Math.ceil(vl_avance.toFixed(1)) > 100) ? 100 : Math.ceil(vl_avance.toFixed(1));
            jQuery("#ContAvance").html(Math.ceil(vl_avance) + " %");
            vl_calificacion = (vl_calificacion.toFixed(1) < 0) ? 0 : vl_calificacion.toFixed(1);
            jQuery("#TxtCalificacion").html(vl_calificacion);
        });
    }
}

//evento de calculos y changue de los opftions
function ChangeControlFormRest() {

    var vl_lentPreguntas = ObjNivel_3.length;
    var vl_ValorPregunta = 100 / parseInt(vl_lentPreguntas);

    vl_ValorPregunta = vl_ValorPregunta.toFixed(1);
    var vl_calificacion = 0;

    var vl_ValorMax = Obj_DLForm[0].ValorMaximoEvaluar;
    var padreSuperior = 0;
    var objBloque = "";
    var contadoresP = 0;


    for (IN3 in ObjNivel_3) {

        jQuery("input[name='Valida_" + ObjNivel_3[IN3].Id + "']").change(function () {
            var vl_select = jQuery(this).val();

            var vl_SplitD = vl_select.split("_");
            var vl_exist = 0;
            var vl_valor_Ind = 0;

            for (IC in Obj_Contadores) {
                contadoresP += contadoresP + parseFloat(Obj_Contadores[IC].PesoIndividual);

            }

            for (IT in Obj_RespuestasForm) {
                if (Obj_RespuestasForm[IT].NivelId == vl_SplitD[1]) {
                    Obj_RespuestasForm[IT].Opc = vl_SplitD[0];

                    for (IEC in Obj_ErroresC) {
                        if (vl_SplitD[1] == Obj_ErroresC[IEC].Id) {
                            var OpcError = Obj_ErroresC[IEC].Opc;

                            switch (OpcError) {
                                case "ECUF":
                                    (vg_Cont_ECUF > 0) ? vg_Cont_ECUF-- : vg_Cont_ECUF++;
                                    break;
                                case "ECN":
                                    (vg_Cont_ECN > 0) ? vg_Cont_ECN-- : vg_Cont_ECN++;
                                    break;
                                case "ECC":
                                    (vg_Cont_ECC > 0) ? vg_Cont_ECC-- : vg_Cont_ECC++;
                                    break;
                            }
                            break;
                        }
                    }

                    (vg_Cont_ECUF == 0) ? jQuery("#PECUF").val("100") : jQuery("#PECUF").val("0");
                    (vg_Cont_ECN == 0) ? jQuery("#PECN").val("100") : jQuery("#PECN").val("0");
                    (vg_Cont_ECC == 0) ? jQuery("#PECC").val("100") : jQuery("#PECC").val("0");

                    (vg_Cont_ECUF == 0 && vg_Cont_ECN == 0 && vg_Cont_ECC == 0) ? jQuery("#PEC").val("100") : jQuery("#PEC").val("0");

                    vl_exist = 1;
                    break;
                }
            }

            if (vl_exist == 0) {
                var JSON = {
                    "Id": 0,
                    "NivelId": vl_SplitD[1],
                    "Opc": vl_SplitD[0]
                }
                Obj_RespuestasForm.push(JSON);
            }

            var vl_valorInd = 0;
            for (itemT in Obj_Contadores) {
                for (IN3_a in ObjNivel_3) {
                    if (vl_SplitD[1] == ObjNivel_3[IN3_a].Id) {
                        var vl_NDEs = ObjNivel_3[IN3_a].NotasDescriptivasId;
                        if (vl_NDEs == Obj_Contadores[itemT].NotasDescriptivasId) {
                            vl_valor_Ind = Obj_Contadores[itemT].PesoIndividual;
                            break;
                        }
                    }
                }
            }

            padreSuperior = jQuery(this).parent('').parent('').parent('').parent('').parent('').parent('').parent('').parent('').attr('id');
            var vl_PId = padreSuperior.split("_");
            objBloque = "#Peso_" + vl_PId[2];

            var vl_calificacionBloque = jQuery(objBloque).html();

            switch (vl_SplitD[0]) {
                case "C":
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("color", "#14480a");
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("background", "#6cd459");

                    if (vl_calificacion != vl_ValorMax) {
                        //sumamos directamente
                        vl_calificacion = parseFloat(vl_calificacion) + parseFloat(vl_valor_Ind);
                    }
                    else if (vl_calificacion >= 0) {
                        //sumamos directamente
                        vl_calificacion = parseFloat(vl_calificacion) + parseFloat(vl_valor_Ind);
                    }
                    break;
                case "NC":

                    jQuery("#Block_ND_" + vl_SplitD[1]).css("color", "#6f0000");
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("background", "#d65555");

                    if (vl_calificacion == vl_ValorMax) {
                        //restamos directamente
                        vl_calificacion = parseFloat(vl_calificacion) - parseFloat(vl_valor_Ind);
                    }
                    else if (vl_calificacion >= 0) {
                        //restamos directamente
                        vl_calificacion = parseFloat(vl_calificacion) - parseFloat(vl_valor_Ind);
                    }

                    break;
                case "NA":
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("color", "#403737");
                    jQuery("#Block_ND_" + vl_SplitD[1]).css("background", "#FFF");
                    break;
            }

            vl_avance = vl_ValorPregunta * Obj_RespuestasForm.length;
            vl_avance = (Math.ceil(vl_avance.toFixed(1)) > 100) ? 100 : Math.ceil(vl_avance.toFixed(1));
            jQuery("#ContAvance").html(Math.ceil(vl_avance) + " %");
            vl_calificacion = (vl_calificacion.toFixed(1) > vg_ValorMaximo) ? vg_ValorMaximo : vl_calificacion.toFixed(1);
            jQuery("#TxtCalificacion").html(vl_calificacion);

        });
    }
}

//asigna calculos para monitoreo
function AsignarValorIndividual() {

    for (itemR in Obj_Contadores) {
        var vl_total = parseFloat(Obj_Contadores[itemR].Peso) / parseFloat(Obj_Contadores[itemR].Contador);

        Obj_Contadores[itemR].PesoIndividual = vl_total.toFixed(1);
    }

}

//dispara el evento de seleccion por defcto del formulario
function AplicaDefault() {
    if (vg_FlagEdit == 0) {

        switch (ObjConfig[0].MonitoreoXDefecto) {
            case "C":
                jQuery("#PECUF").val("100");
                jQuery("#PECN").val("100");
                jQuery("#PECC").val("100");
                jQuery("#PEC").val("100");

                vg_Cont_ECUF = 0;
                vg_Cont_ECN = 0;
                vg_Cont_ECC = 0;

                setTimeout(function () { jQuery("#TxtCalificacion").html(Obj_Form[0].ValorMaximoEvaluar); }, 250);
                jQuery(".Block_Cumple  input[type=radio]").trigger('click');
                break;
            case "NC":
                jQuery("#PECUF").val("0");
                jQuery("#PECN").val("0");
                jQuery("#PECC").val("0");
                jQuery("#PEC").val("0");

                setTimeout(function () { jQuery("#TxtCalificacion").html("0"); }, 250);
                jQuery("#TxtCalificacion").html("0");
                jQuery(".Block_NoCumple  input[type=radio]").trigger('click');
                break;
            case "NA":
                jQuery("#PECUF").val("100");
                jQuery("#PECN").val("100");
                jQuery("#PECC").val("100");
                jQuery("#PEC").val("100");

                setTimeout(function () { jQuery("#TxtCalificacion").html("0"); }, 250);
                jQuery(".Block_NoAplica  input[type=radio]").trigger('click');
                break;
        }
    }
    else {
        jQuery("#TxtCalificacion").html(vg_NotaFinal);

        for (item in Obj_RespuestasForm) {
            var vl_control = Obj_RespuestasForm[item].Opc + "_" + Obj_RespuestasForm[item].NivelId;
            document.querySelector('[value="' + vl_control + '"]').checked = true;

            switch (Obj_RespuestasForm[item].Opc) {
                case "NC":
                    jQuery("#Block_ND_" + Obj_RespuestasForm[item].NivelId).css("color", "#6f0000");
                    jQuery("#Block_ND_" + Obj_RespuestasForm[item].NivelId).css("background", "#d65555");
                    break;
                case "C":
                    jQuery("#Block_ND_" + Obj_RespuestasForm[item].NivelId).css("color", "#14480a");
                    jQuery("#Block_ND_" + Obj_RespuestasForm[item].NivelId).css("background", "#6cd459");
                    break;
                case "NA":
                    jQuery("#Block_ND_" + Obj_RespuestasForm[item].NivelId).css("color", "#403737");
                    jQuery("#Block_ND_" + Obj_RespuestasForm[item].NivelId).css("background", "#FFF");
                    break;
            }
        }
        jQuery("#Container_Form input:radio").attr('disabled', true);



    }
}

//dibuja las graficas de monitoreo
function PaintGraficas(vp_type) {
    var densityCanvasB = document.getElementById("densityChartBar");
    var densityCanvasP = document.getElementById("densityChartPie");

    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 16;

    var densityData = {
        label: 'Estados Monitoreo',
        data: [vg_ContM, vg_ContR, vg_ContOC, vg_ContOA, vg_ContC, vg_ContE],
        backgroundColor: [
            'rgba(255, 193, 7, 0.6)',
            'rgba(63, 144, 63, 0.6)',
            'rgba(220, 53, 69, 0.6)',
            'rgba(220, 53, 69, 0.6)',
            'rgba(26, 30, 68, 0.6)',
            'rgba(159, 14, 96, 0.6)'
        ],
        borderColor: [
            'rgba(255, 193, 7, 1)',
            'rgba(63, 144, 63, 1)',
            'rgba(220, 53, 69, 1)',
            'rgba(220, 53, 69, 1)',
            'rgba(26, 30, 68, 1)',
            'rgba(159, 14, 96, 1)'
        ],
        borderWidth: 2,
        hoverBorderWidth: 0
    };

    if (vp_type == "bar") {
        var barChart = new Chart(densityCanvasB, {
            type: "bar",
            data: {
                labels: ["Monitoreo", "Retroalimentacion", "Objeción Coordinador", "Objeción Agente", "Monitoreo Cerrado", "Escalamiento"],
                datasets: [densityData]
            }
        });
        jQuery("#densityChartBar").css("display", "block");
        jQuery("#densityChartPie").css("display", "none");
    }
    else {
        var barChart = new Chart(densityCanvasP, {
            type: "pie",
            data: {
                labels: ["Monitoreo", "Retroalimentacion", "Objeción Coordinador", "Objeción Agente", "Monitoreo Cerrado", "Escalamiento"],
                datasets: [densityData]
            }
        });
        jQuery("#densityChartPie").css("display", "block");
        jQuery("#densityChartBar").css("display", "none");
    }

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
        "<div class='card-header'><strong class='card-title'>Monitoreos</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>N° Monitoreo</th>" +
        "       <th>" + Obj_NameRoles[4].Nombre + "</th>" +
        "       <th>Calificacion</th>" +
        "       <th>Estado</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {
        switch (ObjWork[ItemObj].EstadoId) {

            case 124:
                var vl_estadoColor = "#ffc107";
                vg_ContM++;
                break;
            case 125:
                var vl_estadoColor = "#28a745";
                vg_ContR++;
                break;
            case 126:
                var vl_estadoColor = "#dc3545";
                vg_ContOC++;
                break;
            case 128:
                var vl_estadoColor = "#dc3545";
                vg_ContOA++;
                break;
            case 127:
                var vl_estadoColor = "#1a1e44";
                vg_ContC++;
                break;
            case 129:
                var vl_estadoColor = "#9f0e60";
                vg_ContE++;
                break;
        }


        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
            "     <td  style='text-align: center; font-weight: bold;'>" + ObjWork[ItemObj].Id + "</td>" +
            "     <td>" + ObjWork[ItemObj].Agente + "</td>" +
            "     <td style='text-align: center; font-weight: bold;'>" + ObjWork[ItemObj].NotaFinal + "</td>" +
            "     <td style='text-align: center; font-weight: bold; color: #FFF; background: " + vl_estadoColor + ";'>" + ObjWork[ItemObj].Estado + "</td>" +
            "     <td><div class='col-lg-3 col-md-3' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:VerMonitoreoGrid('" + ItemObj + "')\"><i class='fa fa-check-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>";
        if (ObjWork[ItemObj].EscaladoId != 0 &&
            ObjWork[ItemObj].EscaladoId == Obj_Data[0].IdUser) {
            vl_Html += "<div class='col-lg-3 col-md-3' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:EliminarMonitoreoGrid('" + ItemObj + "')\"><i class='fa fa-times-circle fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Eliminar</span></span></div> ";
        }
        vl_Html += "     </td></tr>";
    }


    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_Work").html("");
    jQuery("#Grid_Work").html(vl_Html);


    jQuery("#GridWork").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
    PaintGraficas('bar');
}

//editar data grid seleccionada
function VerMonitoreoGrid(vp_ObjIndex) {

    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;
    vg_formularioId = ObjWork[vp_ObjIndex].FormularioId;
    vg_NotaFinal = ObjWork[vp_ObjIndex].NotaFinal;
    vg_EstadoMonitoreo = ObjWork[vp_ObjIndex].EstadoId;

    vg_SaveAgenteId = ObjWork[vp_ObjIndex].AgenteId;
    vg_SaveCoordinadorId = ObjWork[vp_ObjIndex].CoordinadorId;
    vg_SaveMonitorId = ObjWork[vp_ObjIndex].MonitorId;

    ModalForm(1);
    jQuery("#TForm").html("Seguimiento al monitoreo");

    jQuery("#Block_SegMonitoreo").css('display', 'block');

    jQuery("#Block_Seg_monitoreo").show('slow');
    jQuery("#Block_Create_monitoreo").fadeOut('fast');

    jQuery("#View_Monitor").val(ObjWork[vp_ObjIndex].Monitor);
    jQuery("#View_TxtNunFormulario").val(ObjWork[vp_ObjIndex].Id);
    jQuery("#View_Agente").val(ObjWork[vp_ObjIndex].Agente);
    jQuery("#View_PEC").val(ObjWork[vp_ObjIndex].NotaPEC);
    jQuery("#View_Coordinador").val(ObjWork[vp_ObjIndex].Coordinador);
    jQuery("#View_PECUF").val(ObjWork[vp_ObjIndex].NotaPECUF);
    jQuery("#View_TipoMonitoreo").val(ObjWork[vp_ObjIndex].TipoMonitoreo);
    jQuery("#View_Proceso").val(ObjWork[vp_ObjIndex].TipoProceso);
    jQuery("#View_PECN").val(ObjWork[vp_ObjIndex].NotaPECN);
    jQuery("#View_Fecha").val(ObjWork[vp_ObjIndex].FechaTransaccion);
    jQuery("#View_IdTransaccion").val(ObjWork[vp_ObjIndex].IdTransaccion);
    jQuery("#View_PECC").val(ObjWork[vp_ObjIndex].NotaPECC);
    jQuery("#Title_formulario").html(ObjWork[vp_ObjIndex].Formulario);
    jQuery("#TxtObservacionMonitor").html(ObjWork[vp_ObjIndex].ObservacionMonitor);
    jQuery("#talkbubble").css('display', 'block');

    switch (vg_EstadoMonitoreo) {
        case 124://monitoreo
            switch (Obj_Data[0].IdRol) {
                case 1: //administrador
                case 2: //Super monitor
                    jQuery("#btn_cre").show('slow');
                    jQuery("#Block_RegistroMonitoreo").css('display', 'none');
                    break;

            }
            break;
        case 125:
          switch (Obj_Data[0].IdRol) {
                case 1: //administrador
                case 2: //Super monitor
                    jQuery("#btn_cre").show('slow');

                    break;
                case 3: //monitor
                    break;
                case 4: //coordinador
                    jQuery("#Block_Monitor").css('display', 'none');
                    break;
                case 5: //agente
                    jQuery("#Block_Monitor").css('display', 'none');
                    break;
                case 6: //clente
                    jQuery("#Block_Monitor").css('display', 'none');
                    break;
            }
            break;
        case 126:
            break;
        case 127:
            break;
        case 128:
            break;
    }

    ListResultadoMonitoreo_Transaction(ObjWork[vp_ObjIndex].Id);

    setTimeout(function () { List_ObservacionesMonitoreo_Transaction(); }, 500);
}

//elimina monitoreo 
function EliminarMonitoreoGrid(vp_ObjIndex) {
    vg_FlagEdit = ObjWork[vp_ObjIndex].Id;

    jQuery("#View_EnombreMonitoreo").val(ObjWork[vp_ObjIndex].Formulario);
    jQuery("#View_Emonitoreo").val(ObjWork[vp_ObjIndex].Id);
    jQuery("#View_EnombreAgente").val(ObjWork[vp_ObjIndex].Agente);
    jQuery("#View_Enombremonitor").val(ObjWork[vp_ObjIndex].Monitor);
    jQuery("#View_EnombreCordinador").val(ObjWork[vp_ObjIndex].Coordinador);
    jQuery("#View_ENota").val(ObjWork[vp_ObjIndex].NotaFinal);

    List_ObservacionesMonitoreo_Transaction();
    jQuery("#ModalDeleteMonitoreo").modal('show');
}

//pinta el proceso de observacion de monitoreos
function Paint_Timeline_Monitoreo() {

    switch (vg_EstadoMonitoreo) {
        case 124://monitoreo
            jQuery("#talkbubble").html("El monitoreo se acaba de realizar, el cual el coordinador debe aprobar o rechazar el mismo");
            switch (Obj_Data[0].IdRol) {
                case 1: //administrador
                case 2: //Super monitor
                case 3: //monitor
                case 5: //agente
                case 6: //clente
                    jQuery("#Block_RegistroMonitoreo").css("display", "none");
                    break;
                case 4: //coordinador
                    jQuery("#Block_RegistroMonitoreo").css("display", "block");
                    break;
            }
            break;

        case 125://Retroalimentación
            jQuery("#talkbubble").html("El monitoreo se encuentra en la etapa de retroalimentación, el cual solo falta que el agente apruebe o rechaze el mismo");
            switch (Obj_Data[0].IdRol) {
                case 1: //administrador
                case 2: //Super monitor
                case 3: //monitor
                case 4: //coordinador
                case 6: //clente
                    jQuery("#Block_RegistroMonitoreo").css("display", "none");
                    break;
                case 5: //agente
                    jQuery("#Block_RegistroMonitoreo").css("display", "block");
                    break;
            }
            break;

        case 126://objecion cordinador
            jQuery("#talkbubble").html("El monitoreo se encuentra en la etapa de rechazo por parte del coordinador, el cual monitor debe evaluar el porque del rechazo");
            switch (Obj_Data[0].IdRol) {
                case 1: //administrador
                case 2: //Super monitor
                case 3: //monitor
                    jQuery("#Block_RegistroMonitoreo").css("display", "block");
                    break;
                case 4: //coordinador
                case 6: //clente
                case 5: //agente
                    jQuery("#Block_RegistroMonitoreo").css("display", "none");
                    break;
            }
            break;

        case 127://compromisos o monitoreo cerrado
            jQuery("#talkbubble").html("El monitoreo se encuentra cerrado con los compromisos que asumio el agente");
            jQuery("#Block_RegistroMonitoreo").css("display", "none");
            break;

        case 128:
            jQuery("#talkbubble").html("El monitoreo se encuentra en la etapa de rechazo por parte del agente, el cual coordinador debe evaluar el porque del rechazo");
            switch (Obj_Data[0].IdRol) {
                case 1: //administrador
                case 2: //Super monitor
                case 3: //monitor
                case 5: //agente
                case 6: //clente
                    jQuery("#Block_RegistroMonitoreo").css("display", "none");
                    break;
                case 4: //coordinador
                    jQuery("#Block_RegistroMonitoreo").css("display", "block");
                    break;
            }
            break;
        case 129:
            jQuery("#talkbubble").html("El monitoreo se encuentra en la etapa de escalamiento al personal autorizado para la eliminacion del mismo");

            switch (Obj_Data[0].IdRol) {
                case 1: //administrador
                case 2: //Super monitor
                case 3: //monitor
                case 5: //agente
                case 6: //clente
                case 4: //coordinador
                    jQuery("#Block_RegistroMonitoreo").css("display", "none");
                    break;
            }
            break;
    }

    var vl_Html = "<ul class='timeline'>";
    var vl_TipoCModal = "";
    var vl_TipoIcono = "";
    var vl_color = "";
    var vl_CountMonitoreo = 0;

    for (item in Obj_ObservacionMo) {
        jQuery("#Block_Monitor").css("display", "none");

        switch (Obj_ObservacionMo[item].EstadoId) {
            case 124://monitoreo
                vl_TipoCModal = "warning";
                vl_TipoIcono = "book";
                vl_color = "#a19c19";
                vl_CountMonitoreo++;
                break;
            case 125://Retroalimentación
                vl_TipoCModal = "success";
                vl_TipoIcono = "thumbs-up";
                vl_color = "#087800";
                jQuery("#btn_Obj").html(" <i class='fa fa-floppy-o'></i>&nbsp;Rechazar")
                break;
            case 126://Objeción Coordinador
                vl_TipoCModal = "danger";
                vl_TipoIcono = "thumbs-down";
                vl_color = "#9b0808";
                jQuery("#btn_Obj").html(" <i class='fa fa-arrow-circle-up'></i>&nbsp;Escalar")
                break;
            case 127://Compromisos
                vl_TipoCModal = "primary";
                vl_TipoIcono = "pencil-square";
                vl_color = "#1a1e44";
                jQuery("#btn_Obj").html(" <i class='fa fa-floppy-o'></i>&nbsp;Rechazar")
                break;
            case 128://Objeción Agente
                vl_TipoCModal = "danger";
                vl_TipoIcono = "thumbs-o-down";
                vl_color = "#9b0808";
                jQuery("#btn_Obj").html(" <i class='fa fa-floppy-o'></i>&nbsp;Rechazar")
                break;
            case 129://escalamiento
                vl_TipoCModal = "secondary";
                vl_TipoIcono = "rocket";
                vl_color = "#9f0e60";
                jQuery("#btn_Obj").html(" <i class='fa fa-floppy-o'></i>&nbsp;Rechazar")
                break;
        }

        var vl_fecha = Obj_ObservacionMo[item].FechaObservacion;
        var vl_Arrfecha = vl_fecha.split(' ');
        vl_fecha = vl_Arrfecha[0].replaceAll('/', '-');
        var vl_Hora = vl_Arrfecha[1] + " " + vl_Arrfecha[2];

        if (Obj_Data[0].IdRol == 5) {
            if (Obj_ObservacionMo[item].EstadoId == 126) {
                vl_Html += "";
            }
            else {
                if (Obj_ObservacionMo[item].EstadoId == 124 && vl_CountMonitoreo != 1) {
                    vl_Html += "";
                }
                else {
                    vl_Html += "<li>" +
                        "<div class='timeline-badge " + vl_TipoCModal + "'><i class='fa fa-" + vl_TipoIcono + "'></i></div>" +
                        "    <div class='timeline-panel'>" +
                        "       <div class='timeline-heading'>" +
                        "           <div class='oval-half' style='color:#FFF; font-size: 14px; font-weight: bold; background: " + vl_color + "'>" + Obj_ObservacionMo[item].Estado + "</div>" +
                        "           <h4 class='timeline-title'>" + Obj_ObservacionMo[item].Perfil + " - " + Obj_ObservacionMo[item].Usuario + "</h4>" +
                        "           <p><small class='text-muted'><i class='fa fa-calendar'></i> " + vl_fecha + "</small> <small class='text-muted'><i class='fa fa-clock-o'></i> " + vl_Hora + "</small></p>" +
                        "       </div>" +
                        "       <div class='timeline-body'>" +
                        "       <p>" + Obj_ObservacionMo[item].Observacion + "</p>" +
                        "   </div>" +
                        "</div>" +
                        "</li>";
                }
            }
        }
        else {
            vl_Html += "<li>" +
                "<div class='timeline-badge " + vl_TipoCModal + "'><i class='fa fa-" + vl_TipoIcono + "'></i></div>" +
                "    <div class='timeline-panel'>" +
                "       <div class='timeline-heading'>" +
                "           <div class='oval-half' style='color:#FFF; font-size: 14px; font-weight: bold; background: " + vl_color + "'>" + Obj_ObservacionMo[item].Estado + "</div>" +
                "           <h4 class='timeline-title'>" + Obj_ObservacionMo[item].Perfil + " - " + Obj_ObservacionMo[item].Usuario + "</h4>" +
                "           <p><small class='text-muted'><i class='fa fa-calendar'></i> " + vl_fecha + "</small> <small class='text-muted'><i class='fa fa-clock-o'></i> " + vl_Hora + "</small></p>" +
                "       </div>" +
                "       <div class='timeline-body'>" +
                "       <p>" + Obj_ObservacionMo[item].Observacion + "</p>" +
                "   </div>" +
                "</div>" +
                "</li>";
        }
    }
    vl_Html += " </ul>";

    jQuery("#Container_time").html("");
    jQuery("#Container_time").html(vl_Html);
    jQuery("#Container_time_View").html("");
    jQuery("#Container_time_View").html(vl_Html);
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//trae los roles para los titulos
function ListRol_Transaction() {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListRoles",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_NameRoles = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        ListMonitoreosCampana_Transaction();


        jQuery("#LblAgente").html(Obj_NameRoles[4].Nombre);
        jQuery("#LblCoordinador").html(Obj_NameRoles[3].Nombre);
        jQuery("#LblMonitor").html(Obj_NameRoles[2].Nombre);
        jQuery("#LblAgente_View").html(Obj_NameRoles[4].Nombre);
        jQuery("#LblCoordinador_View").html(Obj_NameRoles[3].Nombre);

    });
}

//trae los monitoreos 
function ListMonitoreosCampana_Transaction() {
    var OjdataS = [];
    var OjdataC = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ListMonitoreosC",
            "RolId": Obj_Data[0].IdRol,
            "IdUser": Obj_Data[0].IdUser
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            result = JSON.parse(result);

            ObjWork = result[0];
            OjdataS = result[1];
            OjdataC = result[2];
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        vg_CantSupervisorM = OjdataS[0].Respuesta;
        vg_CoorMonitorea = OjdataC[0].Respuesta;
        CreateGrid();
    });
}

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
        vg_Title_N1 = Obj_Form[0].Title_Nivel1;
        vg_Title_N2 = Obj_Form[0].Title_Nivel2;
        vg_Title_N3 = Obj_Form[0].Title_Nivel3;
        vg_Title_N4 = Obj_Form[0].Title_Nivel4;
    });
}

//trae todos los agentes para el monitoreo
function DropListAgent_Transaction() {
    var Obj_Users = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "UsersAgentes"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Users = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Users, "DList_Agente", "");
    });
}

//trae todos los agentes para el monitoreo
function DropListEscaladores_Transaction() {
    var Obj_Users = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "UsersEscaladores"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Users = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Users, "DList_Resposable", "");
    });
}

//trae todos los agentes para el monitoreo
function DropListCoordinatory_Transaction() {
    var Obj_Users = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "UsersCoordinadores"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Users = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Users, "DList_Coordinador", "");
    });
}

//trae todos los agentes para el monitoreo
function TraerCoordinador_Transaction(vp_index) {
    var Obj_Data = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/ReadCoordinator",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{AgenteId: '" + vp_index + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Data = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery("#TxtCoordinador").val(Obj_Data[0].Coordinador);
        vg_CoordinadorId = Obj_Data[0].CoordinadorId;
    });
}

//trae todos los agentes para el monitoreo
function DropListProccess_Transaction() {
    var Obj_Data = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/ListProcesos",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Data = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Data, "DList_Proceso", "");
    });
}

//trae todos los agentes para el monitoreo
function DropListFomularios_Transaction() {

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/List_FormulariosDroplist",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_DLForm = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_DLForm, "DList_Formulario", "");
    });
}

//trae la data del formulario seleccionado
function TraerForm_Transaction() {
    jQuery("#Carga").css("display", "block");

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ReadComplementos",
            "FormularioId": vg_formularioId
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
        CreateForm();
        vg_AplicaErrorCritico = ObjConfig[0].AplicaErrorCritico;
    });
}

//crear monitoreo
function Crear_Monitoreo_Transaction() {
    var ObjData = [];
    var ListRespuestas = [];

    jQuery("#Carga").css("display", "block");
    var vl_lengthR = Obj_RespuestasForm.length;
    ListRespuestas = (vl_lengthR != 0) ? JSON.stringify(Obj_RespuestasForm) : "VACIO";

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/Create_Monitoreo",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{FormularioId: '" + vg_formularioId +
            "', MonitorId: '" + Obj_Data[0].IdUser +
            "', AgenteId: '" + jQuery("#DList_Agente").val() +
            "', CoordinadorId: '" + vg_CoordinadorId +
            "', TipoProcesoId: '" + jQuery("#DList_Proceso").val() +
            "', TipoMonitoreoId: '" + jQuery("#DList_TipoMonitoreo").val() +
            "', FechaTransaccion: '" + jQuery("#TxtFecha").val() +
            "', NotaFinal: '" + jQuery("#TxtCalificacion").html() +
            "', NotaPEC: '" + jQuery("#PEC").val() +
            "', NotaPECUF: '" + jQuery("#PECUF").val() +
            "', NotaPECN: '" + jQuery("#PECN").val() +
            "', NotaPECC: '" + jQuery("#PECC").val() +
            "', Observacion: '" + jQuery("#TxtObservacion").val() +
            "', OperNivel: '" + vg_PPN +
            "', IdTransaccion: '" + jQuery("#TxtIdTransaccion").val() +
            "', ListResultEncuesta:'" + ListRespuestas + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            jQuery("#Carga").css("display", "none");
            ObjData = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        vg_ContM = 0;
        vg_ContR = 0;
        vg_ContOC = 0;
        vg_ContOA = 0;
        vg_ContC = 0;
        vg_ContE = 0;

        jQuery("#ModalConfirmar").modal("hide");
        Message("Success", "Se ha creado el monitoreo para el proceso de la llamada");
        jQuery("#TxtNunFormulario").val(ObjData[0].Id);
        ListMonitoreosCampana_Transaction();
        ModalForm(2);
    });
}

//trae las respuestas del monitoreo
function ListResultadoMonitoreo_Transaction(vp_Index) {
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ListResultadoMonitoreo",
            "MonitoreoId": vp_Index
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_RespuestasForm = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        AsignaValores();

        setTimeout(function () { TraerForm_Transaction(); }, 300);
    });
}

//guarda la actualizacion del estado para el fljo del monitoreo
function List_ObservacionesMonitoreo_Transaction() {
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/List_ObservacionesMonitoreo",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{MonitoreoId: '" + vg_FlagEdit + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_ObservacionMo = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Paint_Timeline_Monitoreo();
    });
}

//guarda la actualizacion del estado para el fljo del monitoreo
function GuardarAvance(vp_EstadoMonitoreo, vp_Observacion) {
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/SaveAvanceMonitoreo",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{MonitoreoId: '" + vg_FlagEdit +
            "', UsuarioId : '" + Obj_Data[0].IdUser +
            "', EstadoId : '" + vp_EstadoMonitoreo +
            "', Observacion : '" + vp_Observacion +
            "', AgenteId : '" + vg_SaveAgenteId +
            "', CoordinadorId : '" + vg_SaveCoordinadorId +
            "', MonitorId: '" + vg_SaveMonitorId + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vg_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        var vl_msm = "";

        switch (vp_EstadoMonitoreo) {
            case 125: //Retroalimentación
                vl_msm = "retroalimentado";
                break;
            case 126://Objeción Coordinador
                vl_msm = "una objeción del coordinador";
                break;
            case 127://Compromisos
                vl_msm = "compromiso por el agente";
                break;
            case 128://Objeción Agente
                vl_msm = "una objeción del agente";
                break;
            case 129: //Retroalimentación
                vl_msm = "escalado";
                break;
        }
        if (vg_flag == "200") {
            Message("Success", "El Monitoreo ha sido (" + vl_msm + ").", 5000);
        }
        ListMonitoreosCampana_Transaction();
        ModalForm(2);
    });
}

//asigna quien debe eliminar el monitoreo
function AsignarEscalador_Transaction() {
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/AsignarEscalador",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Id: '" + vg_FlagEdit +
            "', EscaladorId : '" + jQuery("#DList_Resposable").val() + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vg_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {

        if (vg_flag == "200") {
            jQuery("#ModalEscalar").modal("hide");
            GuardarAvance(129, jQuery("#TxtCapturaObservacion").val());//retroalimentacion
        }
    });
}

//asigna quien debe eliminar el monitoreo
function DeleteMonitoreo_Transaction() {
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx/DeleteMonitoreo",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Id: '" + vg_FlagEdit + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vg_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {

        if (vg_flag == "200") {
            jQuery("#ModalDeleteMonitoreo").modal("hide");
            ListMonitoreosCampana_Transaction();
            ModalForm(2);
        }
    });
}