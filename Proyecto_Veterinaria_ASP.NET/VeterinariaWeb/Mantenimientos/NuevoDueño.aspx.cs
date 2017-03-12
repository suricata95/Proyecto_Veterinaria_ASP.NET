using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebService;
using VeterinariaEntidades;

namespace VeterinariaWeb.Dueño
{
    public partial class NuevoDueño : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            
            DuennoEntidad duennoW = new DuennoEntidad();
            if (Page.IsPostBack && IsValid)
            {
                duennoW.duennoID = Convert.ToInt32(txtDuennoID.Text.ToString());
                duennoW.nombreDuenno = txtNombre.Text;
                duennoW.apellidosDuenno = txtApellidos.Text;
                duennoW.telefonoDuenno = txtTelefono.Text;
                duennoW.correoDuenno = txtCorreo.Text;
                
            }
            servicio.insertarDuenno(duennoW);
            LimpiarRegistro(); //Limpia los campos una vez ingresado el objeto

           

        }

        

        private void LimpiarRegistro()
        {
            txtDuennoID.Text = "";
            txtNombre.Text = "";
            txtApellidos.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
        }
    }
}