<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ADP.SignUp" MasterPageFile="ADP.Master"%>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
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
        <div class="center-align" style="margin-top:5%;">
            <div style="margin-left:30%; margin-right:30%; background-color:white; padding:10px; border-radius:5px;" class="z-depth-4">
                <h3>Crea tu cuenta!</h3>
                <div style="width:80%; margin-left:10%">
                    <div class="input-field col s6 mt-0">
                        <input type="text" id="nombre"/>
                        <label for="nombre">Nombre</label>
                    </div>
                    <div class="input-field col s6 mt-0">
                        <input type="text" id="apellidos"/>
                        <label for="apellidos">Apellidos</label>
                    </div>
                    <div class="input-field col s6 mt-0">
                        <input type="email" id="email"/>
                        <label for="email">Correo</label>
                    </div>
                    <div class="input-field col s6 mt-0">
                        <input type="password" id="pass"/>
                        <label for="pass">Contraseña</label>
                    </div>
                    <div class="input-field col s6 mt-0">
                        <input type="text" class="datepicker" id="fecha">
                        <label for="fecha">Fecha de nacimiento</label>
                    </div>
                    <div class="input-field col s6 mt-0">
                        <input type="number" id="edad"/>
                        <label for="edad">Edad</label>
                    </div>
                    <div class="input-field col s6 mt-0">
                        <select id="genero">
                            <option value="">Selecciona una opcion</option>
                            <option value="Hombre">Hombre</option>
                            <option value="Mujer">Mujer</option>
                        </select>
                        <label>Genero</label>
                    </div>
                </div>
                <a class="waves-effect waves-light btn btnLogin" style="width:80%; margin-top:2rem;" onclick="signup()">Sign Up</a>
                <p>Already an account? <a href="Login.aspx" style="cursor:pointer;">Sign In</a></p>
            </div>
        </div>
    </div>

    <script>
        var id = localStorage.getItem("id");

        $(document).ready(function () {
            $('.datepicker').datepicker({
                yearRange: 80
            });
            $('select').formSelect();

            if (id != null) {
                window.location.href = "MiCuidado.aspx";
            }

        });

        function signup() {
            var nombre = $('#nombre').val();
            var apellidos = $('#apellidos').val();
            var fecha = $('#fecha').val();
            var edad = $('#edad').val();
            var genero = $('#genero').val();
            var email = $('#email').val();
            var pass = $('#pass').val();

            $.ajax({
                url: '<%=ResolveUrl("SignUp.aspx/registrar")%>',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                type: 'POST',
                async: false,
                data: JSON.stringify({nombre: nombre, apellidos: apellidos, fecha: fecha, edad: edad, genero: genero, email: email, pass:pass}),
                success: function (response) {
                    var data = response.d;

                    if (data != -1) {
                        localStorage.setItem("id", data);
                        window.location.href = "MiCuidado.aspx";
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: 'Hubo un error, intentalo mas tarde',
                            icon: 'warning',
                            confirmButtonText: 'OK'
                        })
                    }
                    

                }
            });
        }
    </script>
</asp:Content>