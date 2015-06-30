using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web126 : System.Web.UI.Page
    {

        static string id_para = "";
        static string id_usuario = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarioMensaje();
                Configuracion_master();
            }
        }

        protected void CargarUsuarioMensaje()
        {
            try
            {
                if (Request.QueryString.Count >= 1)
                {
                    id_para = Request.QueryString["id"].ToString();
                    id_para = Seguridad.Id_cript_cadena(id_para);
                }


                List<object> objU = new usuario().GetUsuario(id_para);

                if (objU.Count != 0)
                {
                    object[] obj = (object[])objU[0];
                    txtpara.InnerText = "PARA :  " +  obj[0].ToString();
                }

            }
            catch { }

        }

        protected void cmdenviar_Click(object sender, EventArgs e)
        {
            bool enviado = new usuario().EnviarMensaje(id_usuario, id_para , txtasunto.Text , txtmensaje.Text);
            if (enviado)
            {
                divmensaje.InnerHtml = "<div class='" + new Cssclass().confirmacion + "'>Mensaje Enviado con exito</div>"; 
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