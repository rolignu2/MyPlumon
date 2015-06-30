<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="curso.aspx.cs" Inherits="ProyectoAsp.Formulario_web19" %>
<%@ MasterType VirtualPath="~/Principal.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
   <div class="page-full-width cf">

			<div class="side-menu fl" runat="server" id="MenuContenido">
				
				<h3>Opciones del tutor</h3>
				<ul>
					<li><a href="#">menu1</a></li>
					<li><a href="#" >menu2</a></li>
					<li><a href="#" >menu3</a></li>
					<li><a href="#" >menu4</a></li>
				</ul>

                <br />
                <h3>Opciones del tutor</h3>
				<ul>
					<li><a href="#">menu1</a></li>
					<li><a href="#" >menu2</a></li>
					<li><a href="#" >menu3</a></li>
					<li><a href="#" >menu4</a></li>
				</ul>
				
			</div> <!-- end side-menu -->
			
			<div class="side-content fr">
			
				<div class="half-size-column fl">
				
					<div class="content-module">
					
						<div class="content-module-heading cf">
						
							<h3 class="fl" runat="server" id="titulo_periodo" >....</h3>
							<span class="fr expand-collapse-text" runat="server" id="estado_periodo" >...</span>
                             <asp:LinkButton ID="linkeliminar" ToolTip="Eliminar periodo" 
                                CssClass="fr button blue text-upper small-button" runat="server" 
                                onclick="linkeliminar_Click">Eliminar</asp:LinkButton>
						</div> <!-- end content-module-heading -->
						
						
						<div class="content-module-main" runat="server" id="tablon_periodo">
						
						
							
						</div> <!-- end content-module-main -->
					
					</div> <!-- end content-module -->
				
				</div> <!--end half-size-column-->

				<div class="half-size-column fr">
				
					<div class="content-module">
					
						<div class="content-module-heading cf">
						
							<h3 class="fl">ALUMNOS DE ESTE CURSO</h3>
							<span class="fr expand-collapse-text"></span>
							<span class="fr expand-collapse-text initial-expand"></span>
						
						</div> <!-- end content-module-heading -->
						
						
						<div class="content-module-main cf">
					            <div class="content-module-main cf">
				
                        <!-- aca va los alumnos dentro de este curso-->
						<ul class="imagenes_lista" runat="server" id="ul_alumnos">
							<li><a href="#" title="Rolando"><img alt="" src="" height="50" width="50" /></a></li>
                            <li><a href="#" title="Rolando"><img alt="" src="" height="50" width="50" /></a></li>
						</ul>
				
					</div> <!-- end content-module-main -->
							
						</div> <!-- end content-module-main -->
						
					</div> <!-- end content-module -->

					<div class="content-module">
					
						<div class="content-module-heading cf">

						
						</div> <!-- end content-module-heading -->
	
						
						<div class="content-module-main cf">
					
						    <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    
                                    	<div class="content-module">
                                        <div class="content-module-heading cf">
						
							            <h3 class="fl">Comentarios</h3>
						                </div> <!-- end content-module-heading -->

                                        <div class="content-module-main cf" runat="server" id="tablon_comentarios">
                                        
                                        </div>
                                        </div>
                                    
                                    <br />
                                    <div class="content-module">
                                     <br /><p align="center">
                                        <input type="text" id="txt_comentario" runat="server" onclick="this.value=''" 
                                         class="round default-width-input" value="Agregar comentario" style="width:300; height:300;" />
                                   </p>
                                    <p align="center">
                                    <asp:Button ID="cmdcomentario" runat="server" CssClass="blue" Height="35px" 
                                        Text="Enviar Comentario" Width="184px" onclick="cmdcomentario_Click" /></p>
                                        <p align="center" id="error_coment" runat="server">
                                            &nbsp;</p>
                                        </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="cmdcomentario" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <br />
					
						</div> <!-- end content-module-main -->
						
					</div> <!-- end content-module -->

				</div> <!--end half-size-column-->
	
			</div> <!-- end side-content -->
		
		</div> <!-- end full-width -->
			

	
	

</asp:Content>
