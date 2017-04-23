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


        //Medicamentos
        [WebMethod]
        public void insertarMedicamento(MedicamentosEntidad me)
        {
            MedicamentoLogica medicamento = new MedicamentoLogica();
            medicamento.Nuevo(me);
        }

        [WebMethod]
        public void modificarMedicamento(MedicamentosEntidad me) //Modifica clientes
        {
            MedicamentoLogica medicamento = new MedicamentoLogica();
            medicamento.Modificar(me);
        }

        [WebMethod]
        public void eliminarMedicamento(MedicamentosEntidad me)
        {
            MedicamentoLogica medicamento = new MedicamentoLogica();
            medicamento.Eliminar(me);

        }

        [WebMethod]
        public List<MedicamentosEntidad> ObtenerTodosMedicamentos()
        {
            MedicamentoLogica medicamento = new MedicamentoLogica();
            return medicamento.ObtenerTodos();
        }

        //Citas
        [WebMethod]
        public void insertarCitas(CitasEntidad c)
        {
            CitaLogica cita = new CitaLogica();
            cita.Nuevo(c);
        }

        [WebMethod]
        public void modificarCitas(CitasEntidad c) //Modifica citas
        {
            CitaLogica cita = new CitaLogica();
            cita.Modificar(c);
        }

        [WebMethod]
        public void eliminarCitas(CitasEntidad c)
        {
            CitaLogica cita = new CitaLogica();
            cita.Eliminar(c);

        }

        [WebMethod]
        public List<CitasEntidad> ObtenerTodosCitas()
        {
            CitaLogica cita = new CitaLogica();
            return cita.ObtenerTodos();
        }

        //Enfermedades
        [WebMethod]
        public void insertarEnfermedades(EnfermedadesEntidad enf)
        {
            EnfermedadLogica enfermedad = new EnfermedadLogica();
            enfermedad.Nuevo(enf);
        }

        [WebMethod]
        public void modificarEnfermedades(EnfermedadesEntidad enf) //Modifica enfermedades
        {
            EnfermedadLogica enfermedad = new EnfermedadLogica();
            enfermedad.Modificar(enf);
        }

        [WebMethod]
        public void eliminarEnfermedades(EnfermedadesEntidad enf)
        {
            EnfermedadLogica enfermedad = new EnfermedadLogica();
            enfermedad.Eliminar(enf);

        }

        [WebMethod]
        public List<EnfermedadesEntidad> ObtenerTodosEnfermedades()
        {
            EnfermedadLogica enfermedad = new EnfermedadLogica();
            return enfermedad.ObtenerTodos();
        }


        //Detalle 

        [WebMethod]
        public List<DetalleFacturaEntidad> ObtenerTodosDetalle()
        {
            DetalleFacturaLogica det = new DetalleFacturaLogica();
            return det.ObtenerTodos();
        }

        [WebMethod]
        public DetalleFacturaEntidad ObtenerDetalle(int idDet)
        {
            DetalleFacturaLogica det = new DetalleFacturaLogica();
            return det.ObtenerDetalleFactura(idDet);
        }


        //Factura
        [WebMethod]
        public void insertarFactura(FacturaEntidad fac)
        {
            FacturaLogica factu = new FacturaLogica();
            factu.Nuevo(fac);
        }

        [WebMethod]
        public List<FacturaEntidad> ObtenerTodosFacturas()
        {
            FacturaLogica f = new FacturaLogica();
            return f.ObtenerTodos();
        }

        [WebMethod]
        public UsuariosEntidad obtieneUsuario (string usuario,string pass)
        {
            UsuarioLogica us = new UsuarioLogica();
            return us.ObtieneUsuario(usuario, pass);
        }
    }
}
