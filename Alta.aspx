<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="Tienda_Online.Alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alta de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="encabezado">
            <h1>Alta de productos</h1>
        </div>

        <div class="contenido">

            <!-- Nombre del producto -->
            <p>Nombre:<br />
                <asp:TextBox ID="txtNombre" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                    ControlToValidate="txtNombre" ForeColor="Red"
                    ErrorMessage="Ingresá el nombre"></asp:RequiredFieldValidator>
            </p>

            <!-- Precio del producto -->
            <p>Precio:<br />
                <asp:TextBox ID="txtPrecio" runat="server" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPrecio" runat="server"
                    ControlToValidate="txtPrecio" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Ingresá el precio"></asp:RequiredFieldValidator>
                <!-- Valida que sea un número mayor a 0 -->
                <asp:RangeValidator ID="rvPrecio" runat="server"
                    ControlToValidate="txtPrecio" Type="Double"
                    MinimumValue="1" MaximumValue="99999999" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="El precio tiene que ser un número mayor o igual a 1"></asp:RangeValidator>
            </p>

            <!-- Categoría: se llena desde la tabla categorias -->
            <p>Categoría:<br />
                <asp:DropDownList ID="ddlCategoria" runat="server"
                    DataSourceID="sdsCategorias"
                    DataTextField="descripcion"
                    DataValueField="idCategoria">
                </asp:DropDownList>
            </p>

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar producto"
                OnClick="btnGuardar_Click" />

            <p>
                <asp:Label ID="lblMensaje" runat="server" ForeColor="Green"></asp:Label>
            </p>

            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/Default.aspx">
                Volver al menú
            </asp:HyperLink>

            <!-- SqlDataSource 1: trae las categorías para el DropDownList -->
            <asp:SqlDataSource ID="sdsCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
                SelectCommand="SELECT idCategoria, descripcion FROM categorias ORDER BY descripcion">
            </asp:SqlDataSource>

            <!-- SqlDataSource 2: inserta el producto nuevo -->
            <asp:SqlDataSource ID="sdsProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
                InsertCommand="INSERT INTO productos (nombre, precio, idCategoria) VALUES (@nombre, @precio, @idCategoria)">
                <InsertParameters>
                    <asp:ControlParameter Name="nombre" ControlID="txtNombre"
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter Name="precio" ControlID="txtPrecio"
                        PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter Name="idCategoria" ControlID="ddlCategoria"
                        PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>

        </div>

    </form>
</body>
</html>
