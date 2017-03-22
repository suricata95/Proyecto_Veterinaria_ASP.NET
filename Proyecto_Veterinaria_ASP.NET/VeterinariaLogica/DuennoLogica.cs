using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaDatos;
using VeterinariaEntidades;
using System.Data;

namespace VeterinariaLogica
{
    public class DuennoLogica
    {
        public void Nuevo(DuennoEntidad du)
        {
                DuennoDatos.InsertarDuenno(du.duennoID, du.nombreDuenno, du.apellidosDuenno, du.telefonoDuenno, du.correoDuenno);
        }

        //Listar todos los clientes
        public List<DuennoEntidad> ObtenerTodos()
        {
            List<DuennoEntidad> lista = new List<DuennoEntidad>();

            DataSet ds = DuennoDatos.SeleccionarTodos();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                DuennoEntidad due = new DuennoEntidad();
                due.duennoID = Convert.ToInt32(row["duennoid"].ToString());
                due.nombreDuenno = row["nombre"].ToString();
                due.apellidosDuenno = row["apellidos"].ToString();
                due.telefonoDuenno = row["telefono"].ToString();
                due.correoDuenno = row["correo"].ToString();               
                lista.Add(due);
            }

            return lista;
        }

        //Modificar un cliente
        public void Modificar(DuennoEntidad cli)
        {
            DuennoDatos.Modificar(cli.duennoID, cli.nombreDuenno, cli.apellidosDuenno, cli.telefonoDuenno, cli.correoDuenno);
        }

        public void Eliminar(DuennoEntidad cli)
        {
            DuennoDatos.Eliminar(cli.duennoID);
            
        }

    }
}
