using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using ProyectoAsp.Clases;


namespace ProyectoAsp
{
    public partial class Formulario_web117 : System.Web.UI.Page
    {

        //class="form-error"

        static string IdCurso_ = null;
        private Conexion conn = null;
        private static bool CursoAbierto_ = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    IdCurso_ = Encriptador.Desencriptar_Md5(Request.QueryString["id"]);
                    CargarCurso();
                }
                catch { Response.Redirect("index.aspx" ,true); }
            }
               
        }

        private void CargarCurso()
        {
            if (conn == null)
                conn = new Conexion();
            conn.IniciarConexion();
            lblerrmenaje.Visible = false;
            try
            {
                string sql = "SELECT cursos.nombre , cursos.estado , cursos.imagen_curso , CONCAT( user.nombre , ' ' , user.apellido) as docente "
                    + " , cursos.fecha_inicio , cursos.abierto from cursos inner join user on cursos.id_docente=user.id_user where cursos.id_curso like '" + IdCurso_ + "'";
                List<object> data_resultado = conn.Get_Consulta(sql);
                object[] obj_resultado = (object[]) data_resultado[0];

                var nombre = obj_resultado[0];
                var estado = obj_resultado[1];
                var imagen = obj_resultado[2];
                var docente = obj_resultado[3];
                var fecha = obj_resultado[4];
                var abierto = obj_resultado[5];

                if (Convert.ToInt32(estado) == 1)
                    estado = "ESTE CURSO SE ESTA IMPARTIENDO";
                else
                    estado = "ESTE CURSO SE HA CERRADO ";

                if (Convert.ToInt32(abierto) == 0)
                    abierto = false;
                else
                    abierto = true;

                CursoAbierto_ = (bool) abierto;
                Nombre_curso.InnerText = nombre + "  [" + estado + "]";
                imagen_curso.Src = Seguridad.HttpUrl + "/images/cursos/" + imagen;
                imagen_curso_lateral.ImageUrl = Seguridad.HttpUrl + "/images/cursos/" + imagen;
                lbl1.Text = "Nombre del curso : " +  nombre;
                lbl2.Text = "Docente del curso : " + docente;
                lbl3.Text = "Fecha de apertura: " + fecha;

                CursoAbierto((bool) abierto);
            }
            catch
            {
                return;
            }
        }

        private bool CursoAbierto(bool estado )
        {
            try
            {
                switch (estado)
                {
                    case true:
                        txtcodigo.Text = "Este Curso esta abierto para todo publico (click registrar curso)";
                        txtcodigo.Enabled = false;
                        return true;
                    case false:
                        txtcodigo.Enabled = true;
                        return false;
                    default:
                        return false;
                }
            }
            catch { return false; }

        }

        private void RegistrarCurso(string sql )
        {

        }

        protected void cmdacceder_Click(object sender, EventArgs e)
        {
            switch (CursoAbierto_)
            {

                case false:
                    if (txtcodigo.Text == null || txtcodigo.Text == "")
                    {
                        lblerrmenaje.Visible = true;
                        lblerrmenaje.Text = "SE NECESITA UN CODIGO DE ACCESO";
                        return;
                    }
                   
                    try
                    {
                        
                        if (string.Compare(IdCurso_ , txtcodigo.Text) == 0)
                        {
                            
                            conn = new Conexion();
                            conn.IniciarConexion();

                            string ID_ESTUDIANTE_CURSO = "@est"
                            + new Random(DateTime.Now.Millisecond).Next(100, 200).ToString()
                             + new Random(DateTime.Now.Millisecond).Next(200, 900).ToString()
                              + new Random(DateTime.Now.Millisecond).Next(1, 99).ToString();

                            string sql = "INSERT INTO estudiante_curso (id_estudiante , id_curso , id_user) VALUES ('"
                                + ID_ESTUDIANTE_CURSO + "','" + IdCurso_ + "','" + Session["id_user"].ToString() + "')";

                            bool ok = conn.Get_Consulta_booleana(sql);
                            if (ok)
                            {
                                Response.Redirect("curso.aspx?id=" + Encriptador.Encriptar_Md5(IdCurso_) , true);
                            }
                        }
                    }
                    catch { }
                    break;
                case true:
                    try
                    {
                        
                        conn = new Conexion();
                        conn.IniciarConexion();

                        string ID_ESTUDIANTE_CURSO = "@estPublic"
                        + new Random(DateTime.Now.Millisecond).Next(100, 200).ToString()
                         + new Random(DateTime.Now.Millisecond).Next(200, 900).ToString()
                          + new Random(DateTime.Now.Millisecond).Next(1, 99).ToString();

                        string sql = "INSERT INTO estudiante_curso (id_estudiante , id_curso , id_user) VALUES ('"
                            + ID_ESTUDIANTE_CURSO + "','" + IdCurso_ + "','" + Session["id_user"].ToString() + "')";

                        bool ok = conn.Get_Consulta_booleana(sql);
                        if (ok)
                        {
                            Response.Redirect("curso.aspx?id=" + Encriptador.Encriptar_Md5(IdCurso_), true);
                        }
                    }
                    catch
                    {
                    }
                    break;

            }
        }
    }
}