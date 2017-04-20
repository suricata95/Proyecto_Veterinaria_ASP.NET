using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaDatos
{
    public class DetalleFactura
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("PA_SeleccionarDetalleFacturas");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "DetalleFacturaLogica");
            return ds;
        }

        public static DataSet SeleccionarDetalleFactura(int idDetalle)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("PA_ObtenerDetalleFactura");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idDetalle", idDetalle);
            DataSet ds = db.ExecuteReader(comando, "DetalleFacturaLogica");
            return ds;
        }


    }
}
