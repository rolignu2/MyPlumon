using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web124 : System.Web.UI.Page
    {

        private static string curso_id = "";
        private static string encript_curso_id = "";
        private static string id_usuario = "";
        private static string img_bdd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Configuracion_master();
                CargarDatosCurso();
            }
        }

        protected void CargarDatosCurso()
        {
            Tutor Tutor = new Tutor();
            List<object> CursoList = Tutor.GetDataCurso(curso_id);
            try
            {
                object[] obj = (object[])CursoList[0];
                txtrcod.Text = obj[0].ToString();
                txtnombre.Text = obj[1].ToString();
                dropestado.Text = obj[2].ToString();

                if (obj[3].ToString() != "" || obj[3].ToString() != null || obj[3].ToString() != "NULL" || obj[3].ToString() != " NULL")
                {
                    string img = Seguridad.HttpUrl + "/images/cursos/" + obj[3].ToString();
                    img_bdd = obj[3].ToString();
                    imagen_curso.ImageUrl = img;
                }

                if (obj[4].ToString() == "1")
                    checkabierto.Checked = true;
                else
                    checkabierto.Checked = false;
            }
            catch { }
        }

        protected void CmdGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                string imagen = null;
                string abierto = "";


                if (subir_img.PostedFile.ContentLength > 0)
                {
                    string dir = Server.MapPath(@"~/images/cursos");
                    imagen = new SubirArchivos().SubirImagen(dir, subir_img.PostedFile);
                }
                else
                    if (img_bdd != null)
                        imagen = img_bdd;

                if(checkabierto.Checked)
                    abierto = "1";
                else 
                    abierto = "0";

                string sql = "UPDATE cursos SET id_curso='" 
                    + txtrcod.Text + "', nombre='" + txtnombre.Text 
                    + "', estado='" + dropestado.Text + "', imagen_curso='" 
                    + imagen + "',abierto=" + abierto + " WHERE id_curso ='" + curso_id + "'" ;

                bool ok = conn.Get_Consulta_booleana(sql);
                if (ok)
                {
                    lblmensaje.InnerHtml = "Curso se ha editado con exito ";
                    lblmensaje.InnerHtml += " ";
                    lblmensaje.InnerHtml += "<a href='" + Session["Previa"].ToString() + "'>Regresar al curso</a>";
                }
                else
                    lblmensaje.InnerHtml = "Opps Hubo un error, Favor intentar denuevo ";

                lblmensaje.Visible = true;
                conn.CerrarConexion();

            }
            catch { }
        }

        #region Funciones_Estandares

        private void Get_mensaje()
        {
            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                string sql = " SELECT COUNT(id_user) FROM mensajeria WHERE id_user like '" + id_usuario + "' and leido=0";
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

            //verificamos la sesion si esta activa en dado caso no exista ira al inicio (LOGIN)
            try
            {
                var sesion_c = Session.Count;
                if (sesion_c <= 0)
                {
                    Response.Redirect("Login.aspx", true);
                    return;
                }

                id_usuario = Session["id_user"].ToString();
            }
            catch { Log.Set_Log_Error("Error sesion", "curso"); }

            try
            {
               
                curso_id = Seguridad.Id_cript_cadena(Request.QueryString["id"].ToString());
                encript_curso_id = curso_id;
                curso_id = Encriptador.Desencriptar_Md5(curso_id);
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
            catch { }
        }

        #endregion
    }
}