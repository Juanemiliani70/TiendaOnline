<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja.aspx.cs" Inherits="Tienda_Online.Baja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Baja de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="encabezado">
            <h1>Baja de productos</h1>
        </div>

        <div class="contenido">

            <%-- Grilla con un botón Eliminar por fila --%>
            <asp:GridView ID="gvBaja" runat="server"
                DataSourceID="sdsBaja"
                AutoGenerateColumns="False"
                DataKeyNames="idProducto"
                CssClass="tabla"
                EmptyDataText="No hay productos cargados.">
                <Columns>

                    <%-- Botón Eliminar con confirmación antes de borrar --%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEliminar" runat="server"
                                CommandName="Delete"
                                Text="Eliminar"
                                OnClientClick="return confirm('¿Seguro que querés eliminar este producto?');">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

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

            <%-- SqlDataSource: lista los productos (con JOIN) y borra el elegido --%>
            <asp:SqlDataSource ID="sdsBaja" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS categoria
                               FROM productos p
                               INNER JOIN categorias c ON p.idCategoria = c.idCategoria
                               ORDER BY p.idProducto"
                DeleteCommand="DELETE FROM productos WHERE idProducto = @idProducto">
                <DeleteParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

        </div>

    </form>
</body>
</html>