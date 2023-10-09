<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asistente.aspx.cs" Inherits="ADP.Asistente" MasterPageFile="ADP.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
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
                        <input id="edad" type="number" placeholder="Edad" style="width: 80%" />
                        <input id="altura" type="number" placeholder="Altura (cm)" style="width: 80%" />
                        <input id="peso" type="number" placeholder="Peso (kg)" style="width: 80%" />
                    </div>
                    <div class="col s12 m5 input-field">
                        <input type="number" placeholder="Cadera (cm)" style="width: 80%" />
                        <input type="number" placeholder="Cintura (cm)" style="width: 80%" />
                            <select id="actividades" class="input-field" style="width: 80%">
                                <option value="" disabled selected>Actividad</option>
                                <option value="1">Ejercicio intenso</option>
                                <option value="2">Ejercicio ocasional</option>
                                <option value="3">Deportista de alto rendimiento</option>
                                <option value="3">Nada</option>
                            </select>


                    </div>
                </div>
                <a class="waves-effect waves-light btn btnLogin" style="width: 80%; margin-top: 2rem;" onclick="calculaIMC()">Calcular IMC</a>
                <p></p>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('select').formSelect();
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
                alert('Llena los campos de altura y peso para calcular tu IMC');
            } else {
                var alturaMetros = altura * 0.01;
                var alturaMetrosCuad = alturaMetros * alturaMetros;

                var IMC = peso / alturaMetrosCuad;
                console.log(IMC);
                alert('Tu IMC de acuerdo a tu estatura y peso es de: ' + IMC);
            }
            

            
        }
    </script>
</asp:Content>
