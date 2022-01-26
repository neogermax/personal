/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    jQuery('.Numeric').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9]/g, '');
    });

    jQuery('.Decimals').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9\.]/g, '');
    });

    jQuery('.Letter_Especial').keyup(function () {
        this.value = (this.value + '').replace(/([ ]{2,})|[´ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç\-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/g, '');
    });

    jQuery('.Letter_Especial_2').keyup(function () {
        this.value = (this.value + '').replace(/([ ]{2,})|[´ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç\-!$%^&*()_+|~=`{}\[\]:";'<>?,\/]/g, '');
    });

    jQuery('.Letter').keyup(function () {
        this.value = (this.value + '').replace(/[^a-zA-Z\s\ñ\Ñ\ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç]+/g, '');
    });

    jQuery('.Numeric_letter_Especial').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9a-zA-Z\ñ\Ñ\ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç]/g, '');
    });

    jQuery('.Numeric_letter').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9a-zA-Z]/g, '');
    });

    jQuery('.Users').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9a-zA-Z\-\_]/g, '');
    });

    jQuery(".standardSelect").chosen({
        disable_search_threshold: 5,
        no_results_text: "Oops, no hay Datos!",
        width: "100%"
    });

    jQuery(".mediumSelect").chosen({
        disable_search_threshold: 5,
        no_results_text: "Oops, no hay Datos!",
        width: "50%"
    });

    jQuery(".minSelect").chosen({
        disable_search_threshold: 5,
        no_results_text: "Oops, no hay Datos!",
        width: "25%"
    });

    Valida_Session_Transaction();
});
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var Obj_Data = [];
var Obj_Campana = [];
var Obj_Style = [];
var Obj_Modules = [];
var Obj_Chargue = [];
var Obj_ErrorChargue = [];
var Obj_Notificaciones = [];

var vg_CuentaId = 0;
var vg_Parameter = 0;
var vg_Color;
var vg_Validador = 0;

var vg_RolID = 0;
var vg_PerfilRol = "";
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION FUNCIONES                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//mostrar modulo de notificaciones
function Btn_VerNotificaciones() {
    jQuery('#ModalNotificaciones').modal('show');
    jQuery("#MsnNotificacion").fadeOut('fast');
}

//validacion de rol para menu lateral
function OpcionRol(vp_Option) {
    switch (vp_Option) {
        case 1:
            jQuery(".Hide1").css("display", "block");
            jQuery(".Hide2").css("display", "block");
            jQuery(".Hide3").css("display", "block");
            break;

        case 2:
            jQuery(".Hide3").css("display", "block");
            break;
    }

    PageLoad();
}

//opciones de seleccion del menu
function MenuLateral(vp_Option) {

    switch (vp_Option) {
        case 1:
            window.location = "../Menu/Dash.aspx";
            break;
        case 2:
            window.location = "../Admin/Cliente.aspx";
            break;
        case 3:
            window.location = "../Admin/Campana.aspx";
            break;
        case 4:
            window.location = "../Admin/User.aspx";
            break;
        case 5:
            window.location = "../Admin/UsersCampanas.aspx";
            break;
        case 6:
            window.location = "../Admin/Message.aspx";
            break;
        case 7:
            window.location = "../Admin/Catalog.aspx";
            break;
        case 8:
            window.location = "../Report/HistoricoPassword.aspx";
            break;
        case 9:
            window.location = "../Admin/GroupWork.aspx";
            break;
    }
}

//validar E-Mail
function ValidarEmail(email) {
    var vl_ValidateMail = email;
    var vl_validate;
    // Expresion regular para validar el correo
    var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/
    if (regex.test(vl_ValidateMail)) {
        vl_validate = 0; /*CORREO VALIDO*/
    }
    else {
        vl_validate = 1; /*CORREO INCORRECTO*/
    }
    return vl_validate;
}

//Valida si el correo esta bien
function ChangeEmail(vp_Campo, vp_msn) {
    jQuery("#" + vp_Campo).blur(function () {
        var vl_Valor = ValidarEmail(jQuery(this).val());

        if (vl_Valor == 1) {
            jQuery("#" + vp_msn).css('display', 'block');
            jQuery("#" + vp_msn).html('*formato del correo incorrecto');
        }
        else {
            jQuery("#" + vp_msn).css('display', 'none');
            jQuery("#" + vp_msn).html('');
        }
    });
}

//funcion de carga de combos
function Carga_CatalogList(vp_objCatalog, vp_NameList, vp_IndexEdit, vp_Campo) {

    jQuery("#" + vp_NameList).empty();

    var objList = jQuery('[id$=' + vp_NameList + ']');
    switch (vp_NameList) {
        case "DList_Resposable":
            //recorremos para llenar el combo de
            jQuery(vp_objCatalog).each(function (ItemObj) {

                if (Obj_Data[0].IdUser != vp_objCatalog[ItemObj].Id) {
                    objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Nombre, vp_objCatalog[ItemObj].Id);
                }

            }).promise().done(function () {
                jQuery("#" + vp_NameList).prepend("<option value='-1'>Seleccione...</option>");
                (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
            });
            break;

        case "DListRol":
        case "DListTipo":
        case "DListPregunta":
        case "DListCatalog":

            //recorremos para llenar el combo de
            jQuery(vp_objCatalog).each(function (ItemObj) {

                if (Obj_Data[0].IdRol == 1) {
                    objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Nombre, vp_objCatalog[ItemObj].Id);
                }
                else {
                    if (vp_objCatalog[ItemObj].Id != 1) {
                        objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Nombre, vp_objCatalog[ItemObj].Id);
                    }
                }
            }).promise().done(function () {
                jQuery("#" + vp_NameList).prepend("<option value='-1'>Seleccione...</option>");
                (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
            });
            break;
        case "DListProceso":
        case "DListBotonH":
        case "DListBotonH_Enun":
        case "DListOptionReturn":
        case "DList_Nivel_0":
        case "DList_Nivel_1":
        case "DList_Nivel_2":
        case "DList_Nivel_3":
        case "DList_Formulario":

            //recorremos para llenar el combo de
            jQuery(vp_objCatalog).each(function (ItemObj) {
                objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Descripcion, vp_objCatalog[ItemObj].Id);
            }).promise().done(function () {
                jQuery("#" + vp_NameList).prepend("<option value='-1'>Seleccione...</option>");
                (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
            });
            break;

        case "DListSelectCampana":
        case "DListSelectCampanaAdd":
        case "DListCampana":
        case "DListUsers":
        case "DListCliente":
        case "DListPeriodo":
        case "DListErrores":
        case "DListErrores_1":
        case "DList_Agente":
        case "DList_Coordinador":
        case "DList_TipoMonitoreo":
        case "DList_Proceso":
        case "DList_CoordinadorA":
        case "DList_CoordinadorR":

            switch (vp_Campo) {
                case "E":
                    //recorremos para llenar el combo de
                    jQuery(vp_objCatalog).each(function (ItemObj) {
                        objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Nombre, vp_objCatalog[ItemObj].LlaveExterna);
                    }).promise().done(function () {
                        jQuery("#" + vp_NameList).prepend("<option value='-1'>Seleccione...</option>");
                        (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
                    });
                    break;

                case "N":
                    //recorremos para llenar el combo de
                    jQuery(vp_objCatalog).each(function (ItemObj) {
                        objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Nombre, vp_objCatalog[ItemObj].Nombre);
                    }).promise().done(function () {
                        jQuery("#" + vp_NameList).prepend("<option value='-1'>Seleccione...</option>");
                        (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
                    });
                    break;

                case "M":
                    //recorremos para llenar el combo de
                    jQuery(vp_objCatalog).each(function (ItemObj) {
                        objList[0].options[ItemObj] = new Option(vp_objCatalog[ItemObj].Nombre, vp_objCatalog[ItemObj].Id);
                    }).promise().done(function () {
                        (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
                    });
                    break;

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
    jQuery('.standardSelect').trigger('chosen:updated');
    jQuery('.mediumSelect').trigger('chosen:updated');
    jQuery('.minSelect').trigger('chosen:updated');
}

//carga de control para numeros
function Carga_CatalogListNumeric(vp_Numeric, vp_NameList, vp_IndexEdit) {

    jQuery("#" + vp_NameList).empty();

    var objList = jQuery('[id$=' + vp_NameList + ']');
    var vl_Num = 1;
    switch (vp_NameList) {

        case "DListNivel":

            for (var ItemObj = 0; ItemObj < vp_Numeric; ItemObj++) {
                objList[0].options[ItemObj] = new Option(vl_Num, vl_Num);
                vl_Num++;
            }

            jQuery("#" + vp_NameList).prepend("<option value='-1'>Seleccione...</option>");
            (vp_IndexEdit == "") ? jQuery("#" + vp_NameList + " option[value= '-1'] ").attr("selected", true) : jQuery("#" + vp_NameList + " option[value= '" + vp_IndexEdit + "'] ").attr("selected", true);
            break;
    }

    jQuery("#" + vp_NameList).trigger("liszt:updated");
    jQuery('.standardSelect').trigger('chosen:updated');
    jQuery('.mediumSelect').trigger('chosen:updated');
    jQuery('.minSelect').trigger('chosen:updated');
}

//validar numeros
function ValidarNumeros(vp_Control, vp_Help, vp_Nombre, vp_Leng, vp_Type) {

    jQuery("#" + vp_Control).change(function () {
        let vl_Campo = jQuery(this).val();
        let vl_valida = validaCero(vl_Campo);
        let vl_flag = 0;

        if (vl_valida == 0) {
            jQuery("#" + vp_Help).html("Campo " + vp_Nombre + " no puede empezar con 0");
            jQuery("#" + vp_Help).css("display", "block");
            vl_flag = 1;

            vg_Validador = 1;
        }
        else {
            jQuery("#" + vp_Help).html("");
            jQuery("#" + vp_Help).css("display", "none");
        }

        if (vp_Type == "T") {
            if (vl_flag == 0) {
                let vl_TamanoTel = vl_Campo.length;

                if (vl_TamanoTel <= 6 ||
                    vl_TamanoTel == 8 ||
                    vl_TamanoTel == 9) {

                    jQuery("#" + vp_Help).html("Campo " + vp_Nombre + " debe ser de " + vp_Leng + " caracteres");
                    jQuery("#" + vp_Help).css("display", "block");

                    vg_Validador = 1;
                }
                else {
                    if (vl_TamanoTel == 10) {
                        var vl_valida_Prefijo = vl_Campo.substring(0, 1);
                        //alert(vl_valida_Prefijo);

                        if (parseInt(vl_valida_Prefijo) !== 3) {
                            jQuery("#" + vp_Help).html("Campo " + vp_Nombre + " debe empezar por el número 3");
                            jQuery("#" + vp_Help).css("display", "block");
                        }
                        else {
                            jQuery("#" + vp_Help).html("");
                            jQuery("#" + vp_Help).css("display", "none");
                        }
                    }

                    jQuery("#" + vp_Help).html("");
                    jQuery("#" + vp_Help).css("display", "none");
                }
            }
        }
        else {
            if (vl_flag == 0) {
                if (vl_Campo.length <= 4) {
                    jQuery("#" + vp_Help).html("El número de documento debe de ser mayor a 4 a 10 caracteres");
                    jQuery("#" + vp_Help).css("display", "block");

                    vg_Validador = 1;
                }
                else {
                    jQuery("#" + vp_Help).html("");
                    jQuery("#" + vp_Help).css("display", "none");
                }
            }
        }
    });
}

//tratamiento de datos decimales
function FormatDecimals(vp_num) {
    var characters = ',';
    var vl_formatNum = vp_num.falsoReplace(characters, ".");
    return vl_formatNum;
}

//VALIDA QUE LA CADENA NO EMPIECE CON 0
function validaCero(vp_num) {
    let vl_NumeroInicial = vp_num.substr(0, 1);
    let vl_resultado = (vl_NumeroInicial == 0) ? 0 : 1;
    return vl_resultado;
}

//aclarar el color para procesos
function LightenDarkenColor(col, amt) {
    var num = parseInt(col, 16);
    var r = (num >> 16) + amt;
    var b = ((num >> 8) & 0x00FF) + amt;
    var g = (num & 0x0000FF) + amt;
    var newColor = g | (b << 8) | (r << 16);
    return newColor.toString(16);
}

//formato de miles en tiempo real
function dinner_format(input) {
    var valida = 0;
    var num = input.value.replace(/\./g, "");
    if (!isNaN(num)) {
        num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g, "$1.");
        num = num.split("").reverse().join("").replace(/^[\.]/, "");
        input.value = num;
    }
    else {
        valida = 1;
        input.value = input.value.replace(/[^\d\.]*/g, "");
    }
    return valida;
}

//funcion de formateo para la insercion en la Base de Datos
function NumericBD(Index) {
    var Output = 0;
    if (Index != "") { Output = Index.replace(/\./g, ""); }
    return Output;
}

//validar tamaño a campo number
function ValidaLength(vp_Control, vp_Length) {
    jQuery('.Len').keyup(function () {
        var len = jQuery("#" + vp_Control).val();
        if (len.length > vp_Length) {
            this.value = (this.value + '').replace(/[^a-zA-Z]/g, '');
        }
    });
}

//asigna stilos de proceso
function FormatStyle() {

    for (ItemObjEm in Obj_Campana) {
        if (Obj_Campana[ItemObjEm].Id == vg_CuentaId) {
            jQuery("#Title_Form").html(Obj_Campana[ItemObjEm].Nombre);
            break;
        }
    }

    for (ItemObj in Obj_Style) {
        // alert(vg_CuentaId);

        if (Obj_Style[ItemObj].CuentaId == vg_CuentaId) {
            jQuery("aside.left-panel").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".navbar").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".navbar").css("color", Obj_Style[ItemObj].ColorLabel);

            jQuery(".sub-menu").css("background", Obj_Style[ItemObj].ColorBack);

            jQuery(".card-header").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".card-header").css("color", Obj_Style[ItemObj].ColorHeaderTitle);
            jQuery(".control-label").css("color", Obj_Style[ItemObj].ColorLabel);
            jQuery("#Title_Form").css("color", Obj_Style[ItemObj].ColorBack);
            jQuery(".menutoggle_right").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".iconNot").css("color", Obj_Style[ItemObj].ColorBack);
            jQuery("#TGraphics").css("color", Obj_Style[ItemObj].ColorHeaderTitle);

            jQuery(".input-group-addon").css("background", Obj_Style[ItemObj].ColorBack);

            jQuery(".BlockAcoodeon").css("color", Obj_Style[ItemObj].ColorHeaderTitle);
            jQuery(".BlockAcoodeon").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".ziehharmonika h3").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".ziehharmonika h3").css("color", Obj_Style[ItemObj].ColorHeaderTitle);
            jQuery(".ziehharmonika h3.active").css("background", "#737373");
            jQuery(".ziehharmonika h3.active").css("color", "#FFF");

            jQuery(".CssNotificacion").css("border", "2px solid  " + Obj_Style[ItemObj].ColorBack);
            jQuery(".CssCampana").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".CssMsn").css("color", Obj_Style[ItemObj].ColorBack);
            jQuery(".MsnTitle").css("color", Obj_Style[ItemObj].ColorBack);

            jQuery(".Help").css("color", Obj_Style[ItemObj].ColorAlerta);
            vg_Color = Obj_Style[ItemObj].ColorLabel;

            jQuery("#Logo_1").attr("src", "../../Repositorio/ImgClientes/" + Obj_Style[ItemObj].Logo);
            jQuery("#Logo_2").attr("src", "../../Repositorio/ImgClientes/" + Obj_Style[ItemObj].Logo);

            var ArrColor = Obj_Style[ItemObj].ColorBack.split("#");
            var ColorAclarado = LightenDarkenColor(ArrColor[1], 15);

            var CantCaracteres = ColorAclarado.length;
            ColorAclarado = (CantCaracteres == 5) ? "#0" + ColorAclarado : "#" + ColorAclarado;

            console.log(ColorAclarado);
            jQuery(".btn-flotante").css("background-color", ColorAclarado);
            jQuery(" .btn-flotante:hover").css("background-color", "#737373");
            jQuery(".DownButton").css("background", Obj_Style[ItemObj].ColorBack);
            jQuery(".DownUp").css("background", Obj_Style[ItemObj].ColorBack);

            break;
        }
    }
}

//funcion para la captura de variables de la url
function Capture_GET() {
    // capturamos la url
    var loc = document.location.href;
    // si existe el interrogante
    if (loc.indexOf('?') > 0) {
        // cogemos la parte de la url que hay despues del interrogante
        var getString = loc.split('?')[1];
        // obtenemos un array con cada clave=valor
        var GET = getString.split('&');
        var get = {};

        // recorremos todo el array de valores
        for (var i = 0, l = GET.length; i < l; i++) {
            var tmp = GET[i].split('=');
            get[tmp[0]] = unescape(decodeURI(tmp[1]));
        }
        return get;
    }
}

//formatea la fecha desde el server
function FormatFechaWM(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

//limpia la fecha desde el servidor
function parseJsonDate(jsonDate) {
    var offset = new Date().getTimezoneOffset() * 60000;
    var parts = /\/Date\((-?\d+)([+-]\d{2})?(\d{2})?.*/.exec(jsonDate);

    if (parts[2] == undefined)
        parts[2] = 0;

    if (parts[3] == undefined)
        parts[3] = 0;

    return new Date(+parts[1] + offset + parts[2] * 3600000 + parts[3] * 60000);
}

//ATERRIZAMOS LAS DATOS DE LAS VARIABLES
function CapturaVariables(vp_Parametros) {
    var vl_Cont = 0;

    if (vp_Parametros) {
        // hacemos un bucle para pasar por cada indice del array de valores de la URL
        for (var index in vp_Parametros) {

            if (index === "P") {
                vg_CuentaId = vp_Parametros[index];
            }
            vl_Cont++;

        }
        //comprueba que si se envien los 9 parametros por URL
        if (vl_Cont === 1) {

            vg_Parameter = 1;
            console.log(vg_Parameter);
            FormatStyle();

            var vl_pathname = window.location.pathname;
            var Objpath = vl_pathname.split("/");
            var vl_length = Objpath.length;
            var vl_page = Objpath[vl_length - 1];

            if (vl_page == "Dash.aspx") {
                Btn_Asignacion(1);
            }
        }
        else {
            console.log('%c Parametros imcompletos desde J', 'color: #f5970b; font-size: 19px; padding:3px 5px;');
        }
    }
    else {
        //
    }
}

//formateo de palabras para nombre de archivos
function ConstruyeNombre(vp_Nombre) {
    var vl_StrName = "";

    if (vp_Nombre != "") {
        var characters = /^\s+|\s+|\s+$/g;
        vl_StrName = vp_Nombre.falsoReplace(characters, "");
    }

    return vl_StrName;
}

String.prototype.falsoReplace = function (str, newstr) {
    var StrFinal = "";
    if (newstr == "comillas") {
        StrFinal = this.split(str).join('\\"');
    }
    else {
        StrFinal = this.split(str).join(newstr);
    }
    return StrFinal;
};

//carga de documentos global
function UpLoad_Document(NameFile_ID, Modulo) {
    jQuery("#Carga").css("display", "block");
    //validamos si seleccionaron un archivo
    if (jQuery("#" + NameFile_ID).val() !== "") {
        //capturamos los datos del input file
        var file = jQuery("#" + NameFile_ID);
        var dataFile = jQuery("#" + NameFile_ID)[0].files[0];
        var size_Byte = jQuery("#" + NameFile_ID)[0].files[0].size;
        var size_kiloByte = parseInt(size_Byte / 1024);
        var size_MagaByte = parseInt(size_kiloByte / 1000);
        var name = jQuery("#" + NameFile_ID).val();
        var splitFile = name.split(".");
        if (splitFile[1] == "xlsx") {
            if (size_MagaByte <= 5) {

                var vl_NameFinal = "ExcelUpdate" + Modulo + ".xlsx";

                //inicializamos el fordata para transferencia de archivos
                var data = new FormData();
                //asinamos el datafile a la variable archivo 
                data.append('archivo', dataFile);
                data.append('RutaTemporal', vg_RutaTemporal);
                data.append('NameTemporal', vl_NameFinal);
                data.append('CampanaId', vg_CuentaId);
                data.append('IdUser', Obj_Data[0].IdUser);
                data.append('Modulo', Modulo);

                //transacion ajax
                jQuery.ajax({
                    url: "/Controller/GeneralTransaccion.aspx",
                    type: "POST",
                    contentType: false,
                    data: data,
                    processData: false,
                    success: function (result) {
                        jQuery("#Carga").css("display", "none");
                        result = JSON.parse(result);

                        if (result == "") {

                            Obj_Chargue = [];
                        }
                        else {
                            Obj_Chargue = result[0];
                            Obj_ErrorChargue = result[1];

                            if (isNaN(Obj_Chargue[0].Id)) {
                            }
                            else {

                                switch (Obj_Chargue[0].Respuesta) {
                                    case "OK":
                                        vg_cargue_ID = Obj_Chargue[0].Id;
                                        CreateGrid_Result();
                                        CreateGrid_DetailResult();
                                        Message("Success", "¡la carga de registros fue exitosa!", 5000);
                                        break;
                                    case "OK_Form":
                                        vg_cargue_ID = Obj_Chargue[0].Id;
                                        CreateGrid_Result();
                                        Message("Success", "¡la carga de registros fue exitosa!", 5000);
                                        break;
                                    case "Dias":
                                        Message("Error", "¡El formato del dia no esta en el estandar de la plantilla debe ser (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo)!", 10000);
                                        break;

                                    default:
                                        Message("Error", "¡No cargo el archivo!", 5000);
                                        break;
                                }
                            }
                        }

                    },
                    error: function (error) {
                        jQuery("#Carga").css("display", "none");
                        Message("Error", "Ocurrió un error inesperado, por favor intente de nuevo mas tarde:" + error);
                    }
                });
            }
            else {
                jQuery("#Carga").css("display", "none");
                Message("Error", "el tamaño maximo del archivo es de 5 Mb");
            }
        }
        else {
            jQuery("#Carga").css("display", "none");
            Message("Error", "solo se pueden cargar archivos de Excel (.xlsx)");
        }
    }
    else {
        jQuery("#Carga").css("display", "none");
        Message("Error", "Debe selecionar un Excel para subir");
    }

}

//carga de documentos global
function UpLoad_Files(NameFile_ID, Modulo, NombreControl) {
    var Obj_File = [];

    var vl_NombreArchivo = ConstruyeNombre(jQuery("#" + NombreControl).val());

    if (vl_NombreArchivo != "") {
        // jQuery("#Carga").css("display", "block");

        //validamos si seleccionaron un archivo
        if (jQuery("#" + NameFile_ID).val() !== "") {
            //capturamos los datos del input file
            var file = jQuery("#" + NameFile_ID);
            var dataFile = jQuery("#" + NameFile_ID)[0].files[0];
            var size_Byte = jQuery("#" + NameFile_ID)[0].files[0].size;
            var size_kiloByte = parseInt(size_Byte / 1024);
            var size_MagaByte = parseInt(size_kiloByte / 1000);
            var name = jQuery("#" + NameFile_ID).val();
            var splitFile = name.split(".");

            if (splitFile[1].toLowerCase() == "jpg" ||
                splitFile[1].toLowerCase() == "png" ||
                splitFile[1].toLowerCase() == "jpeg") {
                if (size_MagaByte <= 2) {

                    var vl_NameFinal = "Logo_" + vl_NombreArchivo + ".jpg";
                    vg_NombreArchivo = vl_NameFinal.toUpperCase();
                    //inicializamos el fordata para transferencia de archivos
                    var data = new FormData();
                    //asinamos el datafile a la variable archivo 
                    data.append('archivo', dataFile);
                    data.append('RutaTemporal', vg_RutaTemporal);
                    data.append('NameTemporal', vl_NameFinal.toUpperCase());
                    data.append('CampanaId', vg_CuentaId);
                    data.append('Modulo', Modulo);

                    //transacion ajax
                    jQuery.ajax({
                        url: "/Controller/GeneralTransaccion.aspx",
                        type: "POST",
                        contentType: false,
                        data: data,
                        processData: false,
                        success: function (result) {
                            jQuery("#Carga").css("display", "none");
                            result = JSON.parse(result);
                            Obj_File = result[0];
                            console.log(Obj_File);
                            switch (Obj_File[0].Respuesta) {
                                case "OK":
                                    Message("Success", "¡Carga de imagen correcta!", 5000);
                                    jQuery("#IF_Visor").attr("width", "100%");
                                    jQuery("#IF_Visor").attr("height", "100%");
                                    jQuery("#IF_Visor").attr("src", vg_RutaTemporal + vl_NameFinal);
                                    break;

                                default:
                                    Message("Error", "¡No cargo el archivo!", 5000);
                                    break;
                            }



                        },
                        error: function (error) {
                            Message("Error", "Ocurrió un error inesperado, por favor intente de nuevo mas tarde:" + error);
                        }
                    });
                }
                else {
                    Message("Error", "el tamaño maximo del archivo es de 2 Mb");
                }
            }
            else {
                Message("Error", "solo se pueden cargar archivos (.jpg .jpeg .png)");
            }
        }
        else {
            Message("Error", "Debe selecionar una imagen para subir");
        }
    }
    else {
        Message("Error", "El campo " + NombreControl + " es obligatorio para crear el archivo");
    }
}

//pinta las notificaciones asignadas
function PaintCardNotificaciones() {

    var vl_Html = "";
    var vl_Modulo = "";
    var vl_color = "";
    var vl_colorAlert = "";
    var vl_Icon = "";


    for (item in Obj_Notificaciones) {

        switch (Obj_Notificaciones[item].ModuloId) {
            case 130:
                vl_Modulo = "Monitoreo";
                break;
        }

        if (Obj_Notificaciones[item].Flag_Visto == 0) {
            vl_color = "#17a2b8";
            vl_colorAlert = "info";
            vl_Icon = "tablet";
        }
        else {
            vl_color = "#28a745";
            vl_colorAlert = "success";
            vl_Icon = "check-box";
        }

        vl_Html += "<div class='card CardNotificacion' style='cursor: pointer; border:1px dotted " + vl_color + ";' onclick=\"Update_View('" + item + "')\">" +
            "	<div class='card-body'>" +
            "		<div class='stat-widget-one'>" +
            "			<div class='stat-icon dib'><i class='ti-" + vl_Icon + " text-" + vl_colorAlert + " border-" + vl_colorAlert + "'></i></div>" +
            "			<div class='stat-content dib'>" +
            "				<div class='stat-text'>" + vl_Modulo + "</div>" +
            "				<div class='stat-digit'>" + Obj_Notificaciones[item].Descripcion + "</div>" +
            "			</div>" +
            "		</div>" +
            "	</div>" +
            "</div>";
    }

    jQuery("#Container_Notifications").html("");
    jQuery("#Container_Notifications").html(vl_Html);

}

//dispara el evento de actualizar la notificacion a leido
function Update_View(vp_Index) {
    var vl_id = Obj_Notificaciones[vp_Index].Id;

    UpdateNotificacion(vl_id);
}

(function (jQuery) {

    var allPanels = jQuery('.accordion > dd').hide();

    jQuery('.accordion > dt > a').click(function () {
        allPanels.slideUp();
        jQuery(this).parent().next().slideDown();
        return false;
    });

})(jQuery);
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #TRANSACCIONES DE SESSION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//Valida si existe la sesion
function Valida_Session_Transaction() {
    jQuery("#Carga").css("display", "block");

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/Valida_Session",
        type: "POST",
        dataType: "json",

        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {

            if (result.d.data[0].EstadoSesion == "ON") {
                Obj_Data = result.d.data;
                Obj_Campana = result.d.campana;
                Obj_Style = result.d.style;
                Obj_Modules = result.d.modulos;
                Obj_Notificaciones = result.d.notificaciones;

                vg_CuentaId = result.d.selectCampana[0].Select_Cuenta;
                vg_RolID = result.d.selectCampana[0].Select_RolId;
                vg_PerfilRol = result.d.selectCampana[0].Select_Perfil;

                jQuery("#LblNombreUser").html("Usuario: " + result.d.data[0].NombreUser);
                if (Obj_Data.length == 1) {
                    jQuery("#LblPerfilUser").html("Perfil: " + Obj_Data[0].PerfilUser);
                }
                else {
                    jQuery("#LblPerfilUser").html("Perfil: " + vg_PerfilRol);
                }

            } else {
                window.location = "/Login.aspx";
            }
        },
        error: function () {
        },
    }).done(function () {
        OpcionRol(Obj_Data[0].IdRol);
        var pathname = window.location.pathname;
        var strUrl = pathname.split("/");

        if (Obj_Campana.length == 1) {

            vg_CuentaId = Obj_Data[0].IdCuenta;

            jQuery("#SeleccionCampana").modal("hide");

            if (strUrl[3] == "Dash.aspx") {
                CreateDahs(0);
                AsignacionEnterprise_Transaction(Obj_Data[0].IdCuenta);
            }

            jQuery("#Title_Form").html(Obj_Campana[0].Nombre);
            jQuery(".HideBEmp").css("display", "none");
            FormatStyle();

        }
        else {
            if (strUrl[3] == "Dash.aspx") {

                if (vg_CuentaId == 0) {
                    Carga_CatalogList(Obj_Campana, "DListSelectCampana", "");
                    jQuery("#SeleccionCampana").modal("show");
                }
                FormatStyle();
                CreateDahs(0);

                jQuery(".HideBEmp").css('display', 'block');
            }
            else {
                FormatStyle();
            }

        }

        if (Obj_Notificaciones.length != 0) {
            var LentNotificacion = Obj_Notificaciones.length;
            jQuery("#Count_notificacion").html(LentNotificacion);
            jQuery("#Count_notificacion").css("display", "block");

            var vl_mensaje = (LentNotificacion == 1) ? "¡Tiene " + LentNotificacion + " notificación nueva!" : "¡Tienes " + LentNotificacion + " notificaciones nuevas!";

            jQuery("#MsnText").html(vl_mensaje);
            jQuery("#MsnTitle").html(Obj_Notificaciones[0].Modulo);
            PaintCardNotificaciones();
            jQuery("#MsnNotificacion").show('slow');

            setTimeout(function () { jQuery("#MsnNotificacion").fadeOut('fast'); }, 10000);
        }
        jQuery("#Carga").css("display", "none");
    });
}

//Cierra la sesion
function Log_Out_Transaction() {

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/Dead_Session",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{}",
        //Transaccion Ajax en proceso
        success: function (result) {
            window.location = (result.d.sesion[0].EstadoSesion == "EXIT") ? "/Login.aspx" : "/Login.aspx";
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
    });
}

//trae los drop lis solicitados
function Cargue_Droplist(vp_Control, vp_Index, vp_Edit, vp_Filtro, vp_Campo) {
    var Obj_DropList = [];

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/Create_DropList",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Id:'" + vp_Index + "',Type:'" + vp_Filtro + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_DropList = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        switch (vp_Control) {
            default:
                Carga_CatalogList(Obj_DropList, vp_Control, vp_Edit, vp_Campo);
                break;
        }
    });
}

//trae los drop lis solicitados
function Cargue_Droplist_FiltrerCuenta(vp_Control, vp_Index, vp_Edit, vp_Filtro, vp_Campo) {
    var Obj_DropList = [];

    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/Create_DropList_Filtrer",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Id:'" + vp_Index + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            Obj_DropList = result.d.data;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        switch (vp_Control) {
            default:
                Carga_CatalogList(Obj_DropList, vp_Control, vp_Edit, vp_Campo);
                break;
        }
    });
}

//actualiza la notificacion seleccionada
function UpdateNotificacion(vp_id) {
    var vl_flag = "";
    jQuery.ajax({
        url: "/Controller/GeneralTransaccion.aspx/Update_Notificacion",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        //crear json
        data: "{Id: '" + vp_id + "'}",
        //Transaccion Ajax en proceso
        success: function (result) {
            vl_flag = result.d.data[0].Respuesta;
        },
        error: function () {
            Message("Error", "¡Disculpenos!, Se generó un error al realizar la transacción y no se completó el proceso.");
        },
    }).done(function () {
        if (vl_flag == "200") {
            if (Obj_Notificaciones.length == 1) {
                jQuery("#Container_Notifications").html("");
                jQuery('#ModalNotificaciones').modal('hide');
                jQuery("#Count_notificacion").html(0);
                jQuery("#Count_notificacion").css("display", "none");
                Valida_Session_Transaction();
            }
            else {
                Valida_Session_Transaction();
            }
        }
    });
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #END REGION
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
