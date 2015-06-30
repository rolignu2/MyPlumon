using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web115 : System.Web.UI.Page
    {

          #region Funciones_Estandares

        static string id_usuario = null;

        private void Get_mensaje()
        {
            try
            {
               
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                string sql = " SELECT COUNT(id_user) FROM mensajeria WHERE id_user like '" + id_usuario + "' and leido=0";
                List<object> Numero_mensaje = conn.Get_Consulta(sql);
                conn.CerrarConexion();
                object[] obj = (object[]) Numero_mensaje[0];
                Master.SetMensajeria_estudiante(obj[0].ToString(), "mensajeria.aspx?id=" + id_usuario);
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "INDEX.ASPX", id_usuario);
            }
        }

        private void LoadMaster()
        {
            try
            {
                //verificamos la sesion si esta activa en dado caso no exista ira al inicio (LOGIN)
                id_usuario = Session["id_user"].ToString();
                if (id_usuario == null || id_usuario == "")
                {
                    Response.Redirect("Login.aspx", true);
                    return;
                }

                //verificamos el estado por seguridad , si esta activo o no  0 inactivo , 1 activo en dado caso este inactivo redirecciona a otra pagina
                string estado = Session["estado"].ToString();
                bool estatus = Seguridad.UsuarioActivo(Convert.ToInt32(estado));
                if (estatus == false)
                    Response.Redirect("Inactivo.aspx", true);

                //verificamos los privilegios , este codigo es muy importante ya que aca separa del usuario , maestro o administrador
                string p = Session["perfil"].ToString();
                int perfil = Convert.ToInt32(p);
                switch (perfil)
                {
                    case 0:
                        ((Label)Master.FindControl("lbltab1")).Text = "Cursos Activos";
                        ((Label)Master.FindControl("lbltab2")).Text = "Todos Los cursos";
                        ((Label)Master.FindControl("lbltab3")).Text = "Cursos Cerrados";
                        Master.SetUsuario_data();
                        Master.SetEstudiante();
                        Master.SetMensajeria_estudiante("", "");
                        break;
                    case 1:
                        ((Label)Master.FindControl("lbltab1")).Text = "Crear Nuevo Cuso";
                        ((Label)Master.FindControl("lbltab2")).Text = "Cursos no impartidos";
                        ((Label)Master.FindControl("lbltab3")).Text = "Ver Cursos De otro Tutor";
                        Master.SetUsuario_data();
                        Master.SetCursoTutor();
                        break;
                    case 2:
                        break;
                    default:
                        break;
                } //fin codigo verificacion perfil
                //bienvenida al usuario
                Get_mensaje();
            }
            catch
            {
                Response.Redirect("login.aspx");
            }
        }



        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMaster();
        }


        protected void CmdGuardar_Click(object sender, EventArgs e)
        {
            Conexion conn = new Conexion();
            lblmensaje.Visible = true;
            try
            {
                if (checkacepto.Checked == false)
                {
                    lblmensaje.InnerText = "Acepta los terminos y condiciones de uso";
                    return;
                }
                string codigo = txtrcod.Text;
                string nombre = txtnombre.Text;
                if (codigo == "")
                {
                    if (checkcod.Checked == true)
                    {
                        string asignar_cod = null;
                        if (nombre.Length >= 4)
                            asignar_cod = nombre.Substring(0, 4)
                                + new Random(DateTime.Now.Millisecond).Next(0, 9).ToString()
                                + new Random(DateTime.Now.Millisecond).Next(0, 9).ToString()
                                + new Random(DateTime.Now.Millisecond).Next(0, 9).ToString();
                        else if (nombre.Length < 4)
                            asignar_cod = nombre
                                + new Random(DateTime.Now.Millisecond).Next(0, 9).ToString()
                                + new Random(DateTime.Now.Millisecond).Next(0, 9).ToString()
                                + new Random(DateTime.Now.Millisecond).Next(0, 9).ToString()
                                + new Random(DateTime.Now.Millisecond).Next(0, 9).ToString();
                        codigo = asignar_cod;
                    }
                    else
                    {
                       
                       lblmensaje.InnerText = "Asigna un codigo del curso impartido o coloca autogenerar";
                       return;
                    }
                }

                conn.IniciarConexion();
                int abierto_cerrado = 0;

                if (checkabierto.Checked == true)
                    abierto_cerrado = 1;
                else
                    abierto_cerrado = 0;

                HttpPostedFile ImgFile = subir_img.PostedFile;
                string imagen_curso = null;
                if (ImgFile.ContentLength != 0)
                {
                    SubirArchivos archivar = new SubirArchivos();
                    string mapeo = Server.MapPath(@"~/images/cursos");
                    imagen_curso = archivar.SubirImagen(mapeo, ImgFile);
                }

                string id_periodo = null;
                id_periodo = Encriptador.Encriptar_Md5(codigo);


                string sql = "INSERT INTO cursos (id_curso , nombre , estado , imagen_curso , id_docente , id_periodos , fecha_inicio , abierto) VALUES ('"
                    + codigo + "','" + nombre + "',1" + ",'"
                    + imagen_curso + "','" + id_usuario + "','"
                    + id_periodo + "','"
                    + Seguridad.FormatoFecha(DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString())
                    + "'," + abierto_cerrado + ")";

                bool consulta = conn.Get_Consulta_booleana(sql);

                if (consulta)
                    lblmensaje.InnerHtml = "Curso creado con exito ";
                else
                    lblmensaje.InnerHtml = "No se pudo crear el curso ,el servidor esta ocupado";

                conn.CerrarConexion();
            }

            catch (Exception ex)
            {
                try
                {
                    lblmensaje.InnerText = "HUBO UN ERROR INESPERADO , INTENTAR MAS TARDE ESTA PETICION";
                    Log.Set_Log_Error(ex.Message, "add curso", id_usuario);
                    conn.CerrarConexion();
                }
                catch { }
            }
        }

       


    }
}