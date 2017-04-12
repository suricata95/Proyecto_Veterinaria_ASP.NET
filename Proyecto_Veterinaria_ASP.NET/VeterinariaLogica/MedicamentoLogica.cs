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
    public class MedicamentoLogica
    {
        public void Nuevo(MedicamentosEntidad m)
        {
            MedicamentosDatos.InsertarMedicamentos(m.nombreMedicamento, m.fechaVencimiento, m.pacienteID, m.dosis);
        }


        //Listar todos los clientes
        public List<MedicamentosEntidad> ObtenerTodos()
        {
            List<MedicamentosEntidad> lista = new List<MedicamentosEntidad>();

            DataSet ds = MedicamentosDatos.SeleccionarTodos();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                MedicamentosEntidad m = new MedicamentosEntidad();
                m.medicamentosID = Convert.ToInt32(row["MedicamentosID"].ToString());
                m.nombreMedicamento = row["Nombre"].ToString();
                m.fechaVencimiento = Convert.ToDateTime(row["FechaVencimiento"].ToString());
                m.pacienteID = Convert.ToInt32(row["PacienteID"].ToString());
                m.dosis = row["Dosis"].ToString();
                m.nombrePaciente = row["nombrePaciente"].ToString(); //Este campo es necesario para que en el grid view aparezca el nombre del paciente
                lista.Add(m);
            }

            return lista;
        }


        //Modificar un cliente
        public void Modificar(MedicamentosEntidad me)
        {
            MedicamentosDatos.Modificar(me.medicamentosID, me.nombreMedicamento, me.fechaVencimiento, me.pacienteID, me.dosis);
        }

        public void Eliminar(MedicamentosEntidad me)
        {
            MedicamentosDatos.Eliminar(me.medicamentosID);
        }




    }
}
