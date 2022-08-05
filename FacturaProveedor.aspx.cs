using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario2
{
    public partial class FacturaProveedor : System.Web.UI.Page
    {
        public SqlCommand comando;
        public SqlConnection conexion = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Usuario\\source\\repos\\Inventario2\\App_Data\\BDTienda.mdf;Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void proveedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtnit.Text = proveedores.SelectedValue;
            String consulta = "SELECT * FROM Proveedor WHERE Prov_nit=" + txtnit.Text;
            comando = new SqlCommand(consulta, conexion);
            conexion.Open();
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                txtdireccion.Text = (leer.GetString(4));
                txttelefono.Text = (leer.GetString(5));
                txtcorreo.Text = (leer.GetString(6));
            }
        }

        protected void productos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var codigoproducto = productos.SelectedValue;
            String consulta = "SELECT * FROM Producto WHERE Prod_Id=" + codigoproducto;
            comando = new SqlCommand(consulta, conexion);
            conexion.Open();
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                txtvalor.Text = leer.GetSqlInt32(2).ToString();
            }
        }
        public DataTable rellenartabla()
        {
            var dt = new DataTable();
            dt.Columns.Add("Codigo", Type.GetType("System.String"));
            dt.Columns.Add("Producto", Type.GetType("System.String"));
            dt.Columns.Add("Valor unitario", Type.GetType("System.String"));
            dt.Columns.Add("Cantidad", Type.GetType("System.String"));
            dt.Columns.Add("Valor Total", Type.GetType("System.String"));
            return dt;
        }

        protected void btnadicionar_Click(object sender, EventArgs e)
        {
            if (Session["dt"] == null)
            {
                DataTable dt = rellenartabla();
                DataRow fila;
                fila = dt.NewRow();
                fila["Codigo"] = productos.SelectedValue.ToString();
                fila["Producto"] = productos.SelectedItem;
                fila["Valor unitario"] = txtvalor.Text;
                fila["Cantidad"] = txtcantidad.Text;
                fila["Valor Total"] = int.Parse(txtcantidad.Text) * int.Parse(txtvalor.Text);
                dt.Rows.Add(fila);
                detalleproductos.DataSource = dt;
                detalleproductos.DataBind();
                Session["dt"] = dt;
            }
            else
            {
                DataTable dt = (DataTable)(Session["dt"]);
                DataRow fila;
                fila = dt.NewRow();
                fila["Codigo"] = productos.SelectedValue.ToString();
                fila["Producto"] = productos.SelectedItem;
                fila["Valor unitario"] = txtvalor.Text;
                fila["Cantidad"] = txtcantidad.Text;
                fila["Valor Total"] = int.Parse(txtcantidad.Text) * int.Parse(txtvalor.Text);
                dt.Rows.Add(fila);
                detalleproductos.DataSource = dt;
                detalleproductos.DataBind();
                Session["dt"] = dt;
            }
        }

        public void limpiar()
        {
            txtnrofactura.Text = "";
            txtobservacion.Text = "";
            txtnit.Text = "";
            txtcorreo.Text = "";
            txtdireccion.Text = "";
            txtcantidad.Text = "";
            txttelefono.Text = "";
            txtvalor.Text = "";
            Session.Abandon();
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            string insertarventa = "insert into FacturaC (Fac_id,Fac_Fecha,Fac_IdProveedor,Fac_Comentario,Fac_Cantidad) values (@Fac_id,@Fac_Fecha,@Fac_Proveedor,@Fac_Comentario,@Fac_Cantidad)";
            try
            {
                string nrofactura = txtnrofactura.Text;
                string idcliente = txtnit.Text;
                string fecha = txtfecha.Text;
                string comentario = txtobservacion.Text;
                string cantidad = txtcantidad.Text;
                SqlCommand comando = new SqlCommand(insertarventa);
                comando.Parameters.AddWithValue("@Fac_id", nrofactura);
                comando.Parameters.AddWithValue("@Fac_Proveedor", idcliente);
                comando.Parameters.AddWithValue("@Fac_Fecha", fecha);
                comando.Parameters.AddWithValue("@Fac_Comentario", comentario);
                comando.Parameters.AddWithValue("@Fac_Cantidad", cantidad);
                comando.Connection = conexion;
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
                comando.Dispose();
                int nrofactura2 = int.Parse(txtnrofactura.Text);
                string consulta = "UPDATE FacturaC SET Fac_vTot=@Fac_vTot, Fac_IdProducto=@Fac_IdProducto, Fac_Cantidad=@Fac_Cantidad, Fac_NombreProducto=@Fac_NombreProducto  WHERE Fac_id=" + nrofactura2;
                conexion.Open();
                foreach (GridViewRow fila in detalleproductos.Rows)
                {
                    SqlCommand comando2 = new SqlCommand(consulta, conexion);
                    comando2.Parameters.Add("@Fac_vTot", SqlDbType.Int).Value =
                    int.Parse(fila.Cells[4].Text);
                    comando2.Parameters.Add("@Fac_IdProducto", SqlDbType.Int).Value =
                    int.Parse(fila.Cells[0].Text);
                    comando2.Parameters.Add("@Fac_Cantidad", SqlDbType.Int).Value =
                    int.Parse(fila.Cells[3].Text);
                    comando2.Parameters.Add("@Fac_NombreProducto", SqlDbType.NVarChar).Value =
                    fila.Cells[1].Text;
                    comando2.ExecuteNonQuery();
                }
                Response.Write("<script language='JavaScript'>alert('Registro guardado...!!!');</script>");
                limpiar();
            }
            catch (SqlException ex)
            {
                Response.Write("<script language='JavaScript'>alert('Error SQL....');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('Error registrando datos');</script>");
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}