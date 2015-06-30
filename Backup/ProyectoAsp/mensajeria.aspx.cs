using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web125 : System.Web.UI.Page
    {

        static string id_usuario = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Configuracion_master();
                CargarMenjaes();
            }
        }



        protected void CargarMenjaes()
        {

            List<object> MensajesUsuario = new usuario().GetMensajesUsuario(id_usuario);
            int ContMsj = MensajesUsuario.Count;
            int ContMsjNoLeidos = 0;
            if (ContMsj == 0)
            {
                txtcontmensaje.InnerText = "0 mensajes recibidos";
                TablonMensajes.InnerHtml = "<div class='" + new Cssclass().error + "'>No tiene Mensajes</div>";
            }
            else
            {
                txtcontmensaje.InnerText = ContMsj + " Mensajes recibidos ";
                TablonMensajes.InnerHtml = "<table><thead>";
                TablonMensajes.InnerHtml += "<tr>";
                TablonMensajes.InnerHtml += "<th></th>";
                TablonMensajes.InnerHtml += "<th>Asunto</th>";
                TablonMensajes.InnerHtml += "<th>Nombre</th>";
                TablonMensajes.InnerHtml += "<th>Eliminar</th>";
                TablonMensajes.InnerHtml += "<th>Marcar Como</th>";
                TablonMensajes.InnerHtml += "</tr>";
                TablonMensajes.InnerHtml += "</thead><tbody>";

                //objeto : id , nombre , imagen , asunto,  fecha , hora , leido
                foreach (object msj in MensajesUsuario)
                {
                    object[] obj_msj = (object[])msj;
                    string imagen = Seguridad.HttpUrl + "/images/avatar/" + obj_msj[2].ToString();
                    string nombre = obj_msj[1].ToString();
                    string asunto = obj_msj[3].ToString();
                    string id_mensaje = Encriptador.Encriptar_Md5(obj_msj[0].ToString());
                    string fecha = obj_msj[4].ToString();
                    fecha = Convert.ToDateTime(fecha).ToShortDateString();
                    string hora = obj_msj[5].ToString();
                    string leido = obj_msj[6].ToString();

                    if (Convert.ToInt32(leido) == 0)
                        ContMsjNoLeidos++;

                    if (asunto == "" || asunto == null || asunto == "NULL")
                        asunto = "sin asunto";

                    TablonMensajes.InnerHtml += "<tr>";
                    TablonMensajes.InnerHtml += "<td><img src='" + imagen + "' width='60' height='60' /></td>";
                    TablonMensajes.InnerHtml += "<td><a href='vermensaje.aspx?id=" + id_mensaje + "'>" + asunto + "</a></td>";
                    TablonMensajes.InnerHtml += "<td>" + nombre + "";
                    TablonMensajes.InnerHtml += "<p>Enviado: " + fecha + " A las " + hora + "</p></td>";
                    TablonMensajes.InnerHtml += "<td><a href='eliminarmensaje.aspx?id=" + id_mensaje + "'>Eliminar mensaje</a></td>";
                    
                    if(Convert.ToInt32(leido) == 0)
                        TablonMensajes.InnerHtml += "<td><a href='mensajeleido.aspx?id=" + id_mensaje + "'>Leido</a></td>";
                    else
                        TablonMensajes.InnerHtml += "<td><a href='mensajeleido.aspx?id=" + id_mensaje + "'>No Leido</a></td>";
                    
                    TablonMensajes.InnerHtml += "</tr>";

                }

                TablonMensajes.InnerHtml += "</tbody></table>";

                Session["MensajeriaPrevia"] = HttpContext.Current.Request.Url.AbsoluteUri;
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
                    Master.SetCursoTutor();
                    Master.SetUsuario_data();
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