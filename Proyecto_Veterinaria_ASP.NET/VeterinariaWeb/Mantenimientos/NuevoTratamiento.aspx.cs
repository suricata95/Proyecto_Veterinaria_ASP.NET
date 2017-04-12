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
    public partial class NuevoTratamiento : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        TratamientosEntidad trata = new TratamientosEntidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                datosTratamientos();
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            TratamientosEntidad trata = new TratamientosEntidad();
            if (Page.IsPostBack && IsValid)
            {
                trata.pacienteID = Convert.ToInt32(txtPacienteID.Text.ToString());
                trata.descripcionTratamiento = txtDescripcion.Text;
            }
            servicio.insertarTratamiento(trata);
            LimpiarRegistro();
            datosTratamientos(); //Actualizar los tratamientos en el grid view
            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);

        }

        private void datosTratamientos()
        {
            grvTratamientos.DataSource = servicio.ObtenerTodosTratamientos();
            grvTratamientos.DataBind();
        }

        protected void grvTratamientos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvTratamientos.EditIndex = -1;
            datosTratamientos();
        }

        protected void grvTratamientos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvTratamientos.EditIndex = e.NewEditIndex;
            datosTratamientos();
        }

        protected void grvTratamientos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grvTratamientos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            trata.tratamientoID = ((int)grvTratamientos.DataKeys[e.RowIndex].Value);
            trata.pacienteID = Convert.ToInt32(((TextBox)grvTratamientos.Rows[e.RowIndex].FindControl("pacienteID")).Text);
            trata.descripcionTratamiento = ((TextBox)grvTratamientos.Rows[e.RowIndex].FindControl("descripcionTratamiento")).Text;
            servicio.modificarTratamiento(trata);

            grvTratamientos.EditIndex = -1;
            datosTratamientos();
        }

        protected void grvTratamientos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            trata.tratamientoID = Convert.ToInt32(grvTratamientos.DataKeys[e.RowIndex].Values[0]);
            servicio.eliminarTratamiento(trata);
            grvTratamientos.EditIndex = -1;
            datosTratamientos();
        }


        private void LimpiarRegistro()
        {
            txtPacienteID.Text = "";
            txtDescripcion.Text = "";
        }
    }
}