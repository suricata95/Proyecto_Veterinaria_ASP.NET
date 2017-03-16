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
    public class UsuarioDatos
    {
        public static DataSet ObtieneUsuario(string usuario,string pass)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("usp_SelectUsuario");
            // Es requerido indicar que el tipo es un StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nom", usuario);
            comando.Parameters.AddWithValue("@pass", pass);

            DataSet ds = db.ExecuteReader(comando, "UsuarioLogica");
            return ds;
        }
    }
}
