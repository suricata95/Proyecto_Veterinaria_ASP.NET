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
    public class CitaDatos
    {

        public static void InsertarCitas(DateTime Fec, int pID, string desc)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_INSERT_Cita");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@fecha", Fec);
            comando.Parameters.AddWithValue("@pacienteid", pID);
            comando.Parameters.AddWithValue("@descripcion", desc);
            db.ExecuteNonQuery(comando);

        }



        public static void Modificar(int citaid, DateTime fecha, int pacienteID, string descripcion)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_UPDATE_Cita");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@citaid", citaid);
            comando.Parameters.AddWithValue("@fecha", fecha);
            comando.Parameters.AddWithValue("@pacienteid", pacienteID);
            comando.Parameters.AddWithValue("@descripcion", descripcion);

            db.ExecuteNonQuery(comando);
        }

        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_SELECT_Cita_All");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "CitaLogica");
            return ds;
        }

        public static void Eliminar(int id)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("usp_DELETE_Cita_ByID");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@citaid", id);

            db.ExecuteNonQuery(comando);

        }


    }
}
