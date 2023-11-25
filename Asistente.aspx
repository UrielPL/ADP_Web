<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asistente.aspx.cs" Inherits="ADP.Asistente" MasterPageFile="ADP.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
   
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <script SameSite="None; Secure" src="https://cdn.landbot.io/landbot-3/landbot-3.0.0.js"></script>
    <script>
        var myLandbot = new Landbot.Fullpage({
            configUrl: 'https://storage.googleapis.com/landbot.online/v3/H-1780078-HWCD0Y9NUWWFSYJD/index.json',
        });
    </script>
</asp:Content>
