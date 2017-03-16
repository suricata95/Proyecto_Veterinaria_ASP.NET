using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using VeterinariaEntidades;
using VeterinariaLogica;

namespace WebService
{
    /// <summary>
    /// Summary description for WebServiceVeterinaria
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceVeterinaria : System.Web.Services.WebService
    {
        //Dueño
        [WebMethod]
        public void insertarDuenno(DuennoEntidad due)
        {
            DuennoLogica duenno = new DuennoLogica();
            duenno.Nuevo(due);
        }

        [WebMethod]
        public List<DuennoEntidad> ObtenerTodosClientes()
        {
            DuennoLogica duenno = new DuennoLogica();
            return duenno.ObtenerTodos();
        }

        [WebMethod]
        public void modificarCliente(DuennoEntidad cli) //Modifica clientes
        {
            DuennoLogica duenno = new DuennoLogica();
            duenno.Modificar(cli);
        }

        //Pacientes
        [WebMethod]
        public void insertarPaciente(PacientesEntidad pa)
        {
            PacienteLogica paciente = new PacienteLogica();
            paciente.Nuevo(pa);
        }
        [WebMethod]
        public UsuariosEntidad obtieneUsuario (string usuario,string pass)
        {
            UsuarioLogica us = new UsuarioLogica();
            return us.ObtieneUsuario(usuario, pass);
        }
    }
}
