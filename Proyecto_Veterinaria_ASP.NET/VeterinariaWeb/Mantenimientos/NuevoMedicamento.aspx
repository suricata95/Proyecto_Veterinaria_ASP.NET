﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="NuevoMedicamento.aspx.cs" Inherits="VeterinariaWeb.Mantenimientos.NuevoMedicamento" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Manejo de medicamentos</h2>
    <div class="form-horizontal">
        <%-- Este h4 para informar cual acción esta realizando --%>
        <h4>Nuevo Medicamento</h4>
        <%-- Aquí comienza el maquetado para un control ejemplo un textbox --%>
        


        <div class="form-group">

            <asp:Label ID="Label1" runat="server" Text="Nombre Medicamento" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <%-- Copie todas las clases de css para cada etiqueta , por ejemplo si quita la etiqueta "entrada" el textbox queda del ancho de la pantalla --%>
                 <asp:TextBox ID="txtNombreMedicamento" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el nombre del medicamento" ControlToValidate="txtNombreMedicamento" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%-- Y aquí termina el maquetado, los otros controles es seguir la misma logica --%>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Fecha Vencimiento" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtFechaVencimiento" runat="server" CssClass="form-control entrada" placeholder="Fecha Vencimiento"></asp:TextBox>
                <ajaxToolkit:CalendarExtender runat="server" Format="dd/MM/yyyy" PopupButtonID="ImageButton1" BehaviorID="txtFecha_CalendarExtender"
                    TargetControlID="txtFechaVencimiento" ID="txtFecha_CalendarExtender"> </ajaxToolkit:CalendarExtender>
                <asp:Image ID="ImageButton1" ImageUrl="~/img/calendar.png" runat="server" AlternateText="Fecha" ImageAlign="Left"/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese la fecha de vencimiento" ControlToValidate="txtFechaVencimiento" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Paciente ID" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10"> 
                <asp:TextBox ID="txtPacienteID" runat="server" CssClass="form-control entrada"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el paciente" ControlToValidate="txtPacienteID" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>


         <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Dosis" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDosis" runat="server" CssClass="form-control entrada"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese la dosis" ControlToValidate="txtDosis" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
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
                <h4>Medicamentos registrados</h4>
             <tr>
                <td colspan="2">
                        <asp:GridView ID="grvMedicamentos" runat="server"
                    DataKeyNames="MedicamentosID" 
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton ="true"
                    AutoGenerateDeleteButton ="true"
                    OnRowCancelingEdit="grvMedicamentos_RowCancelingEdit"
                    OnRowEditing="grvMedicamentos_RowEditing"
                    OnRowDataBound="grvMedicamentos_RowDataBound"
                    OnRowUpdating="grvMedicamentos_RowUpdating"
                    OnRowDeleting="grvMedicamentos_RowDeleting">

                    <Columns>
                       
                        <asp:TemplateField HeaderText="Nombre Medicamento">
                            <ItemTemplate>
                                <asp:Label ID="lblNombreMe" runat="server" Text='<%# Eval("nombreMedicamento") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="nombreMedicamento" runat="server" Text='<%# Bind("nombreMedicamento") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha Vencimiento">
                            <ItemTemplate>
                                <asp:Label ID="lblFechaV" runat="server" Text='<%# Eval("fechaVencimiento") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                             
                                <asp:TextBox ID="fechaVencimiento" runat="server" Text='<%# Bind("fechaVencimiento") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                        
                        <asp:TemplateField HeaderText="Paciente ID">
                            <ItemTemplate>
                                <asp:Label ID="lblPaciente" runat="server" Text='<%# Eval("pacienteID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="pacienteID" runat="server" Text='<%# Bind("pacienteID") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre Paciente">
                            <ItemTemplate>
                                <asp:Label ID="lblPaciente" runat="server" Text='<%# Eval("nombrePaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="nombrePaciente" runat="server" Text='<%# Bind("nombrePaciente") %>' ReadOnly="true"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descripción">
                            <ItemTemplate>
                                <asp:Label ID="lblDosisn" runat="server" Text='<%# Eval("dosis") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="dosis" runat="server" Text='<%# Bind("dosis") %>'></asp:TextBox>
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
