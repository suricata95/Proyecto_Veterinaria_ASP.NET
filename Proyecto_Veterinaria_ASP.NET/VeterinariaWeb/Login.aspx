<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VeterinariaWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/Login.css" rel="stylesheet" />
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/jquery-3.1.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">
    <div class="row">
        <div class="col-md-offset-5 col-md-7">
            <div class="form-login">
            <h4>
            <asp:Label ID="Label1" runat="server" Text="Bienvenido: "></asp:Label></h4>            
            <input type="text" id="txtNombreUsuario" class="form-control input-sm chat-input" placeholder="Nombre de usuario" runat="server"/>
            <br />            
            <input type="password" id="txtContrasena" class="form-control input-sm chat-input" placeholder="Contraseña" runat="server"/>
            <br />
            <div class="wrapper">
            <span class="group-btn"> 
                <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar sesion" OnClick="btnIniciarSesion_Click"  CssClass="btn btn-primary btn-md"/> 
                <%--<a href="Usuarios.aspx">¿No tienes usuario?</a>--%>      
            </span>
            </div>
            </div>
        
        </div>
    </div>
</div>
    
    </div>
    </form>
</body>
</html>
