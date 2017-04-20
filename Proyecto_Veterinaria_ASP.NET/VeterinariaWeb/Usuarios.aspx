<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="VeterinariaWeb.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div class="form-horizontal">
        <h2></h2>
        <h4>Class1</h4>
        <hr />
        
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Identificación" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDuennoID" runat="server" CssClass="form-control entrada" ></asp:TextBox> 
                @Html.ValidationMessageFor(model => model.usuarioID, "", new { @class = "text-danger" })
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Identificación" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control entrada" ></asp:TextBox> 
                @Html.ValidationMessageFor(model => model.nombreUsuario, "", new { @class = "text-danger" })
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Identificación" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control entrada" ></asp:TextBox> 
                @Html.ValidationMessageFor(model => model.password, "", new { @class = "text-danger" })
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Identificación" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control entrada" ></asp:TextBox> 
                @Html.ValidationMessageFor(model => model.tipoUsuarioID, "", new { @class = "text-danger" })
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click"/>
            </div>
        </div>
    </div>
    
    </form>
</body>
</html>
