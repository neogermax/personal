<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="Productividad.aspx.cs" Inherits="QaVision.View.FinalReports.Productividad" %>

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
    <link href="<% = ResolveClientUrl("~/Content/Plugins/Acordeon_Z/ziehharmonika.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Plugins/TimeLine_Obs/StyleTime.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="Neog_Message"></div>
    <div id="Blockfechas">
        <div class="row">
            <div class="col-xs-4 col-sm-4">
                <div class="col-xs-12 col-sm-12">
                    <label for="Check_Filtro" class="control-label mb-1">Seleccione el tipo de grafica</label>
                </div>
                <div class="col-xs-12 col-sm-12">
                    <label for="Check_Filtro" class="control-label mb-1">General</label>
                    <label class="switch switch-3d switch-success mr-3" size="lg">
                        <input id="Check_Filtro" type="checkbox" class="switch-input ">
                        <span class="switch-label"></span><span class="switch-handle"></span>
                    </label>
                    <label for="Check_Filtro" class="control-label mb-1">Monitor</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div id="blockMonitor" class="col-xs-4 col-sm-4">
                <div class="form-group">
                    <label id="LblMonitor" for="DList_Monitor" class="control-label mb-1">Monitores</label>
                    <select id="DList_Monitor" data-placeholder="Seleccione monitores." class="standardSelect" tabindex="1">
                    </select>
                    <label id="help_Monitor" class="Help"></label>
                </div>
            </div>
            <div class="col-xs-3 col-sm-3">
                <div class="form-group">
                    <label for="TxtFecha" class="control-label mb-1">Seleccione el rango de fecha</label>
                    <input id="TxtFecha" name="TxtFecha" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel datepicker-here" data-range="true" data-multiple-dates-separator=" <--> " aria-required="true" aria-invalid="false" data-language='es'>
                </div>
            </div>
            <div class="col-xs-3 col-sm-3">
                <div class="form-group">
                    <div class="dlk-radio btn-group" style="margin-top: 22px;">
                        <label class="btn btn-success">
                            <input id="Select1" name="choices[1]" class="form-control" type="radio" value="1" checked>
                            <i class="fa fa-check glyphicon glyphicon-ok"></i>&nbsp;Diario
                        </label>
                        <label class="btn btn-info">
                            <input id="Select2" name="choices[1]" class="form-control" type="radio" value="2">
                            <i class="fa fa-check glyphicon glyphicon-ok"></i>&nbsp;Semanal
                        </label>
                        <label class="btn btn-warning">
                            <input id="Select3" name="choices[1]" class="form-control" type="radio" value="3">
                            <i class="fa fa-check glyphicon glyphicon-ok"></i>&nbsp;Mensual
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-xs-2 col-sm-2">
                <div class="form-group" style="margin-top: 22px;">
                    <button type="button" id="btn_VU" class="btn btn-success btn-block Top" onclick="javascript:Btn_SearchReport();">
                        <i class="fa fa-search"></i>&nbsp;Buscar
                    </button>
                </div>
            </div>
        </div>
        <div class='card'>
            <div class='card-header'>
                <strong id="Title_formulario">Graficas</strong>
            </div>
            <div class='card-body card-block'>
                <canvas id="densityChartBar" width="600" height="250"></canvas>
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
    <script src="<% = ResolveClientUrl("~/Content/Plugins/DataPiker/js/datepicker.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Plugins/DataPiker/js/i18n/datepicker.es.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Plugins/Acordeon_Z/ziehharmonika.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Master.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Proccess.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/chart.js/dist/Chart.js") %>"></script>
    <script src="Productividad.js"></script>
</asp:Content>
