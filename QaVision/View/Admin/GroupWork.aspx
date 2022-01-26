<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="GroupWork.aspx.cs" Inherits="QaVision.View.Admin.GroupWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/css/StyleForm.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Plugins/NeoG_Message/css/NeoG_Message.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Plugins/DataPiker/css/datepicker.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/datatables.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/dataTables.semanticui.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/semantic.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="Neog_Message"></div>
    <div class="card">
        <div class="card-header">
            <a data-toggle="collapse" href="#collapse-example" aria-expanded="true" aria-controls="collapse-example" id="heading-Block" class="d-block">
                <i class="fa fa-chevron-down pull-right"></i>
                <strong id="TGraphics">Coordinadores monitores y cliente</strong>
            </a>
        </div>
        <div id="collapse-example" class="collapse show" aria-labelledby="heading-example">
            <div class="card-body card-block">
                <div id="Grid_Personal"></div>
            </div>
        </div>
    </div>
    <div class='card'>
        <div class='card-header'>
            <strong id="Title_formulario">Agentes</strong>
        </div>
        <div class="radius-icon">
            <a href="javascript:ModoAgentes(1);" class="btn btn-xs btn-info">
                <i class="fa fa-check" aria-hidden="true"></i>Ver 
            </a>
            <a href="javascript:ModoAgentes(2);" class="btn btn-xs btn-success">
                <i class="fa fa-check" aria-hidden="true"></i>Asignar 
            </a>
            <a href="javascript:ModoAgentes(3);" class="btn btn-xs btn-purple">
                <i class="fa fa-check" aria-hidden="true"></i>Reasignar 
            </a>
        </div>
        <div id="BlockAsignar" style="display: none;">
            <div class="row">
                <div class="col-xs-3 col-sm-3">
                </div>
                <div class="col-xs-6 col-sm-6">
                    <label id="LblCoordinador" for="DList_Coordinador" class="control-label mb-1">Coordinador</label>
                    <select id="DList_Coordinador" data-placeholder="Seleccione Coordinador." class="standardSelect" tabindex="1">
                    </select>
                    <label id="help_Coordinador" class="Help"></label>
                </div>
                <di class="col-xs-3 col-sm-3">
                </di>
            </div>
        </div>
        <div id="BlockReAsignar" style="display: none;">
            <div class="col-xs-6 col-sm-6">
                <label id="LblCoordinadorA" for="DList_Coordinador" class="control-label mb-1">Coordinador Incial</label>
                <select id="DList_CoordinadorA" data-placeholder="Seleccione Coordinador." class="standardSelect" tabindex="1">
                </select>
                <label id="help_CoordinadorA" class="Help"></label>
            </div>
            <div class="col-xs-6 col-sm-6">
                <label id="LblCoordinadorR" for="DList_Coordinador" class="control-label mb-1">Coordinador Final</label>
                <select id="DList_CoordinadorR" data-placeholder="Seleccione Coordinador." class="standardSelect" tabindex="1">
                </select>
                <label id="help_CoordinadorR" class="Help"></label>
            </div>
        </div>
        <div id="Grid_Agentes"></div>
        <div id="BlockButtonAsig" style="display:none;">
            <div class="col-xs-4 col-sm-4">
            </div>
            <div class="col-xs-4 col-sm-4">
                <button type="button" id="btn_AddConfiguracion" class="btn btn-success btn-block Top" style="margin-top: 15px; margin-bottom: 15px;" onclick="javascript:Btn_AgregarAsignacion()">
                    <i class="fa fa-plus-circle"></i>&nbsp;Asignar
                </button>
            </div>
            <div class="col-xs-4 col-sm-4">
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/chosen/chosen.jquery.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net/js/jquery.dataTables.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons/js/dataTables.buttons.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/jszip/dist/jszip.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/pdfmake/build/pdfmake.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/pdfmake/build/vfs_fonts.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons/js/buttons.html5.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons/js/buttons.print.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons/js/buttons.colVis.min.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/assets/js/init-scripts/data-table/datatables-init.js") %>"></script>

    <script src="<% = ResolveClientUrl("~/Content/Plugins/NeoG_Message/js/NeoG_Message.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Plugins/FileStyle/bootstrap-filestyle.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Master.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Proccess.js") %>"></script>
    <script src="GroupWork.js"></script>
</asp:Content>
