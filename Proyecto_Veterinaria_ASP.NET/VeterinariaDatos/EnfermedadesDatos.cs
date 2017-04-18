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
   public class EnfermedadesDatos
    {
        public static void InsertarEnfermedades(string nombre, int pacienteID, string sintomas)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_INSERT_Enfermedad");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@pacienteid", pacienteID);
            comando.Parameters.AddWithValue("@sintomas", sintomas);
            db.ExecuteNonQuery(comando);

        }

        public static void Modificar(int enfermedadID, string nombreEnf, int pacienteID, string sint)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_UPDATE_Enfermedad");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@enfermedadid", enfermedadID);
            comando.Parameters.AddWithValue("@nombre", nombreEnf);
            comando.Parameters.AddWithValue("@pacienteid", pacienteID);
            comando.Parameters.AddWithValue("@sintomas", sint);

            db.ExecuteNonQuery(comando);
        }


        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_SELECT_Enfermedad_All");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "EnfermedadLogica");
            return ds;
        }


        public static void Eliminar(int id)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("usp_DELETE_Enfermedad_ByID");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@enfermedadid", id);

            db.ExecuteNonQuery(comando);

        }



    }
}
