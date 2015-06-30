using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;
using MySql.Data.MySqlClient;
using System.Data;

namespace ProyectoAsp
{
    public partial class Formulario_web116 : System.Web.UI.Page
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
                object[] obj = (object[])Numero_mensaje[0];
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
            if (IsPostBack)
            {
                string patron = TextBox1.Text;
                if (patron == "")
                    patron = null;
                LOADCURSO(patron);
            }
            else
                LOADCURSO();
        }

        //carga todos los cursos no asociados con el usuario ... 
        private void LOADCURSO(string patron = null)
        {
            string sql = "";
            switch (verificar_usuario())
            {
                case 0:
                    if (patron == null)
                    {
                        sql = "select cursos.imagen_curso , cursos.nombre , cursos.estado " +
                         ", CONCAT ( user.nombre , ' ' , user.apellido) as nombre  , Date_format(cursos.fecha_inicio,'%Y/%M/%d') as fecha  , cursos.abierto , cursos.id_curso , id_noticias "
                         + " FROM cursos INNER JOIN user on user.id_user=cursos.id_docente order by fecha ASC";
                    }
                    else
                    {
                        sql = "select cursos.imagen_curso , cursos.nombre , cursos.estado " +
                       ", CONCAT ( user.nombre , ' ' , user.apellido) as nombre  , Date_format(cursos.fecha_inicio,'%Y/%M/%d') as fecha  , cursos.abierto , cursos.id_periodos , id_noticias "
                       + " FROM cursos INNER JOIN user on user.id_user=cursos.id_docente WHERE cursos.nombre like '%" 
                       + patron + "%' or user.nombre like '%" + patron +  "%' or user.apellido like '%" + patron + "%' order by fecha ASC";
                    }
                    Perfil(0 , sql , patron);
                    break;
                case 1:
                    sql = "select * from cursos";
                    Perfil(1, sql, patron);
                    break;
                default:
                    return;
            }
        }

        private void Perfil( int perfil , string sql , string patron= null)
        {
            Conexion conn = new Conexion();
            conn.IniciarConexion();
            try
            {
                List<string> listacursos = new List<string>() ;
                MySqlDataAdapter adaptador_ = new MySqlDataAdapter(sql, conn.GetConexion);
                DataSet ds = new DataSet();
                adaptador_.Fill(ds);
                DataTable dt_aux = ds.Tables[0];
                DataTable dt = new DataTable();
                int col = Grilla_datos.Columns.Count;

                if (dt_aux.Rows.Count <= 0)
                {
                    cuadro_error.Visible = true;
                    cuadro_error.InnerHtml = "<p align='center'> NO SE ENCONTRARON RESULTADOS , FAVOR INTENTAR DENUEVO </P>";
                }
                else
                    cuadro_error.Visible = false;

                Grilla_datos.Columns.Clear();
                Grilla_datos.AutoGenerateColumns = false;

                dt.Columns.Add("imagen");
                dt.Columns.Add("nombre");
                dt.Columns.Add("estado");
                dt.Columns.Add("docente");
                dt.Columns.Add("fecha");
                dt.Columns.Add("abierto");
                dt.Columns.Add("registrar");
                dt.Columns.Add("comentarios");

                try
                {
                    if (perfil == 0)
                    {
                        string query = "select id_curso from estudiante_curso where id_user like '" + id_usuario + "'";
                        List<object> list = conn.Get_Consulta(query);
                        if (list.Count != 0)
                        {
                            object[] objeto_lista = (object[])list[0];
                            foreach (object data in objeto_lista)
                            {
                                listacursos.Add(data.ToString());
                            }
                        }
                    }
                    else if (perfil == 1)
                    {

                    }
                }
                catch { }

                foreach (DataRow rows in dt_aux.Rows)
                {
                    object[] obj = rows.ItemArray;
                    obj[0] = Seguridad.HttpUrl + "/images/cursos/" + obj[0];

                    if (Convert.ToInt32(obj[5]) == 0)
                    {
                        obj[5] = Seguridad.HttpUrl + "/images/icons/candado1.png";
                        obj[7] = "Curso exclusivo ";
                    }
                    else
                    {
                        obj[5] = Seguridad.HttpUrl + "/images/icons/candado0.png";
                        obj[7] = "Curso para todo publico ";
                    }

                    int bandera = 0;
                    if (listacursos.Count != 0)
                    {
                        foreach (string cursos_actuales in listacursos)
                        {
                            if (cursos_actuales != obj[6].ToString())
                                bandera = 0;
                            else
                                bandera = 1;
                        }
                    }
                    if (bandera == 1)
                    {
                        obj[7] += " , [Ya estas registrado]";
                        obj[6] = null;
                    }
                    else
                        obj[6] = "" + Encriptador.Encriptar_Md5(obj[6].ToString());

                    dt.Rows.Add(obj);
                }

                ImageField img = new ImageField();
                DataControlField Dcontrol;
                img.ShowHeader = true;
                img.HeaderText = "";
                img.DataImageUrlField = "imagen";
                img.ControlStyle.Width = 100;
                img.ControlStyle.Height = 100;
                Dcontrol = img;
                Grilla_datos.Columns.Add(img);

                BoundField Bcampo = new BoundField();
                Bcampo.HeaderText = "NOMBRE CURSO ";
                Bcampo.DataField = "nombre";
                Dcontrol = Bcampo;
                Grilla_datos.Columns.Add(Bcampo);

                Bcampo = new BoundField();
                Bcampo.HeaderText = "ESTADO ";
                Bcampo.DataField = "estado";
                Dcontrol = Bcampo;
                Grilla_datos.Columns.Add(Bcampo);


                 Bcampo = new BoundField();
                Bcampo.HeaderText = "DOCENTE DEL CURSO  ";
                Bcampo.DataField = "docente";
                Dcontrol = Bcampo;
                Grilla_datos.Columns.Add(Bcampo);

                Bcampo = new BoundField();
                Bcampo.HeaderText = "INICIO EL  ";
                Bcampo.DataField = "fecha";
                Dcontrol = Bcampo;
                Grilla_datos.Columns.Add(Bcampo);

                img = new ImageField();
                img.ShowHeader = true;
                img.HeaderText = "ENTRADA  ";
                img.DataImageUrlField = "abierto";
                img.ControlStyle.Width = 25;
                img.ControlStyle.Height =25;
                Dcontrol = img;
                Grilla_datos.Columns.Add(img);

                HyperLinkField link = new HyperLinkField();
                link.HeaderText = "REGISTRAR CURSO";
                link.Text = "Registrar";
                link.DataNavigateUrlFields = new string[] { "registrar" };
                link.DataNavigateUrlFormatString = "RegistrarCurso.aspx?id={0}";
                link.NavigateUrl = "hola.aspx";
                Dcontrol = link;
                Grilla_datos.Columns.Add(link);

                Bcampo = new BoundField();
                Bcampo.HeaderText = "COMENTARIOS  ";
                Bcampo.DataField = "comentarios";
                Dcontrol = Bcampo;
                Grilla_datos.Columns.Add(Bcampo);

        
                Grilla_datos.DataSource = dt;
                Grilla_datos.DataBind();

                conn.CerrarConexion();
                return;
            }
            catch (Exception ex) {
                try
                {
                    Log.Set_Log_Error(ex.Message , "buscar cursos " , id_usuario);
                    conn.CerrarConexion();
                }
                catch {}
            }


            cuadro_error.Visible = true;
            cuadro_error.InnerHtml = "<p align='center'> NO SE ENCONTRARON RESULTADOS , FAVOR INTENTAR DENUEVO </P>";
            return;

        }



        private int verificar_usuario()
        {
            return new usuario().TipoDeusuario(id_usuario);
        }

    }
}