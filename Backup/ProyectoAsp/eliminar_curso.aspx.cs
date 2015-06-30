using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web123 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdeliminar_Click(object sender, EventArgs e)
        {
            var curso_id = Seguridad.Id_cript_cadena(Request.QueryString["id"].ToString());
            var encript_curso_id = curso_id;
            curso_id = Encriptador.Desencriptar_Md5(curso_id);
            bool ok = new Tutor().EliminarCurso(curso_id.ToString());
            if (ok)
            {
                Response.Redirect("index.aspx", true);
                return;
            }
            else
            {
                Response.Redirect("index.aspx", true);
                return;
            }
        }
    }
}