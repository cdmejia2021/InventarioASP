//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Inventario2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Factura
    {
        public int Fac_id { get; set; }
        public Nullable<int> Fac_vTot { get; set; }
        public Nullable<System.DateTime> Fac_Fecha { get; set; }
        public string Fac_IdCliente { get; set; }
        public string Fac_IdProducto { get; set; }
        public string Fac_Comentario { get; set; }
    }
}
