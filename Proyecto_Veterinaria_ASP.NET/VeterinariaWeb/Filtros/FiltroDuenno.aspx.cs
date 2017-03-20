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
using WebService;

namespace VeterinariaWeb.Filtros
{
    public partial class FiltroDuenno : System.Web.UI.Page
    {
        
        public SqlConnection cn = new SqlConnection("Data Source=localhost;Initial Catalog=DBVeterinaria;Persist Security Info=True;User ID=sa;Password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

      

    protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                //Declaracion del data_Adaptar
                SqlDataAdapter da = new SqlDataAdapter("select * from Duenno where DuennoID like '" + txtFiltroCedula.Text + "%'", cn);
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

        protected void grvDuennos_SelectedIndexChanged(object sender, EventArgs e)
        {

            //grvDuennos.SelectedRow;
        }
    }
}