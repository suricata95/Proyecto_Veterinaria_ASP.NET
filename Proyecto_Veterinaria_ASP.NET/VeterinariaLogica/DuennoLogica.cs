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
    }
}
