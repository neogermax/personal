jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];
var Obj_Monitor = [];

var vg_SelectAgente = "";

var vg_FlagEdit = 0;

var vg_ContM = 0;
var vg_ContR = 0;
var vg_ContOC = 0;
var vg_ContOA = 0;
var vg_ContC = 0;
var vg_ContE = 0;
var vg_tipoInfo = "G";

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {
    jQuery('body').toggleClass('open');

    jQuery('#TxtFecha').datepicker({
        dateFormat: 'yyyy-mm-dd'
    });
    jQuery('#TxtFecha').data('datepicker');
}

//oculta campos para el proceso
function HideObject() {
    jQuery("#blockMonitor").fadeOut('fast');
}

//inicia la pagina si esta autorizada
function PageLoad() {
    var vl_Parameters = Capture_GET();
    DropListMonitor_Transaction();

    ChangueControl();

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
//dispara  la busqueda del proceso
function Btn_SearchReport() {
    vg_DataGrafica = "";
    vg_LabelsGrafica = [];
    ObjWork = [];

    var vl_Monitor = jQuery("#DList_Monitor").val();
    var capturarRango = jQuery("#TxtFecha").val();
    var vl_tipoFiltro = 0;
    var vl_FechaInicio = "Vacio";
    var vl_FechaFin = "Vacio";


    if (vg_tipoInfo == "G") {
        vl_Monitor = 0;

        //capturar el tipo de filtro
        if (jQuery('#Select1').prop('checked')) {
            vl_tipoFiltro = 1; //diario
        }
        else {
            if (jQuery('#Select2').prop('checked')) {
                vl_tipoFiltro = 2;//semanal
            }
            else {
                if (jQuery('#Select3').prop('checked')) {
                    vl_tipoFiltro = 3;//mensual
                }
            }
        }

        //capturar las fechas de filtro
        if (capturarRango != "") {
            if (capturarRango.length == 10) {
                vl_FechaInicio = capturarRango;
            }
            else {
                var splitFechas = capturarRango.split("<-->");
                vl_FechaInicio = splitFechas[0];
                vl_FechaFin = splitFechas[1];
            }
        }

        DataMonitoreos_Transaction(vl_Monitor, vl_tipoFiltro, vl_FechaInicio, vl_FechaFin);
    }
    else {
        if (vl_Monitor == "-1") {
            Message("Error", "Debe seleccionar un  monitor");
        }
        else {
            vg_SelectAgente = jQuery("#DList_Monitor option:selected").html();

            //capturar el tipo de filtro
            if (jQuery('#Select1').prop('checked')) {
                vl_tipoFiltro = 1; //diario
            }
            else {
                if (jQuery('#Select2').prop('checked')) {
                    vl_tipoFiltro = 2;//semanal
                }
                else {
                    if (jQuery('#Select3').prop('checked')) {
                        vl_tipoFiltro = 3;//mensual
                    }
                }
            }

            //capturar las fechas de filtro
            if (capturarRango != "") {
                if (capturarRango.length == 10) {
                    vl_FechaInicio = capturarRango;
                }
                else {
                    var splitFechas = capturarRango.split("<-->");
                    vl_FechaInicio = splitFechas[0];
                    vl_FechaFin = splitFechas[1];
                }
            }

            DataMonitoreos_Transaction(vl_Monitor, vl_tipoFiltro, vl_FechaInicio, vl_FechaFin);
        }
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ChangueControl() {
    jQuery("#Check_Filtro").on('change', function () {
        var chartdata = [];
        var ctx = jQuery("#densityChartBar");
        var LineGraph = new Chart(ctx, {
            type: 'line',
            data: chartdata
        });
        LineGraph.destroy();

        if (jQuery(this).is(':checked')) {
            //General
            vg_tipoInfo = 'M';
            jQuery("#blockMonitor").show('slow');
            jQuery("#densityChartBar").html("");
        }
        else {
            //monitor
            vg_tipoInfo = 'G';
            jQuery("#blockMonitor").fadeOut('fast');
            jQuery("#densityChartBar").html("");
        }
    });
}

//dibuja las graficas de monitoreo por monitor
function PaintGraficasMonitor() {
    var densityCanvasB = document.getElementById("densityChartBar");

    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 12;
    var Array_Labels = [];
    var Array_Data = [];

    for (var Item in ObjWork) {
        Array_Labels.push(ObjWork[Item].PARAMETRO_3);
        Array_Data.push(ObjWork[Item].PARAMETRO_2);
    }

    var densityData = {
        label: vg_SelectAgente,
        data: Array_Data,
        borderColor: [
            'rgba(63, 144, 63, 1)'
        ],
        borderWidth: 2,
        hoverBorderWidth: 0
    };

    var barChart = new Chart(densityCanvasB, {
        type: "line",
        data: {
            labels: Array_Labels,
            datasets: [densityData]
        }
    });
    jQuery("#densityChartBar").css("display", "block");

}

//dibuja las graficas en general de la campaña
function PaintGraficasGeneral() {

    var Array_Labels = [];
    var Array_Data = [];
    var vl_Monitor ="";
    var vl_Compare = "";


    for (var ItemM in Obj_Monitor) {
        vl_Compare = Obj_Monitor[ItemM].Id ;

        //recorremos la data
        for (var ItemD in ObjWork) {
            if (Obj_Monitor[ItemM].Id == ObjWork[ItemD].F_Monitor) {
                vl_Monitor = Obj_Monitor[ItemM].Nombre;
                Array_Data.push(ObjWork[Item].PARAMETRO_2);
            }

            if (vl_Compare != ObjWork[ItemD].F_Monitor) {

            }
        }



        

    }

    for (var Item in ObjWork) {
        Array_Labels.push(ObjWork[Item].PARAMETRO_3);
      

        for (var ItemM in Array_User) {
            if (Array_User[ItemM] == ObjWork[Item].Monitor) {
                existeM = 1;
                Break;
            }
        }

        if (existeM == 0) {
            Array_User.push(ObjWork[Item].Monitor);
        }

       
        
    }
    console.log(Array_Labels);
    console.log(Array_Data);
    console.log(Array_User);


    var densityCanvasB = document.getElementById("densityChartBar");

    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 16;

    var barChart = new Chart(densityCanvasB, {
        type: "line",
        data: {
            labels: Array_Labels,
            datasets: [{
                label: 'Karen',
                data: Array_Data,
                borderColor: [
                    'rgba(63, 144, 63, 1)'
                ],
                borderWidth: 2,
                hoverBorderWidth: 0
            },
            {
                label: 'Carlos',
                data: [1, 3, 0, 2, 4],
                borderColor: [
                    'rgba(255, 193, 7, 1)'
                ],
                borderWidth: 2,
                hoverBorderWidth: 0
            }]
        }
    });
    jQuery("#densityChartBar").css("display", "block");

}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//trae todos los coordinador para el monitoreo
function DropListMonitor_Transaction() {
    
    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "UsersMonitores"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_Monitor = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(Obj_Monitor, "DList_Monitor", "");
    });
}

//trae los data  monitoreos 
function DataMonitoreos_Transaction(vp_MonitorId, vp_TipoFiltro, vp_FechaInicial, vp_FechaFinal) {

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ReportMonitoreos",
            "MonitorId": vp_MonitorId,
            "TipoFiltro": vp_TipoFiltro,
            "TipoInforme": vg_tipoInfo,
            "FechaInicial": vp_FechaInicial,
            "FechaFinal": vp_FechaFinal
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjWork = JSON.parse(result);

        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {

        (vg_tipoInfo == 'G') ? setTimeout(function () { PaintGraficasMonitor(); }, 500) : setTimeout(function () { PaintGraficasGeneral(); }, 500);
    });
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
