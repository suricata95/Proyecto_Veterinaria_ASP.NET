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
    public class FacturaLogica
    {

        public void Nuevo(FacturaEntidad f)
        {
            FacturaDatos.Insertar(f.fechaFactura, f.total, f.duennoID, f.idDetalle, f.usuarioID);      
        }

        //Listar todas las enfermedades
        public List<FacturaEntidad> ObtenerTodos()
        {
            List<FacturaEntidad> lista = new List<FacturaEntidad>();

            DataSet ds = FacturaDatos.SeleccionarTodos();
                

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                FacturaEntidad factu = new FacturaEntidad();
                factu.fechaFactura = Convert.ToDateTime(row["Fecha"]);
                //factu.subTotal = Convert.ToDecimal(row["SubTotal"]);
                //factu.impuesto = Convert.ToDecimal(row["Impuesto"]);
                //factu.descuento = Convert.ToDecimal(row["Descuento"]);
                factu.total = Convert.ToDecimal(row["Total"]);
                factu.duennoID = Convert.ToInt16(row["DuennoID"]);
                factu.idDetalle = Convert.ToInt16(row["idDetalle"]);
                factu.nombreUsuario = row["nombreUsuario"].ToString();
                lista.Add(factu);
            }

            return lista;
        }


    }
}
