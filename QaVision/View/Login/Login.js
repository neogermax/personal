
/*---------------  EVENTO LOAD JS ------------------*/
$(document).ready(function () {
    OcultarCampos();
    CrearObjetos();
    ChangueControl();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var URLPage = window.location.search.substring(1);
var URLVariables = URLPage.split('&');
var vg_View;
var vg_Redireccion = 0;
var vg_SeguridadIn = 0;
var vg_ip = "";
var vp_OpcE = 0;

var Obj_List = [];
var Obj_ListR = [];
var ObjN_empresas = [];
var ObjList_DropList = [];
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION INICIO DE COMPONENTES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//oculta campos para el proceso
function OcultarCampos() {
}

//instancia los objetos para el proceso
function CrearObjetos() {
    jQuery('.Numeric').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9]/g, '');
    });

    $("#BlockPwd").hover(function () {
        $('#pass').get(0).type = 'text';
    }, function () {
        $('#pass').get(0).type = 'password';
    });

    $(".C_Chosen").chosen({
        width: "85%",
        placeholder: 'Seleccione una empresa',
        search_contains: true
    });

}

//capturar el link y usuario para el proceso
function ConsultaParametrosURL() {
    if (URLVariables.length == 1) {
        vg_Redireccion = URLVariables[0].replace("View=", "");
        if (vg_Redireccion == "") {
            vg_Redireccion = 1;
        }
    }
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION BOTONES                                                                                                
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

//INGRESO AL PROYECTO
function btn_Ingreso() {
    var vl_Valida = validaCampos();

    (vl_Valida == 1) ? Message("Error", "debe ingresar Usuario y contraseña", 5000) : IngresoApp();
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION VALIDACIONES
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//valida los campos de ingreso
function validaCampos() {

    var vl_Campo_1 = $("#user").val();
    var vl_Campo_2 = $("#pass").val();
    var vl_Validar = 0;

    if (vl_Campo_1 == "" ||
        vl_Campo_2 == "") {
        vl_Validar = 1;
    }

    return vl_Validar;
}

function ValidaUser() {
    if ($("#user").val() == "") {
        Message("Error", "debe ingresar el documento", 5000);
    }
    else {
        ValidarCambioPassword();
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//evento de controles
function ChangueControl() {

    $("#Select_Empresa").change(function () {
        vg_Value = jQuery(this).val();

        if (vg_Value == Obj_ListR[0].Id) {
            Message("Info", "Sera redireccionado al panel de cambio de contraseña", 5000, "Cambio de contraseña  QA vision", "S", "../View/Admin/ResetPass.aspx");
        }
        else {
            if (vp_OpcE == 0) {
                Message("Alert", "Acaba de seleccionar la empresa incorrecta, tiene otra oportunidad si no sera bloqueado para el cambio de contraseña", 5000, "Error Empresa");
                vp_OpcE = 1;
            }
            else {
                BloqueoPassword();
            }
        }
    });

}

function RandPreguntas(n) {
    // creamos un numero al azar entre 1 y 5 (o cual sea la cantidad de VIDEOS)
    return (Math.floor(Math.random() * n + 1));
}

//funcion de construr preguntas
function BuscarPreguntas() {
    for (var item = 1; item <= 9; item++) {
        var vl_num = RandPreguntas(58);
        var vl_Repetido = 0;
        var lenghnum = ObjN_empresas.length;

        if (lenghnum == 0) {
            ObjN_empresas.push(vl_num);
        }
        else {
            for (var item2 in ObjN_empresas) {
                if (vl_num == ObjN_empresas[item2]) {
                    vl_Repetido = 1;
                    break;
                }
            }

            if (vl_Repetido == 1) {
                ReinicioPreguntas();
            }
            else {
                ObjN_empresas.push(vl_num);
                vl_Repetido = 0;
            }
        }
    }
}

//validar empresas
function ReinicioPreguntas() {
    BuscarPreguntas();
}

//crea lista
function CreateArrayDroplist() {

    jQuery(ObjN_empresas).each(function (item) {
        for (var ObjItem in Obj_List) {

            var CompareItem = ObjN_empresas[item];
            console.log(ObjItem + " == " + CompareItem);

            if (ObjItem == CompareItem) {

                var json = {
                    "Id": Obj_List[ObjItem].Id,
                    "Nombre": Obj_List[ObjItem].Nombre
                };
                ObjList_DropList.push(json);
            }
        }

    }).promise().done(function () {
        var json = {
            "Id": Obj_ListR[0].Id,
            "Nombre": Obj_ListR[0].Nombre
        };
        ObjList_DropList.push(json);

        ordenarAsc(ObjList_DropList, 'Nombre');
        Carga_CatalogList(ObjList_DropList, "Select_Empresa", "", "");
        $("#BlockList").show('slow');

    });

}

function ordenarAsc(p_array_json, p_key) {
    p_array_json.sort(function (a, b) {
        return a[p_key] > b[p_key];
    });
}

//funcion de carga de combos
function Carga_CatalogList(vp_objCatalog, vp_NameList, vp_IndexEdit, vp_Campo) {

    jQuery("#" + vp_NameList).empty();

    var objList = jQuery('[id$=' + vp_NameList + ']');
    switch (vp_NameList) {
        case "Select_Empresa":
            switch (vp_Campo) {
                default:
                    //recorremos para llenar el combo de
                    jQuery(vp_objCatalog).each(function (ItemObj) {
                        objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Nombre, vp_objCatalog[ItemObj].Id);
                    }).promise().done(function () {
                        jQuery("#" + vp_NameList).prepend("<option value='-1'>Seleccione...</option>");
                        (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
                    });
                    break;
            }
            break;
    }

    jQuery("#" + vp_NameList).trigger("liszt:updated");
    jQuery('.C_Chosen').trigger('chosen:updated');

}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION TRANSACCIONES
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ValidarCambioPassword() {
    var vl_Respuesta = "";

    $.ajax({
        url: "/Controller/LoginTransaccion.aspx/ValidaDataChange",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data:
            "{ Documento:'" + $("#user").val() + "' }",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_Respuesta = result.d.data[0].Respuesta;
            Obj_List = result.d.empresas;
            Obj_ListR = result.d.empresa;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la Consulta de los datos.", 5000);
        },
    }).done(function () {
        switch (vl_Respuesta) {
            case "200":
                $("#user").attr("disabled", true);
                BuscarPreguntas();
                setTimeout(function () { CreateArrayDroplist(); }, 700);
                break;
            case "404":
                Message("Alert", "Disculpa no tiene parmisos para la autogestón de la contraseña, comunicate con el supervisor para al cambio de la misma.", 5000);
                break;
            default:
                Message("Error", "¡Disculpa!, Se generó un error al realizar el ingreso al sistema, verifica tu conexión a internet", 5000);
                break;
        }
    });

}

function BloqueoPassword() {
    var vl_Respuesta = "";

    $.ajax({
        url: "/Controller/LoginTransaccion.aspx/BloqueoPassword",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data:
            "{ Documento:'" + $("#user").val() + "' }",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_Respuesta = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la Consulta de los datos.", 5000);
        },
    }).done(function () {
        switch (vl_Respuesta) {
            case "200":
                Message("Info", "Se ha realizado el bloqueo de cambio de contraseña, debe hablar con el supervisor del sistemar para volver habilitar el cambio.", 5000, "Bloque de cambio de contraseña", "S", "../Login.aspx");
                break;
            case "404":
                Message("Alert", "Disculpa no tiene parmisos para la autogestón de la contraseña, comunicate con el supervisor para al cambio de la misma.", 5000);
                break;
            default:
                Message("Error", "¡Disculpa!, Se generó un error al realizar el ingreso al sistema, verifica tu conexión a internet", 5000);
                break;
        }
    });

}


//transaccion para inicio de la sesion
function IngresoApp() {

    $.ajax({
        url: "/Controller/LoginTransaccion.aspx/IniciarSesion",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data:
            "{ User:'" + $("#user").val() +
            "',Password:'" + $("#pass").val() + "' }",
        //Transaccion Ajax en proceso
        success: function (result) {

            switch (result.d.data[0].Estado_User) {
                case "0":
                    window.location = (vg_Redireccion == 0) ? "../Views/Formulario/GH_Form.aspx?Ind=" + $("#TxtCedula").val() + "&Edit=0&View=0" : "../View/Formulario/GH_Form.aspx?Ind=" + $("#TxtCedula").val();
                    break;
                case "1":
                    Message("Error", "Credenciales erroneas, intenta de nuevo por favor", 5000);
                    break;
                case "2":
                    Message("Alert", "Tu usuario se encuentra inactivo, comunicate con el administrador,", 5000);
                    break;
                case "4":
                    // ** Redirecciona al dashboard ** //
                    Message("Success", "Ingreso a la plataforma exitosa", 5000, "bienvenido a QA vision", "S", "../View/Menu/Dash.aspx");
                    break;
                case "5":
                    //actualizar contraseña
                    Message("Info", "El administrador del sistema solicito el cambio de contraseña sera redireccionado al panel de cambio", 8000, "Cambio de contraseña  QA vision", "S", "../View/Admin/ResetPass.aspx");
                    break;
                case "6":
                    Message("Alert", "El rol de tu usuario se encuentra inactivo, comunicate con el administrador,", 5000);
                    break;

                case "7":
                    // ** Redirecciona al  dash  ** //
                    Message("Success", "Ingreso Exitoso", 5000, "Un momento ingresando a la aplicación", "S", "../View/Menu/Dash.aspx");
                    break;

                default:
                    Message("Error", "¡Disculpa!, Se generó un error al realizar el ingreso al sistema, verifica tu conexión a internet", 5000);
                    break;
            }
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la Consulta de los datos.", 5000);
        },
    }).done(function () {

    });


}
