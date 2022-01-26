jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];
var Obj_NameRoles = [];

var Obj_Encabezado = [];

var vg_FlagEdit = 0;
var vg_RutaTemporal = "/Repositorio/Carga/";

var vg_ContM = 0;
var vg_ContR = 0;
var vg_ContOC = 0;
var vg_ContOA = 0;
var vg_ContC = 0;
var vg_ContE = 0;

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {
    jQuery('body').toggleClass('open');

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

    jQuery('#TxtFechaF').datepicker({
        dateFormat: 'yyyy-mm-dd'
    });
    jQuery('#TxtFechaF').data('datepicker');



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
    ListRol_Transaction()
    var vl_Parameters = Capture_GET();

    DropListAgent_Transaction();
    Cargue_Droplist("DList_TipoMonitoreo", 9, "", "T", "X");
    Cargue_Droplist_FiltrerCuenta("DList_Proceso", 8, "", "T", "X");
    DropListFomularios_Transaction();
    DropListCoordinador_Transaction();
    DropListMonitor_Transaction();
    DropListSMonitor_Transaction();

    ChangueControl();

    if (vl_Parameters !== undefined) {
        CapturaVariables(vl_Parameters);
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION BOTONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function Btn_SearchReport() {
    //revisar filtros
    var vl_pMonitor = jQuery("#DList_Monitor").val();
    var vl_pSMonitor = jQuery("#DList_SMonitor").val();
    var vl_pCoordinador = jQuery("#DList_Coordinador").val();
    var vl_pAgente = jQuery("#DList_Agente").val();
    var vl_pTipoMonitoreo = jQuery("#DList_TipoMonitoreo").val();
    var vl_pProceso = jQuery("#DList_Proceso").val();
    var vl_pFormulario = jQuery("#DList_Formulario").val();
    var vl_pPEC = jQuery("#DListFiltrer7").val();
    var vl_pPECUF = jQuery("#DListFiltrer8").val();
    var vl_pPECN = jQuery("#DListFiltrer9").val();
    var vl_pPECC = jQuery("#DListFiltrer10").val();
    var vl_pFechaInicial = jQuery("#TxtFecha").val();
    var vl_pTxtFechaFinal = jQuery("#TxtFechaF").val();

    if (vl_pMonitor == "-1" &&
        vl_pSMonitor == "-1" &&
        vl_pCoordinador == "-1" &&
        vl_pAgente == "-1" &&
        vl_pTipoMonitoreo == "-1" &&
        vl_pProceso == "-1" &&
        vl_pFormulario == "-1" &&
        vl_pPEC == "-1" &&
        vl_pPECUF == "-1" &&
        vl_pPECN == "-1" &&
        vl_pPECC == "-1" &&
        vl_pFechaInicial == "" &&
        vl_pTxtFechaFinal == "") {
        jQuery("#TFormResult").html("Rerultado General de la Campaña");
        jQuery("#BlockGeneral").css("display", "block");
        jQuery("#BlockFiltros").css("display", "none");
        TraerEncabezado_Transaction();
    }
    else {
        jQuery("#TFormResult").html("Rerultado de la Campaña por el filtro");
        jQuery("#BlockGeneral").css("display", "none");
        jQuery("#BlockFiltros").css("display", "block");

    }
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//evento de chances en controles
function ChangueControl() {
    jQuery("#DList_Formulario2").change(function () {
        var vl_value = jQuery(this).val();

        ReadDataForm_Transaction(vl_value);
    });

    jQuery("#Check_Graphics").on('change', function () {
        (jQuery(this).is(':checked')) ? PaintGraficas('pie') : PaintGraficas('bar');
    });
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
        "<div class='card-header'><strong class='card-title'>Clientes</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridWork' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>" + Obj_NameRoles[4].Nombre + "</th>" +
        "       <th>Nota Final</th>" +
        "       <th>Error PEC</th>" +
        "       <th>Error PECC</th>" +
        "       <th>Error PECN</th>" +
        "       <th>Error PECUF</th>" +
//"       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjWork) {
        switch (ObjWork[ItemObj].EstadoId) {

            case 124:
                vg_ContM++;
                break;
            case 125:
                vg_ContR++;
                break;
            case 126:
                vg_ContOC++;
                break;
            case 128:
                vg_ContOA++;
                break;
            case 127:
                vg_ContC++;
                break;
            case 129:
                vg_ContE++;
                break;
        }

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
            "     <td>" + ObjWork[ItemObj].Agente + "</td>" +
            "     <td>" + ObjWork[ItemObj].NotaFinal + "</td>" +
            "     <td>" + ObjWork[ItemObj].F_PEC + "</td>" +
            "     <td>" + ObjWork[ItemObj].F_PECC + "</td>" +
            "     <td>" + ObjWork[ItemObj].F_PECN + "</td>" +
            "     <td>" + ObjWork[ItemObj].F_PECUF + "</td>" +
    //        "     <td><div class='col-lg-6 col-md-6' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:EditarGrid('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div></td>" +
            "   </tr>";
    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_Work").html("");
    jQuery("#Grid_Work").html(vl_Html);


    jQuery("#GridWork").dataTable({
        "bJQueryUI": true,
        "bDestroy": true,
        order: [[1, 'desc']],
        "aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]],
        "pageLength": 75
    });

    setTimeout(function () { FormatStyle(); }, 500);
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

        jQuery("#LblAgente").html(Obj_NameRoles[4].Nombre);
        jQuery("#LblCoordinador").html(Obj_NameRoles[3].Nombre);
        jQuery("#LblMonitor").html(Obj_NameRoles[2].Nombre);
        jQuery("#LblSMonitor").html(Obj_NameRoles[1].Nombre);

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

//trae todos los coordinador para el monitoreo
function DropListCoordinador_Transaction() {
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

//trae todos los coordinador para el monitoreo
function DropListMonitor_Transaction() {
    var Obj_Users = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "UsersMonitores"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Users = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Users, "DList_Monitor", "");
    });
}

//trae todos los coordinador para el monitoreo
function DropListSMonitor_Transaction() {
    var Obj_Users = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "UsersSMonitores"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Users = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Users, "DList_SMonitor", "");
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
        Carga_CatalogList(Obj_DLForm, "DList_Formulario2", "");
    });
}

