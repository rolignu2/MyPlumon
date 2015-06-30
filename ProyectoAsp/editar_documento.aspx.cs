using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web121 : System.Web.UI.Page
    {

        static string id_documento = null;
        static string Id_periodo = "";

        Curso Curso;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
                Configuracion_master();
            }
        }

        private void CargarDatos()
        {
            try
            {

                lblperiodo.InnerHtml += "<a href='" + Session["Previa"].ToString() + "'>Regresar</a>";

                id_documento = Seguridad.Id_cript_cadena(Request.QueryString["id"].ToString());
                List<object> DataDocumento = new Tutor().Get_Documentos_Periodo(id_documento);
                if (DataDocumento != null || DataDocumento.Count != 0)
                {
                    object[] ObjDatos = (object[]) DataDocumento[0];
                    __txtdocumento.InnerHtml = ObjDatos[0].ToString();
                    txttitulo.Text = ObjDatos[1].ToString();
                }
            }
            catch { }
        }

        protected void cmdguardar_Click(object sender, EventArgs e)
        {
            try
            {
                object[] obj = new object[] {
                    __txtdocumento.Value ,
                    txttitulo.Text , "" };

                bool Ok = new Tutor().Set_Ediccion_Dcoumento_Periodo(id_documento , obj );

                if (Ok)
                {
                    lblerror1.Text = "Datos Guardados con exito ";
                }
                else
                    lblerror1.Text = "Hubo un problema al procesar su solicitud";
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