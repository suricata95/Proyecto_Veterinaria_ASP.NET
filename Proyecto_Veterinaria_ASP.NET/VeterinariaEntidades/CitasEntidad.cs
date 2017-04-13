using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
    public class CitasEntidad
    {
        public int citaID { get; set; }
        public DateTime fechaCita { get; set; }
        public int pacienteID { get; set; }
        public string descripcionCita { get; set; }
        public string nombreDuenno { get; set; } //Traer el nombre del duenno y mostrarlo en el grid view
        public string nombrePaciente { get; set; } //Traer el nombre del paciente y mostrarlo en el grid view

    }
}
