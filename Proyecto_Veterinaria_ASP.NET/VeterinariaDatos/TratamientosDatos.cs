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
    public class TratamientosDatos
    {

        public static void InsertarTratamientos(int pacienteID, string descripcion)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_INSERT_Tratamientos");
            comando.CommandType = CommandType.StoredProcedure;

            //comando.Parameters.AddWithValue("@TratamientoID", tratamientoID);
            comando.Parameters.AddWithValue("@PacienteID", pacienteID);
            comando.Parameters.AddWithValue("@Descripcion", descripcion);
            db.ExecuteNonQuery(comando);

        }


        public static void Modificar(int tratamientoID, int pacienteID, string descripcion)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_UPDATE_Tratamientos");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@tratamientoID", tratamientoID);
            comando.Parameters.AddWithValue("@pacienteID", pacienteID);
            comando.Parameters.AddWithValue("@descripcion", descripcion);

            db.ExecuteNonQuery(comando);
        }

        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("PA_SeleccionarTratamientosNombre");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "TratamientoLogica");
            return ds;
        }


        public static void Eliminar(int id)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("usp_DELETE_Tratamientos_ByID");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@tratamientoid", id);

            db.ExecuteNonQuery(comando);

        }


    }
}
