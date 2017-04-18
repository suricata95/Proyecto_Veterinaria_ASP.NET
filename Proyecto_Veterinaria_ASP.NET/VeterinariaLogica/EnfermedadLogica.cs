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
    public class EnfermedadLogica
    {
        public void Nuevo(EnfermedadesEntidad e)
        {
            EnfermedadesDatos.InsertarEnfermedades(e.nombreEnfermedad, e.pacienteID, e.sintomasEnfermedad);
        }


        //Listar todas las enfermedades
        public List<EnfermedadesEntidad> ObtenerTodos()
        {
            List<EnfermedadesEntidad> lista = new List<EnfermedadesEntidad>();

            DataSet ds = EnfermedadesDatos.SeleccionarTodos();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                EnfermedadesEntidad enf = new EnfermedadesEntidad();
                enf.enfermedadID = Convert.ToInt32(row["EnfermedadID"].ToString());
                enf.nombreEnfermedad = row["Nombre"].ToString();
                enf.pacienteID = Convert.ToInt32(row["PacienteID"].ToString());
                enf.sintomasEnfermedad = row["Sintomas"].ToString();
                enf.nombrePaciente = row["nombrePaciente"].ToString(); //Este campo es necesario para que en el grid view aparezca el nombre del paciente
                lista.Add(enf);
            }

            return lista;
        }


        //Modificar un cliente
        public void Modificar(EnfermedadesEntidad enf)
        {
            EnfermedadesDatos.Modificar(enf.enfermedadID, enf.nombreEnfermedad, enf.pacienteID, enf.sintomasEnfermedad);
        }

        public void Eliminar(EnfermedadesEntidad enf)
        {
            EnfermedadesDatos.Eliminar(enf.enfermedadID);
        }




    }
}
