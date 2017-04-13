using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeterinariaEntidades;
using WebService;

namespace VeterinariaWeb
{
    public partial class Login : System.Web.UI.Page
    {
        private WebServiceVeterinaria serv = new WebServiceVeterinaria();
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            UsuariosEntidad us = new UsuariosEntidad();
            us = serv.obtieneUsuario(txtNombreUsuario.Value, txtContrasena.Value);
            if(us.nombreUsuario != null){
                Session["nombreUsuario"] = us.nombreUsuario;
                Session["idUsuario"] = us.usuarioID;
                Session["perfilUsuario"] = us.tipoUsuarioID;
                Response.Redirect("Bienvenida.aspx");
            }
            else
            {
                Label1.Text = "Usuario o contraseña incorrectos";
            }
        }
    }
}