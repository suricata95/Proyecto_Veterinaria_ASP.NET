<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="NuevoDuenno.aspx.cs" Inherits="VeterinariaWeb.Dueño.NuevoDueño" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        function ConfirmarIngreso() {
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
                    return location.href = "NuevoDueño.aspx";
                
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
    <h2>Manejo de clientes</h2>
    <div class="form-horizontal">
        <%-- Este h4 para informar cual acción esta realizando --%>
        <h4>Nuevo Dueño</h4>
        <%-- Aquí comienza el maquetado para un control ejemplo un textbox --%>
         <div class="form-group">
            <asp:Label ID="Label9" runat="server" Text="Identificación" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDuennoID" runat="server" CssClass="form-control entrada" ></asp:TextBox>                
               <ajaxToolkit:MaskedEditExtender ID="mskDuennoID" Mask="9-9999-9999" runat="server" TargetControlID="txtDuennoID" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese su idenfiticación" ControlToValidate="txtDuennoID" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
                
                <%-- ReadOnly solo para que sea de LECTURA --%>
            </div>
        </div>


        <div class="form-group">

            <asp:Label ID="Label1" runat="server" Text="Nombre" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <%-- Copie todas las clases de css para cada etiqueta , por ejemplo si quita la etiqueta "entrada" el textbox queda del ancho de la pantalla --%>
                 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese su nombre" ControlToValidate="txtNombre" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>
        <%-- Y aquí termina el maquetado, los otros controles es seguir la misma logica --%>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Apellidos" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control entrada"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese su primer y segundo apellido" ControlToValidate="txtApellidos" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Teléfono" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
               <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <ajaxToolkit:MaskedEditExtender ID="mskTelefono" Mask="9999-9999" runat="server" TargetControlID="txtTelefono"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese su teléfono" ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Correo Eléctronico" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control entrada" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtEmailReg" runat="server" ErrorMessage="Ingrese un correo elétronico válido" ControlToValidate="txtCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#cc0000"></asp:RegularExpressionValidator> <%--Validacion para que lo que se ingreso en el campo sea con formato correcto--%>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese su correo" ControlToValidate="txtCorreo" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator> <%--Validacion para que el campo no este vacio--%>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <%--<asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click" OnClientClick="return ConfirmarIngreso();"/>--%>
                <asp:Button ID="Button1" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click"/>
            </div>
        </div>

         <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                 <tr>
            <td colspan="2">
                <h4>Clientes registrados</h4>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="grvClientes" runat="server"
                    DataKeyNames="duennoID" 
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton ="true"
                    OnRowCancelingEdit="grvClientes_RowCancelingEdit"
                    OnRowEditing="grvClientes_RowEditing"
                    OnRowDataBound="grvClientes_RowDataBound"
                    OnRowUpdating="grvClientes_RowUpdating">

                    <Columns>
                        <asp:BoundField DataField="duennoID" HeaderText="Identificaci&#243;n Cliente" ReadOnly="true" ></asp:BoundField>
                        
                        
                        <asp:TemplateField HeaderText="Nombre Cliente">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("nombreDuenno") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNombreD" runat="server" Text='<%# Bind("nombreDuenno") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Apellidos">
                            <ItemTemplate>
                                <asp:Label ID="lblApellidos" runat="server" Text='<%# Eval("apellidosDuenno") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtApellidosD" runat="server" Text='<%# Bind("apellidosDuenno") %>'></asp:TextBox>
                                  

                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Teléfono">
                            <ItemTemplate>
                                <asp:Label ID="lblTelefono" runat="server" Text='<%# Eval("telefonoDuenno") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTelefonoD" runat="server" Text='<%# Bind("telefonoDuenno") %>'></asp:TextBox>
                                  <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un correo elétronico válido" ControlToValidate="txtCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#cc0000"></asp:RegularExpressionValidator> <%--Validacion para que lo que se ingreso en el campo sea con formato correcto--%>
   
                            </EditItemTemplate>
                        </asp:TemplateField>
                        

                        <asp:TemplateField HeaderText="Correo eléctronic">
                            <ItemTemplate>
                                <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("correoDuenno") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCorreoD" runat="server" Text='<%# Bind("correoDuenno") %>'></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un correo elétronico válido" ControlToValidate="txtCorreoD" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#cc0000"></asp:RegularExpressionValidator> <%--Validacion para que lo que se ingreso en el campo sea con formato correcto--%>
                                   

                            </EditItemTemplate>
                        </asp:TemplateField>

                
                       </Columns>
                </asp:GridView>
            </td>
        </tr>
            </div>
        </div>

      </div>
</asp:Content>

