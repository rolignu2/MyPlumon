using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web120 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdeliminar_Click(object sender, EventArgs e)
        {
            string id_documento = Seguridad.Id_cript_cadena(Request.QueryString["id"].ToString());
            bool ok = new Tutor().Eliminar_Documento_Periodo(id_documento);
            if (ok)
            {
                Response.Redirect(Session["PreviaEliminar"].ToString(), true);
                return;
            }
            else
            {
                Response.Redirect(Session["PreviaEliminar"].ToString(), true);
                return;
            }
        }
    }
}