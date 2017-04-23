
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEntidades
{
    public class FacturaEntidad
    {
        public int facturaID { get; set; }
        public DateTime fechaFactura { get; set; }
        public decimal subTotal { get; set; }
        public decimal impuesto { get; set; }
        public decimal descuento { get; set; }
        public decimal total { get; set; }
        public int usuarioID { get; set; } //Usuario que registra la factura
        public int duennoID { get; set; } //Cliente 
        public decimal Cambio { get; set; }
        public int idDetalle { get; set; }

        public decimal precioPaquete { get; set; }

        public string nombreDetalle { get; set; }

        public string nombreUsuario { get; set; }

        public string nombreDuenno { get; set; }




    }
}
