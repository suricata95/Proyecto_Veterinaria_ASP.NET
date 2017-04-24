<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="VeterinariaWeb.Usuarios" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/huellas.css" rel="stylesheet" />
    <link href="css/formulario.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title>Nuevo Usuario</title>
   
</head>
<body>
    <form id="form1" runat="server">
 <asp:scriptmanager runat="server"></asp:scriptmanager>
        <div id="mosaico-izquierda">
        </div>

        <div id="mosaico-derecha">
        </div>
        <div class="container body-content">
            <div class="form-horizontal">
                <h2>Crear nuevo usuario</h2>
                <h4>Usuario</h4>
                <hr />

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Identificación" CssClass="control-label col-md-2"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtID" runat="server" CssClass="form-control entrada"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender runat="server" Mask="9-9999-9999" TargetControlID="txtID" ID="txtID_MaskedEditExtender"></ajaxToolkit:MaskedEditExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Digite identificación" ControlToValidate="txtID"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Nombre" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control entrada" ></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Digite nombre" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Contraseña" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtContra" runat="server" CssClass="form-control entrada" TextMode="Password"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Digite contraseña" ControlToValidate="txtContra"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Rol" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">                
                <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control entrada">
                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                    <asp:ListItem Value="2">M&#233;dico</asp:ListItem>
                    <asp:ListItem Value="3">Enfermero</asp:ListItem>
                </asp:DropDownList>
                
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click"/>
            </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
