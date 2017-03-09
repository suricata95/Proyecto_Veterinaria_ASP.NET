using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
   public class PacientesEntidad
    {
        public int pacienteID { get; set; }
        public string nombrePaciente { get; set; }
        public int edadPaciente { get; set; }
        public decimal pesoPaciente { get; set; }
        public string especiaPaciente { get; set; }
        public string razaPaciente { get; set; }
        public string colorPaciente { get; set; }
        public string genero { get; set; }
        public int veterinariaID { get; set; }
        public int duennoID { get; set; }
        public string observacionesPaciente { get; set; }

    }
}
