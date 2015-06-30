using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;


namespace ProyectoAsp.Clases
{
    public class Tutor : Conexion
    {

        /// <summary>
        /// obtiene los cursos que se estan impartiendo por el tutor asignado 
        /// </summary>
        /// <param name="id_tutor">codigo del tutor</param>
        /// <returns></returns>
        public List<object> Get_Cursos(string id_tutor)
        {
            List<object> Listado_cursos = new List<object>();
            string sql = "SELECT cursos.id_curso , cursos.nombre , cursos.estado , cursos.imagen_curso FROM cursos ";
            sql += " WHERE cursos.id_docente LIKE '" + id_tutor + "'";

            try
            {
                IniciarConexion();
                if (GetConexion == null)
                {
                    Log.Set_Log_Error("No hay conexion", "clase tutor", id_tutor);
                    return null;
                }
                Listado_cursos = Get_Consulta(sql);
                CerrarConexion();

                return Listado_cursos;
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error( ex.Message, "clase tutor", id_tutor);
            }

            return null;
          
        }

        /// <summary>
        /// crea un periodo (tutor)
        /// </summary>
        /// <param name="id_curso">codigo del curso </param>
        /// <param name="nombre"> nombre del curso</param>
        /// <param name="estado"> estado del curso activo/desactivo</param>
        /// <returns></returns>
        public bool CrearPeriodo(string id_curso, string nombre, bool estado)
        {
            try
            {

                string Id_Periodo = Encriptador.Encriptar_Md5(nombre +  "perido" + new Random().Next(100, 999));
                if (Id_Periodo.Length >= 255)
                {
                    Id_Periodo = Encriptador.Encriptar_Md5(nombre.Substring(0, nombre.Length / 2) + new Random().Next(0, 100));
                }
                int stado = 0;
                if (estado == true) stado = 1;
                IniciarConexion();
                string sql = "insert into periodo_curso (id_periodo , id_curso , nombre , estado) values ('"
                + Id_Periodo + "','" + id_curso + "','" + nombre + "'," + stado + ")";
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok)
                    return true;
                else
                    return false;
            }
            catch (Exception ex) { Log.Set_Log_Error(ex.Message, "Tutor creacion de periodo"); }

            return false;
        }

        /// <summary>
        /// obtiene una lista de periodos del tutor en ese curso
        /// </summary>
        /// <param name="id_curso">codigo del curso</param>
        /// <returns></returns>
        public List<object> Get_Periodos(string id_curso)
        {
            List<object> lista_periodo = new List<object>();
            string sql = "SELECT id_periodo , nombre , estado FROM periodo_curso Where id_curso like '" + id_curso + "'";

            try
            {
                IniciarConexion();
                if (GetConexion == null)
                {
                    Log.Set_Log_Error("No hay conexion", "clase tutor ... get_periodo");
                    return null;
                }
                lista_periodo = Get_Consulta(sql);
                CerrarConexion();

                return lista_periodo;
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "clase tutor ... get_periodo");
            }

