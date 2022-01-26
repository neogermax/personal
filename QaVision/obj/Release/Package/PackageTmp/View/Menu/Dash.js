/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    CreateObject();
    HideObject();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------* /
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//instancia los objetos para el proceso
function CreateObject() {
}

//oculta campos para el proceso
function HideObject() {
}

//inicia la pagina si esta autorizada
function PageLoad() {
    var vl_Parameters = Capture_GET();
    ChangeCampana();

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
//validar si seleccionan la empresa
function Btn_Asignacion(vp_Index) {
    var vl_Valida = (vp_Index == 0) ? jQuery("#DListSelectCampana").val() : vg_CuentaId;
    (vl_Valida == "-1") ? Message("Alert", "Debe seleccionar una empresa.", 5000) : AsignacionEnterprise_Transaction(vl_Valida);
}

//mostrar el cambio de empresa
function Btn_ReloadEntreprise() {
    Carga_CatalogList(Obj_Campana, "DListSelectCampana", "");
    jQuery('#SeleccionCampana').modal('show');
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//crea el dash board de trabajo
function CreateDahs(vp_Index) {

    var vl_html_Dahs = "";

    for (var item in Obj_Modules) {

        if (Obj_Modules[item].PadreId == vp_Index) {

            var vl_Proccess = (Obj_Modules[item].Url == "") ? Obj_Modules[item].Id : Obj_Modules[item].Url;

            vl_html_Dahs += "<div class='col-md-6 col-lg-3'>" +
                "    <div class='card bg-flat-color-" + Obj_Modules[item].Color + " text-light Hand' onclick=\"Redirecion_Page('" + vl_Proccess + "');\">" +
                "        <div class='card-body'>" +
                "            <div class='h1 text-muted text-right mb-4'>" +
                "                <i class='fa fa-" + Obj_Modules[item].Imagen + " text-light'></i>" +
                "            </div>" +
                "            <div class='h4 mb-0 text-light'>" +
                "                <!--<span class='count'>numeritos</span>-->" +
                "			</div>" +
                "            <small class='text-uppercase font-weight-bold text-light'>" + Obj_Modules[item].Nombre + "</small>" +
                "            <div class='progress progress-xs mt-3 mb-0 bg-light' style='width: 90%; height: 5px;'></div>" +
                "        </div>" +
                "    </div>" +
                "</div>";
        }
    }

    jQuery("#ContainerDahs").html(vl_html_Dahs);
}

//valida si es redireccion o sub dashboard
function Redirecion_Page(vp_Index) {
    if (isNaN(vp_Index)) {
        //redireccion
        window.location = vp_Index;
    }
    else {
        CreateDahs(vp_Index);
    }
}

//evento dde change para seleccionar la campaña
function ChangeCampana() {
    jQuery("#DListSelectCampana").change(function () {
        var vl_Valor = jQuery(this).val();

        var vl_Rol = "";
        var vl_RolId = "";
        for (Item in Obj_Campana) {
            if (vl_Valor == Obj_Campana[Item].Id) {
                vl_Rol = Obj_Campana[Item].Campo_Add2;
                vl_RolId = Obj_Campana[Item].Campo_Add1;
                break;
            }
        }

        (vl_Valor == "-1") ? Message("Alert", "Debe seleccionar una empresa.", 5000) : AsignacionEnterprise_Transaction(vl_Valor, vl_RolId, vl_Rol);
    });
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #TRANSACCIONES DE SESSION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//Asigma la empresa en la sesion
function AsignacionEnterprise_Transaction(vp_Index, vp_RolId, vp_Rol) {
   
    vp_RolId = (vp_RolId == null) ? Obj_Data[0].IdRol : vp_RolId;
    vp_Rol = (vp_Rol == null) ? vg_PerfilRol : vp_Rol;
    if (Obj_Data.length != 1) {
        jQuery("#LblPerfilUser").html("Perfil: " + vp_Rol);
    }
    vg_CuentaId = vp_Index;
    jQuery("#Title_Form").html(jQuery("#DListSelectCampana option:selected").html());

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/AsignaCampana",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{CampanaId:'" + vp_Index +
            "', RolId:'" + vp_RolId +
            "',Rol: '" + vp_Rol +"'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            jQuery("#SeleccionCampana").modal("hide");

            if (result.d.data[0].Select_Cuenta != "0") {
                vg_CuentaId = result.d.data[0].Select_Cuenta;
                Obj_Style = result.d.style;
                Obj_Modules = result.d.modulos;
            }
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        FormatStyle();
        CreateDahs(0);
    });
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
