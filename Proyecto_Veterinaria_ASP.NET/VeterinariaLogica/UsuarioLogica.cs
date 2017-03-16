using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaDatos;
using VeterinariaEntidades;

namespace VeterinariaLogica
{
    public class UsuarioLogica
    {
        public UsuariosEntidad ObtieneUsuario(string usuario, string pass)
        {

            UsuariosEntidad us = new UsuariosEntidad();

            DataSet ds = UsuarioDatos.ObtieneUsuario(usuario, pass);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                us.nombreUsuario = row["Nombre"].ToString();
                us.usuarioID = Convert.ToInt32(row["UsuarioID"]);
                us.tipoUsuarioID = Convert.ToInt32(row["TipoUsuarioID"]);

            }
            return us;
        }
    }
}
