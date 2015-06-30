using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web127 : System.Web.UI.Page
    {

        static string id_mensaje = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    id_mensaje = Seguridad.Id_cript_cadena(Encriptador.Desencriptar_Md5(Request.QueryString["id"].ToString()));
                }
                catch { }
            }
        }

        protected void cmdeliminar_Click(object sender, EventArgs e)
        {
            bool eliminado = new usuario().EliminarMensaje(id_mensaje);
            Response.Redirect(Session["MensajeriaPrevia"].ToString() , true);
        }
    }
}