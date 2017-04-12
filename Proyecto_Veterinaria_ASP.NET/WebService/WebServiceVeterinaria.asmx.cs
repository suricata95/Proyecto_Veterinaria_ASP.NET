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

        [WebMethod]
        public void eliminarCliente(DuennoEntidad cli)
        {
            DuennoLogica duenno = new DuennoLogica();
            duenno.Eliminar(cli);
        }

        //Pacientes
        [WebMethod]
        public void insertarPaciente(PacientesEntidad pa)
        {
            PacienteLogica paciente = new PacienteLogica();
            paciente.Nuevo(pa);
        }

        [WebMethod]
        public void modificarPaciente(PacientesEntidad pa) //Modifica clientes
        {
            PacienteLogica paciente = new PacienteLogica();
            paciente.Modificar(pa);
        }

        [WebMethod]
        public void eliminarPaciente(PacientesEntidad pa)
        {
            PacienteLogica paciente = new PacienteLogica();
            paciente.Eliminar(pa);
            
        }

        [WebMethod]
        public List<PacientesEntidad> ObtenerTodosPacientes()
        {
            PacienteLogica paciente = new PacienteLogica();
            return paciente.ObtenerTodos();
        }


        //Tratamientos
        [WebMethod]
        public void insertarTratamiento(TratamientosEntidad tra)
        {
           TratamientoLogica tratamiento = new TratamientoLogica();
            tratamiento.Nuevo(tra);
        }

        [WebMethod]
        public void modificarTratamiento(TratamientosEntidad tra) //Modifica clientes
        {
            TratamientoLogica tratamiento = new TratamientoLogica();
            tratamiento.Modificar(tra);
        }

        [WebMethod]
        public void eliminarTratamiento(TratamientosEntidad tra)
        {
            TratamientoLogica tratamiento = new TratamientoLogica();
            tratamiento.Eliminar(tra);

        }

        [WebMethod]
        public List<TratamientosEntidad> ObtenerTodosTratamientos()
        {
            TratamientoLogica tratamiento = new TratamientoLogica();
            return tratamiento.ObtenerTodos();
        }






        [WebMethod]
        public UsuariosEntidad obtieneUsuario (string usuario,string pass)
        {
            UsuarioLogica us = new UsuarioLogica();
            return us.ObtieneUsuario(usuario, pass);
        }
    }
}
