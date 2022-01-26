<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="QaVision.View.Admin.User" %>

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
                <strong id="TForm">Ver Usuarios</strong>
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
                            <div class="col-xs-4 col-sm-4">
                                <div class="form-group">
                                    <label for="TxtNombre" class="control-label mb-1">Nombres</label>
                                    <input id="TxtNombre" name="TxtNombre" type="text" maxlength="250" class="form-control Letter" aria-required="true" aria-invalid="false">
                                    <label id="helpNombre" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4">
                                <div class="form-group">
                                    <label for="TxtApellido" class="control-label mb-1">Apellidos</label>
                                    <input id="TxtApellido" name="TxtApellido" type="text" maxlength="250" class="form-control Letter" aria-required="true" aria-invalid="false">
                                    <label id="helpApellido" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4">
                                <div class="form-group">
                                    <label for="TxtCedula" class="control-label mb-1">Documento</label>
                                    <input id="TxtCedula" name="TxtCedula" type="text" maxlength="20" class="form-control Numeric" aria-required="true" aria-invalid="false">
                                    <label id="helpCedula" class="Help"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-2 col-sm-2">
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Ges" class="control-label mb-1">Tiene correo?</label>
                                </div>
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Correo" class="control-label mb-1">Si</label>
                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                        <input id="Check_Correo" type="checkbox" class="switch-input ">
                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                    </label>
                                    <label for="Check_Correo" class="control-label mb-1">No</label>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4">
                                <div class="form-group">
                                    <label for="TxtCorreo" class="control-label mb-1">Correo</label>
                                    <input id="TxtCorreo" name="TxtCorreo" type="text" maxlength="250" class="form-control" aria-required="true" aria-invalid="false">
                                    <label id="helpCorreo" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="DListRol" class="control-label mb-1">Perfil</label>
                                    <select id="DListRol" data-placeholder="Seleccione Perfil." class="standardSelect" tabindex="1">
                                    </select>
                                    <label id="helpRol" class="Help"></label>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Ges" class="control-label mb-1">Es gestionable la contraseña?</label>
                                </div>
                                <div class="col-xs-12 col-sm-12">
                                    <label for="Check_Ges" class="control-label mb-1">No</label>
                                    <label class="switch switch-3d switch-success mr-3" size="lg">
                                        <input id="Check_Ges" type="checkbox" class="switch-input ">
                                        <span class="switch-label"></span><span class="switch-handle"></span>
                                    </label>
                                    <label for="Check_Ges" class="control-label mb-1">Si</label>
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
                                            <button type="button" class="btn btn-info btn-block" onclick="UpLoad_Document('BSbtnsuccess','Users');">
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
                                <label for="TxtNombreUsuarioView" class="control-label mb-1">Documento</label>
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
    <script src="<% = ResolveClientUrl("~/Content/Js/Master.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Proccess.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Plugins/FileStyle/bootstrap-filestyle.js") %>"></script>
    <script src="User.js"></script>
</asp:Content>
