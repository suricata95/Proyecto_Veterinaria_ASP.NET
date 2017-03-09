<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="MantenimientoPacientes.aspx.cs" Inherits="VeterinariaWeb.MantenimientoPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-md-4">
            <fieldset class="form-group">
                <legend>Nombre</legend>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
             <fieldset class="form-group">
                <legend>Edad</legend>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
             <fieldset class="form-group">
                <legend>Peso</legend>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
             <fieldset class="form-group">
                <legend>Especie</legend>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
             <fieldset class="form-group">
                <legend>Raza</legend>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>            
        </div>
        <div class="col-md-4">
            
             <fieldset class="form-group">
                <legend>Color</legend>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
             <fieldset class="form-group">
                <legend>Genero</legend>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
             <fieldset class="form-group">
                <legend>Dueño</legend>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
             <fieldset class="form-group">
                <legend>Veterinaria</legend>
                <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>
            <fieldset class="form-group">
                <legend>Observaciones</legend>
                <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>
            </fieldset>            
        </div>
        
            <asp:Button ID="Button1" runat="server" Text="Button" CssClass="bottom btn btn-primary btn-sm" />
        
    </div>
</asp:Content>
