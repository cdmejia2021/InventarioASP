<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacturaProveedor.aspx.cs" Inherits="Inventario2.FacturaProveedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbltitulo" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Factura Tienda"></asp:Label>
        </div>
        <asp:Label ID="lblnrofactura" runat="server" Font-Bold="True" Font-Names="Arial" Text="Número de factura:"></asp:Label>
        <asp:TextBox ID="txtnrofactura" runat="server" Width="73px"></asp:TextBox>
        <asp:Label ID="lblfecha" runat="server" Font-Bold="True" Font-Names="Arial" Text="Fecha de venta:"></asp:Label>
        <asp:TextBox ID="txtfecha" runat="server">MM/dd/AAAA</asp:TextBox>
        <asp:Label ID="lblobservacion" runat="server" Font-Bold="True" Font-Names="Arial" Text="Observación:"></asp:Label>
        <asp:TextBox ID="txtobservacion" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lblproveedor" runat="server" Font-Bold="True" Font-Names="Arial" Text="Seleccionar proveedor:"></asp:Label>
            <asp:DropDownList ID="proveedores" runat="server" AutoPostBack="True" DataSourceID="BDProveedores" DataTextField="Prov_Nom" DataValueField="Prov_nit" Height="16px" OnSelectedIndexChanged="proveedores_SelectedIndexChanged" Width="173px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BDProveedores" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Proveedor]"></asp:SqlDataSource>
            <asp:Label ID="lblnit" runat="server" Font-Bold="True" Font-Names="Arial" Text="Nit:"></asp:Label>
            <asp:TextBox ID="txtnit" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="lbldireccion" runat="server" Font-Bold="True" Font-Names="Arial" Text="Dirección:"></asp:Label>
        <asp:TextBox ID="txtdireccion" runat="server" Width="146px"></asp:TextBox>
        <asp:Label ID="lbltelefono" runat="server" Font-Bold="True" Font-Names="Arial" Text="Teléfono:"></asp:Label>
        <asp:TextBox ID="txttelefono" runat="server"></asp:TextBox>
        <asp:Label ID="lblcorreo" runat="server" Font-Bold="True" Font-Names="Arial" Text="Correo:"></asp:Label>
        <asp:TextBox ID="txtcorreo" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lblproducto" runat="server" Font-Bold="True" Font-Names="Arial" Text="Seleccione producto:"></asp:Label>
            <asp:DropDownList ID="productos" runat="server" AutoPostBack="True" DataSourceID="BDProductos" DataTextField="Prod_Nombre" DataValueField="Prod_Id" Height="28px" OnSelectedIndexChanged="productos_SelectedIndexChanged" Width="154px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BDProductos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Producto]"></asp:SqlDataSource>
            <asp:Label ID="lblvalor" runat="server" Font-Bold="True" Font-Names="Arial" Text="Valor unitario:"></asp:Label>
            <asp:TextBox ID="txtvalor" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="lblcantidad" runat="server" Font-Bold="True" Font-Names="Arial" Text="Cantidad a comprar:"></asp:Label>
            <asp:TextBox ID="txtcantidad" runat="server"></asp:TextBox>
            <asp:Button ID="btnadicionar" runat="server" OnClick="btnadicionar_Click" Text="Adicionar" />
        </p>
        <asp:GridView ID="detalleproductos" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="527px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:Button ID="btnguardar" runat="server" OnClick="btnguardar_Click" Text="Guardar" />
    </form>
</body>
</html>
