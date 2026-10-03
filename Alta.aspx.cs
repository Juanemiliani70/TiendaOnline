using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda_Online
{
    public partial class Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Se ejecuta al hacer click en "Guardar producto"
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Si algún validador falla, no se guarda nada
            if (!Page.IsValid)
            {
                return;
            }

            // Ejecuta el InsertCommand del SqlDataSource con los parámetros de los controles
            sdsProductos.Insert();

            lblMensaje.Text = "Producto guardado correctamente.";

            // Limpia los campos para cargar otro producto
            txtNombre.Text = "";
            txtPrecio.Text = "";
        }
    }
}