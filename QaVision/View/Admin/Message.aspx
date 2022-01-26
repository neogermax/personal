<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="QaVision.View.Admin.Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/css/StyleForm.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Plugins/NeoG_Message/css/NeoG_Message.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/datatables.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/dataTables.semanticui.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Cloudflare/semantic.min.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Plugins/Editor/editor.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="Neog_Message"></div>
    <div class="col-xs-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <strong id="TForm">Ver Mensajes</strong>
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
                                <label for="TxtNombre" class="control-label mb-1">Titulo Mensaje</label>
                                <input id="TxtNombre" name="TxtNombre" type="text" maxlength="250" class="form-control " aria-required="true" aria-invalid="false" disabled="disabled">
                                <label id="helpNombre" class="Help"></label>
                            </div>
                        </div>
                        <div class="col-xs-8 col-sm-8">
                            <div class="form-group">
                                <label for="textareaCuerpoMensaje_Interno" class="control-label mb-1">Mensaje Interno</label>
                                <textarea name="textarea-input" id="textareaCuerpoMensaje_Interno" rows="3" placeholder="Diligencie menseje interno" class="form-control"></textarea>
                                <label id="helpCuerpoMensaje_Interno" class="Help"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label for="TxtUrl" class="control-label mb-1">Url para redireccion</label>
                                <input id="TxtUrl" name="TxtUrl" type="text" maxlength="500" class="form-control " aria-required="true" aria-invalid="false">
                                <label id="helpUrl" class="Help"></label>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 nopadding">
                                <textarea id="txtEditor"></textarea>
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
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Activar - Desactivar Cliente</h4>
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
                        <div class="col-xs-8 col-sm-8">
                            <div class="form-group">
                                <label for="TxtNombreView" class="control-label mb-1">Nombres</label>
                                <input id="TxtNombreView" name="TxtNombreView" type="text" maxlength="500" readonly="readonly" class="form-control Letter" aria-required="true" aria-invalid="false">
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
    <script src="<% = ResolveClientUrl("~/Content/Plugins/Editor/editor.js") %>"></script>
    <script src="Message.js"></script>
</asp:Content>
