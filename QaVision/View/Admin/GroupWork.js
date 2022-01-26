/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var ObjWork = [];
var ObjPersonal = [];
var ObjAsignacion = [];

var vg_tipoAsignacion = 0;
var vg_FlagEdit = 0;
var vg_EstadoUser;
var vg_selectCheckbox = 0;
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
    ListDataPersonal_Transaction();
    ListCoordinadores_Transaction();
    ChangueControl();

    if (vl_Parameters !== undefined) {
        CapturaVariables(vl_Parameters);
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION BOTONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//activa paneles de vision para el agente
function ModoAgentes(vp_Type) {
    switch (vp_Type) {

        case 1:
            vg_tipoAsignacion = 0;
            jQuery("#BlockAsignar").fadeOut('fast');
            jQuery("#BlockReAsignar").fadeOut('fast');
            jQuery("#BlockButtonAsig").fadeOut('fast');
            ListAgentesAll_Transaction();
            break;
        case 2:
            vg_tipoAsignacion = 1;
            jQuery("#BlockAsignar").show('slow');
            jQuery("#BlockReAsignar").fadeOut('fast');
            jQuery("#BlockButtonAsig").show('slow');
            ListAgentesAll_Transaction();
            break;
        case 3:
            vg_tipoAsignacion = 2;
            jQuery("#BlockAsignar").fadeOut('fast');
            jQuery("#BlockReAsignar").show('slow');
            jQuery("#BlockButtonAsig").show('slow');
            break;

    }

}

//activa el proceso de guardado
function Btn_Save() {
    var vl_Valida = ValidaCampos();

    (vl_Valida == 1) ? Message("Alert", "Revise por favor los campos obligatorios") : ValidaCliente_Transaction();
}

//activa el proceso de asignacion
function Btn_AgregarAsignacion() {

    if (vg_tipoAsignacion == 1) {
        //asignacion
        var vl_cordinadorId = jQuery("#DList_Coordinador").val();

        if (vl_cordinadorId != "-1") {
            jQuery("input[type=checkbox]:checked").each(function () {
                var json = {
                    "CoordinadorId": vl_cordinadorId,
                    "AgenteId": jQuery(this).val()
                };

                ObjAsignacion.push(json);
            });

            (ObjAsignacion.length == 0) ? Message("Error", "Debe seleccionar almenos un agente") : Save_Transaccion();
        }
        else {
            Message("Error", "Debe seleccionar un coordinador");
        }
    }
    else {
        //reasisgnacion
        var vl_cordinadorId_A = jQuery("#DList_CoordinadorA").val();
        var vl_cordinadorId_R = jQuery("#DList_CoordinadorR").val();

        if (vl_cordinadorId_A == "-1" ||
            vl_cordinadorId_R == "-1") {

            if (vl_cordinadorId_A == "") { jQuery("#help_CoordinadorA").html("* Coor. Inicial Obligatorio"); jQuery("#help_CoordinadorA").css("display", "block"); } else { jQuery("#help_CoordinadorA").html(""); jQuery("#help_CoordinadorA").css("display", "none"); }
            if (vl_cordinadorId_R == "") { jQuery("#help_CoordinadorR").html("* Coor. final Obligatorio"); jQuery("#help_CoordinadorR").css("display", "block"); } else { jQuery("#help_CoordinadorR").html(""); jQuery("#help_CoordinadorR").css("display", "none"); }
            Message("Error", "Debe seleccionar un coordinador inicial y uno final");
        }
        else {
            if (vl_cordinadorId != "-1") {
                jQuery("input[type=checkbox]:checked").each(function () {
                    var json = {
                        "CoordinadorId": vl_cordinadorId_R,
                        "AgenteId": jQuery(this).val()
                    };

                    ObjAsignacion.push(json);
                });

                (ObjAsignacion.length == 0) ? Message("Error", "Debe seleccionar almenos un agente") : Save_Transaccion();
            }

        }

    }
}

//limpiA CAMPOS
function Clear() {
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

//evento de chances en controles
function ChangueControl() {
    jQuery("#DList_CoordinadorA").change(function () {
        var vl_ListR = jQuery("#DList_CoordinadorR").val();
        var vl_value = jQuery(this).val();

        if (vl_ListR == vl_value) {
            Message("Error", "el coordinador inicial no puede ser el mismo del final");
            jQuery('#DList_CoordinadorA').val("-1").trigger('chosen:updated');
        }

        ListAgentesCoordinador_Transaction(vl_value);
    });

    jQuery("#DList_CoordinadorR").change(function () {
        var vl_ListA = jQuery("#DList_CoordinadorA").val();
        var vl_value = jQuery(this).val();

        if (vl_ListA == vl_value) {
            Message("Error", "el coordinador final no puede ser el mismo del inicial");
            jQuery('#DList_CoordinadorR').val("-1").trigger('chosen:updated');
        }

    });
}

//limpia campos
function Clear() {
    jQuery('#DList_CoordinadorA').val("-1").trigger('chosen:updated');
    jQuery('#DList_CoordinadorR').val("-1").trigger('chosen:updated');
    jQuery('#DList_Coordinador').val("-1").trigger('chosen:updated');
    jQuery("#TxtNombre").val("");
    jQuery("#TxtNit").val("");
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GRID                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//creacion de grid de personal
function CreatePersonalGrid() {

    var vl_Color = "";
    var vl_BackColor = "";

    var vl_Html = "<div class='card'>" +
        "<div class='card-header'><strong class='card-title'>Personal</strong></div>" +
        "<div class='card-body'>" +
        "   <table id='GridPersonal' class='table table-striped table-bordered'>" +
        "   <thead><tr>" +
        "       <th>Perfil</th>" +
        "       <th>Nombre</th>" +
        "       <th>Opciones</th>" +
        "   </tr></thead><tbody>";

    for (ItemObj in ObjPersonal) {
        switch (ObjPersonal[ItemObj].ValueRolId) {
            case 1: //Administrador
                vl_Color = "#cacaca";
                vl_BackColor = "#FFF";
                break;
            case 2: //Supervisor
                vl_Color = "#FFF";
                vl_BackColor = "#a10000";
                break;
            case 3: //Monitor
                vl_Color = "#FFF";
                vl_BackColor = "#cb531a";
                break;
            case 4: //Coordinador
                vl_Color = "#FFF";
                vl_BackColor = "#0bcd47";
                break;
            case 5: //Agente
                vl_Color = "#FFF";
                vl_BackColor = "#f720f0";
                break;
            case 6: //Cliente
                vl_Color = "#FFF";
                vl_BackColor = "#4120f7";
                break;

        }

        var vl_estadoColor = (ObjPersonal[ItemObj].Estado == 1) ? "#0EEA04" : "#F61313";

        vl_Html += "    <tr id= 'Tr_Cliente_" + ObjPersonal[ItemObj].Id + "'>" +
            "     <td style='text-align: center; font-weight: bold; background:" + vl_BackColor + "; color:" + vl_Color + "'>" + ObjPersonal[ItemObj].Rol + "</td>" +
            "     <td>" + ObjPersonal[ItemObj].Usuario + "</td>" +
            "     <td>";
        if (ObjPersonal[ItemObj].ValueRolId == 4) {
            vl_Html += "      <div class='col-lg-6 col-md-6' style='text-align: center;'><span class='ToolTip_Ver'><a href=\"javascript:EditarGrid('" + ItemObj + "')\"><i class='fa fa-pencil-square fa-2x' onmouseover=this.color='" + vg_Color + "'; onmouseout=this.color='#343a40';></i></a><span>Editar</span></span></div>";
        }
        vl_Html += "</td>" +
            "   </tr>";
    }

    vl_Html += "</tbody></table></div></div>";

    jQuery("#Grid_Personal").html("");
    jQuery("#Grid_Personal").html(vl_Html);


    jQuery("#GridPersonal").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
}

//creacion de grid de agentes
function CreateGrid(vp_Type) {
    var vl_Html = "";

    switch (vp_Type) {

        case 1:
            vl_Html = "<div class='card'>" +
                "<div class='card-header'><strong class='card-title'>Ver Agentes</strong></div>" +
                "<div class='card-body'>" +
                "   <table id='GridWork' class='table table-striped table-bordered'>" +
                "   <thead><tr>" +
                "       <th>Coordinador</th>" +
                "       <th>Agente</th>" +
                "   </tr></thead><tbody>";

            for (ItemObj in ObjWork) {


                if (ObjWork[ItemObj].Id == ObjWork[ItemObj].CoordinadorId) {
                    vl_Html += "    <tr  style='text-align: center; background: #939b19; color:#FFF;' id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>";
                    vl_Html += "     <td>Sin Asignar</td>";
                }
                else {
                    vl_Html += "    <tr  id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>";
                    vl_Html += "     <td  style='text-align: center;'>" + ObjWork[ItemObj].Coordinador + "</td>";
                }

                vl_Html += "     <td>" + ObjWork[ItemObj].Usuario + "</td>" +
                    "   </tr>";
            }

            vl_Html += "</tbody></table></div></div>";
            break;

        case 2:
        case 3:
            vl_Html = "<div class='card'>" +
                "<div class='card-header'><div class='col-xs-9 col-sm-9'><strong class='card-title'>Agentes sin asignar<strong></div><div class='col-xs-3 col-sm-3''><button type='button'  class='btn btn-warning btn-block Top' onclick='javascript:Select_All()'><i class='fa fa-check'></i>&nbsp;Seleccionar todo</button></div></div>" +
                "<div class='card-body'>" +
                "   <table id='GridWork' class='table table-striped table-bordered'>" +
                "   <thead><tr>" +
                "       <th>Agente</th>" +
                "       <th>Seleccionar</th>" +
                "   </tr></thead><tbody>";

            for (ItemObj in ObjWork) {


                vl_Html += "    <tr  style='text-align: center;'  id= 'Tr_Cliente_" + ObjWork[ItemObj].Id + "'>" +
                    "     <td>" + ObjWork[ItemObj].Usuario + "</td>" +
                    "     <td><div class='col-1 col-md-1 Block_Cumple' style='border: solid 1px #e8e3e3; text-align: center; padding-top: 12px;'><label class='containerX'><input type='checkbox' id='Opc_" + ObjWork[ItemObj].Id + "' name='N_Opc_" + ObjWork[ItemObj].Id + "' value='" + ObjWork[ItemObj].Id + "' style='display:none;' ><span class='checkmark'></span></label></div></td>" +
                    "</tr>";
            }
            vl_Html += "</tbody></table></div></div>";


            vl_Html.replace("/\NaN/g", "");
            break;

    }

    jQuery("#Grid_Agentes").html("");
    jQuery("#Grid_Agentes").html(vl_Html);


    jQuery("#GridWork").dataTable({
        "bJQueryUI": true,
        "bDestroy": true
    });

    setTimeout(function () { FormatStyle(); }, 500);
}

//funcin de seleccion de checkbox
function Select_All() {
    if (vg_selectCheckbox == 0) {
        vg_selectCheckbox = 1;
        jQuery("input:checkbox").prop('checked', true);
    }
    else {
        vg_selectCheckbox = 0;
        jQuery("input:checkbox").prop('checked', false);
    }
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
function ListDataPersonal_Transaction() {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/ListUserPersonal",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjPersonal = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        CreatePersonalGrid();
    });
}

//trae todos los agentes de la campaña 
function ListAgentesAll_Transaction() {
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ListUser_Agentes_All",
            "TipoOperacion": vg_tipoAsignacion
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjWork = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {

        switch (vg_tipoAsignacion) {
            case 0:
                CreateGrid(1);
                break;
            case 1:
                CreateGrid(2);
                break;

        }
    });
}

//trae todos los agentes de la campaña 
function ListAgentesCoordinador_Transaction(vp_Index) {
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "ListUser_Agentes_Coor",
            "CoordinadorId": vp_Index
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjWork = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        CreateGrid(3);
    });
}

//trae los coordinadores de la cuenta
function ListCoordinadores_Transaction() {
    var ObjDataTemp = [];

    jQuery.ajax({
        url: "/Controller/ProcesoTransaccion.aspx",
        type: "POST",
        //crear json
        data: {
            "Action": "UsersCoordinadores"
        },
        //Transaccion Ajax en proceso
        success: function (result) {
            ObjDataTemp = JSON.parse(result);
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        Carga_CatalogList(ObjDataTemp, "DList_Coordinador", "");
        Carga_CatalogList(ObjDataTemp, "DList_CoordinadorA", "");
        Carga_CatalogList(ObjDataTemp, "DList_CoordinadorR", "");
    });
}

//ingresa los datos registrados
function Save_Transaccion() {
    var vl_flag;
    var vl_ListAsignacion = [];

    vl_ListAsignacion = JSON.stringify(ObjAsignacion);

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/UpdateCoordinador",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{ ListAsignacion:'" + vl_ListAsignacion + "'}",
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
                Message("Success", "Se actualiza la asignacion.", 5000);
                ModoAgentes(1);
                Clear();
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




