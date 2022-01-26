<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="UsersCampanas.aspx.cs" Inherits="QaVision.View.Admin.UsersCampanas" %>

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
                <strong id="TForm">Ver Cuentas - Usuarios</strong>
            </div>
            <div class="card-body card-block">
                <div id="BlockButton">
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <div class="form-group">
                                <button type="button" id="btn_VU" class="btn btn-primary btn-block Top" onclick="javascript:ModalForm(1)">
                                    <i class="fa fa-user"></i>&nbsp;Ver Usuarios
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <div class="form-group">
                                <button type="button" id="btn_VC" class="btn btn-info btn-block Top" onclick="javascript:ModalForm(2)">
                                    <i class="fa fa-briefcase"></i>&nbsp;Ver Cuentas
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                    </div>
                </div>
                <div id="BlockUser" style="display: none;">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="DListUsers" class="control-label mb-1">Usuarios</label>
                                <select id="DListUsers" data-placeholder="Seleccione Usuario." class="standardSelect" tabindex="1">
                                </select>
                                <label id="helpUsers" class="Help"></label>
                            </div>
                        </div>
                    </div>
                    <div id="BlockDataUser">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6">
                                <div class="form-group">
                                    <label for="TxtNombreCompleto" class="control-label mb-1">Nombre Completo</label>
                                    <input id="TxtNombreCompleto" name="TxtNombreCompleto" readonly="readonly" type="text" maxlength="250" class="form-control Letter" aria-required="true" aria-invalid="false">
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-3">
                                <div class="form-group">
                                    <label for="TxtDocumento" class="control-label mb-1">Documento</label>
                                    <input id="TxtDocumento" name="TxtDocumento" type="text" readonly="readonly" maxlength="250" class="form-control Letter" aria-required="true" aria-invalid="false">
                                </div>
                            </div>
                        </div>
                        <div class="row" style="width: 100%;">
                            <div id="Grid_CampanaUser" style="width: 100%;"></div>
                        </div>
                    </div>
                </div>
                <div id="BlockCampana" style="display: none;">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6">
                            <div class="form-group">
                                <label for="DListCampana" class="control-label mb-1">Cuentas</label>
                                <select id="DListCampana" data-placeholder="Seleccione Cuenta." class="standardSelect" tabindex="1">
                                </select>
                                <label id="helpCampana" class="Help"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="width: 100%;">
                        <div id="Grid_UserCampana" style="width: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalAddCampanas" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Asignar Cuentas</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="col-xs-6 col-sm-6">
                        <div class="form-group">
                            <label for="DListSelectCampanaAdd" class="control-label mb-1">Seleccione Cuenta</label>
                            <select id="DListSelectCampanaAdd" data-placeholder="Seleccione Cuenta." class="standardSelect" tabindex="1">
                            </select>
                            <label id="helpSelectCampanaAdd" class="Help"></label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6">
                        <div class="form-group">
                            <label for="DListRol" class="control-label mb-1">Perfil</label>
                            <select id="DListRol" data-placeholder="Seleccione Perfil." class="standardSelect" tabindex="1">
                            </select>
                            <label id="helpRol" class="Help"></label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-xs-12 col-sm-12">
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="Btn_ReversaC" class="btn btn-danger btn-block" data-dismiss="modal">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;Cancelar 
                            </button>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <button type="button" id="Btn_Add" class="btn btn-success btn-block " onclick="javascript:Btn_AddCampanas();">
                                <i class="fa fa-check-square"></i>&nbsp;Confirmar 
                            </button>
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
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Asignar - Desasignar Cuenta</h4>
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
                                <label for="TxtNombreView" class="control-label mb-1">Cuenta</label>
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
    <script src="UsersCampanas.js"></script>
</asp:Content>
