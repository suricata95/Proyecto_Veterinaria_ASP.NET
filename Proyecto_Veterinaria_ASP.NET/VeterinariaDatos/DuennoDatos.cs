using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaEntidades;

namespace VeterinariaDatos
{
    public class DuennoDatos
    {
        public static void InsertarDuenno(int due_id, string nombre, string apellidos, string tel, string correo)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_INSERT_Duenno");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@duennoid", due_id);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@apellidos", apellidos);
            comando.Parameters.AddWithValue("@telefono", tel);
            comando.Parameters.AddWithValue("@correo", correo);
            db.ExecuteNonQuery(comando);

        }

        public static void Modificar(int dueID, string nombreD, string apellidosD, string telD, string correoD)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_UPDATE_Duenno");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@duennoid", dueID);
            comando.Parameters.AddWithValue("@nombre", nombreD);
            comando.Parameters.AddWithValue("@apellidos", apellidosD);
            comando.Parameters.AddWithValue("@telefono", telD);
            comando.Parameters.AddWithValue("@correo", correoD);
            db.ExecuteNonQuery(comando);
        }

        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_SELECT_Duenno_All");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "DuennoLogica");
            return ds;
        }

    }
}
