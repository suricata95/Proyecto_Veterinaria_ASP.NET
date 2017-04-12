using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaEntidades;
using VeterinariaDatos;
using System.Data;

namespace VeterinariaLogica
{
    public class PacienteLogica
    {
        public void Nuevo(PacientesEntidad du)
        {
            PacienteDatos.InsertarPacientes(du.nombrePaciente, du.edadPaciente, du.pesoPaciente, du.especiaPaciente, du.razaPaciente, du.colorPaciente, du.genero, du.duennoID, du.observacionesPaciente);
        }

        //Listar todos los clientes
        public List<PacientesEntidad> ObtenerTodos()
        {
            List<PacientesEntidad> lista = new List<PacientesEntidad>();

            DataSet ds = PacienteDatos.SeleccionarTodos();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                PacientesEntidad pa = new PacientesEntidad();
                pa.pacienteID = Convert.ToInt32(row["PacienteID"].ToString());
                pa.nombrePaciente = row["Nombre"].ToString();
                pa.edadPaciente = Convert.ToInt32(row["Edad"].ToString());
                pa.pesoPaciente = Convert.ToDecimal(row["Peso"].ToString());
                pa.especiaPaciente = row["Especie"].ToString();
                pa.razaPaciente = row["Raza"].ToString();
                pa.colorPaciente = row["Color"].ToString();
                pa.genero = row["Genero"].ToString();
                pa.duennoID = Convert.ToInt32(row["DuennoID"].ToString());
                pa.observacionesPaciente = row["Observaciones"].ToString();
                lista.Add(pa);
            }

            return lista;
        }


        //Modificar un cliente
        public void Modificar(PacientesEntidad pa)
        {

            PacienteDatos.Modificar(pa.pacienteID, pa.nombrePaciente, pa.edadPaciente, pa.pesoPaciente, pa.especiaPaciente, pa.razaPaciente, pa.colorPaciente, pa.genero, pa.observacionesPaciente);
        }


        public void Eliminar(PacientesEntidad pa)
        {
            PacienteDatos.Eliminar(pa.pacienteID);
            

        }

    }
}
