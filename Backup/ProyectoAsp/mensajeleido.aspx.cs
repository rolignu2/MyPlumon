using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web129 : System.Web.UI.Page
    {

        static string id_mensaje = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    id_mensaje = Seguridad.Id_cript_cadena(Encriptador.Desencriptar_Md5(Request.QueryString["id"].ToString()));
                    string direccion_retorno = Session["MensajeriaPrevia"].ToString();
                    usuario user = new usuario();
                    string sql = "SELECT leido From mensajeria WHERE id_mensaje Like '" + id_mensaje + "'";
                    user.IniciarConexion();
                    List<object> obj = user.Get_Consulta(sql);
                    object[] msj = (object[])obj[0];

                    if (Convert.ToInt32(msj[0].ToString()) == 0)
                        user.MensajeLeido(id_mensaje);
                    else
                        user.MensajeLeido(id_mensaje, 0);

                    user.CerrarConexion();
                    Response.Redirect(direccion_retorno, true);
                }
                catch { }
            }
        }
    }
}