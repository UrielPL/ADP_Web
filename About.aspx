<%@ Page Title="About" Language="C#" MasterPageFile="ADP.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ADP.About" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        
    </style>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="content">
        <div class="center-align" style="margin-top: 5%;">
            <div style="margin-left: 5%; margin-right: 5%; background-color: white; padding: 10px; border-radius: 5px;" class="z-depth-4">
                <image src="img/ADLogo.jpg" style="width: 30rem;"></image>
                <p style="font-size: 20px; margin-left: 10%; margin-right: 10%;">
                    Weight Balance es un sitio en el que podrás consultar diversos temas relacionados a la nutrición y salud. Contamos con
                    nuestra calculadora de IMC para que puedas estar al tanto de tu índice de masa corporal cada vez que lo requieras.
                    Además contamos con nuestro asistente virtual el cual te puede proporcionar información variada sobre cierto tema
                    que requieras relacionado a la salud y nutrición.
                </p>
                <p style="font-size: 20px; margin-left: 10%; margin-right: 10%;">
                    Estamos para ayudarte a estar en constante seguimiento de tu estado de salud y a darte recomendaciones para que vivas una vida
                    mucho más sana. A continuación te presentamos algunas herramientas que ayudan a tener un estilo de vida saludable.
                </p>

                <div class="row">
                   <div class="col l6 m12">
                       <image src="img/plato.jfif" style="width: 45rem;"></image>
                   </div>
                    <div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
