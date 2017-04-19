<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="NuevoPaciente.aspx.cs" Inherits="VeterinariaWeb.MantenimientoPacientes" %>
<%@Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        function ConfirmarIngresoPacientes() {
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
                    return location.href = "NuevoPaciente.aspx";
            }
        }
       
    </script>

    <script type="text/javascript">    
    function ConfirmarCedulaPaciente() {
            valor = document.getElementById("txtDuennoID").value;
            if (!(/^\d{9}$/.test(valor))) {
                alert("Digite los 9 digitos de la cedula");
            }
        }

    </script>
  
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
        <%-- <div class="form-group">
            <asp:Label ID="Label9" runat="server" Text="ID Paciente" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtPacienteID" runat="server" CssClass="form-control entrada" ReadOnly="True"></asp:TextBox>
                <%-- ReadOnly solo para que sea de LECTURA --%>
        <%--    </div>
        </div>--%>
        
        <div class="form-group">

            <asp:Label ID="Label1" runat="server" Text="Nombre" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <%-- Copie todas las clases de css para cada etiqueta , por ejemplo si quita la etiqueta "entrada" el textbox queda del ancho de la pantalla --%>
                 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese nombre del paciente" ControlToValidate="txtNombre" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>
        <%-- Y aquí termina el maquetado, los otros controles es seguir la misma logica --%>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Edad" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtEdad" TextMode="Number" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese la edad" ControlToValidate="txtEdad" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Peso" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtPeso" TextMode="Number" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el peso" ControlToValidate="txtPeso" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Especie" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtEspecie" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese la especie del paciente" ControlToValidate="txtEspecie" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Raza" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtRaza" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese la raza del paciente" ControlToValidate="txtRaza" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Color" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtColor" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el color del paciente" ControlToValidate="txtColor" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        
        
        <div class="form-group">
            <asp:Label ID="Label7" Text="Cliente" runat="server" CssClass="control-label col-md-2">
            </asp:Label>


            <div class="col-md-10">

                <%-- Aqui estaria bueno hacer que el dueño se seleccione como en la aplicacion suya , abriendo otra pagina web pero pequeña o un datagrid
                    pero hay que investigar como hacerlo --%>
                <asp:TextBox ID="txtDuennoID" runat="server" CssClass="form-control entrada" OnTextChanged="btnBuscar_Click" AutoPostBack="true"></asp:TextBox>
                <br/>
                 <ajaxToolkit:MaskedEditExtender ID="mskDuennoID" Mask="9-9999-9999" runat="server" TargetControlID="txtDuennoID"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="validar" ErrorMessage="Dígite la cédula con 9 dígitos" ControlToValidate="txtDuennoID" ValidationExpression="^\d{9}$" ForeColor="#ff0000"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="validar" ErrorMessage="Debe buscar el cliente" ControlToValidate="txtDuennoID" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView runat="server" ID="grvDuennos" CssClass="col-md-10">

                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="txtDuennoID" EventName="TextChanged" />
                    </Triggers>
                  </asp:UpdatePanel>

           </div>

        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Genero" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlGenero" runat="server" AutoPostBack="true" CssClass="form-control entrada" >
                    <asp:ListItem Text="Macho" Value="1" Selected="True">Macho</asp:ListItem>
                    <asp:ListItem Text="Hembra" Value="2">Hembra</asp:ListItem>
                </asp:DropDownList>                

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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="validar" ErrorMessage="Mencione observaciones del paciente" ControlToValidate="txtObservaciones" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" ValidationGroup="validar" CssClass="btn btn-default" OnClick="btnNuevo_Click" />
            </div>
        </div>

      </div>

    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
            <td colspan="2">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                <h4>Pacientes registrados</h4>  
               
        <tr>
            <td colspan="2">
                <asp:GridView ID="grvPacientes" runat="server"
                    DataKeyNames="PacienteID" 
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton ="true"
                    AutoGenerateDeleteButton ="true"
                    OnRowCancelingEdit="grvPacientes_RowCancelingEdit"
                    OnRowEditing="grvPacientes_RowEditing"
                    OnRowDataBound="grvPacientes_RowDataBound"
                    OnRowUpdating="grvPacientes_RowUpdating"
                    OnRowDeleting="grvPacientes_RowDeleting">

                    <Columns>
                        <asp:TemplateField HeaderText="ID Paciente" >
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("pacienteID")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="pacienteID"  runat="server" Text='<%# Eval("pacienteID") %>' ReadOnly="true"/>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                        
                        <asp:TemplateField HeaderText="Paciente">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("nombrePaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="nombrePaciente" runat="server" Text='<%# Bind("nombrePaciente") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edad">
                            <ItemTemplate>
                                <asp:Label ID="lblEdad" runat="server" Text='<%# Eval("edadPaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="edadPaciente" runat="server" Text='<%# Bind("edadPaciente") %>'></asp:TextBox>
                                  

                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Peso">
                            <ItemTemplate>
                                <asp:Label ID="lblPeso" runat="server" Text='<%# Eval("pesoPaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="pesoPaciente" runat="server" Text='<%# Bind("pesoPaciente") %>'></asp:TextBox>
                                  <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un correo elétronico válido" ControlToValidate="txtCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#cc0000"></asp:RegularExpressionValidator> <%--Validacion para que lo que se ingreso en el campo sea con formato correcto--%>
   
                            </EditItemTemplate>
                        </asp:TemplateField>
                        

                        <asp:TemplateField HeaderText="Especie">
                            <ItemTemplate>
                                <asp:Label ID="lblEspecie" runat="server" Text='<%# Eval("especiaPaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="especiaPaciente" runat="server" Text='<%# Bind("especiaPaciente") %>'></asp:TextBox>
                                  <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un correo elétronico válido" ControlToValidate="txtCorreoD" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#cc0000"></asp:RegularExpressionValidator> <%--Validacion para que lo que se ingreso en el campo sea con formato correcto--%>
     
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Raza">
                            <ItemTemplate>
                                <asp:Label ID="lblRaza" runat="server" Text='<%# Eval("razaPaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="razaPaciente" runat="server" Text='<%# Bind("razaPaciente") %>'></asp:TextBox>
                                  <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un correo elétronico válido" ControlToValidate="txtCorreoD" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#cc0000"></asp:RegularExpressionValidator> <%--Validacion para que lo que se ingreso en el campo sea con formato correcto--%>
     
                            </EditItemTemplate>
                        </asp:TemplateField>


                         <asp:TemplateField HeaderText="Color">
                            <ItemTemplate>
                                <asp:Label ID="lblColor" runat="server" Text='<%# Eval("colorPaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="colorPaciente" runat="server" Text='<%# Bind("colorPaciente") %>'></asp:TextBox>
                                  <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un correo elétronico válido" ControlToValidate="txtCorreoD" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#cc0000"></asp:RegularExpressionValidator> <%--Validacion para que lo que se ingreso en el campo sea con formato correcto--%>
     
                            </EditItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Genero">
                            <ItemTemplate>
                                <asp:Label ID="lblGenero" runat="server" Text='<%# Eval("genero") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                       
                             <asp:DropDownList ID="ddlGenero1" runat="server" AutoPostBack="true"  >
                                <asp:ListItem Text="Macho" Value="1" Selected="True">Macho</asp:ListItem>
                                <asp:ListItem Text="Hembra" Value="2">Hembra</asp:ListItem>
                            </asp:DropDownList>   

                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Dueño">
                            <ItemTemplate>
                                <asp:Label ID="lblDueño" runat="server" Text='<%# Eval("duennoID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="duennoID" runat="server" Text='<%# Bind("duennoID") %>' ReadOnly="true"></asp:TextBox>
                                
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Observaciones">
                            <ItemTemplate>
                                <asp:Label ID="lblObs" runat="server" Text='<%# Eval("observacionesPaciente") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="observacionesPaciente" runat="server" Text='<%# Bind("observacionesPaciente") %>'></asp:TextBox>
                                
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
