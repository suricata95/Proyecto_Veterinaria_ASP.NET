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
    public class MedicamentosDatos
    {

        public static void InsertarMedicamentos(string nombre, DateTime FechaV, int pacienteID, string dosis)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_INSERT_Medicamentos");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@fechavencimiento", FechaV);
            comando.Parameters.AddWithValue("@pacienteid", pacienteID);
            comando.Parameters.AddWithValue("@dosis", dosis);
            db.ExecuteNonQuery(comando);

        }

        public static void Modificar(int medicamentosid, string nombre, DateTime fechaV, int pacienteID, string dosis)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_UPDATE_Medicamentos");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@medicamentosid", medicamentosid);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@fechavencimiento", fechaV);
            comando.Parameters.AddWithValue("@pacienteid", pacienteID);
            comando.Parameters.AddWithValue("@dosis", dosis);

            db.ExecuteNonQuery(comando);
        }


        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_SELECT_Medicamentos_All");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "MedicamentoLogica");
            return ds;
        }

        public static void Eliminar(int id)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("usp_DELETE_Medicamentos_ByID");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@medicamentosid", id);

            db.ExecuteNonQuery(comando);

        }



    }
}
