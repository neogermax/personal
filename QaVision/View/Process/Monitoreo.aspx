<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="Monitoreo.aspx.cs" Inherits="QaVision.View.CrearMonitoreo.Monitoreo" %>

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
    <a href="#" class="btn-flotante" id="ContAvance">0</a>
    <div class="col-xs-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <div class="col-xs-9 col-sm-9">
                    <strong id="TForm">Ver Monitoreos</strong>
                </div>
                <div class="col-xs-3 col-sm-3" id="Block_Calificacion" style="display: none;">
                    <div class="row" style="margin-top: 16px;">
                        <div class="col col-md-6">
                            <strong>Calificación:</strong>
                        </div>
                        <div class="col-12 col-md-6">
                            <strong id="TxtCalificacion" type="text" maxlength="25" class="CampoNumContador">0</strong>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body card-block Enc_Fijo">
                <div id="BlockButton">
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                            <div class="form-group">
                                <button type="button" id="btn_cre" class="btn btn-primary btn-block Top" style="display: none;" onclick="javascript:ModalForm(1)">
                                    <i class="fa fa-plus-square"></i>&nbsp;Crear
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="btn_reg" style="display: none;" class="btn btn-danger btn-block Top" onclick="javascript:ModalForm(2)">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;Regresar
                            </button>
                        </div>
                    </div>
                </div>
                <div id="BlockView">
                    <div class="card">
                        <div class="card-header">
                            <a data-toggle="collapse" href="#collapse-example" aria-expanded="true" aria-controls="collapse-example" id="heading-Block" class="d-block">
                                <i class="fa fa-chevron-down pull-right"></i>
                                <strong id="TGraphics">Graficas de proceso</strong>
                            </a>
                        </div>
                        <div id="collapse-example" class="collapse show" aria-labelledby="heading-example">
                            <div class="card-body card-block">
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Graphics" class="control-label mb-1">Barras</label>
                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                        <input id="Check_Graphics" type="checkbox" class="switch-input ">
                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                    </label>
                                    <label for="Check_Graphics" class="control-label mb-1">Pie</label>
                                </div>
                                <canvas id="densityChartBar" width="600" height="250"></canvas>
                                <canvas id="densityChartPie" width="600" height="250" style="display:none;"></canvas>
                            </div>
                        </div>
                    </div>
                    <div id="Grid_Work"></div>
                </div>
                <div id="BlockForm" style="display: none;">
                    <div id="Block_Create_monitoreo">
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-xs-4 col-sm-4">
                            </div>
                            <div class="col-xs-3 col-sm-3" style="text-align: center">
                            </div>
                            <div class="col-xs-2 col-sm-2">
                                <div class="form-group" style="text-align: center">
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="row" style="margin-top: 16px;">
                                    <div class="col col-md-6">
                                        <label for="TxtNunFormulario" class="control-label mb-1" style='font-size: 14px; font-weight: bold;'>Id Monitoreo</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input id="TxtNunFormulario" name="TxtNunFormulario" type="text" value="0" maxlength="25" class=" CampoNumLabel" aria-required="true" aria-invalid="false" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="BlockListAgente" class="col-xs-6 col-sm-6">
                                <label id="LblAgente" for="DList_Agente" class="control-label mb-1">Agente</label>
                                <select id="DList_Agente" data-placeholder="Seleccione Agente." class="standardSelect" tabindex="1">
                                </select>
                                <label id="help_Agente" class="Help"></label>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div id="BlockPEC" class="row" style="margin-top: 16px;">
                                    <div class="col col-md-6">
                                        <label for="PEC" class="control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="PEC" name="PEC" placeholder="PEC" class=" CampoNumLabel" value="0" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6">
                                <div class="form-group">
                                    <label id="LblCoordinador" for="DList_Coordinador" class="control-label mb-1">Coordinador</label>
                                    <input id="TxtCoordinador" name="TxtCoordinador" type="text" maxlength="50" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div id="BlockPECUF" class="row " style="margin-top: -2px;">
                                    <div class="col col-md-6">
                                        <label for="PECUF" class=" control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC Usuario Final</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="PECUF" name="PECUF" placeholder="PEC Usuario Final" value="0" class="CampoNumLabel" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3 col-sm-3">
                                <label for="DList_TipoMonitoreo" class="control-label mb-1">Tipo de Monitoreo</label>
                                <select id="DList_TipoMonitoreo" data-placeholder="Seleccione Agente." class="standardSelect" tabindex="1">
                                </select>
                                <label id="help_TipoMonitoreo" class="Help"></label>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <label for="DList_Proceso" class="control-label mb-1">Proceso</label>
                                <select id="DList_Proceso" data-placeholder="Seleccione Agente." class="standardSelect" tabindex="1">
                                </select>
                                <label id="help_Proceso" class="Help"></label>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div id="BlockPECN" class="row " style="margin-top: -25px;">
                                    <div class="col col-md-6">
                                        <label for="PECN" class=" control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC Negocio</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="PECN" name="PECN" placeholder="PEC Negocio" value="0" class="CampoNumLabel" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="TxtFecha" class="control-label mb-1">Fecha de Transacción</label>
                                    <input id="TxtFecha" name="TxtFecha" type="text" maxlength="20" class="form-control Letter datepicker-here" aria-required="true" aria-invalid="false" data-language='es' readonly="readonly">
                                    <label id="helpFecha" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="TxtIdTransaccion" class="control-label mb-1">Id Transacción</label>
                                    <input id="TxtIdTransaccion" name="TxtIdTransaccion" type="text" maxlength="10" value="0" class="form-control " aria-required="true" aria-invalid="false" style="text-align: center; color: #0b0d50; font-size: 18px; font-weight: bold;">
                                    <label id="helpIdTransaccion" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div id="BlockPECC" class="row" style="margin-top: -44px;">
                                    <div class="col col-md-6">
                                        <label for="PECC" class=" control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC Cumplimiento</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="PECC" name="PECC" placeholder="PEC Cumplimiento" class="CampoNumLabel" value="0" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4">
                            </div>
                            <div class="col-xs-4 col-sm-4">
                                <label for="DList_Formulario" class="control-label mb-1">Formularios</label>
                                <select id="DList_Formulario" data-placeholder="Seleccione Formulario." class="standardSelect" tabindex="1">
                                </select>
                                <label id="help_Formulario" class="Help"></label>
                            </div>
                            <div class="col-xs-4 col-sm-4">
                            </div>
                        </div>
                    </div>
                    <div id="Block_Seg_monitoreo">
                        <div class="row" style="margin-top: 20px;">
                            <div id="" class="col-xs-6 col-sm-6">
                                <label id="LblMonitor" for="View_Monitor" class="control-label mb-1">monitor</label>
                                <input id="View_Monitor" name="View_Agente" type="text" maxlength="50" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly">
                            </div>
                            <div class="col-xs-3 col-sm-3" style="text-align: center">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="row" style="margin-top: 16px;">
                                    <div class="col col-md-6">
                                        <label for="View_TxtNunFormulario" class="control-label mb-1" style='font-size: 14px; font-weight: bold;'>Id Monitoreo</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input id="View_TxtNunFormulario" name="View_TxtNunFormulario" type="text" value="0" maxlength="25" class=" CampoNumLabel" aria-required="true" aria-invalid="false" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="" class="col-xs-6 col-sm-6">
                                <label id="LblAgente_View" for="View_Agente" class="control-label mb-1">Agente</label>
                                <input id="View_Agente" name="View_Agente" type="text" maxlength="50" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div id="BlockPEC2" class="row" style="margin-top: 16px;">
                                    <div class="col col-md-6">
                                        <label for="View_PEC" class="control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="View_PEC" name="View_PEC" placeholder="PEC" class=" CampoNumLabel" value="0" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6">
                                <div class="form-group">
                                    <label id="LblCoordinador_View" for="View_Coordinador" class="control-label mb-1">Coordinador</label>
                                    <input id="View_Coordinador" name="View_Coordinador" type="text" maxlength="50" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div id="" class="row " style="margin-top: -2px;">
                                    <div class="col col-md-6">
                                        <label for="View_PECUF" class=" control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC Usuario Final</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="View_PECUF" name="View_PECUF" placeholder="PEC Usuario Final" value="0" class="CampoNumLabel" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3 col-sm-3">
                                <label for="View_TipoMonitoreo" class="control-label mb-1">Tipo de Monitoreo</label>
                                <input id="View_TipoMonitoreo" name="View_TipoMonitoreo" type="text" maxlength="50" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <label for="View_Proceso" class="control-label mb-1">Proceso</label>
                                <input id="View_Proceso" name="View_Proceso" type="text" maxlength="50" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div id="" class="row " style="margin-top: -25px;">
                                    <div class="col col-md-6">
                                        <label for="View_PECN" class=" control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC Negocio</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="View_PECN" name="View_PECN" placeholder="PEC Negocio" value="0" class="CampoNumLabel" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="View_Fecha" class="control-label mb-1">Fecha de Transacción</label>
                                    <input id="View_Fecha" name="View_Fecha" type="text" maxlength="20" class="form-control Letter " aria-required="true" aria-invalid="false" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="View_IdTransaccion" class="control-label mb-1">Id Transacción</label>
                                    <input id="View_IdTransaccion" name="View_IdTransaccion" type="text" maxlength="15" class="form-control " aria-required="true" aria-invalid="false" style="text-align: center; color: #0b0d50; font-size: 18px; font-weight: bold;" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="row" style="margin-top: -44px;">
                                    <div class="col col-md-6">
                                        <label for="View_PECC" class=" control-label mb-1" style='font-size: 12px; font-weight: bold;'>PEC Cumplimiento</label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <input type="email" id="View_PECC" name="View_PECC" placeholder="PEC Cumplimiento" class="CampoNumLabel" value="0" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='card'>
                        <div class='card-header'>
                            <strong id="Title_formulario">Formulario</strong>
                        </div>
                        <div class='card-body card-block'>
                            <div id='Container_Form' style='width: 100%'>
                            </div>
                            <div id="Block_Monitor" class="row">
                                <div class="col-xs-9 col-sm-9">
                                    <div class="form-group">
                                        <label for="TxtObservacion" class="control-label mb-1">Observación Monitor</label>
                                        <textarea name="TxtObservacion" id="TxtObservacion" rows="2" placeholder="Registre su cargo" class="form-control"></textarea>
                                        <label id="helpObservacionMonitor" class="Help"></label>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-sm-3">
                                    <button type="button" id="btn_AddSave" class="btn btn-success btn-block Top" style="margin-top: 27px; margin-bottom: 15px;" onclick="javascript:Btn_Save()">
                                        <i class="fa fa-floppy-o"></i>&nbsp;Crear
                                    </button>
                                </div>
                            </div>
                             <div id="Block_SegMonitoreo" class="row">
                                <div id="Block_RegistroMonitoreo">
                                    <div class="col-xs-9 col-sm-9">
                                        <div class="form-group">
                                            <label for="TxtCapturaObservacion" class="control-label mb-1">Registre su Observación </label>
                                            <textarea name="TxtCapturaObservacion" id="TxtCapturaObservacion" rows="5" placeholder="Registre su comentario" class="form-control"></textarea>
                                            <label id="helpCapturaObservacion" class="Help"></label>
                                        </div>
                                    </div>
                                    <div class="col-xs-3 col-sm-3">
                                        <button type="button" id="btn_Sus" class="btn btn-success btn-block Top" style="margin-top: 27px; margin-bottom: 15px;" onclick="javascript:Btn_Avance('S')">
                                            <i class="fa fa-floppy-o"></i>&nbsp;Aceptar
                                        </button>
                                        <button type="button" id="btn_Obj" class="btn btn-danger btn-block Top" style="margin-top: 27px; margin-bottom: 15px;" onclick="javascript:Btn_Avance('O')">
                                            <i class="fa fa-floppy-o"></i>&nbsp;Rechazar
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalConfirmar" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Confirmar monitoreo</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group" style="text-align: center;">
                                <label id="LblMsmAdvertencia" class="control-label mb-1">Usted esta seguro de terminar este monitoreo, recuerde despues de creado no lo puede modificar </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-xs-12 col-sm-12">
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="Btn_Reversa" class="btn btn-danger btn-block" data-dismiss="modal">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;Cancelar 
                            </button>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="Btn_Desact" class="btn btn-success btn-block " onclick="javascript:Crear_Monitoreo_Transaction();">
                                <i class="fa fa-check-square"></i>&nbsp;Crear 
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalEscalar" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Confirmar Escalamiento</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group" style="text-align: center;">
                                <label id="LblMsmEscalar" class="control-label mb-1">xxx </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-2 col-sm-2">
                        </div>
                        <div class="col-xs-8 col-sm-8">
                            <label id="LblResposable" for="DList_Resposable" class="control-label mb-1">¿A quien desea escalar?</label>
                            <select id="DList_Resposable" data-placeholder="Seleccione Responsable." class="standardSelect" tabindex="1">
                            </select>
                            <label id="help_Resposable" class="Help"></label>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-xs-12 col-sm-12">
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="Btn_Reversa_E" class="btn btn-danger btn-block" data-dismiss="modal">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;Cancelar 
                            </button>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="Btn_Desact_E" class="btn btn-success btn-block " onclick="javascript:Btn_Escalar();">
                                <i class="fa fa-arrow-circle-up"></i>&nbsp;Escalar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDeleteMonitoreo" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Eliminar monitoreo</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-2 col-sm-2">
                            <label for="View_Emonitoreo" class="control-label mb-1">N° Monitoreo</label>
                            <input id="View_Emonitoreo" name="View_Emonitoreo" type="text" maxlength="50" class="form-control LabelDisabled" aria-required="true" aria-invalid="false" readonly="readonly">
                        </div>
                        <div class="col-xs-8 col-sm-8">
                            <label for="View_EnombreMonitoreo" class="control-label mb-1">Monitoreo</label>
                            <input id="View_EnombreMonitoreo" name="View_EnombreMonitoreo" type="text" maxlength="50" class="form-control LabelDisabled" aria-required="true" aria-invalid="false" readonly="readonly">
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <label for="View_ENota" class="control-label mb-1">Nota</label>
                            <input id="View_ENota" name="View_ENota" type="text" maxlength="50" class="form-control LabelDisabled" aria-required="true" aria-invalid="false" readonly="readonly">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-2 col-sm-2">
                        </div>
                        <div class="col-xs-8 col-sm-8">
                            <label for="View_Enombremonitor" class="control-label mb-1">Monitor</label>
                            <input id="View_Enombremonitor" name="View_Enombremonitor" type="text" maxlength="50" class="form-control LabelDisabled" aria-required="true" aria-invalid="false" readonly="readonly">
                        </div>
                        <div class="col-xs-2 col-sm-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-2 col-sm-2">
                        </div>
                        <div class="col-xs-8 col-sm-8">
                            <label for="View_EnombreCordinador" class="control-label mb-1">Coordinador</label>
                            <input id="View_EnombreCordinador" name="View_EnombreCordinador" type="text" maxlength="50" class="form-control LabelDisabled" aria-required="true" aria-invalid="false" readonly="readonly">
                        </div>
                        <div class="col-xs-2 col-sm-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-2 col-sm-2">
                        </div>
                        <div class="col-xs-8 col-sm-8">
                            <label for="View_EnombreAgente" class="control-label mb-1">Agente</label>
                            <input id="View_EnombreAgente" name="View_EnombreAgente" type="text" maxlength="50" class="form-control LabelDisabled" aria-required="true" aria-invalid="false" readonly="readonly">
                        </div>
                        <div class="col-xs-2 col-sm-2">
                        </div>
                    </div>
                    <div class="row" style="margin-left: 15%;">
                        <div id="Container_time_View"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-xs-12 col-sm-12">
                        <div class="col-xs-4 col-sm-4">
                        </div>
                        <div class="col-xs-4 col-sm-4">
                            <button type="button" id="Btn_Eliminar" class="btn btn-primary btn-block " onclick="javascript:Btn_EliminarMonitoreo();">
                                <i class="fa fa-times-circle"></i>&nbsp;Eliminar
                            </button>
                        </div>
                        <div class="col-xs-4 col-sm-4">
                        </div>
                    </div>
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
    <script src="../../Content/Template/vendors/chart.js/dist/Chart.js"></script>
    <script src="Monitoreo.js"></script>
</asp:Content>
