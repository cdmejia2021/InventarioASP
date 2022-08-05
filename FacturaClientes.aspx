<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacturaClientes.aspx.cs" Inherits="Inventario2.FacturaClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbltitulo" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#3366FF" Text="Facturación Clientes "></asp:Label>
        </div>
        <asp:Label ID="lblnrofactura" runat="server" Font-Bold="True" Font-Names="Arial" Text="Número de factura:"></asp:Label>
        <asp:TextBox ID="txtnrofactura" runat="server" Width="75px"></asp:TextBox>
        <asp:Label ID="lblfecha" runat="server" Font-Bold="True" Font-Names="Arial" Text="Fecha de venta:"></asp:Label>
        <asp:TextBox ID="txtfecha" runat="server">MM/dd/AAAA</asp:TextBox>
        <asp:Label ID="lblobservacion" runat="server" Font-Bold="True" Font-Names="Arial" Text="Observación:"></asp:Label>
        <asp:TextBox ID="txtobservacion" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lblcliente" runat="server" Font-Bold="True" Font-Names="Arial" Text="Seleccionar cliente:"></asp:Label>
            <asp:DropDownList ID="clientes" runat="server" AutoPostBack="True" DataSourceID="BDclientes" DataTextField="Cli_Nom" DataValueField="Cli_id" Height="20px" OnSelectedIndexChanged="clientes_SelectedIndexChanged" Width="133px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BDclientes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Cliente]"></asp:SqlDataSource>
        </p>
        <asp:Label ID="lblid" runat="server" Font-Bold="True" Font-Names="Arial" Text="Id:"></asp:Label>
        <asp:TextBox ID="txtid" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lbldireccion" runat="server" Font-Bold="True" Font-Names="Arial" Text="Dirección:"></asp:Label>
            <asp:TextBox ID="txtdireccion" runat="server"></asp:TextBox>
            <asp:Label ID="lbltelefono" runat="server" Font-Bold="True" Font-Names="Arial" Text="Teléfono:"></asp:Label>
            <asp:TextBox ID="txttelefono" runat="server"></asp:TextBox>
            <asp:Label ID="lblcorreo" runat="server" Font-Bold="True" Font-Names="Arial" Text="Correo:"></asp:Label>
            <asp:TextBox ID="txtcorreo" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="lblproducto" runat="server" Font-Bold="True" Font-Names="Arial" Text="Seleccione producto:"></asp:Label>
        <asp:DropDownList ID="productos" runat="server" Height="27px" Width="146px" AutoPostBack="True" DataSourceID="BDProductos" DataTextField="Prod_Nombre" DataValueField="Prod_Id" OnSelectedIndexChanged="productos_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="BDProductos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Producto]"></asp:SqlDataSource>
        <asp:Label ID="lblunitario" runat="server" Font-Bold="True" Font-Names="Arial" Text="Valor Unitario:"></asp:Label>
        <asp:TextBox ID="txtunitario" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblcantidad" runat="server" Font-Bold="True" Font-Names="Arial" Text="Cantidad a comprar:"></asp:Label>
        <asp:TextBox ID="txtcantidad" runat="server"></asp:TextBox>
        <asp:Button ID="btnadicionar" runat="server" OnClick="btnadicionar_Click" Text="Adicionar" />
        <br />
        <br />
        <asp:GridView ID="vistaproductos" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="503px">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
        <asp:Button ID="btnguardar" runat="server" OnClick="btnguardar_Click" style="width: 68px" Text="Guardar" />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
