using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoAsp.Clases;

namespace ProyectoAsp
{
    public partial class Formulario_web119 : System.Web.UI.Page
    {

        static string Id_Periodo = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var sesion_c = Session.Count;
                if (sesion_c <= 0)
                {
                    Response.Redirect("Login.aspx", true);
                    return;
                }

                Id_Periodo = Request.QueryString["id_periodo"].ToString();

                if (Id_Periodo == null || Id_Periodo == "")
                {
                    Response.Redirect("Login.aspx", true);
                    return;
                }
                else
                {
                    Id_Periodo = Seguridad.Id_cript_cadena(Id_Periodo);
                    bool Activado = new Curso().ActivarPeriodo(Id_Periodo);
                    if (Activado)
                    {
                        Response.Redirect("Login.aspx", true);
                        return;
                    }
                    else
                    {
                        System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('OPPS OCURRIO UN ERROR , INTENTA MAS TARDE')</SCRIPT>");
                        Response.Redirect("Login.aspx", true);
                        return;
                    }
                }
            }
            catch { }

        }


    }
}