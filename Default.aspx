<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tienda_Online.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tienda Online</title>
    <!-- Vincula la hoja de estilos externa (punto extra de la consigna) -->
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="encabezado">
            <h1>Tienda Online</h1>
            <p>Administración de productos y categorías</p>
        </div>

        <div class="contenido">
            <h2>Menú principal</h2>

            <div class="menu">
                <!-- Cada HyperLink lleva a un formulario del CRUD -->
                <asp:HyperLink ID="lnkAlta" runat="server"
                    NavigateUrl="~/Alta.aspx" CssClass="boton-menu">
                    Alta de productos
                </asp:HyperLink>

                <asp:HyperLink ID="lnkConsulta" runat="server"
                    NavigateUrl="~/Consulta.aspx" CssClass="boton-menu">
                    Consulta de productos
                </asp:HyperLink>

                <asp:HyperLink ID="lnkModificacion" runat="server"
                    NavigateUrl="~/Modificacion.aspx" CssClass="boton-menu">
                    Modificación de productos
                </asp:HyperLink>

                <asp:HyperLink ID="lnkBaja" runat="server"
                    NavigateUrl="~/Baja.aspx" CssClass="boton-menu">
                    Baja de productos
                </asp:HyperLink>
            </div>
        </div>

    </form>
</body>
</html>