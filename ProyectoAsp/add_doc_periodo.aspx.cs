using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web112 : System.Web.UI.Page
    {
        static string Id_periodo = "";
        Curso Curso;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ObtenerDatosPeriodo();
                Configuracion_master();
            }

        }

        protected void cmdguardar_Click(object sender, EventArgs e)
        {
            try
            {
                string titulo = txttitulo.Text;
                var Documento = __txtdocumento.Value;
                Curso = new Curso();

                string id_documentos = "DeltaDocument" 
                    + new Random(DateTime.Now.Millisecond).Next(0, 5556)
                    +   new Random(DateTime.Now.Millisecond).Next(555, 999)
                    + new Random(DateTime.Now.Millisecond).Next(2,2566);

                id_documentos = Encriptador.Encriptar_Md5(id_documentos);
                
                string sql = "INSERT INTO documentos_cursos (id_documentos , id_periodo , comentario , titulo, archivo , fecha)"
                    + " VALUES ('" + id_documentos
                    + "','" + Id_periodo + "','" + Documento.ToString() + "','" + titulo + "','NULL','" 
                    + Seguridad.FormatoFecha(DateTime.Now.Year.ToString() , DateTime.Now.Month.ToString() , DateTime.Now.Day.ToString()) +"')";

                Curso.IniciarConexion();
                bool Ok = Curso.Get_Consulta_booleana(sql);

                if (Ok)
                {
                    lblerror1.Text = "Datos Guardados con exito ";
                }
                else
                    lblerror1.Text = "Hubo un problema al procesar su solicitud";

                Curso.CerrarConexion();
            }
            catch { }
        }

        private void ObtenerDatosPeriodo()
        {
            Id_periodo = Seguridad.Id_cript_cadena(Request.QueryString["id_periodo"]);
            string sql = "Select nombre , id_periodo from periodo_curso where id_periodo like '" + Id_periodo + "'";
            Curso = new Curso();
            Curso.IniciarConexion();
            List<object> DatosPeriodo = Curso.Get_Consulta(sql);

            if (DatosPeriodo.Count == 0)
            {
                Response.Redirect(Session["Previa"].ToString());
                Curso.CerrarConexion();
                return;
            }

            try
            {
                

                object[] obj = (object[]) DatosPeriodo[0];
                lblperiodo.InnerHtml = obj[0].ToString();
                lblperiodo.InnerHtml += "&nbsp  ||  <a href='" + Session["Previa"].ToString() + "'>Regresar</a>";

                List<object> DocumentosPeriodo = Curso.ObtenerDocumentosPeriodo(Id_periodo);
                otrosArchivos1.InnerHtml = "";
                otrosArchivos2.InnerHtml = "";
                if (DocumentosPeriodo == null || DocumentosPeriodo.Count == 0)
                {
                    otrosArchivos1.InnerHtml = "<div class='" + new Cssclass().error + "'><h2>No existen Archivos en este periodo</h2></div>";
                }
                else
                {
                    int medio = ((DocumentosPeriodo.Count - 1) / 2);
                    int iteracion = 0;
                    foreach (object objeto in DocumentosPeriodo)
                    {

                        object[] datosDocumentos = (object[])objeto;
                        if (iteracion >= medio)
                        {
                            otrosArchivos2.InnerHtml += "<li><p>"
                                + datosDocumentos[0] + "&nbsp&nbsp&nbsp" +
                                "<a href='eliminar_documento.aspx?id=" + datosDocumentos[1]
                                + "'><img src='" + Seguridad.HttpUrl + "/images/icons/delete.png'/>" + "</a></p></li>";
                        }
                        else
                        {
                            otrosArchivos1.InnerHtml += "<li><p>"
                                + datosDocumentos[0] + "&nbsp&nbsp&nbsp" +
                                "<a href='eliminar_documento.aspx?id=" + datosDocumentos[1]
                                + "'><img src='" + Seguridad.HttpUrl + "/images/icons/delete.png'/>" + "</a></p></li>";

                        }
                        iteracion++;
                    }
                }

                Session["PreviaEliminar"] = HttpContext.Current.Request.Url.AbsoluteUri;
            }
            catch { }

        }

        //region de funciones estandares
        #region Funciones_Estandares

        private static string id_usuario = "";

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