//trae todos los coordinador para el monitoreo
function TraerEncabezado_Transaction() {

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "EncabezodoReporte"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Encabezado = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        jQuery("#vi_CantMonitoreos").val(Obj_Encabezado[0].CANT_MONITOREOS);
        jQuery("#vi_PORCENTAJE_PEC").val(Obj_Encabezado[0].PORCENTAJE_PEC + " %");
        jQuery("#vi_PORCENTAJE_PECC").val(Obj_Encabezado[0].PORCENTAJE_PECC + " %");
        jQuery("#vi_PORCENTAJE_PECN").val(Obj_Encabezado[0].PORCENTAJE_PECN + " %");
        jQuery("#vi_PORCENTAJE_PECUF").val(Obj_Encabezado[0].PORCENTAJE_PECUF + " %");
        jQuery("#vi_CantFormulario").val(Obj_Encabezado[0].CANT_FORMULARIOS);
        jQuery("#vi_NotaFinalProm").val(Obj_Encabezado[0].PROMEDIO_NOTA_FINAL);

        if (Obj_Encabezado[0].CANT_FORMULARIOS > 1) {
            jQuery("#vi_CantFormulario").css("background", "#646209");
            jQuery("#vi_CantFormulario").css("color", "#e9ecef");
            jQuery("#BlockMSN").css("display", "block");

            jQuery("#MsnPerson").html("tiene mas de un formulario debe seleccionar uno para visualizar el informe");
        }
        else {
            jQuery("#vi_CantFormulario").css("background", "#e9ecef");
            jQuery("#vi_CantFormulario").css("color", "#0c0d3d");
            jQuery("#BlockMSN").css("display", "none");

            jQuery("#MsnPerson").html("");
        }
    });
}

//trae todos los agentes para el monitoreo
function ReadDataForm_Transaction(vp_Index) {

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ReportGeneralXFormulario",
            "FormularioId": vp_Index
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

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

