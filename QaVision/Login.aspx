<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QaVision.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/Plugins/Chosen/Chosen.css" rel="stylesheet" />
    <link href="Content/StyleLogin/bootstrap.min.css" rel="stylesheet" />
    <!--Bootsrap 4 CDN-->
    <link href="Content/StyleLogin/Bootsrap4_CDN/bootstrap.min.css" rel="stylesheet" />
    <!--Fontawesome CDN-->
    <link href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" rel="stylesheet" />
    <link href="Content/Plugins/NeoG_Message/css/NeoG_Message.css" rel="stylesheet" />
    <link href="Content/Css/CssLogin.css" rel="stylesheet" />
    <title></title>
</head>
<body >
    <div class="Neog_Message"></div>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Bienvenido </h3>
                </div>
                <div class="card-body">
                    <form>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input id="user" type="text" class="form-control Numeric" maxlength="15" placeholder="Documento" />
                        </div>
                        <div class="input-group form-group">
                            <div id="BlockPwd" class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input id="pass" type="password" class="form-control" placeholder="Contraseña" />
                        </div>
                        <div class="input-group form-group" id="BlockList" style="display:none;">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-building"></i></span>
                            </div>
                            <select id="Select_Empresa" class="C_Chosen">
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="button" value="Login" class="btn float-right login_btn" onclick="javascript: btn_Ingreso()" />
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <a href="javascript: ValidaUser();" style="color: #FFF;">¿Olvidaste tu contraseña?</a>
                </div>
            </div>
        </div>
    </div>

    <script src="Content/StyleLogin/bootstrap.min.js"></script>
    <script src="Content/StyleLogin/jquery.min.js"></script>
    <script src="Content/Plugins/Chosen/chosen.jquery.js"></script>
    <script src="Content/Plugins/NeoG_Message/js/NeoG_Message.js"></script>
    <script src="View/Login/Login.js"></script>
</body>
</html>
