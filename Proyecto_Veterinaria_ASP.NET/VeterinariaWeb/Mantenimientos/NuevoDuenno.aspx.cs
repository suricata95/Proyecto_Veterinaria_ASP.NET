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
            if (!Page.IsPostBack)
            {
                datosClientes();
            }
        }

        private void datosClientes()
        {
            grvClientes.DataSource = servicio.ObtenerTodosClientes();
            grvClientes.DataBind();
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
            datosClientes(); //Actualizar los clientes en el grid view
            LimpiarRegistro(); //Limpia los campos una vez ingresado el objeto
            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);
            

        }

        private void LimpiarRegistro()
        {
            txtDuennoID.Text = "";
            txtNombre.Text = "";
            txtApellidos.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
        }

        protected void grvClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvClientes.EditIndex = -1;
            datosClientes();

        }

        protected void grvClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvClientes.EditIndex = e.NewEditIndex;
            datosClientes();
        }

        protected void grvClientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
        }

        protected void grvClientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DuennoEntidad dueno = new DuennoEntidad();

            //dueno.duennoID = (int)(grvClientes.DataKeys[e.RowIndex].Values[0]);
            
            dueno.duennoID = ((int)grvClientes.DataKeys[e.RowIndex].Value);
           // dueno.duennoID = Convert.ToInt32(((TextBox)grvClientes.Rows[e.RowIndex].FindControl("duennoID")).Text);
            dueno.nombreDuenno = ((TextBox)grvClientes.Rows[e.RowIndex].FindControl("nombreDuenno")).Text;
            dueno.apellidosDuenno = ((TextBox)grvClientes.Rows[e.RowIndex].FindControl("apellidosDuenno")).Text;
            dueno.telefonoDuenno = ((TextBox)grvClientes.Rows[e.RowIndex].FindControl("telefonoDuenno")).Text;
            dueno.correoDuenno = ((TextBox)grvClientes.Rows[e.RowIndex].FindControl("correoDuenno")).Text;
            servicio.modificarCliente(dueno);

            grvClientes.EditIndex = -1;
            datosClientes();

        }

        protected void grvClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DuennoEntidad d = new DuennoEntidad();
            d.duennoID = Convert.ToInt32(grvClientes.DataKeys[e.RowIndex].Values[0]);
            servicio.eliminarCliente(d);
            grvClientes.EditIndex = -1;
            datosClientes();
            
        }
    }
}