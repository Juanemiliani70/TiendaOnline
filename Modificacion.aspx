<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificacion.aspx.cs" Inherits="Tienda_Online.Modificacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modificación de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="encabezado">
            <h1>Modificación de productos</h1>
        </div>

        <div class="contenido">

            <%-- Grilla editable: el botón "Editar" de cada fila habilita los campos --%>
            <asp:GridView ID="gvModificacion" runat="server"
                DataSourceID="sdsModificacion"
                AutoGenerateColumns="False"
                DataKeyNames="idProducto"
                CssClass="tabla"
                EmptyDataText="No hay productos cargados.">
                <Columns>

                    <%-- Botones Editar / Guardar / Cancelar --%>
                    <asp:CommandField ShowEditButton="True"
                        EditText="Editar" UpdateText="Guardar" CancelText="Cancelar" />

                    <%-- El ID no se puede modificar --%>
                    <asp:BoundField DataField="idProducto" HeaderText="ID" ReadOnly="True" />

                    <asp:BoundField DataField="nombre" HeaderText="Producto" />

                    <%-- Sin DataFormatString para que al editar aparezca el número limpio --%>
                    <asp:BoundField DataField="precio" HeaderText="Precio" />

                    <%-- Categoría: texto normal, y un desplegable cuando se edita --%>
                    <asp:TemplateField HeaderText="Categoría">
                        <ItemTemplate>
                            <asp:Label ID="lblCategoria" runat="server"
                                Text='<%# Eval("categoria") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCategoriaEdit" runat="server"
                                DataSourceID="sdsCategorias"
                                DataTextField="descripcion"
                                DataValueField="idCategoria"
                                SelectedValue='<%# Bind("idCategoria") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <br />

            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/Default.aspx">
                Volver al menú
            </asp:HyperLink>

            <%-- SqlDataSource principal: trae los productos (con JOIN) y actualiza --%>
            <asp:SqlDataSource ID="sdsModificacion" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, p.idCategoria, c.descripcion AS categoria
                               FROM productos p
                               INNER JOIN categorias c ON p.idCategoria = c.idCategoria
                               ORDER BY p.idProducto"
                UpdateCommand="UPDATE productos
                               SET nombre = @nombre, precio = @precio, idCategoria = @idCategoria
                               WHERE idProducto = @idProducto">
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="precio" Type="Decimal" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <%-- SqlDataSource auxiliar: llena el desplegable de categorías al editar --%>
            <asp:SqlDataSource ID="sdsCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
                SelectCommand="SELECT idCategoria, descripcion FROM categorias ORDER BY descripcion">
            </asp:SqlDataSource>

        </div>

    </form>
</body>
</html>