﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="NuevoTratamiento.aspx.cs" Inherits="VeterinariaWeb.Mantenimientos.NuevoTratamiento" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">

    <script type="text/javascript">
        function ConfirmarIngresoTratamientos() {
            //var mensaje1 = alert("Ingrese primero los datos");
            
            //if (mensaje1) {
            //    location.href = "NuevoDueño.aspx";
            //}            
                var mensaje1 = confirm("¿Desea completar el ingreso?");
                if (mensaje1) {
                    alert("Datos ingresados");
                } else {
                    alert("Se canceló el ingreso de datos");
                    event.preventDefault(); //Con esto se evita que se inserte, dandole click en cancelar.
                    return location.href = "NuevoTratamiento.aspx";
            }
        }
       
    </script>

</asp:Content>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Pense que sería buena idea trabajar cada mantenimiento en carpetas tomando como principal de cada mantenimiento un listado y 
        agregando a esa pagina enlaces para las paginas de insertar editar y eliminar --%>
    <%-- El formulario para editar sigue la misma logica --%>
    <%-- Este h2 para informar a cual mantenimiento pertenece --%>
    <h2>Manejo de tratamientos</h2>
    <div class="form-horizontal">
        <%-- Este h4 para informar cual acción esta realizando --%>
        <h4>Nuevo Tratamiento</h4>
        <%-- Aquí comienza el maquetado para un control ejemplo un textbox --%>
        


        <div class="form-group">

            <asp:Label ID="Label1" runat="server" Text="Paciente ID" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <%-- Copie todas las clases de css para cada etiqueta , por ejemplo si quita la etiqueta "entrada" el textbox queda del ancho de la pantalla --%>
                 <asp:TextBox ID="txtPacienteID" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el Paciente" ControlToValidate="txtPacienteID" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%-- Y aquí termina el maquetado, los otros controles es seguir la misma logica --%>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Descripcion" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control entrada"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese una descripción" ControlToValidate="txtDescripcion" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <%--<asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click" OnClientClick="return ConfirmarIngreso();"/>--%>
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" ValidationGroup="validar" CssClass="btn btn-default" OnClick="btnNuevo_Click"/>
            </div>
        </div>

         

      </div>

    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
              
            <td colspan="2">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                <h4>Tratamientos registrados</h4>
             <tr>
                <td colspan="2">
                        <asp:GridView ID="grvTratamientos" runat="server"
                    DataKeyNames="TratamientoID" 
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton ="true"
                    AutoGenerateDeleteButton ="true"
                    OnRowCancelingEdit="grvTratamientos_RowCancelingEdit"
                    OnRowEditing="grvTratamientos_RowEditing"
                    OnRowDataBound="grvTratamientos_RowDataBound"
                    OnRowUpdating="grvTratamientos_RowUpdating"
                    OnRowDeleting="grvTratamientos_RowDeleting">

                    <Columns>
                       
                        
                        
                        <asp:TemplateField HeaderText="Paciente">
                            <ItemTemplate>
                                <asp:Label ID="lblPaciente" runat="server" Text='<%# Eval("pacienteID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="pacienteID" runat="server" Text='<%# Bind("pacienteID") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descripción">
                            <ItemTemplate>
                                <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("descripcionTratamiento") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="descripcionTratamiento" runat="server" Text='<%# Bind("descripcionTratamiento") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Nombre Paciente">
                            <ItemTemplate>
                                <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("nombrePaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="nombrePaciente" runat="server" Text='<%# Bind("nombrePaciente") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                       </Columns>
                </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                </td>
            
            </div>
        </div>
</asp:Content>