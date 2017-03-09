using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
    public class MedicamentosEntidad
    {
        public int medicamentosID { get; set; }
        public string nombreMedicamento { get; set; }
        public DateTime fechaVencimiento { get; set; }
        public int pacienteID { get; set; }
        public  int dosis { get; set; }

    }
}
