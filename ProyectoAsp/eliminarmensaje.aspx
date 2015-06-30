<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="eliminarmensaje.aspx.cs" Inherits="ProyectoAsp.Formulario_web127" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">

	<div class="page-full-width cf">

    	<div class="content-module-heading cf">
					
					</div> <!-- end content-module-heading -->
		
					<div class="content-module-main cf" >
				
					<fieldset>
							<div class="confirmation-box" >
                                <p align="center">
                                     <h2>¿ESTA SEGURO QUE DESEA ELIMINAR ESTE MENSAJE?</h2>
                                     <b>Si elimina este mensaje ya no podra recuperarse ya que es borrado directamente de la base de datos</b>
                                </p>
                                <br />
                                <br />
                                <asp:Button ID="cmdeliminar" runat="server" 
                                    Text="Eliminar Mensaje" Height="34px" 
                                        onclick="cmdeliminar_Click" />
                                <br />
                            </div>
					</fieldset>
			</div> <!-- end side-content -->
            </div>
</asp:Content>
