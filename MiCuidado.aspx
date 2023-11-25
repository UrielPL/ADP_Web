<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MiCuidado.aspx.cs" Inherits="ADP.MiCuidado" MasterPageFile="ADP.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .btnLogin {
            background-color: #8BC34A
        }

            .btnLogin:hover {
                background-color: #558B2F
            }

        .selected {
            border: 3px solid blue;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="content">
        <div class="center-align" style="margin-top: 5%;">
            <div style="margin-left: 30%; margin-right: 30%; background-color: white; padding: 10px; border-radius: 5px;" class="z-depth-4">
                <h3>¡Permiteme conocerte mejor!</h3>
                <div class="row" style="width: 80%;">
                    <div class="col s12 m5 " style="margin-left: 4%; margin-right: 4%">
                        <div class="card" style="cursor: pointer;" onclick="cardSelected(this)">
                            <div class="card-image">
                                <img src="img/mujer.png">
                                <span class="card-title" style="font-weight: 500">MUJER</span>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m5">
                        <div class="card" style="cursor: pointer;" onclick="cardSelected(this)">
                            <div class="card-image">
                                <img src="img/hombre.png">
                                <span class="card-title" style="font-weight: 500">HOMBRE</span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row" style="width: 80%;">
                    <div class="col s12 m5 input-field" style="margin-left: 4%; margin-right: 4%">
                        <div class="input-field">
                            <input id="edad" type="number" style="width: 80%" />
                            <label for="edad">Edad</label>
                        </div>
                        <div class="input-field">
                            <input id="altura" type="number" style="width: 80%" />
                            <label for="altura">Altura (cm)</label>
                        </div>
                        <div class="input-field">
                            <input id="peso" type="number" style="width: 80%" />
                            <label for="peso">Peso (kg)</label>
                        </div>
                    </div>
                    <div class="col s12 m5 input-field">
                        <div class="input-field">
                            <input id="cadera" type="number"style="width: 80%" />
                            <label for="cadera">Cadera (cm)</label>
                        </div>
                        <div class="input-field">
                            <input id="cintura" type="number" style="width: 80%" />
                            <label for="cintura">Cintura (cm)</label>
                        </div>
                        <div class="input-field">
                            <select id="actividades" class="input-field" style="width: 80%">
                                <option value="" disabled selected>Actividad</option>
                                <option value="1">Ejercicio intenso</option>
                                <option value="2">Ejercicio ocasional</option>
                                <option value="3">Deportista de alto rendimiento</option>
                                <option value="3">Nada</option>
                            </select>
                        </div>

                    </div>
                </div>
                <a class="waves-effect waves-light btn btnLogin" style="width: 80%; margin-top: 2rem;" onclick="calculaIMC()">Calcular IMC</a>
                <p></p>
            </div>
        </div>
    </div>

    <script>
        var id = localStorage.getItem("id");

        $(document).ready(function () {
            $('select').formSelect();


            $.ajax({
                url: '<%=ResolveUrl("MiCuidado.aspx/traeUser")%>',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                type: 'POST',
                async: false,
                data: JSON.stringify({ id: id }),
                success: function (response) {
                    var json = response.d;
                    console.log(json);
                    $('#edad').val(json.Edad);

                }
            });

        });

        function cardSelected(card) {
            const cards = document.querySelectorAll('.card');
            cards.forEach(function (card) {
                card.classList.remove('selected');
            });

            card.classList.add('selected');
        }

        function calculaIMC() {
            var altura = $('#altura').val();
            var peso = $('#peso').val();

            console.log(altura);
            console.log(peso);

            if (altura == "" || peso == "") {
                //alert('Llena los campos de altura y peso para calcular tu IMC');
                Swal.fire({
                    title: 'Error!',
                    text: 'Asegurate de llenar los campos de ALTURA y PESO',
                    icon: 'warning',
                    confirmButtonText: 'OK'
                });
            } else {
                var alturaMetros = altura * 0.01;
                var alturaMetrosCuad = alturaMetros * alturaMetros;

                var IMC = peso / alturaMetrosCuad;
                console.log(IMC);

                Swal.fire({
                    title: 'Tu IMC!',
                    text: 'Tu IMC calculado es de: ' + IMC,
                    icon: 'success',
                    confirmButtonText: 'OK'
                });
                //alert('Tu IMC de acuerdo a tu estatura y peso es de: ' + IMC);
            }

        }
    </script>
</asp:Content>
