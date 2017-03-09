using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
    public class UsuariosEntidad
    {
        public int usuarioID { get; set; }
        public string nombreUsuario { get; set; }
        public string password { get; set; }
        public int tipoUsuarioID { get; set; }

    }
}
