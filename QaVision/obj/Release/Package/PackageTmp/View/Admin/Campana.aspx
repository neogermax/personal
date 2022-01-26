<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="Campana.aspx.cs" Inherits="QaVision.View.Admin.Campana" %>

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
                <strong id="TForm">Ver Cuentas</strong>
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
                    <div class="row">
                        <div class="col-xs-4 col-sm-4">
                            <div class="form-group">
                                <label for="DListCliente" class="control-label mb-1">Cliente</label>
                                <select id="DListCliente" data-placeholder="Seleccione Perfil." class="standardSelect" tabindex="1">
                                </select>
                                <label id="helpCliente" class="Help"></label>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4">
                            <div class="form-group">
                                <label for="TxtNombre" class="control-label mb-1">Nombre</label>
                                <input id="TxtNombre" name="TxtNombre" type="text" maxlength="250" class="form-control Letter" aria-required="true" aria-invalid="false">
                                <label id="helpNombre" class="Help"></label>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <div class="form-group">
                                <label for="TxtCantidadMonitoreo" class="control-label mb-1">N° Monitoreos</label>
                                <input id="TxtCantidadMonitoreo" name="TxtCantidadMonitoreo" type="text" maxlength="1" class="form-control Numeric" aria-required="true" aria-invalid="false">
                                <label id="helpCantidadMonitoreo" class="Help"></label>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <label for="DListPeriodo" class="control-label mb-1">Frecuencia</label>
                            <select id="DListPeriodo" data-placeholder="Seleccione Periodo." class="standardSelect" tabindex="1">
                            </select>
                            <label id="helpPeriodo" class="Help"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4">
                            <div class="col-xs-12 col-sm-12">
                                <label for="Check_Nivel_0M" class="control-label mb-1">El coordinador puede Realizar Monitoreos?</label>
                            </div>
                            <div class="col-xs-12 col-sm-12">
                                <label for="Check_Nivel_0M" class="control-label mb-1">No</label>
                                <label class="switch switch-3d switch-success mr-3" size="lg">
                                    <input id="Check_Nivel_0M" type="checkbox" class="switch-input ">
                                    <span class="switch-label"></span><span class="switch-handle"></span>
                                </label>
                                <label for="Check_Nivel_0M" class="control-label mb-1">Si</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="col-xs-8 col-sm-8">
                                        <strong>procesos</strong>
                                    </div>
                                    <div class="col-xs-4 col-sm-4">
                                        <button type="button" id="btn_AddProcess" class="btn btn-success btn-block Top" onclick="javascript:Btn_AddProccess()">
                                            <i class="fa fa-plus-square"></i>&nbsp;Agregar proceso
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body card-block">
                                    <div class="col-xs-12 col-sm-12">
                                        <div id="Container_GridProcesos" style="width: 100%">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Roles</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12">
                                            <div class="form-group">
                                                <label for="" class="control-label mb-1">Estos roles seran creados para la cuenta si desea cambiar el nombre según sus necesidades</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtRol1" class="control-label mb-1">Rol 1</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Rol responsable de la administración </span></span>
                                                    </div>
                                                    <input type="text" id="TxtRol1" name="TxtRol1" value="ADMINISTRADOR" class="form-control Letter" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpRol1" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtRol2" class="control-label mb-1">Rol 2</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Rol responsable del monitoreo de agentes y creacion de formularios</span></span>
                                                    </div>
                                                    <input type="text" id="TxtRol2" name="TxtRol2" value="SUPERVISOR MONITOR" class="form-control Letter" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpRol2" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtRol3" class="control-label mb-1">Rol 3</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Rol responsable del monitoreo de agentes</span></span>
                                                    </div>
                                                    <input type="text" id="TxtRol3" name="TxtRol3" value="MONITOR" class="form-control Letter" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpRol3" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtRol4" class="control-label mb-1">Rol 4</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Rol responsable de la cuenta o campaña</span></span>
                                                    </div>
                                                    <input type="text" id="TxtRol4" name="TxtRol4" value="COORDINADOR" class="form-control Letter" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpRol4" class="Help"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3 col-sm-3">
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtRol5" class="control-label mb-1">Rol 5</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Rol que procesa la infromación del cliente</span></span>
                                                    </div>
                                                    <input type="text" id="TxtRol5" name="TxtRol5" value="AGENTE" class="form-control Letter" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpRol5" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtRol6" class="control-label mb-1">Rol 6</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Rol que esta del lado del cliente</span></span>
                                                    </div>
                                                    <input type="text" id="TxtRol6" name="TxtRol6" value="CLIENTE" class="form-control Letter" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpRol6" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                        </div>
                                    </div>
                                    <div class="card" id="BlockParemetrizacion" style="display: none;">
                                        <div class="card-header">
                                            <strong>Parametrización del dashboard</strong>
                                        </div>
                                        <div class="card-body card-block">
                                            <div class="row">
                                                <div class="col-xs-4 col-sm-4">
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol3" class="control-label mb-1">El Rol 3 puede ver panel de Formulario?</label>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol3" class="control-label mb-1">No</label>
                                                        <label class="switch switch-3d switch-success mr-3" size="lg">
                                                            <input id="Check_Dash_Rol3" type="checkbox" class="switch-input ">
                                                            <span class="switch-label"></span><span class="switch-handle"></span>
                                                        </label>
                                                        <label for="Check_Dash_Rol3" class="control-label mb-1">Si</label>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4 col-sm-4">
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol3" class="control-label mb-1">El Rol 3 puede ver panel de Monitoreo?</label>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol3M" class="control-label mb-1">No</label>
                                                        <label class="switch switch-3d switch-warning mr-3" size="lg">
                                                            <input id="Check_Dash_Rol3M" type="checkbox" class="switch-input ">
                                                            <span class="switch-label"></span><span class="switch-handle"></span>
                                                        </label>
                                                        <label for="Check_Dash_Rol3M" class="control-label mb-1">Si</label>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4 col-sm-4">
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol3" class="control-label mb-1">El Rol 4 puede ver panel de Monitoreo?</label>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol4M" class="control-label mb-1">No</label>
                                                        <label class="switch switch-3d switch-primary mr-3" size="lg">
                                                            <input id="Check_Dash_Rol4M" type="checkbox" class="switch-input ">
                                                            <span class="switch-label"></span><span class="switch-handle"></span>
                                                        </label>
                                                        <label for="Check_Dash_Rol4M" class="control-label mb-1">Si</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-4 col-sm-4">
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol5M" class="control-label mb-1">El Rol 5 puede ver panel de Monitoreo?</label>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol5M" class="control-label mb-1">No</label>
                                                        <label class="switch switch-3d switch-info mr-3" size="lg">
                                                            <input id="Check_Dash_Rol5M" type="checkbox" class="switch-input ">
                                                            <span class="switch-label"></span><span class="switch-handle"></span>
                                                        </label>
                                                        <label for="Check_Dash_Rol5M" class="control-label mb-1">Si</label>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4 col-sm-4">
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol6M" class="control-label mb-1">El Rol 6 puede ver panel de Monitoreo?</label>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12">
                                                        <label for="Check_Dash_Rol6M" class="control-label mb-1">No</label>
                                                        <label class="switch switch-3d switch-danger mr-3" size="lg">
                                                            <input id="Check_Dash_Rol6M" type="checkbox" class="switch-input ">
                                                            <span class="switch-label"></span><span class="switch-handle"></span>
                                                        </label>
                                                        <label for="Check_Dash_Rol6M" class="control-label mb-1">Si</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Configuración de correo</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row">
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtEMAIL_FROM" class="control-label mb-1">Correo para envio</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Correo de con el que se enviara las notificaciones</span></span>
                                                    </div>
                                                    <input type="text" id="TxtEMAIL_FROM" name="TxtEMAIL_FROM" class="form-control" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpEMAIL_FROM" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtSMTP" class="control-label mb-1">SMTP</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Configuracion del servidor de envio</span></span>
                                                    </div>
                                                    <input type="text" id="TxtSMTP" name="TxtSMTP" class="form-control" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpSMTP" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtEMAIL_CONFIG" class="control-label mb-1">Correo Configuracion</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Correo de con el que se se configura los parametros de servicio</span></span>
                                                    </div>
                                                    <input type="text" id="TxtEMAIL_CONFIG" name="TxtEMAIL_CONFIG" class="form-control" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpEMAIL_CONFIG" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtEMAIL_PASS" class="control-label mb-1">Contraseña</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Contraseña para el ingreso del correo</span></span>
                                                    </div>
                                                    <input type="text" id="TxtEMAIL_PASS" name="TxtEMAIL_PASS" class="form-control" aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpEMAIL_PASS" class="Help"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Estructura Formulario</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12">
                                            <div class="form-group">
                                                <label for="" class="control-label mb-1">Este es el panel de configuración de nombres del formulario puede editarlo según sus necesidades</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-sm-4">
                                            <div class="form-group">
                                                <label for="TxtNivel_0" class="control-label mb-1">Nivel 0</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Nivel opcional para separar formularios por procesos</span></span>
                                                    </div>
                                                    <input type="text" id="TxtNivel_0" name="TxtNivel_0" value="Cargo" class="form-control " aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpNivel_0" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-4 col-sm-4">
                                            <div class="form-group">
                                                <label for="TxtNivel_1" class="control-label mb-1">Nivel 1</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Nivel principal en el cual se desglosa el proceso</span></span>
                                                    </div>
                                                    <input type="text" id="TxtNivel_1" name="TxtNivel_1" value="B. Evaluación" class="form-control " aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpNivel_1" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-4 col-sm-4">
                                            <div class="form-group">
                                                <label for="TxtNivel_2" class="control-label mb-1">Nivel 2</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Nivel intermedio para desglosar el proceso</span></span>
                                                    </div>
                                                    <input type="text" id="TxtNivel_2" name="TxtNivel_2" value="Notas Des." class="form-control " aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpNivel_2" class="Help"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-2 col-sm-2">
                                        </div>
                                        <div class="col-xs-4 col-sm-4">
                                            <div class="form-group">
                                                <label for="TxtNivel_3" class="control-label mb-1">Nivel 3</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Nivel final en el cual se encuentra el estado de proceso </span></span>
                                                    </div>
                                                    <input type="text" id="TxtNivel_3" name="TxtNivel_3" value="Punto Ent." class="form-control " aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpNivel_3" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-4 col-sm-4">
                                            <div class="form-group">
                                                <label for="TxtNivel_4" class="control-label mb-1">Nivel 4</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <span class='ToolTip_Ver'>
                                                            <i class="fa fa-info-circle"></i>
                                                            <span>Nivel opcional que se utiliza de retro alimentación del nivel anterior</span></span>
                                                    </div>
                                                    <input type="text" id="TxtNivel_4" name="TxtNivel_4" value="Foco Mejora" class="form-control " aria-required="true" aria-invalid="false">
                                                </div>
                                                <label id="helpNivel_4" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Estilo Campaña</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row">
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtColorBack" class="control-label mb-1">Fondo de formularios</label>
                                                <input type="color" id="TxtColorBack" name="TxtColorBack" class="form-control Numeric" aria-required="true" aria-invalid="false">
                                                <label id="helpColorBack" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtColorHeaderTitle" class="control-label mb-1">Titulo de formularios</label>
                                                <input type="color" id="TxtColorHeaderTitle" name="TxtColorHeaderTitle" class="form-control Numeric" aria-required="true" aria-invalid="false">
                                                <label id="helpColorHeaderTitle" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtColorLabel" class="control-label mb-1">Titulo de control</label>
                                                <input type="color" id="TxtColorLabel" name="TxtColorLabel" class="form-control Numeric" aria-required="true" aria-invalid="false">
                                                <label id="helpColorLabel" class="Help"></label>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="TxtColorAlerta" class="control-label mb-1">Alerta de control</label>
                                                <input type="color" id="TxtColorAlerta" name="TxtColorAlerta" class="form-control Numeric" aria-required="true" aria-invalid="false">
                                                <label id="helpColorAlerta" class="Help"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 col-sm-8 col-md-8" id="Bl_File">
                                            <div class="box-placeholder">
                                                <div class="form-group">
                                                    <input type="file" id="BSbtnsuccess" name="files[]">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 col-sm-4 col-md-4">
                                            <div class="box-placeholder" id="Btn_Chargue">
                                                <div class="box-placeholder">
                                                    <div class="form-group">
                                                        <button type="button" class="btn btn-info btn-block" onclick="UpLoad_Files('BSbtnsuccess','CampanaFiles','TxtNombre');">
                                                            <span class="glyphicon glyphicon-open-file"></span>Subir Imagen
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
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="card">
                                <div id="DivHeader" class="card-header">
                                    <strong>Titulo formulario</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6">
                                            <div class="form-group">
                                                <label id="Txtejemplo" class="control-label mb-1">Fondo</label>
                                                <input type="text" id="Txt1" name="Txt1" class="form-control Numeric" readonly="readonly" aria-required="true" aria-invalid="false">
                                                <label id="helpColor1">* obligatorio</label>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6">
                                            <iframe id="IF_Visor" src=""></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4">
                        </div>
                        <div class="col-xs-4 col-sm-4">
                            <div class="form-group">
                                <button type="button" id="btn_Save" class="btn btn-success btn-block Top" onclick="javascript:Btn_Save()">
                                    <i class="fa fa-save"></i>&nbsp;Guardar
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

    <div class="modal fade" id="ModalDesactivar" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Activar - Desactivar usuario</h4>
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
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="TxtNombreView" class="control-label mb-1">Nombres</label>
                                <input id="TxtNombreView" name="TxtNombreView" type="text" maxlength="500" readonly="readonly" class="form-control Letter" aria-required="true" aria-invalid="false">
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="TxtNombreUsuarioView" class="control-label mb-1">Usuario</label>
                                <input id="TxtNombreUsuarioView" name="TxtNombreUsuarioView" readonly="readonly" type="text" maxlength="25" class="form-control Letter" aria-required="true" aria-invalid="false">
                            </div>
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
                            <button type="button" id="Btn_Desact" class="btn btn-success btn-block " onclick="javascript:Btn_ActivarDesativar();">
                                <i class="fa fa-check-square"></i>&nbsp;Confirmar 
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalProccess" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 id="TitleModalPro" class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Agregar Procesos</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="TxtProceso" class="control-label mb-1">Nombre de proceso</label>
                                <input id="TxtProceso" name="TxtProceso" type="text" maxlength="500" class="form-control Letter" aria-required="true" aria-invalid="false">
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
                            <button type="button" id="Btn_Addprocesos" class="btn btn-success btn-block " onclick="javascript:Btn_AddProceso();">
                                <i class="fa fa-check-square"></i>&nbsp;Confirmar 
                            </button>
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
    <script src="<% = ResolveClientUrl("~/Content/Js/Master.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Proccess.js") %>"></script>
    <script src="Campana.js"></script>
</asp:Content>
