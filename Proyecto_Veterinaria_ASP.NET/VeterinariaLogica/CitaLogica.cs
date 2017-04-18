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
    public class CitaLogica
    {


        public void Nuevo(CitasEntidad ce)
        {
            CitaDatos.InsertarCitas(ce.fechaCita, ce.pacienteID, ce.descripcionCita); 
        }

        //Listar todos los tratamientos
        public List<CitasEntidad> ObtenerTodos()
        {
            List<CitasEntidad> lista = new List<CitasEntidad>();

            DataSet ds = CitaDatos.SeleccionarTodos();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                CitasEntidad cEntidad = new CitasEntidad();
                cEntidad.citaID = Convert.ToInt32(row["CitaID"].ToString());
                cEntidad.fechaCita = Convert.ToDateTime(row["Fecha"].ToString());
                cEntidad.pacienteID = Convert.ToInt32(row["PacienteID"].ToString());
                cEntidad.descripcionCita = row["Descripcion"].ToString();
                //cEntidad.nombreDuenno = row["nombreDuenno"].ToString(); //se agregua este atributo para mostrarlo en el grid view
                cEntidad.nombrePaciente = row["nombrePaciente"].ToString(); // se agrega este atributo para mostrarlo en el grid view
                lista.Add(cEntidad);
            }

            return lista;
        }

        //Modificar citas
        public void Modificar(CitasEntidad c)
        {
            CitaDatos.Modificar(c.citaID, c.fechaCita, c.pacienteID, c.descripcionCita);
        }

        public void Eliminar(CitasEntidad c)
        {
            CitaDatos.Eliminar(c.citaID);
        }

    }
}
