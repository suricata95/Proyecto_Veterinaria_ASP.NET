<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="FiltroDuenno.aspx.cs" Inherits="VeterinariaWeb.Filtros.FiltroDuenno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="form-group">
        <asp:Label Text="Ingrese la cédula del cliente" ID="Label1" CssClass="form-control-static" runat="server" />
        <asp:TextBox ID="txtFiltroCedula" runat="server" /> 
        
        <asp:Button Text="BUSCAR" ID="btnBuscar" runat="server" OnClick="btnBuscar_Click"/>
         
    </div>
    <asp:GridView runat="server" ID="grvDuennos" OnSelectedIndexChanged="grvDuennos_SelectedIndexChanged">

    </asp:GridView>
</asp:Content>
