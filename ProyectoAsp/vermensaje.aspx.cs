using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web128 : System.Web.UI.Page
    {

        static string id_mensaje = null;
        static string id_usuario = null;
        static string id_usuario_de = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    id_mensaje = Seguridad.Id_cript_cadena(Encriptador.Desencriptar_Md5(Request.QueryString["id"].ToString()));
                    Configuracion_master();
                    CargarMensaje();
                }
                catch { }
            }
        }



        /*	<div class="stripe-separator"><!-- --></div>
							
							<blockquote>This is a blockquote followed by a cite tag. And no matter how much text you put in this, it will automatically resize.</blockquote>
							<cite>- John</cite>*/

        protected void CargarMensaje()
        {

            usuario user = new usuario();
            //id_usuario_de  , nombre , asunto , mensaje , leido
            List<object> ObjMensaje = user.VerMensaje(id_mensaje);
            
            if (ObjMensaje.Count >= 1)
            {
                object[] Obj = (object[])ObjMensaje[0];
                id_usuario_de = Obj[0].ToString();
                tablon_de.InnerHtml = "<h3>" + Obj[1].ToString() + "</h3>";
                tablon_mensaje.InnerHtml = "<div class='stripe-separator'><!-- --></div>";
                tablon_mensaje.InnerHtml += "<h3>Asunto: " + Obj[2].ToString() + "</h3>";
                tablon_mensaje.InnerHtml += "<div class='stripe-separator'><!-- --></div>";
                tablon_mensaje.InnerHtml += "" + Obj[3].ToString() + "";
                tablon_mensaje.InnerHtml += "<div class='stripe-separator'><!-- --></div>";
                tablon_mensaje.InnerHtml += "<cite><a class='round button blue text-upper ' href='mensaje.aspx?id=" + id_usuario_de + "'>Contestar Mensaje</a></cite>";
                if (Convert.ToInt32(Obj[4].ToString()) == 0)
                    user.MensajeLeido(id_mensaje);
            }


        }

        #region Funciones_Estandares

        private void Get_mensaje()
        {
            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                string sql = " SELECT COUNT(id_user) FROM mensajeria WHERE id_user like '" + id_usuario + "'  and leido=0";
                List<object> Numero_mensaje = conn.Get_Consulta(sql);
                conn.CerrarConexion();
                object[] obj = (object[])Numero_mensaje[0];
                Master.SetMensajeria_estudiante(obj[0].ToString(), "mensajeria.aspx?id=" + id_usuario);
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "INDEX.ASPX", id_usuario);
            }
        }

        private void Configuracion_master()
        {

            id_usuario = Session["id_user"].ToString();
            if (id_usuario == null || id_usuario == "")
            {
                Response.Redirect("Login.aspx", true);
                return;
            }

            string p = Session["perfil"].ToString();
            int perfil = Convert.ToInt32(p);
            switch (perfil)
            {
                case 0:
                   ((Label)Master.FindControl("lbltab1")).Text = "Cursos Cerrados";
                        ((Label)Master.FindControl("lbltab2")).Text = "Buscar Cursos";
                        ((Label)Master.FindControl("lbltab3")).Text = "Todos los Cursos";
                    Master.SetEstudiante();
                    break;
                case 1:
                    ((Label)Master.FindControl("lbltab1")).Text = "Crear Nuevo Cuso";
                     ((Label)Master.FindControl("lbltab2")).Text = "Cursos no impartidos";
                    ((Label)Master.FindControl("lbltab3")).Text = "Ver Cursos De otro Tutor";
                    break;
                case 2:
                    break;
                default:
                    break;
            }
            //muestra los periodos por medio de los perfiles 
            // ejemplo : si el perfil es el tutor muestra las herramientas del tutor por ese periodo 
            // si el perfil es estudiante  entonces muestra el periodo sin ninguna manipulacion
            Master.SetUsuario_data();
            Get_mensaje();
        }

        #endregion
    }
}