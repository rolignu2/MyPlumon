<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AddCurso.aspx.cs" Inherits="ProyectoAsp.Formulario_web115" %>
<%@ MasterType VirtualPath="~/Principal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
    <p>
        <br />
    </p>
      <div class="content-module-main cf" id="cmd_">
				
						<div align="center" class="half-size-column fl">
					
							
							
								<h1 class="information-box" >USO PERMITIDO DE UN CURSO</h1>
									<p align="center">

                                    Uso de la imagen en productos electrónicos u online, y en proyectos promocionales como:
Presentaciones y vídeos empresariales
Películas comerciales y cinematográficas
Sitios web
Sitios de medios sociales, incluidas las plataformas de vídeo
Aplicaciones móviles
Correo electrónico
Libros electrónicos
Aplicaciones de software


                                    </p>
                                    <p align="center">La página o el recurso tiene establecido un copyright (c). Esto indica que la obra no se debería emplear, si no es con el consentimiento expreso del autor.
El material cuenta con una licencia abierta del tipo Creative Commons, GPL u otras tantas. En estos casos, de forma general, el material se puede emplear, incorporar, modificar y difundir; pero siempre debemos ceñirnos a lo que se indique en la licencia: si se nos indica aspectos como que debemos citar la autoría o si no podemos hacer modificaciones. En estos casos no tendremos que pedir consentimiento, sólo seguir las pautas indicadas. Este es el tipo de material que debemos emplear.
En el material no hay nada indicado o no es posible localizar su fuente. Sería mejor no emplearlo, ya que podríamos encontrarnos con que su autor nos reclame su reconocimiento de autoría en un futuro.
Por tanto, la mejor recomendación para reutilizar contenidos es la de incorporar exclusivamente materiales con licencias abiertas, como Creative Commons. En Internet encontraremos montones de espacios donde localizar recursos que podemos emplear.</p>
                                <p align="center">&nbsp;</p>
                                <p align="center">&nbsp;</p>
                                <p align="center">&nbsp;</p>
                                <p align="center">
                                  <asp:CheckBox ID="checkacepto" Checked="true" runat="server" Text="Acepto terminos de Uso plataforma" />
                                </p>
						
							
					
						
						</div> <!-- end half-size-column -->
						
						<div class="half-size-column fr">
						
							
								<fieldset>

                                   <p>
										<label>CODIGO DEL CURSO</label>
										<asp:TextBox ID="txtrcod" runat="server" CssClass="round default-width-input"></asp:TextBox>
                                        <em id="em1" runat="server">
                                           Auto generar codigo <asp:CheckBox ID="checkcod" runat="server" /></em>
									</p>
                                    <p></p>
                                    <p></p>
									<p>
										<label>NOMBRE DEL CURSO</label>
										<asp:TextBox ID="txtnombre" runat="server" CssClass="round default-width-input"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Se necesita un nombre" ControlToValidate="txtnombre" CssClass="error-box"></asp:RequiredFieldValidator>
                                        <em id="em_fcebook" runat="server">....Como se llamara tu curso ...</em>
									</p>
	                                   <p></p>
                                          <p></p>
									<p>
										<label>ACTIVAR CURSO</label></p>
                                    <p>
										<asp:DropDownList ID="DropDownList1" runat="server" Height="16px" 
                                            Width="111px">
                                            <asp:ListItem Value="1">Si</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:DropDownList>
                                       <em> ...Tu curso por defecto estara activado</em>
									</p>
	                                   <p></p>
									<p class="form-error-input">
										<label for="dropdown-actions">Agrega un logo o imagen</label>
                                        <asp:FileUpload ID="subir_img"
                                            runat="server" />
                                         <em>Agrega una imagen representativa a tu curso </em>	
									</p>
                                       <p></p>
                                          <p></p>
                                     <p>
										<label>Curso abierto</label>
                                        <em id="em2" runat="server">
                                           Curso abierto para todo publico  <asp:CheckBox ID="checkabierto" runat="server" /></em>
									</p>

	
									<div class="stripe-separator"><!--  --></div>
                                    <p>
                                            <asp:Button ID="CmdGuardar" runat="server" Text="Guardar Curso"  
                                                CssClass="round blue ic-right-arrow" onclick="CmdGuardar_Click"   />
                                    </p>
                                    <p align="center" visible="false" runat="server" class="confirmation-box" id="lblmensaje">

                                            
                                    </p>
                                    <p>
                                            &nbsp;</p>
								</fieldset>

						</div> <!-- end half-size-column -->
				
					</div>
</asp:Content>
