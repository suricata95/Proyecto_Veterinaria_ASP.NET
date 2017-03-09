using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
    public class ExamenEntidad
    {
        //Todos estos atributos son parte del examen de sangre del paciente
        public int examenID { get; set; }
        public string eritrocitos { get; set; }
        public string hemoglobina { get; set; }
        public string hematocrito { get; set; }
        public string VCM { get; set; }
        public string HCM { get; set; }
        public string CHCM { get; set; }
        public string plaquetas { get; set; }
        public string leucocitos { get; set; }
        public string neutrofilos { get; set; }
        public string eosinofilos { get; set; }
        public string linfocitos { get; set; }
        public int pacienteID { get; set;}

    }
}
