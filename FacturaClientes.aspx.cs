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
    public partial class FacturaClientes : System.Web.UI.Page
    {
        public SqlCommand comando;
        public SqlConnection conexion = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Usuario\\source\\repos\\Inventario2\\App_Data\\BDTienda.mdf;Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtid.Text = clientes.SelectedValue;
                string consulta = "SELECT * FROM Cliente WHERE Cli_id=" + txtid.Text;
                comando = new SqlCommand(consulta, conexion);
                conexion.Open();
                SqlDataReader leer = comando.ExecuteReader();
                if (leer.Read())
                {
                    txtdireccion.Text = (leer.GetString(2));
                    txttelefono.Text = (leer.GetString(3));
                    txtcorreo.Text = (leer.GetString(4));
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void productos_SelectedIndexChanged(object sender, EventArgs e)
        {
          //  try
        //    {
                var codigoproducto = productos.SelectedValue;
                string consulta = "select * from Producto where Prod_Id=" + codigoproducto;
                comando = new SqlCommand(consulta, conexion);
                conexion.Open();
                SqlDataReader leer = comando.ExecuteReader();
                if (leer.Read())
                {
                    txtunitario.Text = (leer.GetSqlInt32(2).ToString());
                }
            /*}catch(Exception ex)
            {

            }*/
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
                fila["Valor unitario"] = txtunitario.Text;
                fila["Cantidad"] = txtcantidad.Text;
                fila["Valor Total"] = int.Parse(txtcantidad.Text) * int.Parse(txtunitario.Text);
                dt.Rows.Add(fila);
                vistaproductos.DataSource = dt;
                vistaproductos.DataBind();
                Session["dt"] = dt;
            }
            else
            {
                DataTable dt = (DataTable)(Session["dt"]);
                DataRow fila;
                fila = dt.NewRow();
                fila["Codigo"] = productos.SelectedValue.ToString();
                fila["Producto"] = productos.SelectedItem;
                fila["Valor unitario"] = txtunitario.Text;
                fila["Cantidad"] = txtcantidad.Text;
                fila["Valor Total"] = int.Parse(txtcantidad.Text) * int.Parse(txtunitario.Text);
                dt.Rows.Add(fila);
                vistaproductos.DataSource = dt;
                vistaproductos.DataBind();
                Session["dt"] = dt;
            }
        }
        public void limpiar()
        {
            txtnrofactura.Text = "";
            txtobservacion.Text = "";
            txtid.Text = "";
            txtcorreo.Text = "";
            txtdireccion.Text = "";
            txtcantidad.Text = "";
            txttelefono.Text = "";
            txtunitario.Text = "";
            Session.Abandon();
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            string insertarventa = "insert into Factura (Fac_id,Fac_Fecha,Fac_IdCliente,Fac_Comentario,Fac_Cantidad) values (@Fac_id,@Fac_Fecha,@Fac_IdCliente,@Fac_Comentario,@Fac_Cantidad)";
            try
            {
                string nrofactura = txtnrofactura.Text;
                string idcliente = txtid.Text;
                string fecha = txtfecha.Text;
                string comentario = txtobservacion.Text;
                string cantidad = txtcantidad.Text;
                SqlCommand comando = new SqlCommand(insertarventa);
                comando.Parameters.AddWithValue("@Fac_id", nrofactura);
                comando.Parameters.AddWithValue("@Fac_IdCliente", idcliente);
                comando.Parameters.AddWithValue("@Fac_Fecha", fecha);
                comando.Parameters.AddWithValue("@Fac_Comentario", comentario);
                comando.Parameters.AddWithValue("@Fac_Cantidad", cantidad);
                comando.Connection = conexion;
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
                comando.Dispose();
                int nrofactura2 = int.Parse(txtnrofactura.Text);
                string consulta = "UPDATE Factura SET Fac_vTot=@Fac_vTot, Fac_IdProducto=@Fac_IdProducto, Fac_Cantidad=@Fac_Cantidad, Fac_NombreProducto=@Fac_NombreProducto  WHERE Fac_id=" + nrofactura2;
                conexion.Open();
                foreach (GridViewRow fila in vistaproductos.Rows)
                {
                    SqlCommand comando2 = new SqlCommand(consulta,conexion);
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
            catch (SqlException ex) {
                Response.Write("<script language='JavaScript'>alert('Error SQL....');</script>");
            }
            catch (Exception ex) {
                Response.Write("<script language='JavaScript'>alert('Error registrando datos');</script>");
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}