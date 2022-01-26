<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPass.aspx.cs" Inherits="QaVision.View.Admin.ResetPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        @font-face {
            font-family: 'TextPrincipal';
            src: url('../../Content/Fonts/Walkway_SemiBold.ttf');
        }

        .container {
            margin-top: 5%;
        }

        .card-header {
            padding: 5px 15px;
        }

        .profile-img {
            width: 96px;
            height: 96px;
            margin: 0 auto 10px;
            display: block;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
        }

        .input-group-prepend span {
            width: 50px;
            background-color: #32fffa;
            color: #194ab0;
            border: 0 !important;
        }

            .input-group-prepend span:hover {
                background-color: #194ab0;
                color: #32fffa;
                border: 0 !important;
                transition: all 0.5s;
            }

        .login_btn {
            color: #194ab0;
            background-color: #32fffa;
            width: 240px;
        }

            .login_btn:hover {
                color: #32fffa;
                background-color: #194ab0;
                font-weight: bold;
                transition: all 0.5s;
            }


        .Help {
            color: #bd2130;
            font-weight: bold;
            font-size: 12px;
            width: 340px;
            display: none;
            margin-left: 25px;
        }
    </style>
</head>
<body style="background-color: #484848; font-family: TextPrincipal;">
    <div class="Neog_Message"></div>
    <link href="../../Content/StyleLogin/Bootsrap4_CDN/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/StyleLogin/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/Plugins/Chosen/Chosen.css" rel="stylesheet" />
    <link href="../../Content/Plugins/NeoG_Message/css/NeoG_Message.css" rel="stylesheet" />
    <!------ Include the above in your HEAD tag ---------->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>

    <div class="">
        <div class="container d-flex justify-content-center">
            <div class="row">
                <div class="card">
                    <div class="card-header" style="background-color: #828282; color: #FFF;">
                        <strong>Cambio de Contraseña</strong>
                    </div>
                    <div class="card-body">
                        <form name="login" id="login">
                            <div class="row">
                                <div class="col">
                                    <span class="profile-img">
                                        <i class="fas fa-user-lock" style='font-size: 100px; color: #828282;'></i>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                    <label id="DataUser"></label>

                                    <!-- other content  -->
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="input-group form-group">
                                        <div id="BlockPwd" class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-user-shield"></i></span>
                                        </div>
                                        <input id="pass" type="password" class="form-control" placeholder="Nueva Contraseña" />
                                    </div>
                                    <div class="row">
                                        <label id="helppass" class="Help"></label>
                                    </div>
                                    <div class="input-group form-group">
                                        <div id="BlockPwd1" class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-user-shield"></i></span>
                                        </div>
                                        <input id="pass1" type="password" class="form-control" placeholder="Confirme Contraseña" />
                                    </div>
                                    <div class="row">
                                        <label id="helppass1" class="Help"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="text-align: center;">
                                <h3 id="Msm" style ="color:#c77a01"></h3>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-star"></i></span>
                                </div>
                                <select id="Select_Colors" class="C_Chosen">
                                </select>
                            </div>
                            <div class="row" style="text-align: center;">
                                <input id="Btn_Changue" type="button"  style="margin-left: 25%;"  value="Cambio Contraseña" class="btn login_btn" onclick="javascript: btn_Cambio()" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../Content/StyleLogin/bootstrap.min.js"></script>
    <script src="../../Content/StyleLogin/jquery.min.js"></script>
    <script src="../../Content/Plugins/Chosen/chosen.jquery.js"></script>
    <script src="../../Content/Plugins/NeoG_Message/js/NeoG_Message.js"></script>
    <script src="ResetPass.js"></script>
</body>
</html>