            return null;
        }


        /// <summary>
        /// Verifica si el curso es realmente del tutor ... en dado caso envia un false
        /// </summary>
        /// <param name="id_user"></param>
        /// <returns></returns>
        public bool Is_CursoTutor(string id_user , string id_curso)
        {
            try
            {
                string sql = "SELECT count(nombre) as nom FROM cursos WHERE id_docente like '" + id_user + "' and id_curso LIKE '" + id_curso + "'";
                IniciarConexion();
                List<object> L = Get_Consulta(sql);
                object[] obj = (object[])L[0];
                CerrarConexion();
                if ( Convert.ToInt32(obj[0]) == 0 || L == null)
                    return false;
                else
                    return true;
            }
            catch (Exception ex) { Log.Set_Log_Error(ex.Message, "TUTOR ELIMINAR PERIODO"); }

            return false;
        }


        /// <summary>
        /// obtiene documentos del periodo por medio del tutor... lo cambiante es que el tutor tiene privilegios extras
        /// </summary>
        /// <param name="id_periodo">codigo periodo</param>
        /// <returns>lista array objetos</returns>
        public List<object> Get_Periodo_Documentos(string id_periodo , int perfil)
        {
            List<object> lista_periodo = new List<object>();

            string sql = "SELECT documentos_cursos.id_documentos , documentos_cursos.titulo , documentos_cursos.comentario , documentos_cursos.archivo ";
            sql += "FROM documentos_cursos WHERE documentos_cursos.id_periodo LIKE '" + id_periodo + "' order by documentos_cursos.fecha DESC";

            if (perfil == 0) sql = "SELECT documentos_cursos.id_documentos , documentos_cursos.titulo , documentos_cursos.comentario , documentos_cursos.archivo "
                  + "FROM documentos_cursos INNER JOIN periodo_curso ON documentos_cursos.id_periodo=periodo_curso.id_periodo "
                  + "WHERE documentos_cursos.id_periodo LIKE'" + id_periodo + "' AND periodo_curso.estado =1 order by documentos_cursos.fecha DESC";

            try
            {
                IniciarConexion();
                if (GetConexion == null)
                {
                    Log.Set_Log_Error("No hay conexion", "clase tutor ... get_periodo");
                    return null;
                }
                lista_periodo = Get_Consulta(sql);
                CerrarConexion();

                return lista_periodo;
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "clase tutor ... get_periodo_documento");
            }

            return null;
        }


        /// <summary>
        /// elimina periodos creados por el tutor .... esta funcion solo pide el identificador del periodo ya 
        /// ya que como no pide el identificador del tutor porque para habilitar el eliminar se encesita tener privilegios 
        /// 1 o 2 que es tutor y super usuario (root)
        /// </summary>
        /// <param name="id_periodo">codigo periodo</param>
        /// <returns>retorna true en caso que todo halla salido bien </returns>
        public bool Eliminar_periodo(string id_periodo)
        {
            string sql = "delete from periodo_curso where id_periodo like '" + id_periodo + "'";
            Conexion conn = new Conexion();
            conn.IniciarConexion();
            MySqlCommand cmd = new MySqlCommand(sql, conn.GetConexion);
            MySqlDataReader lector = cmd.ExecuteReader();
            try
            {
                if (lector.RecordsAffected >= 1)
                {
                    cmd.Dispose();
                    lector.Dispose();
                    sql = "SELECT COUNT(id_periodo) FROM periodo_documentos WHERE id_periodo LIKE '" + id_periodo + "'";
                    MySqlDataAdapter adpt = new MySqlDataAdapter(sql, conn.GetConexion);
                    DataSet ds = new DataSet();
                    adpt.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count >= 1)
                    {
                        sql = "DELETE FROM periodo_documentos WHERE id_periodo LIKE '" + id_periodo + "'";
                        cmd = new MySqlCommand(sql, conn.GetConexion);
                        lector = cmd.ExecuteReader();
                        if (lector.RecordsAffected >= 1)
                        {
                            return true;
                        }
                    }

                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Set_Log_Error(ex.Message, "TUTOR ELIMINAR PERIODO");
            }


            return false;
        }


        /// <summary>
        /// elimina un documento del periodo asignado ...
        /// </summary>
        /// <param name="id_documento"></param>
        /// <returns></returns>
        public bool Eliminar_Documento_Periodo(string id_documento)
        {

            try
            {
                string sql = "DELETE FROM documentos_cursos WHERE id_documentos LIKE '" + id_documento + "'";
                IniciarConexion();
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
                else return false;
            }
            catch (Exception ex) { Log.Set_Log_Error(ex.Message, "TUTOR ELIMINAR PERIODO"); }

            return false;
        }

        /// <summary>
        /// obtieene los datos de un documento para poder visualizarlo al momento de edicion
        /// </summary>
        /// <param name="id_documento"></param>
        /// <returns></returns>
        public List<object> Get_Documentos_Periodo(string id_documento)
        {
            try
            {
                string sql = "SELECT comentario , titulo , archivo FROM documentos_cursos WHERE id_documentos LIKE '" + id_documento + "'";
                IniciarConexion();
                List<object> Doc = Get_Consulta(sql);
                CerrarConexion();
                return Doc;
            }
            catch { }
            return null;
        }


        /// <summary>
        ///  edita el documento seleccionado del periodo por medio del id_periodo y el object[] data_documneto asinasion de objetos a editar
        /// </summary>
        /// <param name="id_documento"></param>
        /// <param name="data_documento"></param>
        /// <returns></returns>
        public bool Set_Ediccion_Dcoumento_Periodo(string id_documento , object[] data_documento)
        {

            try
            {
                string sql = "UPDATE documentos_cursos SET comentario='"
                    + data_documento[0].ToString() +
                    "', titulo='" + data_documento[1].ToString() +
                    "',archivo='" + data_documento[2].ToString() +
                    "',fecha ='" + Seguridad.FormatoFecha(DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString()) +
                    "' WHERE id_documentos LIKE '" + id_documento + "'";
                IniciarConexion();
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
                else return false;
            }
            catch (Exception ex) { Log.Set_Log_Error(ex.Message, "TUTOR ELIMINAR PERIODO"); }

            return false;
        }


        /// <summary>
        /// obtiene los datos basicos del curso 
        /// </summary>
        /// <param name="id_curso"></param>
        /// <returns>id , nombre , estado , imagen y estado</returns>
        public List<object> GetDataCurso(string id_curso)
        {
            try
            {
                string sql = "SELECT id_curso , nombre , estado , imagen_curso , abierto FROM cursos WHERE id_curso LIKE '" + id_curso + "'";
                IniciarConexion();
                List<object> Doc = Get_Consulta(sql);
                CerrarConexion();
                return Doc;
            }
            catch { }
            return null;
        }


        /// <summary>
        /// Elimina el curso 
        /// </summary>
        /// <param name="id_curso"></param>
        /// <returns></returns>
        public bool EliminarCurso(string id_curso)
        {
            try
            {
                string sql = "DELETE FROM cursos WHERE id_curso LIKE '" + id_curso + "'";
                IniciarConexion();
                bool ok = Get_Consulta_booleana(sql);
                CerrarConexion();
                if (ok) return true;
                else return false;
            }
            catch (Exception ex) { Log.Set_Log_Error(ex.Message, "TUTOR ELIMINAR PERIODO"); }

            return false;
        }


        /// <summary>
        /// obtiene el id del tutor
        /// </summary>
        /// <param name="id_curso"></param>
        /// <returns></returns>
        public string GetIdTutor(string id_curso)
        {
            try
            {
                string sql = "SELECT id_docente FROM cursos WHERE id_curso LIKE '" + id_curso + "'";
                IniciarConexion();
                List<object> Doc = Get_Consulta(sql);
                CerrarConexion();
                if (Doc.Count != 0)
                {
                    object[] obj = (object[])Doc[0];
                    return obj[0].ToString();
                }
            }
            catch { }
            return null;
        }
      
    
    }
}