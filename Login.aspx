<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ADP.Login" MasterPageFile="ADP.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .btnLogin{
                background-color: #8BC34A
            }
        .btnLogin:hover{
                background-color: #558B2F
            }
    </style>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="content">
        <div class="center-align" style="margin-top:10%;">
            <div style="margin-left:30%; margin-right:30%; background-color:white; padding:10px; border-radius:5px;" class="z-depth-4">
                <h3>Bienvenido!</h3>
                <input id="user" type="text" placeholder="Email" style="width:80%"/>
                <input id="pass" type="password" placeholder="Password" style="width:80%"/>
                <a class="waves-effect waves-light btn btnLogin" style="width:80%; margin-top:2rem;" onclick="login()">Login</a>
                <p>Not registered? <a href="SignUp.aspx" style="cursor:pointer;">Create an account</a></p>
            </div>
        </div>
    </div>

    <script>
        var id = localStorage.getItem("id");

        $(document).ready(function () {

            if (id != null) {
                window.location.href = "MiCuidado.aspx";
            }

        });

        function login() {
            var email = $('#user').val();
            var pass = $('#pass').val();

            $.ajax({
                url: '<%=ResolveUrl("Login.aspx/loginUser")%>',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                type: 'POST',
                async: false,
                data: JSON.stringify({email: email, pass:pass}),
                success: function (response) {
                    var data = response.d;

                    if (data != -1) {
                        localStorage.setItem("id", data);
                        window.location.href = "MiCuidado.aspx?u=" + data;
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: 'Correo o contraseña incorrectas.',
                            icon: 'warning',
                            confirmButtonText: 'OK'
                        })
                    }
                    

                }
            });
        }
    </script>
</asp:Content>
