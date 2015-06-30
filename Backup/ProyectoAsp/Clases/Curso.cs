using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace ProyectoAsp.Clases
{
    public class Curso : Conexion
    {

        private Conexion conn;
        private List<object> Listado;

        public Curso()
        {
            conn = new Conexion();
        }


        /// <summary>
        /// obtenemos el listado de los miembros de este curso en dado caso solo obtenemos la imagen, el id y el nombre
        /// 0->id , 1->nombre , 2->imagen
        /// </summary>
        /// <param name="id_curso"></param>
        /// <returns></returns>
        public List<object> ObtenerListaDeMiembros(string id_curso)
        {

            try
            {
                this.conn.IniciarConexion();
                string sql = " SELECT user.id_user , user.nombre , user.imagen FROM user "
                    + "INNER JOIN estudiante_curso ON user.id_user=estudiante_curso.id_user "
                    + " WHERE estudiante_curso.id_curso LIKE '" + id_curso + "'" ;
                this.Listado = this.conn.Get_Consulta(sql);
                this.conn.CerrarConexion();
            }
            catch(Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "CLASE TUTOR");
                try { this.conn.CerrarConexion(); }
                catch { }
            }

            return Listado;
        }


        /// <summary>
        /// guarda la nueva documentacion del periodo 
        /// </summary>
        /// <param name="id_periodo"></param>
        /// <returns>retorna verdadero si todo marcho bien ... en caso falso si no marcho bien</returns>
        public bool GuardarDocumentacionPeriodo(string id_periodo )
        {

            return false;
        }


        /// <summary>
        /// obtiene el titulo y id del documento de el periodo otorgado
        /// </summary>
        /// <param name="id_periodo"></param>
        /// <returns></returns>
        public List<object> ObtenerDocumentosPeriodo(string id_periodo)
        {
            List<object> ListaDoc = new List<object>();
            try
            {
                IniciarConexion();
                string sql = "select titulo , id_documentos from documentos_cursos where id_periodo like '" + id_periodo + "'";
                ListaDoc = Get_Consulta(sql);
                CerrarConexion();
                return ListaDoc;
            }
            catch { }
           
            return null;
        }


        /// <summary>
        /// obtiene una serie de datos que son los que han comentado en tal periodo 
        /// </summary>
        /// <param name="id_periodo"></param>
        /// <returns>retorna una lista objec[] con lo sig = nombre,imagen,comentario,fecha</returns>
        public List<object> ObtenerComentariosPeriodo(string id_periodo)
        {

            List<object> ListaDoc = new List<object>();
            try
            {
                IniciarConexion();
                string sql = "SELECT CONCAT(user.nombre , ' ' , user.apellido) as nombre_completo , user.imagen , foros_curso.comentario , foros_curso.fecha " 
                   + " FROM foros_curso LEFT OUTER JOIN user ON foros_curso.id_user=user.id_user WHERE foros_curso.id_periodo LIKE '" 
                   + id_periodo + "' ORDER BY foros_curso.id_foro ASC";
                ListaDoc = Get_Consulta(sql);
                CerrarConexion();
                return ListaDoc;
            }
            catch { }

            return null;
        }

        public bool AgregarComentarioEnperiodo(string id_periodo, string id_user, string comentario)
        {
            try
            {
                IniciarConexion();
                string fecha = Seguridad.FormatoFecha(DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString());
                string sql = "INSERT INTO foros_curso (id_user , id_periodo , comentario , fecha) VALUES ('"
                    + id_user + "','" + id_periodo + "','" + comentario + "','" + fecha + "')";
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
            }
            catch { }

            return false;
        }


        public bool ActivarPeriodo(string id_periodo)
        {
            try
            {
                IniciarConexion();
                string fecha = Seguridad.FormatoFecha(DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString());
                string sql = "UPDATE periodo_curso SET estado=1 WHERE id_periodo like '" + id_periodo + "'";
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
            }
            catch { }

            return false;
        }
     
    }
}