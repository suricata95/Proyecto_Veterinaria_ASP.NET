using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
   public class EnfermedadesEntidad
    {
        public int enfermedadID { get; set; }
        public string nombreEnfermedad { get; set; }
        public int pacienteID { get; set; }
        public string nombrePaciente { get; set; } //Este campo no se guarda en la base de datos, es solo para visualizacion en el programa.
        public string sintomasEnfermedad { get; set; }
    }
}
