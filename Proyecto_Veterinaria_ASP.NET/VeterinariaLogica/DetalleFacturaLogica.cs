using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaDatos;
using VeterinariaEntidades;

namespace VeterinariaLogica
{
   public class DetalleFacturaLogica
    {

        public List<DetalleFacturaEntidad> ObtenerTodos()
        {
            
            List<DetalleFacturaEntidad> lista = new List<DetalleFacturaEntidad>();

            DataSet ds = DetalleFactura.SeleccionarTodos();

            // El DataSet tiene un conjunto de tablas
            // 1 DataSet tiene varios DataTable
            // 1 DataTable tiene varios DataRows

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                DetalleFacturaEntidad df = new DetalleFacturaEntidad();
                df.idDetalle = Convert.ToInt16(row["idDetalle"].ToString());
                df.nombre = row["Nombre"].ToString();
                df.descripcion = row["descripcion"].ToString(); 
                df.precio = Convert.ToDecimal(row["Precio"]); //Agregado

                lista.Add(df);
            }

            return lista;
        }

        //Obtener 
        public DetalleFacturaEntidad ObtenerDetalleFactura(int idDetalle)
        {
            DataSet ds = DetalleFactura.SeleccionarDetalleFactura(idDetalle);
            DetalleFacturaEntidad dte = new DetalleFacturaEntidad();    

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                dte.idDetalle = Convert.ToInt16(row["idDetalle"]);
                dte.nombre = row["nombre"].ToString();
                dte.descripcion = row["descripcion"].ToString();
                dte.precio = Convert.ToInt16(row["Precio"]);

            }
            return dte;
        }


    }
}
