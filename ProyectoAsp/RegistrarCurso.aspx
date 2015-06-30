<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="RegistrarCurso.aspx.cs" Inherits="ProyectoAsp.Formulario_web117" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
   <!-- MAIN CONTENT -->
	<div id="content">
		
		<div class="page-full-width cf">

			
			<div class="side-content fr">
			
		
				<div class="content-module">
				
					<div class="content-module-heading cf" >
					
                        <img alt="" class="fl" style="border-bottom-style" src="http://desmarcado.cl/wp-content/uploads/2013/05/JavaScript.png" width="70" height="70" runat="server" id="imagen_curso" />
						<h3 class="fl" runat="server" id="Nombre_curso">NOMBRE_CURSO</h3>
						<span class="fr expand-collapse-text">click colapsar</span>
						<span class="fr expand-collapse-text initial-expand">click Expandir</span>
					
					</div> <!-- end content-module-heading -->
					
					
					<div class="content-module-main cf">
				
						<div class="half-size-column fl">
						
							<form action="#">
							
								<fieldset>
							
									<br />
                                        <blockquote>
                                            AL MOMENTO DE REGISTRARTE EN ESTE CURSOS ACEPTAS LOS TERMINOS Y CONDICIONES DE ESTA PLATAFORMA VIRTUAL
                                            EN DADO CASO NO ACEPTAS LOS TERMINOS ES LIBRE DE TOMAR SU RIESGO O NO TOMAR ESTE CURSO...
                                            <a href="terminos.aspx"> Revisar Terminos de uso</a>
                                        </blockquote>
                                        <p></p>
							            <cite>Staff My Plumon</cite>
                                        <p></p>
                                        <p></p>
                                        <br />
									<p runat="server" visible="true">
										<label for="full-width-input">Codigo de acceso</label>
                                        <asp:TextBox ID="txtcodigo" runat="server" CssClass="round full-width-input"></asp:TextBox>
										<em>Se necesita un codigo otorgado por el docente para acceder a este curso</em>								
									</p>
	                                <p></p>
                                    <p></p>
                                    	<p align="center">
                                        	
                                            <asp:Button ID="cmdacceder" runat="server" Text="Registar Curso" 
                                                onclick="cmdacceder_Click" />						
									</p>
								</fieldset>
							
							</form>
						
						</div> <!-- end half-size-column -->
						
						<div class="half-size-column fr">
						
							<form action="#">
							
								<fieldset>
								
                                    <p align="center">
                                        <asp:Image ID="imagen_curso_lateral" runat="server" 
                                            ImageUrl="http://desmarcado.cl/wp-content/uploads/2013/05/JavaScript.png" 
                                            Width="100" Height="100" BorderStyle="Dotted" BorderWidth="2px" /></p>
									<p align="center">
                                          
                                          <asp:Label ID="lbl1" runat="server" Text="HOLA ROLANDO " Font-Size="Larger"></asp:Label>
									</p>

                                    <p  align="center">
                                           <asp:Label ID="lbl2" runat="server" Text="HOLA ROLANDO " Font-Size="Larger"></asp:Label>
                                    </p>

                                    <p  align="center">
                                    
                                           <asp:Label ID="lbl3" runat="server" Text="HOLA ROLANDO " Font-Size="Larger"></asp:Label>
                                    </p>
                                    <p  align="center">
                                    
                                           &nbsp;</p>
                                    <p  align="center">
                                    
                                           <asp:Label ID="lblerrmenaje" runat="server" Text="HOLA ROLANDO " 
                                               Font-Size="Larger" CssClass="error-box"></asp:Label>
                                    </p>
									
								</fieldset>
							
							</form>
							
						</div> <!-- end half-size-column -->
				
					</div> <!-- end content-module-main -->
					
				</div> <!-- end content-module -->
	
			

			
			</div> <!-- end side-content -->
		
		    <br />
		
		</div> <!-- end full-width -->
			
	</div> <!-- end content -->

</asp:Content>
