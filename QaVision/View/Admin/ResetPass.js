/*---------------  EVENTO LOAD JS ------------------*/
$(document).ready(function () {
    OcultarCampos();
    CrearObjetos();
    ChangeControl();
    ValidaCambios_Transaction();
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
var ObjWork = [];
var ObjColors = [];
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
    $(".C_Chosen").chosen({
        width: "85%",
        placeholder: 'Seleccione una empresa',
        search_contains: true
    });

    $("#Btn_Changue").attr("disabled", true);

    $("#BlockPwd").hover(function () {
        $('#pass').get(0).type = 'text';
    }, function () {
        $('#pass').get(0).type = 'password';
    });

    $("#BlockPwd1").hover(function () {
        $('#pass1').get(0).type = 'text';
    }, function () {
        $('#pass1').get(0).type = 'password';
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
function btn_Cambio() {

    if ($("#Select_Colors").val() != "-1") {
        CambioPass_Transaction();
    }
    else {
        Message("Alert", "Debe seleccionar un color", 5000);
    }
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION VALIDACIONES
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ChangeControl() {
    var rex = /^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$/;
    var validaRex = 0;

    jQuery("#pass1").blur(function () {
        vg_ValuePC = jQuery(this).val();
        vg_ValueP = jQuery("#pass").val();

        if (!rex.test(vg_ValuePC)) {
            $("#pass1").css("border", "1px solid #bd2130");
            $("#helppass1").css("display", "block");
            $("#helppass1").html("la contraseña debe tener entre 8 a 16 caracteres,  minimo una Mayuscula, una Minuscula y un numero");
            validaRex = 1;
        }
        else {
            $("#pass1").css("border", "1px solid #cacaca");
            $("#helppass1").css("display", "none");
            $("#helppass1").html("");
            validaRex = 0;
        }

        if (validaRex == 0) {
            if (vg_ValuePC != vg_ValueP) {
                $("#pass1").css("border", "1px solid #bd2130");
                $("#pass").css("border", "1px solid #bd2130");
            }
            else {
                $("#pass1").css("border", "1px solid #07f73e");
                $("#pass").css("border", "1px solid #07f73e");
                $("#Btn_Changue").attr("disabled", false);
            }
        }
    });

    jQuery("#pass").blur(function () {
        vg_ValuePC = jQuery(this).val();
        vg_ValueP = jQuery("#pass1").val();

        if (!rex.test(vg_ValuePC)) {
            $("#pass").css("border", "1px solid #bd2130");
            $("#helppass").css("display", "block");
            $("#helppass").html("la contraseña debe entre 8 a 16 caracteres, tener minimo una Mayuscula, una Minuscula y un numero");
            validaRex = 1;
        }
        else {
            $("#pass").css("border", "1px solid #cacaca");
            $("#helppass").css("display", "none");
            $("#helppass").html("");
            validaRex = 0;
        }

        if (validaRex == 0) {

            if (vg_ValuePC != vg_ValueP) {
                $("#pass1").css("border", "1px solid #bd2130");
                $("#pass").css("border", "1px solid #bd2130");
            }
            else {
                $("#pass1").css("border", "1px solid #07f73e");
                $("#pass").css("border", "1px solid #07f73e");
                $("#Btn_Changue").attr("disabled", false);
            }
        }
    });
}

//funcion de carga de combos
function Carga_CatalogList(vp_objCatalog, vp_NameList, vp_IndexEdit, vp_Campo) {

    jQuery("#" + vp_NameList).empty();

    var objList = jQuery('[id$=' + vp_NameList + ']');
    switch (vp_NameList) {
        case "Select_Colors":
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
//trae todos los Clientes 
function ValidaCambios_Transaction() {
    var vl_flag = "";
    jQuery.ajax({
        url: "/Controller/LoginTransaccion.aspx/ValidaChange",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].EstadoSesion;
            ObjWork = result.d.user;
            ObjColors = result.d.colores;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        switch (vl_flag) {
            case "200":
                var vl_txt = "";
                var vl_Wt = "";
                var vl_Mt = "";

                $("#DataUser").html(ObjWork[0].Nombre + " " + ObjWork[0].Apellido);
                vl_txt = (ObjWork[1].Respuesta == "New") ? "Bienvenido a la plataforma debe asignar su color favorito al ser su primera vez de cambio de contraseña, ya en proximas oprtunidades solo le solicitará el color " : "Para corfirmar su identidad Seleccione su color favorito";
                $("#Msm").html(vl_txt);
                Carga_CatalogList(ObjColors, "Select_Colors", "", "");
                vl_Wt = (ObjWork[1].Respuesta == "New") ? "50%" : "80%";
                vl_Mt = (ObjWork[1].Respuesta == "New") ? "25%" : "10%";

                $(".card").css("width", vl_Wt);
                $(".card").css("margin-left", vl_Mt);
                break;

            case "404":
                Message("Alert", "No tiene permisos para utilizar este modulo sera redireccionado al login.", 5000, "Sin Autorización", "S", "/Login.aspx");
                break;

            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.", 5000, "Falla en el sistema", "S", "/Login.aspx");
                break;
        }
    });
}

//trae todos los Clientes 
function CambioPass_Transaction() {
    var vl_flag = "";
    jQuery.ajax({
        url: "/Controller/LoginTransaccion.aspx/ChangePassword",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{PasswordNew:'" + jQuery("#pass").val() +
            "',Color: '" + $("#Select_Colors").val() +
            "', Estado: '" + ObjWork[1].Respuesta + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        switch (vl_flag) {
            case "1":
                Message("Success", "Se ha realizado el cambio de contraseña satisfactoriamente, se redirecionara al login para el ingreso ala plataforma.", 5000, "Cambio Exitoso", "S", "/Login.aspx");
                break;

            case "303":
                Message("Alert", "el proceso de actualización de color no fue satisfactorio, comuniquese con su administrador", 5000);
                break;

            case "404":
                Message("Alert", "El color seleccionado no coincide con el del sistema, otro error y el sistema bloquera su proceso de cambio de contraseñan", 5000);
                break;


            default:
                Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.", 5000, "Falla en el sistema", "S", "/Login.aspx");
                break;
        }
    });
}


