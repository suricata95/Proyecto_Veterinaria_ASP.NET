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
    public partial class MantenimientoPacientes : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            PacientesEntidad paciente = new PacientesEntidad();
            if (Page.IsPostBack && IsValid)
            {
                paciente.nombrePaciente = txtNombre.Text;
                paciente.edadPaciente = Convert.ToInt32(txtEdad.Text);
                paciente.pesoPaciente = Convert.ToDecimal(txtPeso.Text);
                paciente.especiaPaciente = txtEspecie.Text;
                paciente.razaPaciente = txtRaza.Text;
                paciente.colorPaciente = txtColor.Text;
                paciente.duennoID = Convert.ToInt32(txtDuennoID.Text);
                paciente.genero = Convert.ToString(ddlGenero.SelectedItem);
                paciente.observacionesPaciente = txtObservaciones.Text;
            }
            servicio.insertarPaciente(paciente);
            LimpiarRegistro();
            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);
        }

        private void LimpiarRegistro()
        {
            txtPacienteID.Text = "";
            txtNombre.Text = "";
            txtEdad.Text = "";
            txtPeso.Text = "";
            txtEspecie.Text = "";
            txtRaza.Text = "";
            txtColor.Text = "";
            txtDuennoID.Text = "";
            ddlGenero.ClearSelection();
            txtObservaciones.Text = "";
        }

       
    }
}