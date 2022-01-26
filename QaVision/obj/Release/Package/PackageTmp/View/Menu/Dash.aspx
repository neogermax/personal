<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Master.Master" AutoEventWireup="true" CodeBehind="Dash.aspx.cs" Inherits="QaVision.View.Menu.Dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<% = ResolveClientUrl("~/Content/Template/vendors/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/Plugins/NeoG_Message/css/NeoG_Message.css") %>" rel="stylesheet" />
    <link href="<% = ResolveClientUrl("~/Content/css/StyleForm.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="Neog_Message"></div>
    <div id="ContainerDahs">
    </div>
    <div class="modal fade" id="SeleccionCampana" role="dialog">
        <div class="modal-dialog modal-lg" style="height: 400px">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xs-10 col-sm-10">
                        <h4 class="modal-title" style="font-weight: bold; color: #8e8e8e; font-size: 25px;">Seleccione cuenta a gestionar</h4>
                    </div>
                    <div class="col-xs-2 col-sm-2">
                        <!--	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-12">
                        <div class="form-group">
                            <label for="DListSelectCampana" class="control-label mb-1">Cuenta</label>
                            <select id="DListSelectCampana" data-placeholder="Seleccione Cuenta." class="standardSelect" tabindex="1">
                            </select>
                            <label id="helpSelectCampana" class="Help"></label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-xs-12 col-sm-12">
                        <div class="col-xs-3 col-sm-3">
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <button type="button" id="Btn_Asignar" style="display: none;" class="btn btn-success btn-block " onclick="javascript:Btn_Asignacion(0);">
                                <i class="fa fa-arrow-circle-right"></i>Seleccionar 
                            </button>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="<% = ResolveClientUrl("~/Content/Template/vendors/chosen/chosen.jquery.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Plugins/NeoG_Message/js/NeoG_Message.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Master.js") %>"></script>
    <script src="<% = ResolveClientUrl("~/Content/Js/Proccess.js") %>"></script>
    <script src="Dash.js"></script>
</asp:Content>
