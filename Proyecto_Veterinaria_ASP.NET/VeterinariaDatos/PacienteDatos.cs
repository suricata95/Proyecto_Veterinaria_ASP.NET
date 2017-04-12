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
    public class PacienteDatos
    {
        public static void InsertarPacientes(string nom, int edad, decimal peso, string especie, string raza, string color, string genero, int dueID, string obs)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_INSERT_Pacientes");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@nombre", nom);
            comando.Parameters.AddWithValue("@edad", edad);
            comando.Parameters.AddWithValue("@peso", peso);
            comando.Parameters.AddWithValue("@especie", especie);
            comando.Parameters.AddWithValue("@raza", raza);
            comando.Parameters.AddWithValue("@color", color);
            comando.Parameters.AddWithValue("@genero", genero);
            comando.Parameters.AddWithValue("@duennoid", dueID);
            comando.Parameters.AddWithValue("@observaciones", obs);
            db.ExecuteNonQuery(comando);

        }

        public static void Modificar(int paID, string nombreP, int edad, decimal peso, string especie, string raza, string color, string genero, string obs)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_UPDATE_Pacientes");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@PacienteID", paID);
            comando.Parameters.AddWithValue("@nombre", nombreP);
            comando.Parameters.AddWithValue("@edad", edad);
            comando.Parameters.AddWithValue("@peso", peso);
            comando.Parameters.AddWithValue("@especie", especie);
            comando.Parameters.AddWithValue("@raza", raza);
            comando.Parameters.AddWithValue("@color", color);
            comando.Parameters.AddWithValue("@genero", genero);
            comando.Parameters.AddWithValue("@observaciones", obs);
            db.ExecuteNonQuery(comando);
        }


        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_SELECT_Pacientes_All");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "PacienteLogica");
            return ds;
        }


        public static void Eliminar(int id)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("usp_DELETE_Pacientes_ByID");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@pacienteid", id);

            db.ExecuteNonQuery(comando);

        }

    }
}
