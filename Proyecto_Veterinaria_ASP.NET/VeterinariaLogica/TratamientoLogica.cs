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
   public class TratamientoLogica
    {

        public void Nuevo(TratamientosEntidad t)
        {
            TratamientosDatos.InsertarTratamientos(t.pacienteID, t.descripcionTratamiento);
        }

        //Listar todos los tratamientos
        public List<TratamientosEntidad> ObtenerTodos()
        {
            List<TratamientosEntidad> lista = new List<TratamientosEntidad>();

            DataSet ds = TratamientosDatos.SeleccionarTodos();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                TratamientosEntidad t = new TratamientosEntidad();
                t.tratamientoID = Convert.ToInt32(row["TratamientoID"].ToString());
                t.pacienteID = Convert.ToInt32(row["PacienteID"].ToString());
                t.descripcionTratamiento = row["Descripcion"].ToString();
                t.nombrePaciente = row["nombrePaciente"].ToString();
                lista.Add(t);
            }

            return lista;
        }

        //Modificar tratamientos
        public void Modificar(TratamientosEntidad tra)
        {
            TratamientosDatos.Modificar(tra.tratamientoID, tra.pacienteID, tra.descripcionTratamiento);
        }

        public void Eliminar(TratamientosEntidad tra)
        {
            TratamientosDatos.Eliminar(tra.tratamientoID);
        }




    }
}
