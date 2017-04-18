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
    public class FacturaDatos
    {

        public static void Insertar(DateTime fech, decimal subT, decimal imp, decimal desc, decimal total, int duennoID, int idDet, int usuarioID)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_INSERT_Factura");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Fecha", fech);
            comando.Parameters.AddWithValue("@SubTotal", subT);
            comando.Parameters.AddWithValue("@Impuesto", imp);
            comando.Parameters.AddWithValue("@Descuento", desc);
            comando.Parameters.AddWithValue("@Total", total);
            comando.Parameters.AddWithValue("@DuennoID", duennoID);
            comando.Parameters.AddWithValue("@idDetalle", idDet);
            comando.Parameters.AddWithValue("@UsuarioID", usuarioID);
            db.ExecuteNonQuery(comando);
        }


        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("PA_SeleccionarReservas");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "reservarPaqueteLogica");
            return ds;
        }



    }
}
