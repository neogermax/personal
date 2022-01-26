/*---------------  EVENTO LOAD JS ------------------*/
jQuery(document).ready(function () {
    ConstruyeMensaje();
});

vg_Class = "";

/* se construye el mensaje base*/
function ConstruyeMensaje() {
    var HtmlMensaje = "<div id='Fondo' class='BlackFondo' ></div><div class='ContainerGeneral'>" +
        "	<div id='Container_1' class='ContentBanner ColorInfo row'>" +
        "		<div class='col-xs-8 BannerTitlte'>" +
        "			<img src='' class='Imagen' alt='Exito'>" +
        "			<h4 id='NeoG_Title' class='TitleText'></h4>" +
        "		</div>" +
        "		<div class='col-xs-2 BannerButtons'>" +
        "			<img src='' class='ImagenClose' alt='Exit' onclick='CloseMessage()'>" +
        "		</div>" +
        "	</div>" +
        "	<div id='Container_2' class='ColorInfo ContentInfo row'>" +
        "		<p id='NeoG_Description'></p>" +
        "	</div>" +
        "</div>";
    jQuery(".Neog_Message").html(HtmlMensaje);
    jQuery(".ContainerGeneral").fadeOut('fast');
    jQuery("#Fondo").css("display", "none");
}

//funcion que dispára el mensaje
function Message(vp_Type, vp_Description, vp_Timer, vp_Title, vp_Fondo, vp_Redireccion) {

    jQuery("#NeoG_Description").html(vp_Description);
    var vl_Title = "";

    switch (vp_Type) {
        case "Error":
            vg_Class = "ContentBanner ColorDanger row";
            jQuery("#Container_1").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorDanger row");
            jQuery("#Container_2").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorDanger row");
            vl_Title = (vp_Title == "" || vp_Title === null || vp_Title === undefined) ? "Error" : vp_Title;
            break;

        case "Alert":
            vg_Class = "ContentBanner ColorWarning row";
            jQuery("#Container_1").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorWarning row");
            jQuery("#Container_2").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorWarning row");
            vl_Title = (vp_Title == "" || vp_Title === null || vp_Title === undefined) ? "Advertencia" : vp_Title;
            break;

        case "Success":
            vg_Class = "ContentBanner ColorSuccess row";
            jQuery("#Container_1").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorSuccess row");
            jQuery("#Container_2").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorSuccess row");
            vl_Title = (vp_Title == "" || vp_Title === null || vp_Title === undefined) ? "Exito" : vp_Title;
            break;

        case "Info":
            vg_Class = "ContentBanner ColorInfo row";
            jQuery("#Container_1").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorInfo row");
            jQuery("#Container_2").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorInfo row");
            vl_Title = (vp_Title == "" || vp_Title === null || vp_Title === undefined) ? "Información" : vp_Title;
            break;

        case "Primary":
            vg_Class = "ContentBanner ColorPrimary row";
            jQuery("#Container_1").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorPrimary row");
            jQuery("#Container_2").removeClass("ContentBanner ColorInfo row").addClass("ContentBanner ColorPrimary row");
            vl_Title = (vp_Title == "" || vp_Title === null || vp_Title === undefined) ? "Información" : vp_Title;
            break;
    }

    vl_Timer = (vp_Timer == "" || vp_Timer === null || vp_Timer === undefined) ? 5000 : parseInt(vp_Timer);
    /*habilitar fondo de bloqueo negro*/
    if (vp_Fondo != "" || vp_Fondo !== null || vp_Fondo !== undefined) {
        if (vp_Fondo == "S") {
            jQuery("#Fondo").css("display", "block");
        }
        else {
            jQuery("#Fondo").css("display", "none");
        }
    }

    jQuery("#NeoG_Title").html(vl_Title);
    jQuery(".ContainerGeneral").show('slow');
    jQuery('html,body').animate({
        scrollTop: jQuery("#NeoG_Title").offset().top
    }, 500);
    /*valida si tiene redireccion*/
    if (vp_Redireccion == "" || vp_Redireccion === null || vp_Redireccion === undefined) {
        setTimeout("CloseMessage();", vl_Timer);
    }
    else {
        setTimeout("window.location ='" + vp_Redireccion + "'", vl_Timer);
    }

}

/*cierra el mensaje*/
function CloseMessage() {
    jQuery(".ContainerGeneral").fadeOut('fast');

    jQuery("#Container_1").removeClass(vg_Class).addClass("ContentBanner ColorInfo row");
    jQuery("#Container_2").removeClass(vg_Class).addClass("ContentBanner ColorInfo row");
}