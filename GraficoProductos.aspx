<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraficoProductos.aspx.cs" Inherits="Inventario2.GraficoProductos" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbltitulo" runat="server" Font-Bold="True" Font-Names="Arial" Text="Gráfico Productos"></asp:Label>
        </div>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="productos">
            <series>
                <asp:Series Name="Series1" XValueMember="Prod_Nombre" YValueMembers="Prod_Uni">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="productos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Prod_Uni], [Prod_Nombre] FROM [Producto]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
