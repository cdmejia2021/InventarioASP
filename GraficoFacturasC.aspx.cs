using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario2
{
    public partial class GraficoFacturasC : System.Web.UI.Page
    {
        public SqlCommand comando;
        public SqlConnection conexion = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Usuario\\source\\repos\\Inventario2\\App_Data\\BDTienda.mdf;Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbuscar_Click1(object sender, EventArgs e)
        {
            try
            {
                int idfactura = int.Parse(txtidfactura.Text);
                string consulta = "SELECT * FROM Factura WHERE Fac_id=" + idfactura;
                comando = new SqlCommand(consulta, conexion);
                conexion.Open();
                SqlDataReader leer = comando.ExecuteReader();
                if (leer.Read())
                {
                    Response.Write("<script language='JavaScript'>alert('Encontre la factura :)');</script>");
                }
                else
                {
                    Response.Write("<script language='JavaScript'>alert('No encontre la factura :/');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('No funciona :c');</script>");
            }
        }
    }
}
