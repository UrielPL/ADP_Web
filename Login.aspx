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
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="content">
        <div class="center-align" style="margin-top:10%;">
            <div style="margin-left:30%; margin-right:30%; background-color:white; padding:10px; border-radius:5px;" class="z-depth-4">
                <h3>Bienvenido!</h3>
                <input type="text" placeholder="Username" style="width:80%"/>
                <input type="password" placeholder="Password" style="width:80%"/>
                <a class="waves-effect waves-light btn btnLogin" style="width:80%; margin-top:2rem;">Login</a>
                <p>Not registered? <a style="cursor:pointer;">Create an account</a></p>
            </div>
        </div>
    </div>
</asp:Content>
