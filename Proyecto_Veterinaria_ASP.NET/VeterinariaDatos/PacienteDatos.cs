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
    }
}
