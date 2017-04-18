using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeterinariaEntidades;
using WebService;

namespace VeterinariaWeb.Mantenimientos
{
    public partial class NuevoEnfermedad : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        EnfermedadesEntidad enfermedad = new EnfermedadesEntidad();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                datosEnfermedades();
            }
        }

        private void datosEnfermedades()
        {
            grvEnfermedades.DataSource = servicio.ObtenerTodosEnfermedades();
            grvEnfermedades.DataBind();
        }



        protected void grvEnfermedades_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void grvEnfermedades_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grvEnfermedades_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grvEnfermedades_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void grvEnfermedades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            EnfermedadesEntidad enfer = new EnfermedadesEntidad();
            if (Page.IsPostBack && IsValid)
            {//iuh
                enfer.nombreEnfermedad = txtNombreEnfermedad.Text;
                enfer.pacienteID = Convert.ToInt32(txtPacienteID.Text.ToString());
                enfer.sintomasEnfermedad = txtSintomas.Text;
            }

            servicio.insertarEnfermedades(enfer);
            datosEnfermedades(); //Actualizar las enfermedades en el grid view, cada vez que se crea uno nuevo.
            LimpiarRegistro(); //Limpia los campos
            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);
        }

        private void LimpiarRegistro()
        {
            txtNombreEnfermedad.Text = "";
            txtPacienteID.Text = "";
            txtSintomas.Text = "";
        }
    }
}