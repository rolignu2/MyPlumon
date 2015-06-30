using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace ProyectoAsp.Clases
{
    public class SubirArchivos
    {


        /// <summary>
        /// sube cualquier imagen alojada en una carpeta mapeada por medio de server 
        /// </summary>
        /// <param name="ruta_imagen">direccion de la carpeta donde se va a alojar la imagen</param>
        /// <param name="ImgFile">control de la imagen nueva a a lojar</param>
        /// <returns>retorna un valor booleano</returns>
        public string SubirImagen(string ruta_imagen, HttpPostedFile ImgFile)
        {
            if (ImgFile.ContentLength != 0)
            {
                int size = ImgFile.ContentLength;
                if (size > 1000000)
                    return null;
                else
                {
                    while (true)
                    {
                        try
                        {
                            string[] type = ImgFile.ContentType.Split('/');
                            string id_file = new Random(DateTime.Now.Millisecond).Next().ToString() 
                                + "_" + new Random(DateTime.Now.Millisecond).Next().ToString() 
                                + new Random(DateTime.Now.Millisecond).Next().ToString() + "." + type[1];
                            string save_file = Path.Combine(ruta_imagen, id_file);
                            if (System.IO.File.Exists(save_file) == false)
                            {
                                ImgFile.SaveAs(save_file);
                                return id_file;
                            }

                        }
                        catch
                        {
                            return null;
                        }
                    
                    }

                }
            }
            else
            {
                return null;
            }
        }
        
    }
}