using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web122 : System.Web.UI.Page
    {

        static string id_usuario = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                LoadMaster();
        }



        private void Get_Usuario_Cursos()
        {
            usuario USUARIO = new usuario();
            List<object> ListaCurso = USUARIO.Get_Cursos_Usuario(id_usuario);
            if (ListaCurso == null)
            {
                div_tabla.InnerHtml = "<div class='warning-box' ><p align='center' >Lo sentimos no se pudieron cargar los cursos </p>"
                    + "</ br><p align='center'>puede que la conexion este saturada; intentar mas tarde</p>";
            }
            else if (ListaCurso.Count >= 1)
            {

                div_tabla.InnerHtml = "<table><thead><tr><th></th>"
                                    + "<th>Nombre</th>"
                                    + "<th>Catedratico</th>"
                                    + "<th>Fecha Inicio</th>"
                                    + "<th>Link</th></tr></thead><tbody>";

                for (int i = 0; i < ListaCurso.Count; i++)
                {
                    object A = ListaCurso[i];
                    object[] B = (object[])A;
                    string[] Datos_cursos = Array.ConvertAll(B, p => (p ?? String.Empty).ToString());
                    div_tabla.InnerHtml += "<tr>";
                    string url_imagen = Seguridad.HttpUrl + "/images/cursos/" + Datos_cursos[3];
                    div_tabla.InnerHtml += "<td><img src='" + url_imagen + "' width='60' height='60' /></td>";
                    div_tabla.InnerHtml += "<td>" + Datos_cursos[0].ToString() + "</td>";
                    div_tabla.InnerHtml += "<td>" + Datos_cursos[1].ToString() + "</td>";
                    DateTime fecha = Convert.ToDateTime(Datos_cursos[2].ToString());
                    div_tabla.InnerHtml += "<td>" + fecha.ToShortDateString() + "</td>";
                    string encrypt = Encriptador.Encriptar_Md5(Datos_cursos[4]);
                    div_tabla.InnerHtml += "<td><a href='curso.aspx?id=" + encrypt + "'>Ir al curso</a></td>";
                    div_tabla.InnerHtml += "</tr>";
                }
                div_tabla.InnerHtml += "<tbody></table>";
            }
            else
            {
            }
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
                
                    case 1:
                        ((Label)Master.FindControl("lbltab1")).Text = "Crear Nuevo Cuso";
                        ((Label)Master.FindControl("lbltab2")).Text = "Cursos no impartidos";
                        ((Label)Master.FindControl("lbltab3")).Text = "Ver Cursos De otro Tutor";
                        Master.SetUsuario_data();
                        Master.SetCursoTutor();
                        Get_Usuario_Cursos();
                        break;
                    default:
                        break;
                }
                Get_mensaje();
            }
            catch
            {
                Response.Redirect("login.aspx");
            }
        }

        #endregion
    }
}