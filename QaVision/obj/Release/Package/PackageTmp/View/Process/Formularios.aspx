<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="Formularios.aspx.cs" Inherits="QaVision.View.Process.Formularios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/css/StyleForm.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Plugins/NeoG_Message/css/NeoG_Message.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/datatables.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/dataTables.semanticui.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/semantic.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="Neog_Message"></div>
    <div class="col-xs-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <strong id="TForm">Ver Formularios</strong>
            </div>
            <div class="card-body card-block">
                <div id="BlockButton">
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                            <div class="form-group">
                                <button type="button" id="btn_cre" class="btn btn-primary btn-block Top" onclick="javascript:ModalForm(1)">
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
                    <div id="Grid_Work"></div>
                </div>
                <div id="BlockForm" style="display: none;">
                    <div id="BlockButton_proccess" style="margin-top: 15px;">
                        <div class="row">
                            <div class="col-xs-3 col-sm-3">
                                <button type="button" id="btn_CreManmual" class="btn btn-info btn-block Top" onclick="javascript:ModalFormCreate(1)">
                                    <i class="fa fa-plus-square"></i>&nbsp;Crear Manualmente
                                </button>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <button type="button" id="btn_CreMasiva" class="btn btn-info btn-block Top" onclick="javascript:ModalFormCreate(2)">
                                    <i class="fa fa-plus-square"></i>&nbsp;Carga Masiva
                                </button>
                            </div>
                        </div>
                    </div>
                    <div id="Block_C_Manual" style="margin-top: 15px;">
                        <div class="row">
                            <div class="col-xs-2 col-sm-2">
                                <div class="form-group" style="text-align: center">
                                    <label for="Txt_ValorMaximoEvaluar" class="control-label mb-1 LabelNum">Valor maximo de evaluación</label>
                                    <input id="Txt_ValorMaximoEvaluar" name="Txt_ValorMaximoEvaluar" type="text" style="text-align: center; font-size: 20px; font-weight: bold;" value="100" maxlength="25" class="form-control" aria-required="true" aria-invalid="false">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6" style="text-align: center">
                                <div class="form-group">
                                    <label for="Txt" class="control-label mb-1 LabelNum" style="margin-top: 19px;">Formulario</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <span class='ToolTip_Ver'>
                                                <i class="fa fa-info-circle"></i>
                                                <span>Para editar el título haga click sobre el mismo</span></span>
                                        </div>
                                        <input id="HtmlTitleForm" name="HtmlTitleForm" type="text" style="text-align: center; font-size: 20px; font-weight: bold;" maxlength="250" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly" onclick="javascript: EditTitle();">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 col-sm-2">
                                <div class="form-group" style="text-align: center">
                                    <label for="TxtAvance" class="control-label mb-1 LabelNum">Avance de formulario</label>
                                    <input id="TxtAvance" name="TxtAvance" type="text" style="text-align: center; color: #FFF; font-size: 16px; font-weight: bold;" value="0" maxlength="25" class="form-control" aria-required="true" aria-invalid="false" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-xs-2 col-sm-2">
                                <div class="form-group" style="text-align: center">
                                    <label for="TxtNunFormulario" class="control-label mb-1 LabelNum">Número de formulario</label>
                                    <input id="TxtNunFormulario" name="TxtNunFormulario" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4">
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Nivel_0" class="control-label mb-1">El formulario lleva <span class="TN_0">xxx</span>?</label>
                                </div>
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Nivel_0" class="control-label mb-1">No</label>
                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                        <input id="Check_Nivel_0" type="checkbox" class="switch-input ">
                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                    </label>
                                    <label for="Check_Nivel_0" class="control-label mb-1">Si</label>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4">
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_PesoPonderado" class="control-label mb-1">el peso ponderado desea aplicarlo en?</label>
                                </div>
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_PesoPonderado" class="control-label mb-1" style='font-size: 11px; font-weight: bold;'><span class="TN_2">xxx</span></label>
                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                        <input id="Check_PesoPonderado" type="checkbox" class="switch-input ">
                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                    </label>
                                    <label for="Check_PesoPonderado" class="control-label mb-1" style='font-size: 11px; font-weight: bold;'><span class="TN_3">xxx</span></label>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4">
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Nivel_ErrorCritico" class="control-label mb-1">El error critico desea aplicarlo en?</label>
                                </div>
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Nivel_ErrorCritico" class="control-label mb-1" style='font-size: 11px; font-weight: bold;'><span class="TN_2">xxx</span></label>
                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                        <input id="Check_Nivel_ErrorCritico" type="checkbox" class="switch-input ">
                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                    </label>
                                    <label for="Check_Nivel_ErrorCritico" class="control-label mb-1" style='font-size: 11px; font-weight: bold;'><span class="TN_3">xxx</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="BlockCargo" class="col-xs-12 col-sm-12" style="display: none;">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="col-xs-6 col-sm-6">
                                            <strong>Nivel 0 - <span class="TN_0">xxx</span></strong>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Aplica Valoración?</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Si</strong>
                                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                                    <input id="Check_Valoracion_N0" type="checkbox" class="switch-input ">
                                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                                </label>
                                                <strong>No</strong>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje <span class="TN_0">xxx</span></strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_0" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row">
                                            <div class="col-xs-2 col-sm-2">
                                            </div>
                                            <div class="col-xs-6 col-sm-6">
                                                <div class="form-group">
                                                    <label for="TxtDescripcion" class="control-label mb-1">Descripción</label>
                                                    <textarea name="TxtDescripcion" id="TxtDescripcion" rows="2" placeholder="Registre su cargo" class="form-control"></textarea>
                                                    <label id="helpDescripcion" class="Help"></label>
                                                </div>
                                            </div>
                                            <div class="col-xs-2 col-sm-2">
                                                <label for="TxtPeso_N0" class="control-label mb-1">Peso <span class="TN_0">xxx</span></label>
                                                <input id="TxtPeso_N0" name="TxtPeso_N0" type="text" maxlength="5" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPesoCargo" class="Help"></label>
                                            </div>
                                            <div class="col-xs-2 col-sm-2">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                                <button type="button" id="btn_AddCargo" class="btn btn-success btn-block Top" style="margin-top: 15px; margin-bottom: 15px;" onclick="javascript:Btn_Agrega_N0()">
                                                    <i class="fa fa-plus-circle"></i>&nbsp;Agregar&nbsp;<span class="TN_0">xxx</span>
                                                </button>
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12">
                                            <div id="Container_Grid_Nivel_0" style="width: 100%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="BlockEvaluacion" class="col-xs-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="col-xs-6 col-sm-6">
                                            <strong>Nivel 1 - <span class="TN_1">xxx</span></strong>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Aplica Valoración?</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Si</strong>
                                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                                    <input id="Check_Valoracion_N1" type="checkbox" class="switch-input ">
                                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                                </label>
                                                <strong>No</strong>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje <span class="TN_1">xxx</span></strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_1" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2" id="BlockContCargo">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje <span class="TN_0">xxx</span></strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_A0" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row">
                                            <div id="BlockListCargo" class="col-xs-3 col-sm-3">
                                                <label for="DList_Nivel_0" class="control-label mb-1"><span class="TN_0">xxx</span></label>
                                                <select id="DList_Nivel_0" data-placeholder="Seleccione Cargo." class="standardSelect" tabindex="1">
                                                </select>
                                                <label id="help_N0" class="Help"></label>
                                            </div>
                                            <div class="col-xs-5 col-sm-5">
                                                <div class="form-group">
                                                    <label for="TxtDescripcion_N1" class="control-label mb-1">Descripción</label>
                                                    <textarea name="TxtDescripcion_N1" id="TxtDescripcion_N1" rows="2" placeholder="Registre su Evaluación" class="form-control"></textarea>
                                                    <label id="helpDescripcion_N1" class="Help"></label>
                                                </div>
                                            </div>
                                            <div class="col-xs-2 col-sm-2">
                                                <label for="TxtPeso_N1" class="control-label mb-1">Peso <span class="TN_1">xxx</span></label>
                                                <input id="TxtPeso_N1" name="TxtPeso_N1" type="text" maxlength="5" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPeso_N1" class="Help"></label>
                                            </div>
                                            <div class="col-xs-2 col-sm-2" id="BlockAddCargo">
                                                <label for="TxtPesoA_N0" class="control-label mb-1">Peso <span class="TN_0">xxx</span></label>
                                                <input id="TxtPesoA_N0" name="TxtPesoA_N0" type="text" maxlength="3" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPesoA_N0" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                                <button type="button" id="btn_AddEvaluacion" class="btn btn-success btn-block Top" style="margin-top: 15px; margin-bottom: 15px;" onclick="javascript:Btn_Agrega_N1()">
                                                    <i class="fa fa-plus-circle"></i>&nbsp;Agregar &nbsp;<span class="TN_1">xxx</span>
                                                </button>
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12">
                                            <div id="Container_Grid_Nivel_1" style="width: 100%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="BlockNotas" class="col-xs-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="col-xs-6 col-sm-6">
                                            <strong>Nivel 2 - <span class="TN_2">xxx</span></strong>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Aplica Valoración?</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Si</strong>
                                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                                    <input id="Check_Valoracion_N2" type="checkbox" class="switch-input ">
                                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                                </label>
                                                <strong>No</strong>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje <span class="TN_2">xxx</span></strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_2" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2" id="BlockPonderado_N2">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje Ponderado</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_Pon2" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row">
                                            <div id="BlockListEvaluacion" class="col-xs-3 col-sm-3">
                                                <label for="DList_Nivel_1" class="control-label mb-1"><span class="TN_1">xxx</span></label>
                                                <select id="DList_Nivel_1" data-placeholder="Seleccione Bloque." class="standardSelect" tabindex="1">
                                                </select>
                                                <label id="help_N1" class="Help"></label>
                                            </div>
                                            <div class="col-xs-5 col-sm-5">
                                                <div class="form-group">
                                                    <label for="TxtDescripcion_N2" class="control-label mb-1">Descripción</label>
                                                    <textarea name="TxtDescripcion_N2" id="TxtDescripcion_N2" rows="2" placeholder="Registre su nota descriptiva" class="form-control"></textarea>
                                                    <label id="helpDescripcion_N2" class="Help"></label>
                                                </div>
                                            </div>
                                            <div class="col-xs-2 col-sm-2">
                                                <label for="TxtPeso_N2" class="control-label mb-1">Peso <span class="TN_2">xxx</span></label>
                                                <input id="TxtPeso_N2" name="TxtPeso_N2" type="text" maxlength="5" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPeso_N2" class="Help"></label>
                                            </div>
                                            <div class="col-xs-2 col-sm-2" id="Block_N2_PP">
                                                <label for="TxtPeso_PP2" class="control-label mb-1">Peso Ponderado</label>
                                                <input id="TxtPeso_PP2" name="TxtPeso_PP2" type="text" maxlength="5" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPeso_PP2" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="row" id="Block_N2_EC">
                                            <div class="col-xs-3 col-sm-3">
                                            </div>
                                            <div class="col-xs-3 col-sm-3">
                                                <div class="col-xs-12 col-sm-12">
                                                    <label for="Check_ErrorCritico_1" class="control-label mb-1">Error Critico?</label>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">
                                                    <label for="Check_ErrorCritico_1" class="control-label mb-1">No</label>
                                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                                        <input id="Check_ErrorCritico_1" type="checkbox" class="switch-input ">
                                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                                    </label>
                                                    <label for="Check_ErrorCritico_1" class="control-label mb-1">Si</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label for="DListErrores_1" class="control-label mb-1">Tipo de error</label>
                                                    <select id="DListErrores_1" data-placeholder="Seleccione Error." class="standardSelect" tabindex="1">
                                                    </select>
                                                    <label id="helpErrores_1" class="Help"></label>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 col-sm-3">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                                <button type="button" id="btn_AddNota" class="btn btn-success btn-block Top" style="margin-top: 15px; margin-bottom: 15px;" onclick="javascript:Btn_Agrega_N2()">
                                                    <i class="fa fa-plus-circle"></i>&nbsp;Agregar&nbsp; <span class="TN_2">xxx</span>
                                                </button>
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12">
                                            <div id="Container_Grid_Nivel_2" style="width: 100%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="BlockPuntos" class="col-xs-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="col-xs-4 col-sm-4">
                                            <strong>Nivel 3 - <span class="TN_3">xxx</span></strong>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Aplica Valoración?</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Si</strong>
                                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                                    <input id="Check_Valoracion_N3" type="checkbox" class="switch-input ">
                                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                                </label>
                                                <strong>No</strong>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje <span class="TN_3">xxx</span></strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_3" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2" id="BlockPonderado_N3">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje Ponderado</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_Pon3" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Aplica <span class="TN_4">xxx</span>?</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>No</strong>
                                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                                    <input id="Check_Aplica_N4" type="checkbox" class="switch-input ">
                                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                                </label>
                                                <strong>Si</strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row">
                                            <div id="BlockListNotas" class="col-xs-3 col-sm-3">
                                                <label for="DList_Nivel_2" class="control-label mb-1"><span class="TN_2">xxx</span></label>
                                                <select id="DList_Nivel_2" data-placeholder="Seleccione Notas." class="standardSelect" tabindex="1">
                                                </select>
                                                <label id="help_N2" class="Help"></label>
                                            </div>
                                            <div class="col-xs-5 col-sm-5">
                                                <div class="form-group">
                                                    <label for="TxtDescripcion_N3" class="control-label mb-1">Descripción</label>
                                                    <textarea name="TxtDescripcion_N3" id="TxtDescripcion_N3" rows="2" placeholder="Registre su punto de entrenamiento" class="form-control"></textarea>
                                                    <label id="helpDescripcion_N3" class="Help"></label>
                                                </div>
                                            </div>
                                            <div class="col-xs-2 col-sm-2">
                                                <label for="TxtPeso_N3" class="control-label mb-1">Peso <span class="TN_3">xxx</span></label>
                                                <input id="TxtPeso_N3" name="TxtPeso_N3" type="text" maxlength="5" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPeso_N3" class="Help"></label>
                                            </div>
                                            <div class="col-xs-2 col-sm-2" id="Block_N3_PP">
                                                <label for="TxtPeso_PP3" class="control-label mb-1">Peso Ponderado</label>
                                                <input id="TxtPeso_PP3" name="TxtPeso_PP3" type="text" maxlength="5" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPeso_PP3" class="Help"></label>
                                            </div>
                                        </div>
                                        <div id="Block_N3_EC" class="row">
                                            <div class="col-xs-3 col-sm-3">
                                            </div>
                                            <div class="col-xs-3 col-sm-3">
                                                <div class="col-xs-12 col-sm-12">
                                                    <label for="Check_ErrorCritico" class="control-label mb-1">Error Critico?</label>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">
                                                    <label for="Check_ErrorCritico" class="control-label mb-1">No</label>
                                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                                        <input id="Check_ErrorCritico" type="checkbox" class="switch-input ">
                                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                                    </label>
                                                    <label for="Check_ErrorCritico" class="control-label mb-1">Si</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label for="DListErrores" class="control-label mb-1">Tipo de error</label>
                                                    <select id="DListErrores" data-placeholder="Seleccione Error." class="standardSelect" tabindex="1">
                                                    </select>
                                                    <label id="helpErrores" class="Help"></label>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 col-sm-3">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                                <button type="button" id="btn_AddPunto" class="btn btn-success btn-block Top" style="margin-top: 15px; margin-bottom: 15px;" onclick="javascript:Btn_Agrega_N3()">
                                                    <i class="fa fa-plus-circle"></i>&nbsp;Agregar&nbsp; <span class="TN_3">xxx</span>
                                                </button>
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12">
                                            <div id="Container_Grid_Nivel_3" style="width: 100%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="BlockFoco" class="col-xs-12 col-sm-12" style="display: none;">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="col-xs-6 col-sm-6">
                                            <strong>Nivel 4 - <span class="TN_4">xxx</span></strong>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Aplica Valoración?</strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <strong>Si</strong>
                                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                                    <input id="Check_Valoracion_N4" type="checkbox" class="switch-input ">
                                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                                </label>
                                                <strong>No</strong>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center;">
                                                <strong>Porcentaje <span class="TN_4">xxx</span></strong>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <input id="TxtContador_N4" name="" type="text" value="0" maxlength="25" class="form-control CampoNum" aria-required="true" aria-invalid="false" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row">
                                            <div id="BlockListPunto" class="col-xs-3 col-sm-3">
                                                <label for="DList_Nivel_3" class="control-label mb-1"><span class="TN_3">xxx</span></label>
                                                <select id="DList_Nivel_3" data-placeholder="Seleccione Punto." class="standardSelect" tabindex="1">
                                                </select>
                                                <label id="help_N3" class="Help"></label>
                                            </div>
                                            <div class="col-xs-6 col-sm-6">
                                                <div class="form-group">
                                                    <label for="TxtDescripcion_N4" class="control-label mb-1">Descripción</label>
                                                    <textarea name="TxtDescripcion_N4" id="TxtDescripcion_N4" rows="2" placeholder="Registre su foco de mejora" class="form-control"></textarea>
                                                    <label id="helpDescripcion_N4" class="Help"></label>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 col-sm-3">
                                                <label for="TxtPeso_N4" class="control-label mb-1">Peso <span class="TN_4">xxx</span></label>
                                                <input id="TxtPeso_N4" name="TxtPeso_N4" type="text" maxlength="5" class="form-control Decimals CampoNumText" aria-required="true" aria-invalid="false">
                                                <label id="helpPeso_N4" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                                <button type="button" id="btn_AddFoco" class="btn btn-success btn-block Top" style="margin-top: 15px; margin-bottom: 15px;" onclick="javascript:Btn_Agrega_N4()">
                                                    <i class="fa fa-plus-circle"></i>&nbsp;Agregar&nbsp; <span class="TN_4">xxx</span>
                                                </button>
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12">
                                            <div id="Container_Grid_Nivel_4" style="width: 100%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="BlockFormulacion" class="col-xs-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="col-xs-6 col-sm-6">
                                            <strong>Formulación</strong>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                        </div>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12" style="text-align: center; margin-bottom: 20px;">
                                                <h3>Panel para la implemetación de la formulacion y configuración final para el monitoreo</h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="card border border-info">
                                                    <div class="card-header">
                                                        <strong class="card-title">Base Operadores</strong>
                                                    </div>
                                                    <div class="card-body">
                                                        <p class="card-text">Bloques los cuales actuaran como el total de la operación</p>
                                                        <div class="funkyradio">
                                                            <div id="BlockCheck_N0" class="funkyradio-primary">
                                                                <input type="checkbox" name="Operadores" id="checkbox_N0" />
                                                                <label class="TN_0" for="checkbox_N0">xxx</label>
                                                            </div>
                                                            <div class="funkyradio-info">
                                                                <input type="checkbox" name="Operadores" id="checkbox_N1" />
                                                                <label class="TN_1" for="checkbox_N1">xxx</label>
                                                            </div>
                                                            <label id="helpBloqueOperadores" class="Help"></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="card border border-info">
                                                    <div class="card-header">
                                                        <strong class="card-title">Valores a operar</strong>
                                                    </div>
                                                    <div class="card-body">
                                                        <p class="card-text">Bloques los cuales actuaran como el operador contra el total del bloque principal</p>
                                                        <div class="col-md-12">
                                                            <label for="Check_VariosV" class="control-label mb-1">Desea tener varios operadores?</label>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label for="Check_VariosV" class="control-label mb-1">No</label>
                                                            <label class="switch switch-3d switch-success mr-3" size="lg">
                                                                <input id="Check_VariosV" type="checkbox" class="switch-input ">
                                                                <span class="switch-label"></span><span class="switch-handle"></span>
                                                            </label>
                                                            <label for="Check_VariosV" class="control-label mb-1">Si</label>
                                                        </div>
                                                        <div class="funkyradio">
                                                            <div class="funkyradio-warning">
                                                                <input type="radio" name="checkbox_Opera" id="checkbox_N2" value="N2" />
                                                                <label class="TN_2" for="checkbox_N2">xxx</label>
                                                            </div>
                                                            <div class="funkyradio-success">
                                                                <input type="radio" name="checkbox_Opera" id="checkbox_N3" value="N3" />
                                                                <label class="TN_3" for="checkbox_N3">xxx</label>
                                                            </div>
                                                            <div id="BlockCheck_N4" class="funkyradio-info">
                                                                <input type="radio" name="checkbox_Opera" id="checkbox_N4" value="N4" />
                                                                <label class="TN_4" for="checkbox_N4">xxx</label>
                                                            </div>
                                                        </div>
                                                        <label id="helpBloqueValores" class="Help"></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="card border border-info">
                                                    <div class="card-header">
                                                        <strong class="card-title">Opciones de monitoreo</strong>
                                                    </div>
                                                    <div class="card-body">
                                                        <p class="card-text">Son las opciones de monitoreo establecidas las cuales tiene la facilidad de configurarlas para el proceso</p>
                                                        <div class="funkyradio">
                                                            <div class="funkyradio-success">
                                                                <input type="checkbox" name="OpcionMonitoreo" id="checkboxC" />
                                                                <label for="checkboxC">Cumple</label>
                                                            </div>
                                                            <div class="funkyradio-success">
                                                                <input type="checkbox" name="OpcionMonitoreo" id="checkboxNC" />
                                                                <label for="checkboxNC">No Cumple</label>
                                                            </div>
                                                            <div class="funkyradio-success">
                                                                <input type="checkbox" name="OpcionMonitoreo" id="checkboxNA" />
                                                                <label for="checkboxNA">No Aplica</label>
                                                            </div>
                                                        </div>
                                                        <label id="helpBloqueOpcMonitoreo" class="Help"></label>
                                                        <div id="Block_NA">
                                                            <div class="col-md-12">
                                                                <label for="Check_aplicaNA" id="LabelNA" class="control-label mb-1">Desea que el porcentaje de peso que tenga ?</label>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label for="Check_aplicaNA" class="control-label mb-1">No</label>
                                                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                                                    <input id="Check_aplicaNA" type="checkbox" class="switch-input ">
                                                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                                                </label>
                                                                <label for="Check_aplicaNA" class="control-label mb-1">Si</label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="card border border-info">
                                                    <div class="card-header">
                                                        <strong class="card-title">Monitoreo por defecto</strong>
                                                    </div>
                                                    <div class="card-body">
                                                        <p class="card-text">Según las opciones seleccionadas puede escoger alguna por defecto</p>
                                                        <div class="funkyradio">
                                                            <div class="funkyradio-success">
                                                                <input type="radio" name="DefaultMonitoreo" id="DefC" value="C" />
                                                                <label for="DefC">Cumple</label>
                                                            </div>
                                                            <div class="funkyradio-success">
                                                                <input type="radio" name="DefaultMonitoreo" id="DefNC" value="NC" />
                                                                <label for="DefNC">No Cumple</label>
                                                            </div>
                                                            <div class="funkyradio-success">
                                                                <input type="radio" name="DefaultMonitoreo" id="DefNA" value="NA" />
                                                                <label for="DefNA">No Aplica</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="card border border-info">
                                                    <div class="card-header">
                                                        <strong class="card-title">Error Critico</strong>
                                                    </div>
                                                    <div class="card-body">
                                                        <p class="card-text">Desea que el (Error Critico) afecte la nota total del monitoreo?</p>
                                                        <div class="col-md-12">
                                                            <label for="Check_ErrorC" class="control-label mb-1">No</label>
                                                            <label class="switch switch-3d switch-success mr-3" size="lg">
                                                                <input id="Check_ErrorC" type="checkbox" class="switch-input ">
                                                                <span class="switch-label"></span><span class="switch-handle"></span>
                                                            </label>
                                                            <label for="Check_ErrorC" class="control-label mb-1">Si</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                                <button type="button" id="btn_AddConfiguracion" class="btn btn-success btn-block Top" style="margin-top: 15px; margin-bottom: 15px;" onclick="javascript:Btn_AgregaConfiguracion()">
                                                    <i class="fa fa-plus-circle"></i>&nbsp;Agregar&nbsp; Cofiguración
                                                </button>
                                            </div>
                                            <div class="col-xs-4 col-sm-4">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="Block_Activate">
                            <div class="col-xs-4 col-sm-4">
                            </div>
                            <div class="col-xs-4 col-sm-4">
                                <div class="form-group">
                                    <button type="button" id="btn_Save" class="btn btn-primary btn-block Top" onclick="javascript:Btn_Activate()">
                                        <i class="fa fa-save"></i>&nbsp;Activar Formualrio
                                    </button>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4">
                            </div>
                        </div>
                    </div>
                    <div id="Block_C_Masive" style="margin-top: 15px;">
                        <div class="row">
                            <div class="col-6 col-sm-6 col-md-6" id="Bl_File">
                                <div class="box-placeholder">
                                    <div class="form-group">
                                        <input type="file" id="BSbtnsuccess" name="files[]">
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col-sm-3 col-md-3">
                                <div class="box-placeholder" id="Btn_Chargue">
                                    <div class="box-placeholder">
                                        <div class="form-group">
                                            <button type="button" class="btn btn-info btn-block" onclick="UpLoad_Document('BSbtnsuccess','Forms');">
                                                <i class="fa fa-upload"></i>&nbsp;Subir Excel
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 col-sm-3 col-md-3">
                                <div class="box-placeholder" id="Btn_Group">
                                    <div class="box-placeholder">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <button type="button" class="btn btn-warning btn-block" onclick="Btn_Download_Plantilla();">
                                                    <i class="fa fa-download"></i>&nbsp;Descargar Plantilla
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="text-align: center;">
                            <div id="Grid_Result_Chargue" style="width: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalStart" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Creación de formulario</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row" style="text-align: center;">
                        <h3 style="margin: 5%;" id="TitleBienvenida">Bienvenido al módulo para la creación de formularios para iniciar presione el botón start</h3>
                    </div>
                    <div class="row">
                        <div class="col-xs-2 col-sm-2">
                        </div>
                        <div class="col-xs-8 col-sm-8">
                            <div class="form-group">
                                <label for="TxtDescripcionForm" class="control-label mb-1">Descripción</label>
                                <textarea name="TxtDescripcionForm" id="TxtDescripcionForm" rows="2" placeholder="Registre el nombre del formulario" class="form-control"></textarea>
                                <label id="helpDescripcionForm" class="Help"></label>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                        </div>
                    </div>
                    <div class="row" style="text-align: center;">
                        <div class="col-xs-4 col-sm-4">
                        </div>
                        <div class="col-xs-4 col-sm-4">
                            <div class="form-group">
                                <label for="TxtvalForm" class="control-label mb-1">valor maximo a evaluar, este valor aplica para todos bloques </label>
                                <input id="TxtvalForm" name="TxtvalForm" type="text" maxlength="4" class="form-control Numeric" aria-required="true" aria-invalid="false">
                                <label id="helpvalForm" class="Help"></label>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4">
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4">
                        </div>
                        <div class="col-xs-4 col-sm-4">
                            <div class="form-group">
                                <button type="button" class="btn btn-success btn-block Top" onclick="javascript:Btn_CreateFormulario()">
                                    <i class="fa fa-check-circle"></i>&nbsp;Start
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalEliminar" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" id="TitleDelete" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Eliminar</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label id="LblMsmAdvertencia" class="control-label mb-1">Usted esta seguro de </label>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label id="LblMsmAdvertencia2" class="control-label mb-1">Usted esta seguro de </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="TxtNombreView" class="control-label mb-1">Descripción</label>
                                <input id="TxtNombreView" name="TxtNombreView" type="text" maxlength="500" readonly="readonly" class="form-control Letter" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
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
                            <button type="button" id="Btn_Desact" class="btn btn-success btn-block " onclick="javascript:Delete_Transaction();">
                                <i class="fa fa-check-square"></i>&nbsp;Confirmar 
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalFormDesactivar" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" id="TitleFormDessactivar" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Eliminar</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label id="LblMsmAdvertenciaForm" class="control-label mb-1">Usted esta seguro de </label>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label id="LblMsmAdvertenciaForm2" class="control-label mb-1">Usted esta seguro de </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="TxtNombreForm" class="control-label mb-1">Descripción</label>
                                <input id="TxtNombreForm" name="TxtNombreForm" type="text" maxlength="500" readonly="readonly" class="form-control Letter" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-xs-12 col-sm-12">
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;Cancelar 
                            </button>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="Btn_Form" class="btn btn-success btn-block " onclick="javascript:Update_FormularioEstado_Transaction(0);">
                                <i class="fa fa-check-square"></i>&nbsp;Confirmar 
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalFormEliminar" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Eliminar formulario</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label class="control-label mb-1">Panel oculto para la eliminacion de formularios, Advertencia al borrar se perdera todo el formulario</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="TxtDigito" class="control-label mb-1">Id de formulario</label>
                                <input id="TxtDigito" name="TxtDigito" type="text" maxlength="7" class="form-control Numeric" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-xs-12 col-sm-12">
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;Cancelar 
                            </button>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" class="btn btn-success btn-block " onclick="javascript:DeleteForm_Transaction();">
                                <i class="fa fa-check-square"></i>&nbsp;Confirmar 
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalViewDetail" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Registros no cargados</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row" style="text-align: center;">
                        <div id="Grid_Result_DetailsChargue" style="width: 100%;"></div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <span class="DownButton" onclick="javascript:PaginarLeves(0)"><i class="fa fa-angle-double-down"></i></span>
    <span class="DownUp" onclick="javascript:PaginarLeves(1)"><i class="fa fa-angle-double-up"></i></span>
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
    <script src="Formularios.js"></script>
</asp:Content>
