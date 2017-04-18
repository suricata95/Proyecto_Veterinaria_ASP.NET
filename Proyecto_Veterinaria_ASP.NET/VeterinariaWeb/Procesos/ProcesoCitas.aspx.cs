using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeterinariaEntidades;
using WebService;

namespace VeterinariaWeb.Procesos
{
    public partial class ProcesoCitas : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        CitasEntidad ce = new CitasEntidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                datosCitas();
            }
        }

        private void datosCitas()
        {
            grvCitas.DataSource = servicio.ObtenerTodosCitas();
            grvCitas.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            CitasEntidad cEntidad = new CitasEntidad();
            if (Page.IsPostBack && IsValid)
            {
                cEntidad.fechaCita = Convert.ToDateTime(txtFechaCita.Text);
                cEntidad.pacienteID = Convert.ToInt32(txtPacienteID.Text.ToString());
                cEntidad.descripcionCita = txtDescripcion.Text;
            }

            servicio.insertarCitas(ce);
            datosCitas();
            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);

        }

        protected void grvCitas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvCitas.EditIndex = -1;
            datosCitas();
        }

        protected void grvCitas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvCitas.EditIndex = e.NewEditIndex;
            datosCitas();
        }

        protected void grvCitas_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grvCitas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ce.citaID = ((int)grvCitas.DataKeys[e.RowIndex].Value);
            ce.fechaCita = Convert.ToDateTime(((TextBox)grvCitas.Rows[e.RowIndex].FindControl("fechaCita")).Text);
            ce.pacienteID = Convert.ToInt32(((TextBox)grvCitas.Rows[e.RowIndex].FindControl("pacienteID")).Text);
            ce.descripcionCita = ((TextBox)grvCitas.Rows[e.RowIndex].FindControl("descripcionCita")).Text;
            servicio.modificarCitas(ce);

            grvCitas.EditIndex = -1;
            datosCitas();
        }

        protected void grvCitas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ce.citaID = Convert.ToInt32(grvCitas.DataKeys[e.RowIndex].Values[0]);
            servicio.eliminarCitas(ce);
            grvCitas.EditIndex = -1;
            datosCitas();

        }
    }
}