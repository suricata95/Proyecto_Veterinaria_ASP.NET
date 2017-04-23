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
    public partial class ProcesoFactura : System.Web.UI.Page
    {
        private WebServiceVeterinaria servicio = new WebServiceVeterinaria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<DetalleFacturaEntidad> df = new List<DetalleFacturaEntidad>();
                df = servicio.ObtenerTodosDetalle();
                ddlFactura.DataSource = df;
                ddlFactura.DataTextField = "nombre";
                ddlFactura.DataValueField = "idDetalle";
                ddlFactura.DataBind();
                datosFactura();
                CalcularTotal();
                refrescar();


            }

        }

        private void CalcularTotal()
        {
            decimal total = 0;

            total = (Convert.ToDecimal(lblPrecio.Text));
            txtTotal.Text = total.ToString();
            
        }

        private void datosFactura()
        {
            DetalleFacturaEntidad dt = new DetalleFacturaEntidad();
            dt = servicio.ObtenerDetalle(Convert.ToInt32(ddlFactura.SelectedValue));
            lblPrecio.Text = dt.precio.ToString(".000");

            lblDescripcion.Text = dt.descripcion.ToString();
        }
       

        protected void btnNuevo_Click(object sender, EventArgs e)
        {

        }

        protected void ddlFactura_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalcularTotal();
            datosFactura();
        }

        protected void btnNuevo_Click1(object sender, EventArgs e)
        {
            UsuariosEntidad u = new UsuariosEntidad();
            FacturaEntidad fac1 = new FacturaEntidad();
            fac1.idDetalle = Convert.ToInt16(ddlFactura.SelectedIndex);
            fac1.fechaFactura = Convert.ToDateTime(txtFechaFactura.Text);
            fac1.total = Convert.ToDecimal(txtTotal.Text);
            fac1.duennoID = Convert.ToInt32(txtDuenno.Text);
            fac1.usuarioID = Convert.ToInt32(Session["idUsuario"]);
            servicio.insertarFactura(fac1);
            refrescar();

            String mensaje = @"alert('Datos guardados correctamente')";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Informacion", mensaje, true);


        }

        private void refrescar()
        {
            grvFacturas.DataSource = servicio.ObtenerTodosFacturas();
            grvFacturas.DataBind();
        }

       
    }
}