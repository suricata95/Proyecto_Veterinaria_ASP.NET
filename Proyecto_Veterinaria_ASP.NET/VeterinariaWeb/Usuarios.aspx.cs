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
    public partial class Usuarios : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            UsuariosEntidad usuario = new UsuariosEntidad();
            if (Page.IsValid && Page.IsPostBack)
            {
                usuario.usuarioID = Convert.ToInt32(txtID.ToString());
                usuario.nombreUsuario = txtNombre.Text;
                usuario.password = txtContra.Text;
                usuario.tipoUsuarioID = Convert.ToInt16(ddlRol.SelectedValue);
            }
        }
    }
}