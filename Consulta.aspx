<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="Tienda_Online.Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="encabezado">
            <h1>Consulta de productos</h1>
        </div>

        <div class="contenido">

            <!-- Grilla que muestra el resultado del JOIN entre productos y categorias -->
            <asp:GridView ID="gvProductos" runat="server"
                DataSourceID="sdsConsulta"
                AutoGenerateColumns="False"
                DataKeyNames="idProducto"
                CssClass="tabla"
                EmptyDataText="No hay productos cargados.">
                <Columns>
                    <asp:BoundField DataField="idProducto" HeaderText="ID" />
                    <asp:BoundField DataField="nombre" HeaderText="Producto" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="categoria" HeaderText="Categoría" />
                </Columns>
            </asp:GridView>

            <br />

            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/Default.aspx">
                Volver al menú
            </asp:HyperLink>

            <!-- SqlDataSource con JOIN: une cada producto con la descripción de su categoría -->
            <asp:SqlDataSource ID="sdsConsulta" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS categoria
                               FROM productos p
                               INNER JOIN categorias c ON p.idCategoria = c.idCategoria
                               ORDER BY p.idProducto">
            </asp:SqlDataSource>

        </div>

    </form>
</body>
</html>