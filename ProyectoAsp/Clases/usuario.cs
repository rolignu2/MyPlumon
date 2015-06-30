using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using ProyectoAsp.Clases;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoAsp.Clases
{
    public class usuario : Conexion
    {

        /// <summary>
        ///  cambia la imagen del usuario con los parametros nombre de la nueva imagen 
        ///  el id del usuario a cambiar y la direccion de la imagen ya guardada para eliminar anterior
        /// </summary>
        /// <param name="imagen"></param>
        /// <param name="id_user"></param>
        /// <param name="server_path"></param>
        /// <returns> regresa el nombre de la imagen en caso todo salio bien , regresa null en caso de que hubo un problema</returns>
        public string CambiarImagen(string imagen , string id_user , string server_path)
        {
            try
            {
                string imagen_anterior = null;
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                if (conn.GetConexion == null) return null;
                string sql = "select imagen from user where id_user like '" + id_user + "'";
                MySqlDataAdapter adaptador = new MySqlDataAdapter(sql, conn.GetConexion);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                DataTable tabla = ds.Tables[0];
                foreach (DataRow rows in tabla.Rows)
                {
                    imagen_anterior = rows.Field<string>("imagen", DataRowVersion.Default);
                }
                adaptador.Dispose();
                ds.Dispose();
                tabla.Dispose();
                sql = "Update user set imagen = '" + imagen + "' where id_user like '" + id_user + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn.GetConexion);
                MySqlDataReader read = cmd.ExecuteReader();
                if (read.RecordsAffected >= 1)
                {
                    if (imagen_anterior != " NULL" 
                        || imagen_anterior != "NULL" 
                        || imagen_anterior != "" 
                        || imagen_anterior != " ")
                    {

                        string ruta = System.IO.Path.Combine(server_path, imagen_anterior);
                        System.IO.File.Delete(ruta);
                    }
                    conn.CerrarConexion();
                    return imagen;
                }
                else
                {
                    conn.CerrarConexion();
                    return null;
                }
            }
            catch 
            {
                return null;
            }

           
        }

        /// <summary>
        ///  obtenemos el periodo por medio de dos parametros independientes que son el id periodo o id curso
        /// </summary>
        /// <param name="id_periodo"></param>
        /// <param name="id_curso"></param>
        /// <returns> objetos en lista donde estan los periodos en forma de array object </returns>
        public List<object> Get_Periodo_Name(string id_periodo , string id_curso = null )
        {
            List<object> lista_periodo = new List<object>();
            string sql = "";
            if (id_curso == null)
            {
                id_periodo = Seguridad.Id_cript_cadena(id_periodo);
                sql = "SELECT id_periodo ,  nombre , estado FROM periodo_curso Where id_periodo like '" + Seguridad.Id_cript_cadena(id_periodo) + "'";
            }
            else
                sql = "SELECT id_periodo ,  nombre , estado FROM periodo_curso Where id_curso like '" + id_curso + "'";

            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                if (conn == null)
                {
                    return null;
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn.GetConexion);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                DataTable tabla = ds.Tables[0];

                    foreach (DataRow filas in tabla.Rows)
                    {
                        object[] obj = filas.ItemArray;
                        lista_periodo.Add(obj);
                    }

                adapter.Dispose();
                ds.Dispose();
                tabla.Dispose();
                conn.CerrarConexion();

                return lista_periodo;
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "clase tutor ... get_periodo");
            }

            return null;
        }

        /// <summary>
        ///   obtiene los periodos del documento perfil usuario ... (perfil basico)
        /// </summary>
        /// <param name="id_periodo"></param>
        /// <returns></returns>
        public List<object> Get_Periodo_Documentos(string id_periodo)
        {
            List<object> lista_periodo = new List<object>();
            string sql = "";

            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                if (conn == null)
                {
                    Log.Set_Log_Error("No hay conexion", "clase tutor ... get_periodo");
                    return null;
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn.GetConexion);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                DataTable tabla = ds.Tables[0];

                    foreach (DataRow filas in tabla.Rows)
                    {
                        object[] obj = filas.ItemArray;
                        lista_periodo.Add(obj);
                    }

                adapter.Dispose();
                ds.Dispose();
                tabla.Dispose();
                conn.CerrarConexion();

                return lista_periodo;
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "clase tutor ... get_periodo_documento");
            }

            return null;
        }


        /// <summary>
        /// Miembro estatico verificando si existe alias de un usuario
        /// </summary>
        /// <param name="alias">alias del usuario</param>
        /// <returns> retorna true ->si existe en dado caso false->sino existe</returns>
        public static bool Existe_alias(string alias)
        {
            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                string consulta = "SELECT count(alias) FROM user Where alias like '" + alias + "'";
                List<object> data = conn.Get_Consulta(consulta);
                object[] valor = (object[])data[0];
                conn.CerrarConexion();
                if ( Convert.ToInt32(valor[0].ToString()) != 0)
                    return true;
                else
                    return false;
            }
            catch
            {

            }
            return false;
        }


        /// <summary>
        /// verifica el tipo de usuario por medio del id del usuario
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int TipoDeusuario(string id)
        {
            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                string consulta = "SELECT perfil FROM user Where id_user like '" + id + "'";
                List<object> data = conn.Get_Consulta(consulta);
                object[] valor = (object[])data[0];
                conn.CerrarConexion();
                return Convert.ToInt32(valor[0]);
            }
            catch
            {
                return 10;
            }
        }


        /// <summary>
        /// obtiene una lista de los cursos que el usuario esta cursando en este momento , el curso devuelto 
        /// es un curso activo ...
        /// </summary>
        /// <param name="id_usuario"></param>
        /// <returns>listado del curso en object[] to object </returns>
        public List<object> Get_Cursos_Usuario(string id_usuario)
        {
            List<object> Listado_cursos = new List<object>();
            string sql = "SELECT  cursos.nombre , CONCAT( user.nombre , ' ' , user.apellido) , cursos.fecha_inicio , cursos.imagen_curso , cursos.id_curso  FROM cursos " 
                + "INNER JOIN estudiante_curso ON cursos.id_curso=estudiante_curso.id_curso "
                + "INNER JOIN user ON user.id_user=cursos.id_docente " 
                + " WHERE estudiante_curso.id_user like '" + id_usuario + "' and cursos.estado=1 ORDER BY cursos.fecha_inicio ASC";

            try
            {
                Conexion conn = new Conexion();
                conn.IniciarConexion();
                if (conn == null)
                {
                    Log.Set_Log_Error("No hay conexion", "clase tutor", id_usuario);
                    return null;
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn.GetConexion);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                DataTable tabla = ds.Tables[0];
                foreach (DataRow filas in tabla.Rows)
                {
                    object[] obj = filas.ItemArray;
                    Listado_cursos.Add(obj);
                }
                adapter.Dispose();
                ds.Dispose();
                tabla.Dispose();
                conn.CerrarConexion();

                return Listado_cursos;
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "clase tutor", id_usuario);
            }

            return null;
        }


        /// <summary>
        /// enviar un mensaje a otro usuario de myplumon
        /// </summary>
        /// <param name="id_de"></param>
        /// <param name="id_para"></param>
        /// <param name="asunto"></param>
        /// <param name="mensaje"></param>
        /// <returns>true si se mando con exito</returns>
        public bool EnviarMensaje(string id_de, string id_para, string asunto, string mensaje)
        {


            string fecha = Seguridad.FormatoFecha(DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString());
            string hora = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();

            string sql = "INSERT INTO mensajeria (id_user , id_usuario_de , asunto ,  mensaje , fecha , hora , leido) VALUES ('"
                + id_para + "','" + id_de + "','" + asunto + "','" + mensaje + "','" + fecha + "','" + hora + "',0)" ;

            try
            {
                IniciarConexion();
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
                else return false;
            }
            catch { }

            return false;
        }

        /// <summary>
        /// obtiene un usuario registrado en myplumon (datos basicos como el nombre e imagen de su perfil)
        /// </summary>
        /// <param name="id_usuario"></param>
        /// <returns>objeto ... nombres , imagen </returns>
        public List<object> GetUsuario(string id_usuario)
        {
            string sql = "SELECT concat( nombre , ' ' , apellido ) as nombres , imagen  FROM user Where id_user like '" + id_usuario + "'";
            List<object> objU = new List<object>();
            try
            {
                IniciarConexion();
                objU = Get_Consulta(sql);
                CerrarConexion();
            }
            catch { }

            return objU;
        }


        /// <summary>
        /// lista de mensajes enviados al usuario 
        /// </summary>
        /// <param name="id_usuario"></param>
        /// <returns>objeto : id , nombre , imagen , asunto,  fecha , hora</returns>
        public List<object> GetMensajesUsuario(string id_usuario)
        {
            List<object> MsjUsr = new List<object>();
            try
            {

                IniciarConexion();
                string sql = "SELECT mensajeria.id_mensaje , concat( user.nombre , ' ' , user.apellido ) as nombres ,"
                    + " user.imagen , mensajeria.asunto , mensajeria.fecha , mensajeria.hora , mensajeria.leido FROM mensajeria "
                    + " INNER JOIN user ON user.id_user=mensajeria.id_usuario_de WHERE mensajeria.id_user like '" + id_usuario + "' order by mensajeria.fecha desc" ;
                MsjUsr = Get_Consulta(sql);
                CerrarConexion();
            }
            catch { }

            return MsjUsr;
        }


        /// <summary>
        /// elimina mensaje mediante su id
        /// </summary>
        /// <param name="id_mensaje"></param>
        /// <returns></returns>
        public bool EliminarMensaje(string id_mensaje)
        {

            try
            {
                string sql = "DELETE FROM mensajeria WHERE id_mensaje LIKE '" + id_mensaje + "'";
                IniciarConexion();
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
                else return false;
            }
            catch { }

            return false;
        }


        /// <summary>
        /// coloca el mensaje como leido por defecto pero tambien puede ser no leido como parametro
        /// </summary>
        /// <param name="id_mensaje"></param>
        /// <param name="Leido"></param>
        /// <returns></returns>
        public bool MensajeLeido(string id_mensaje , int Leido = 1)
        {
            try
            {
                string sql = "UPDATE mensajeria SET leido=" + Leido.ToString() + " WHERE id_mensaje LIKE '" + id_mensaje + "'";
                IniciarConexion();
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
                else return false;
            }
            catch { }

            return false;
        }

        /// <summary>
        /// obtiene el mensaje por medio de su ID
        /// </summary>
        /// <param name="id_mensaje"></param>
        /// <returns>id_usuario_de  , nombre , asunto , mensaje , leido </returns>
        public List<object> VerMensaje(string id_mensaje)
        {
            List<object> MsjUsr = new List<object>();
            try
            {

                IniciarConexion();
                string sql = "SELECT mensajeria.id_usuario_de , concat( user.nombre , ' ' , user.apellido ) as nombres ,"
                    + " mensajeria.asunto , mensajeria.mensaje , mensajeria.leido FROM mensajeria "
                    + " INNER JOIN user ON user.id_user=mensajeria.id_usuario_de WHERE mensajeria.id_mensaje like '" + id_mensaje + "'";
                MsjUsr = Get_Consulta(sql);
                CerrarConexion();
            }
            catch { }

            return MsjUsr;
        }


    }
}