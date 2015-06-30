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
    public partial class Formulario_web19 : System.Web.UI.Page
    {

        private static string curso_id = "";
        private static string encript_curso_id = "";
        private static string periodo_id = "";
        private static string id_usuario = "";

        protected void Page_Load(object sender, EventArgs e)
        {
           
            Configuracion_master();
        }

        /*<h3>Opciones del tutor</h3>
            <ul>
                <li><a href="#">menu1</a></li>
                <li><a href="#" >menu2</a></li>
                <li><a href="#" >menu3</a></li>
                <li><a href="#" >menu4</a></li>
            </ul> */
        private void Configuracion_Tutor()
        {
            try
            {
                Tutor tutor = new Tutor();
                if (tutor.Is_CursoTutor(Seguridad.Id_cript_cadena(id_usuario), curso_id))
                {
                    MenuContenido.InnerHtml = "<h3>Opciones del tutor</h3>";
                    MenuContenido.InnerHtml += "<ul>" + "<li><a href='periodo.aspx?id=" + Request.QueryString["id"].ToString() + "'>Agregar Periodo</a></li>"
                                    + "<li><a href='editar_curso.aspx?id=" + Request.QueryString["id"].ToString() + "'>Editar Curso</a></li>"
                                    + "<li><a href='eliminar_curso.aspx?id=" + Request.QueryString["id"].ToString() + "'>Eliminar Curso</a></li>"
                                    + "<li><a href='periodo.aspx?" + Request.QueryString["id"].ToString() + "'></a></li>"
                                    + "<li><a href='#'></a></li></ul><br />";
                    List<object> lista_periodo = tutor.Get_Periodos(curso_id);
                    if (lista_periodo.Count >= 1)
                        MenuContenido.InnerHtml += "<h3>Periodos</h3><ul>";
                    else
                        MenuContenido.InnerHtml += "<h3>No existen periodos</h3><ul>";
                    foreach (object lista in lista_periodo)
                    {
                        object A = lista;
                        object[] B = (object[])A;
                        string[] Datos_periodo = Array.ConvertAll(B, p => (p ?? String.Empty).ToString());
                        if (Datos_periodo[2] == "1")
                            MenuContenido.InnerHtml += "<li><a href='curso.aspx?id="
                           + encript_curso_id + "&id_periodo=" + Datos_periodo[0].ToString() + "'>" + Datos_periodo[1] + "</a></li>";
                        else
                            MenuContenido.InnerHtml += "<li><a href='curso.aspx?id="
                            + encript_curso_id + "&id_periodo=" + Datos_periodo[0].ToString() + "'>" + Datos_periodo[1] + " (No activo) </a></li>";
                    }
                    MenuContenido.InnerHtml += "</ul>";
                }
                else
                {
                    Configuracion_Usuario();
                }
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "Curso");
            }
            finally
            {
                
            }
        }

        private void ComentariosPeriodo()
        {
            try
            {
                List<object> ComentariosLista = new Curso().ObtenerComentariosPeriodo(periodo_id);
                if(ComentariosLista == null)
                    return;
                if (ComentariosLista.Count == 0)
                {
                    tablon_comentarios.InnerHtml = "<div class='"
                        + new Cssclass().aleatorio()
                        + "'><p>NO EXISTEN COMENTARIOS , SE EL PRIMERO EN COMENTAR </p></div>";
                    return;
                }
                else
                {
                    tablon_comentarios.InnerHtml = "";
                    foreach (object objeto in ComentariosLista)
                    {
                        object[] comentarios = (object[])objeto;
                        ImprimirComentario(comentarios);
                    }
                }

            }
            catch { Log.Set_Log_Error("Error en alguna parte de la clase", "curso comentarios"); }
        }


        private void ImprimirComentario(object[] comentario)
        {
            tablon_comentarios.InnerHtml += "<div class='content-module'>";
            string RutaImagen = Seguridad.HttpUrl + "/images/avatar/" + comentario[1].ToString();
            string Nombre = comentario[0].ToString();
            string Coment = comentario[2].ToString();
            string Fecha = comentario[3].ToString();
            tablon_comentarios.InnerHtml += "<p><img src='" + RutaImagen + "' width='50' height='50' />&nbsp;&nbsp;&nbsp;&nbsp;";
            tablon_comentarios.InnerHtml += "" + Nombre + " || " + Fecha + "</p>";
            tablon_comentarios.InnerHtml += "<h3>" + Coment + "</h3>";
            tablon_comentarios.InnerHtml += "</div>";
        }

        private void Configuracion_Usuario()
        {
            try
            {
                Tutor tutor = new Tutor();
                List<object> lista_periodo = tutor.Get_Periodos(curso_id);
                if (lista_periodo.Count >= 1)
                    MenuContenido.InnerHtml = "<h3>Periodos</h3><ul>";
                else
                    MenuContenido.InnerHtml = "<h3>No existen periodos</h3><ul>";

                foreach (object lista in lista_periodo)
                {
                    object A = lista;
                    object[] B = (object[])A;
                    string[] Datos_periodo = Array.ConvertAll(B, p => (p ?? String.Empty).ToString());
                    
                    if (Datos_periodo[2] == "1")
                        MenuContenido.InnerHtml += "<li><a href='curso.aspx?id="
                       + encript_curso_id + "&id_periodo=" + Datos_periodo[0].ToString() + "'>" + Datos_periodo[1] + "</a></li>";
                }
                MenuContenido.InnerHtml += "</ul>";
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "Curso");
            }
            finally
            {

            }
        }

        //<li><a href="www.microsot.com" title="Rolando"><img alt="" src="" height="50" width="50" /></a></li>
        private void ObtenerParticipantesCurso()
        {
            Curso curso = new Curso();
            List<object> lista_alumnos = curso.ObtenerListaDeMiembros(curso_id);
            string id_tutor = new Tutor().GetIdTutor(curso_id);
            tablon_alumnos.InnerHtml = "ALUMNOS DE ESTE CURSO &nbsp&nbsp&nbsp&nbsp <a class='round button blue text-upper' href='mensaje.aspx?id=" + id_tutor + "'>Contactar Tutor</a>";  
            ul_alumnos.InnerHtml = "";
            foreach (object Obj in lista_alumnos)
            {
                object[] DataAlumno = (object[])Obj;
                var id = Seguridad.Id_cript_cadena(DataAlumno[0].ToString());
                var nombre = DataAlumno[1].ToString();
                var imagen = Seguridad.HttpUrl + "/images/avatar/" + DataAlumno[2].ToString();
                ul_alumnos.InnerHtml += "<li><a href='perfil.aspx?id_p=" 
                    + id + "' title='" + nombre + "'><img alt='' src='" + imagen + " ' height='50' width='50' /></a></li>";
            }
        }

        //<div class="stripe-separator"><!-- --></div>
        /*<h2>This is an H2 heading</h2>
							<h3>This is an H3 heading</h3>
							<h4>This is an H4 heading</h4>
							<h5>This is an H5 heading</h5>

							<div class="stripe-separator"><!-- --></div>

							<p>The separator above has top and bottom margin set by default, so it will split the content accordingly without 
							any extra tweaks needed from you.</p>

							<div class="stripe-separator"><!-- --></div>
							
							<blockquote>This is a blockquote followed by a cite tag. And no matter how much text you put in this, it will automatically resize.</blockquote>
							<cite>- John</cite>*/

        private void Mostrar_periodos( int perfil )
        {

            usuario user = new usuario();
            List<object> periodo_nombre;
            var id_periodo = "";
            int estado = 0;
            try
            {
                id_periodo = Seguridad.Id_cript_cadena(Request.QueryString["id_periodo"]);
                if (id_periodo == null || id_periodo == "")
                {
                    periodo_nombre = user.Get_Periodo_Name(null, curso_id);
                }
                else
                {
                    periodo_nombre = user.Get_Periodo_Name(id_periodo, null);
                }
            }
            catch
            {
                periodo_nombre = user.Get_Periodo_Name("" , curso_id);
            }

            if (periodo_nombre == null) return;

            foreach (object periodo_n in periodo_nombre)
            {
                object A = periodo_n;
                object[] B = (object[])A;
                string[] Datos_periodo = Array.ConvertAll(B, p => (p ?? String.Empty).ToString());
                titulo_periodo.InnerText = "(" + Datos_periodo[1] + ")";
                
                if (Datos_periodo[2] == "1")
                    estado_periodo.InnerText = "Estado: Abierto ";
                else
                    estado_periodo.InnerText = "Estado: Cerrado ";
                estado = Convert.ToInt32(Datos_periodo[2]);
                id_periodo = Datos_periodo[0];
                periodo_id = id_periodo;

                break;
            }


            Tutor tutor;
            List<object> lista_documentos_periodo;
            switch (perfil)
            {
                case 0:
            salto_tutor_alumno:
                    //MUESTRA LOS PERIODOS BASADOS EN EL USUARIO SIN PRIVILEGIOS
                    tutor = new Tutor();
                    linkeliminar.Visible = false;

                    lista_documentos_periodo = tutor.Get_Periodo_Documentos(id_periodo , perfil);

                    if (lista_documentos_periodo == null 
                        || lista_documentos_periodo.Count == 0)
                    {
                        tablon_periodo.InnerHtml += "<div align='center'><h1>¡No existen documentos!</h1></div><div class='stripe-separator'><!-- --></div>";
                        tablon_periodo.InnerHtml += "<blockquote> Pronto el tutor colocara documentos en este periodo , este pendiente..." +
                        " </blockquote>"
                             + "<cite>Staff My PluMon </cite>";
                    }
                    else
                    {
                        foreach (object listado in lista_documentos_periodo)
                        {
                            object[] obj = (object[])listado;

                             
                            tablon_periodo.InnerHtml += "<div class='content-module-heading cf'>";
                            tablon_periodo.InnerHtml += "<h3 class='fl'>" + obj[1].ToString() + "</h3>";
                            tablon_periodo.InnerHtml += "</div>";

                            if (obj[2].ToString() != ""
                                || obj[2].ToString().Replace(" ", "") != "NULL" 
                                || obj[2] != null)
                            {
                                tablon_periodo.InnerHtml += "<div class='content-module-main'>";
                                tablon_periodo.InnerHtml += obj[2].ToString();
                            }


                            if (obj[3].ToString().Replace(" " , "") != "NULL")
                            {
                                tablon_periodo.InnerHtml += "<div class='content-module-main'>";
                                tablon_periodo.InnerHtml += obj[3].ToString();
                            }

                            tablon_periodo.InnerHtml += "</div>";

                        }
                    }
                    break;
                case 1:
                    //MUESTRA LOS PERIODOS BASADO EN EL TUTOR ...
                    tutor = new Tutor();
                    linkeliminar.Visible = true;

                    if (!tutor.Is_CursoTutor(id_usuario, Seguridad.Id_cript_cadena(curso_id)))
                        goto salto_tutor_alumno;
                
                        
                     tablon_periodo.InnerHtml += "<h1>Herramientas</h1>";
                     tablon_periodo.InnerHtml += "<a  id='company-branding-small' href='add_doc_periodo.aspx?id_periodo=" + id_periodo + "'>Agregar Nuevo documento</a>";

                     if (estado == 0)
                            tablon_periodo.InnerHtml += " <div align='right'><a  id='company-branding-small' href='activar_periodo.aspx?id_periodo=" + id_periodo + "'><img src='images/icons/flecha.gif' width='120' height='10' /><b>Activar_periodo</b></a></div>";

                     tablon_periodo.InnerHtml += "<div class='stripe-separator'><!-- --></div>";



                    lista_documentos_periodo = tutor.Get_Periodo_Documentos(id_periodo , perfil);

                    if (lista_documentos_periodo == null 
                        || lista_documentos_periodo.Count == 0)
                    {
                        tablon_periodo.InnerHtml += "<div align='center'><h1>¡No existen documentos!</h1></div><div class='stripe-separator'><!-- --></div>";
                        tablon_periodo.InnerHtml += "<blockquote>No tienes ningun documento agregado en este periodo. " +
                        " si tu deseas agregar un documento nuevo solo ve al link 'agregar documento nuevo' o en dado caso no deseas, puedes eliminar el periodo completo.</blockquote>"
                             + "<cite>Staff My PluMon </cite>";
                    }
                    else
                    {
                        foreach (object listado in lista_documentos_periodo)
                        {
                            object[] obj = (object[])listado;
                            tablon_periodo.InnerHtml += "<div class='content-module-heading cf'>";
                            tablon_periodo.InnerHtml += "<h3 class='fl'>" + obj[1].ToString() + "</h3>";
                            tablon_periodo.InnerHtml += "<span class='fr'><a href='eliminar_documento.aspx?id=" + obj[0].ToString() + "'>Eliminar</a><br /><a href='editar_documento.aspx?id=" + obj[0].ToString() + "'>Editar</a></span>";
                            tablon_periodo.InnerHtml += "</div>";

                            if (obj[2].ToString() != ""
                                || obj[2].ToString().Replace(" ", "") != "NULL" 
                                || obj[2] != null)
                            {
                                tablon_periodo.InnerHtml += "<div class='content-module-main'>";
                                tablon_periodo.InnerHtml += obj[2].ToString();
                            }


                            if (obj[3].ToString().Replace(" " , "") != "NULL")
                            {
                                tablon_periodo.InnerHtml += "<div class='content-module-main'>";
                                tablon_periodo.InnerHtml += obj[3].ToString();
                            }

                            tablon_periodo.InnerHtml += "</div>";

                        }
                    }
                    break;
                case 2:
                    break;
            }


        }

        protected void linkeliminar_Click(object sender, EventArgs e)
        {
            Tutor tutor = new Tutor();
            
            bool ok = tutor.Eliminar_periodo(periodo_id);
            if (ok)
            {
                Response.Redirect(Request.RawUrl);
            }
        }

        //region de funciones estandares
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
                linkeliminar.Visible = false;
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
                        Configuracion_Usuario();
                        break;
                    case 1:
                        ((Label)Master.FindControl("lbltab1")).Text = "Crear Nuevo Cuso";
                        ((Label)Master.FindControl("lbltab2")).Text = "Cursos no impartidos";
                        ((Label)Master.FindControl("lbltab3")).Text = "Ver Cursos De otro Tutor";
                        Configuracion_Tutor();
                        break;
                    case 2:
                        break;
                    default:
                        break;
                }
                //muestra los periodos por medio de los perfiles 
                // ejemplo : si el perfil es el tutor muestra las herramientas del tutor por ese periodo 
                // si el perfil es estudiante  entonces muestra el periodo sin ninguna manipulacion
                Mostrar_periodos(perfil);
                Master.SetUsuario_data();
                Get_mensaje();
                ObtenerParticipantesCurso();
                //configuracion pagina previa por medio de la sesion 
                Session["Previa"] = HttpContext.Current.Request.Url.AbsoluteUri;
                Session["PreviaEliminar"] = HttpContext.Current.Request.Url.AbsoluteUri;
                if(!IsPostBack)
                    ComentariosPeriodo();
               
            }
            catch { }
        }

        #endregion

        protected void cmdcomentario_Click(object sender, EventArgs e)
        {
            if (txt_comentario.Value == "" || txt_comentario.Value == null)
            {
                error_coment.InnerHtml = "<div class='" + new Cssclass().error + "'><p>SE NECESITA UN COMENTARIO</p></div>";
                return;
            }

            bool MensajeEnviado = new Curso().AgregarComentarioEnperiodo(periodo_id, id_usuario, txt_comentario.Value);
            if (MensajeEnviado)
            {
                error_coment.InnerHtml = "<div class='" + new Cssclass().informacion + "'><p>Mensaje Enviado</p></div>";
                ComentariosPeriodo();
            }
        }
    }
}