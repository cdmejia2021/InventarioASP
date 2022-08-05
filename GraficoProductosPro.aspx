<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraficoProductosPro.aspx.cs" Inherits="Inventario2.GraficoProductosPro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbltitulo" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#000099" Text="Filtrar factura (Empresa)"></asp:Label>
        </div>
        <asp:Label ID="lblidfacturapro" runat="server" Font-Bold="True" Font-Names="Arial" Text="Buscar factura empresa x número:"></asp:Label>
        <asp:TextBox ID="txtidfacturapro" runat="server"></asp:TextBox>
        <asp:Button ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" Text="Buscar" />
        <br />
        <br />
        <asp:Chart ID="Chart1" runat="server" DataSourceID="BDFacturaempresa">
            <Series>
                <asp:Series Name="Series1" XValueMember="Fac_NombreProducto" YValueMembers="Fac_Cantidad">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="BDFacturaempresa" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Fac_NombreProducto], [Fac_Cantidad] FROM [FacturaC] WHERE ([Fac_id] = @Fac_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtidfacturapro" Name="Fac_id" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
