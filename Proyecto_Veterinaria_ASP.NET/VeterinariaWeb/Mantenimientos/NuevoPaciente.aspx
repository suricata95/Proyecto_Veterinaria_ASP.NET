<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="NuevoPaciente.aspx.cs" Inherits="VeterinariaWeb.MantenimientoPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Pense que sería buena idea trabajar cada mantenimiento en carpetas tomando como principal de cada mantenimiento un listado y 
        agregando a esa pagina enlaces para las paginas de insertar editar y eliminar --%>
    <%-- El formulario para editar sigue la misma logica --%>
    <%-- Este h2 para informar a cual mantenimiento pertenece --%>
    <h2>Manejo de pacientes</h2>
    <div class="form-horizontal">
        <%-- Este h4 para informar cual acción esta realizando --%>
        <h4>Nuevo Paciente</h4>
        <%-- Aquí comienza el maquetado para un control ejemplo un textbox --%>
         <div class="form-group">
            <asp:Label ID="Label9" runat="server" Text="ID Paciente" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtPacienteID" runat="server" CssClass="form-control entrada" ReadOnly="True"></asp:TextBox>
                <%-- ReadOnly solo para que sea de LECTURA --%>
            </div>
        </div>


        <div class="form-group">

            <asp:Label ID="Label1" runat="server" Text="Nombre" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <%-- Copie todas las clases de css para cada etiqueta , por ejemplo si quita la etiqueta "entrada" el textbox queda del ancho de la pantalla --%>
                 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>
        <%-- Y aquí termina el maquetado, los otros controles es seguir la misma logica --%>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Edad" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtEdad" TextMode="Number" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Peso" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtPeso" TextMode="Number" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Especie" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtEspecie" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Raza" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtRaza" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Color" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtColor" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Dueño" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <%-- Aqui estaria bueno hacer que el dueño se seleccione como en la aplicacion suya , abriendo otra pagina web pero pequeña o un datagrid
                    pero hay que investigar como hacerlo --%>
                <asp:TextBox ID="txtDueño" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Genero" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlGenero" runat="server" CssClass="form-control entrada"></asp:DropDownList>                
            </div>
        </div>

      <%--  <div class="form-group">
            <asp:Label ID="Label9" runat="server" Text="Veterinaria" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtVeterinaria" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>--%>

        <div class="form-group">
            <asp:Label ID="Label10" runat="server" Text="Observaciones" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtObservaciones" TextMode="MultiLine" runat="server" CssClass="form-control entrada"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default"/>
            </div>
        </div>

        

      </div>
</asp:Content>
