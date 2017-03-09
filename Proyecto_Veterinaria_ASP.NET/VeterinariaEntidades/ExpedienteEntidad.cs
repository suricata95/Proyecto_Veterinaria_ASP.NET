using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
    public class ExpedienteEntidad
    {
        public int expedienteID { get; set; }
        public int pacienteID { get; set; }
        public int enfermedadID { get; set; }
        public int tratamientosID { get; set; }
        public int medicamentosID { get; set; }
        public int examenID { get; set; }
        public int veterinariaID { get; set; }
        public int duennoID { get; set; }

    }
}
