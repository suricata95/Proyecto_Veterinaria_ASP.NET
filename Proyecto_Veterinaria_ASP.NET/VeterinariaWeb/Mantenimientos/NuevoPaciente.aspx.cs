using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeterinariaEntidades;
using WebService;

namespace VeterinariaWeb
{
    public partial class MantenimientoPacientes : System.Web.UI.Page
    {
        public SqlConnection cn = new SqlConnection("Data Source=localhost;Initial Catalog=DBVeterinaria;Persist Security Info=True;User ID=sa;Password=123456");
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                datosPacientes(); //REFRESCAR
            }
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
            datosPacientes(); //Actualizar los pacientes en el gridview
            LimpiarRegistro();
            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);
        }

        private void LimpiarRegistro()
        {
            //txtPacienteID.Text = "";
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

        private void datosPacientes()
        {
            grvPacientes.DataSource = servicio.ObtenerTodosPacientes();
            grvPacientes.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                //Declaracion del data_Adaptar
                SqlDataAdapter da = new SqlDataAdapter("select * from Duenno where DuennoID like '" + txtDuennoID.Text + "%'", cn);
                //contenedor de datos datatable
                DataTable dt = new DataTable();
                //llenar datatable
                da.Fill(dt);
                //Agregar a gridview con datasource
                this.grvDuennos.DataSource = dt;
                grvDuennos.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void grvPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvPacientes.EditIndex = -1;
            datosPacientes(); //REFRESCAR

        }

        protected void grvPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvPacientes.EditIndex = e.NewEditIndex;
            datosPacientes(); //REFRESCAR
            
        }

        protected void grvPacientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grvPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            PacientesEntidad paciente = new PacientesEntidad();

            paciente.pacienteID = ((int)grvPacientes.DataKeys[e.RowIndex].Value);
            paciente.nombrePaciente = ((TextBox)grvPacientes.Rows[e.RowIndex].FindControl("nombrePaciente")).Text;
            paciente.edadPaciente = Convert.ToInt32(((TextBox)grvPacientes.Rows[e.RowIndex].FindControl("edadPaciente")).Text);
            paciente.pesoPaciente = Convert.ToDecimal(((TextBox)grvPacientes.Rows[e.RowIndex].FindControl("pesoPaciente")).Text);
            paciente.especiaPaciente = ((TextBox)grvPacientes.Rows[e.RowIndex].FindControl("especiaPaciente")).Text; ;
            paciente.razaPaciente = ((TextBox)grvPacientes.Rows[e.RowIndex].FindControl("razaPaciente")).Text;
            paciente.colorPaciente = ((TextBox)grvPacientes.Rows[e.RowIndex].FindControl("colorPaciente")).Text; ;
            paciente.genero = Convert.ToString(((DropDownList)grvPacientes.Rows[e.RowIndex].FindControl("ddlGenero1")).SelectedItem); //SelectedItem saco el nombre de lo que contiene el dropdawn 
           
            paciente.observacionesPaciente = ((TextBox)grvPacientes.Rows[e.RowIndex].FindControl("observacionesPaciente")).Text;

            servicio.modificarPaciente(paciente);

            grvPacientes.EditIndex = -1;
            datosPacientes();
        }

        protected void grvPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            PacientesEntidad p = new PacientesEntidad();
            p.pacienteID = Convert.ToInt32(grvPacientes.DataKeys[e.RowIndex].Values[0]);
            servicio.eliminarPaciente(p);
            grvPacientes.EditIndex = -1;
            datosPacientes(); //REFRESCAR

        }
    }
}