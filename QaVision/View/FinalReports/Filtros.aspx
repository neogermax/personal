<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="Filtros.aspx.cs" Inherits="QaVision.View.FinalReports.Filtros" %>

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
    <div class="col-xs-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <a data-toggle="collapse" href="#collapse-example" aria-expanded="true" aria-controls="collapse-example" id="heading-Block" class="d-block">
                    <i class="fa fa-chevron-down pull-right"></i>
                    <strong id="TGraphics">Filtros para informe</strong>
                </a>
            </div>
            <div id="collapse-example" class="collapse show" aria-labelledby="heading-example">
                <div class="card-body card-block">
                    <div id="BlockFiltro">
                        <div class="row">
                            <div class="col-xs-2 col-sm-2">
                                <div class="form-group">
                                    <label for="DList_Proceso" class="control-label mb-1">Proceso</label>
                                    <select id="DList_Proceso" data-placeholder="Seleccione Agente." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="help_Proceso" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-5 col-sm-5">
                                <div class="form-group">
                                    <label id="LblCoordinador" for="DList_Agente" class="control-label mb-1">Coordinadores</label>
                                    <select id="DList_Coordinador" data-placeholder="Seleccione Coordinador." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="help_Coordinador" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-5 col-sm-5">
                                <div class="form-group">
                                    <label id="LblAgente" for="DList_Agente" class="control-label mb-1">Agentes</label>
                                    <select id="DList_Agente" data-placeholder="Seleccione Agente." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="help_Agente" class="Help"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-sm-7">
                                <div class="form-group">
                                    <label for="DList_Formulario" class="control-label mb-1">Formularios</label>
                                    <select id="DList_Formulario" data-placeholder="Seleccione Formulario." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="help_Formulario" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-5 col-sm-5">
                                <div class="form-group">
                                    <label for="DList_TipoMonitoreo" class="control-label mb-1">Tipo de Monitoreo</label>
                                    <select id="DList_TipoMonitoreo" data-placeholder="Seleccione Agente." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="help_TipoMonitoreo" class="Help"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="DListFiltrer7" class="control-label mb-1">PEC</label>
                                    <select id="DListFiltrer7" data-placeholder="Seleccione Filtro 7." class="standardSelect" tabindex="1">
                                        <option value="-1" selected="selected">Seleccione...</option>
                                        <option value="0">0</option>
                                        <option value="100">100</option>
                                    </select>
                                    <label id="helpFiltrer7" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="DListFiltrer8" class="control-label mb-1">PEC Usuario Final</label>
                                    <select id="DListFiltrer8" data-placeholder="Seleccione Filtro 8." class="standardSelect" tabindex="1">
                                        <option value="-1" selected="selected">Seleccione...</option>
                                        <option value="0">0</option>
                                        <option value="100">100</option>
                                    </select>
                                    <label id="helpFiltrer8" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="DListFiltrer9" class="control-label mb-1">PEC Negocio</label>
                                    <select id="DListFiltrer9" data-placeholder="Seleccione Filtro 9." class="standardSelect" tabindex="1">
                                        <option value="-1" selected="selected">Seleccione...</option>
                                        <option value="0">0</option>
                                        <option value="100">100</option>
                                    </select>
                                    <label id="helpFiltrer9" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="DListFiltrer10" class="control-label mb-1">PEC Cumplimiento</label>
                                    <select id="DListFiltrer10" data-placeholder="Seleccione Filtro 10." class="standardSelect" tabindex="1">
                                        <option value="-1" selected="selected">Seleccione...</option>
                                        <option value="0">0</option>
                                        <option value="100">100</option>
                                    </select>
                                    <label id="helpFiltrer10" class="Help"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="Block_DataAdmin">
                            <div class="col-xs-6 col-sm-6">
                                <div class="form-group">
                                    <label id="LblSMonitor" for="DList_SMonitor" class="control-label mb-1">Supervisores Monitores</label>
                                    <select id="DList_SMonitor" data-placeholder="Seleccione monitores." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="help_SMonitor" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6">
                                <div class="form-group">
                                    <label id="LblMonitor" for="DList_Monitor" class="control-label mb-1">Monitores</label>
                                    <select id="DList_Monitor" data-placeholder="Seleccione monitores." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="help_Monitor" class="Help"></label>
                                </div>
                            </div>
                        </div>
                        <div id="Blockfechas">
                            <div class="row">
                                <div class="col-xs-2 col-sm-2">
                                </div>
                                <div class="col-xs-3 col-sm-3">
                                    <div class="form-group">
                                        <label for="TxtFecha" class="control-label mb-1">Fecha inicial</label>
                                        <input id="TxtFecha" name="TxtFecha" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                                    </div>
                                </div>
                                <div class="col-xs-2 col-sm-2">
                                </div>
                                <div class="col-xs-3 col-sm-3">
                                    <div class="form-group">
                                        <label for="TxtFechaF" class="control-label mb-1">Fecha final</label>
                                        <input id="TxtFechaF" name="TxtFechaF" type="text" readonly="readonly" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                                    </div>
                                </div>
                                <div class="col-xs-2 col-sm-2">
                                </div>
                            </div>
                        </div>
                        <div id="BlockButton">
                            <div class="row">
                                <div class="col-xs-4 col-sm-4">
                                </div>
                                <div class="col-xs-4 col-sm-4">
                                    <div class="form-group">
                                        <button type="button" id="btn_VU" class="btn btn-primary btn-block Top" onclick="javascript:Btn_SearchReport();">
                                            <i class="fa fa-search"></i>&nbsp;Buscar
                                        </button>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="card">
            <div class="card-header">
                <strong id="TFormResult">Resultado de Informes</strong>
            </div>
            <div class="card-body card-block">
                <div id="BlockGeneral" style="display: none;">
                    <div class="row">
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="vi_CantMonitoreos" class="control-label mb-1">Cant. de Monitoreos</label>
                                <input id="vi_CantMonitoreos" name="vi_CantMonitoreos" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="vi_PORCENTAJE_PEC" class="control-label mb-1">Porcentaje PEC</label>
                                <input id="vi_PORCENTAJE_PEC" name="vi_PORCENTAJE_PEC" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="vi_PORCENTAJE_PECC" class="control-label mb-1">Porcentaje PECC</label>
                                <input id="vi_PORCENTAJE_PECC" name="vi_PORCENTAJE_PECC" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="vi_PORCENTAJE_PECN" class="control-label mb-1">Porcentaje PECN</label>
                                <input id="vi_PORCENTAJE_PECN" name="vi_PORCENTAJE_PECN" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="vi_PORCENTAJE_PECUF" class="control-label mb-1">Porcentaje PECUF</label>
                                <input id="vi_PORCENTAJE_PECUF" name="vi_PORCENTAJE_PECUF" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="vi_NotaFinalProm" class="control-label mb-1">Prom. Nota Final</label>
                                <input id="vi_NotaFinalProm" name="vi_NotaFinalProm" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                    </div>
                    <div id="BlockMSN" class="row" style="display: none;">
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="vi_CantFormulario" class="control-label mb-1">Cant. Formularios</label>
                                <input id="vi_CantFormulario" name="vi_CantFormulario" readonly="readonly" type="text" maxlength="250" class="form-control CampoNumLabel" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-10 col-sm-10">
                            <div id="MsnPerson"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="DList_Formulario2" class="control-label mb-1">Formularios</label>
                                <select id="DList_Formulario2" data-placeholder="Seleccione Formulario." class="standardSelect" tabindex="1">
                                </select>
                                <label id="help_Formulario2" class="Help"></label>
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                    </div>
                    <div class="row">
                    </div>
                    <div class="custom-tab">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active show" id="custom-nav-home-tab" data-toggle="tab" href="#custom-nav-home" role="tab" aria-controls="custom-nav-home" aria-selected="true">Graficas</a>
                                <a class="nav-item nav-link" id="custom-nav-profile-tab" data-toggle="tab" href="#custom-nav-profile" role="tab" aria-controls="custom-nav-profile" aria-selected="false">Data</a>
                            </div>
                        </nav>
                        <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                            <div class="tab-pane fade active show" id="custom-nav-home" role="tabpanel" aria-labelledby="custom-nav-home-tab">
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Graphics" class="control-label mb-1">Barras</label>
                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                        <input id="Check_Graphics" type="checkbox" class="switch-input ">
                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                    </label>
                                    <label for="Check_Graphics" class="control-label mb-1">Pie</label>
                                </div>
                                <canvas id="densityChartBar" width="600" height="250"></canvas>
                                <canvas id="densityChartPie" width="600" height="250" style="display: none;"></canvas>
                            </div>
                            <div class="tab-pane fade" id="custom-nav-profile" role="tabpanel" aria-labelledby="custom-nav-profile-tab">
                                <div id="Grid_Work"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="BlockFiltros" style="display: none;">
                </div>
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
    <script src="../../Content/Plugins/DataPiker/js/i18n/datepicker.es.js"></script>
    <script src="<% = ResolveClientUrl("~/Content/Plugins/Acordeon_Z/ziehharmonika.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Master.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Proccess.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/chart.js/dist/Chart.js") %>"></script>
    <script src="Filtros.js"></script>
</asp:Content>
