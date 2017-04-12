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
    public partial class NuevoMedicamento : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        MedicamentosEntidad medicamento = new MedicamentosEntidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                datosMedicamentos();
            }
        }

        private void datosMedicamentos()
        {
            grvMedicamentos.DataSource = servicio.ObtenerTodosMedicamentos();
            grvMedicamentos.DataBind();
        }

        private void LimpiarRegistro()
        {
            txtNombreMedicamento.Text = "";
            txtFechaVencimiento.Text = "";
            txtPacienteID.Text = "";
            txtDosis.Text = "";
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            MedicamentosEntidad medi = new MedicamentosEntidad();
            if (Page.IsPostBack && IsValid)
            {
                medi.nombreMedicamento = txtNombreMedicamento.Text;
                medi.fechaVencimiento = Convert.ToDateTime(txtFechaVencimiento.Text);
                medi.pacienteID = Convert.ToInt32(txtPacienteID.Text.ToString());
                medi.dosis = txtDosis.Text; 
            }
            servicio.insertarMedicamento(medi);
            LimpiarRegistro();
            datosMedicamentos(); //ACtualizar los medicamentos en el grid view
            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);
        }

        protected void grvMedicamentos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvMedicamentos.EditIndex = -1;
            datosMedicamentos();
        }

        protected void grvMedicamentos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvMedicamentos.EditIndex = e.NewEditIndex;
            datosMedicamentos();
        }

        protected void grvMedicamentos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grvMedicamentos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            medicamento.medicamentosID = ((int)grvMedicamentos.DataKeys[e.RowIndex].Value);
            medicamento.nombreMedicamento = ((TextBox)grvMedicamentos.Rows[e.RowIndex].FindControl("nombreMedicamento")).Text;
            medicamento.fechaVencimiento = Convert.ToDateTime(((TextBox)grvMedicamentos.Rows[e.RowIndex].FindControl("fechaVencimiento")).Text);
            medicamento.pacienteID = Convert.ToInt32(((TextBox)grvMedicamentos.Rows[e.RowIndex].FindControl("pacienteID")).Text);
            medicamento.dosis = ((TextBox)grvMedicamentos.Rows[e.RowIndex].FindControl("dosis")).Text;
            servicio.modificarMedicamento(medicamento);

            grvMedicamentos.EditIndex = -1;
            datosMedicamentos();

        }

        protected void grvMedicamentos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            medicamento.medicamentosID = Convert.ToInt32(grvMedicamentos.DataKeys[e.RowIndex].Values[0]);
            servicio.eliminarMedicamento(medicamento);
            grvMedicamentos.EditIndex = -1;
            datosMedicamentos();

        }
    }
}