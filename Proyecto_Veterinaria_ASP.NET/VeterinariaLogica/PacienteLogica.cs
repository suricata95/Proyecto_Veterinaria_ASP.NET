using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaEntidades;
using VeterinariaDatos;

namespace VeterinariaLogica
{
    public class PacienteLogica
    {
        public void Nuevo(PacientesEntidad du)
        {
            PacienteDatos.InsertarPacientes(du.nombrePaciente, du.edadPaciente, du.pesoPaciente, du.especiaPaciente, du.razaPaciente, du.colorPaciente, du.genero, du.duennoID, du.observacionesPaciente);
        }
    }
}
