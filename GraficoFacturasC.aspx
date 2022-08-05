<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraficoFacturasC.aspx.cs" Inherits="Inventario2.GraficoFacturasC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbltitulo" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Buscar factura Clientes"></asp:Label>
        </div>
        <p>
            <asp:Label ID="lblidfactura" runat="server" Font-Bold="True" Font-Names="Arial" Text="Buscar por Id factura (Cliente):"></asp:Label>
            <asp:TextBox ID="txtidfactura" runat="server"></asp:TextBox>
            <asp:Button ID="btnbuscar" runat="server" OnClick="btnbuscar_Click1" Text="Buscar" />
        </p>
        <p>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="BDFactura">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Fac_NombreProducto" YValueMembers="Fac_Cantidad">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="BDFactura" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Fac_NombreProducto], [Fac_Cantidad] FROM [Factura] WHERE ([Fac_id] = @Fac_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtidfactura" Name="Fac_id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
