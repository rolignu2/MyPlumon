<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="editar_documento.aspx.cs" Inherits="ProyectoAsp.Formulario_web121" %>
<%@ MasterType VirtualPath="~/Principal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">

 <div id="content">
		
		<div class="page-full-width cf">

			<div class="content-module">

				
				<div class="half-size-column fl">
				
					<div class="content-module">
					
						<div class="content-module-heading cf">
						
							<h3 class="fl" id="lblperiodo" runat="server"></h3>
						
						</div> <!-- end content-module-heading -->
						
						
						<div class="content-module-main">
						

                        <asp:Label ID="Label3" runat="server" Text="Titulo "></asp:Label>
                        <asp:TextBox ID="txttitulo" CssClass="round default-width-input"  runat="server"></asp:TextBox>
                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txttitulo" CssClass="confirmation-box" 
                                ErrorMessage="Se necesita un titulo"></asp:RequiredFieldValidator>
                        
                        <div class="stripe-separator"><!--  --></div>
							
					<textarea id="__txtdocumento" name="txtdocumento" rows="20" cols="40" style="width: 94%" 
                        runat="server"></textarea>

                        	
					<div class="stripe-separator"><!--  --></div>
					
					<p>Por medio de de esta pagina usted podra agregar todo tipo de documento asi como mejorar el sistema con resaltos de
                    letras , agregar imagenes desde la web , agregar videos de youtube u otro sitio etc. es libre de explorar todo tipo de
                    posibilidades (Staff My plumon) </p>

                   <div class="stripe-separator"><!--  --></div>

                   <p align="center">
                       <asp:Button ID="cmdguardar" 
                   CssClass="Button blue"
                   ToolTip="Guardar los cambios de la documentacion" 
                    runat="server" Text="Guardar Cambios Documentos" onclick="cmdguardar_Click" /></p>
							
                            <p></p>
                            <asp:Label ID="lblerror1" runat="server" Text=""></asp:Label>
						</div> <!-- end content-module-main -->
					
					</div> <!-- end content-module -->
				
				</div> <!--end half-size-column-->

				<div class="half-size-column fr">
				
					<div class="content-module">
					
						<div class="content-module-heading cf">
						
							<h3 class="fl">Sube un documento</h3>
							<span class="fr expand-collapse-text">Collapsar</span>
							<span class="fr expand-collapse-text initial-expand">Expandir</span>
						
						</div> <!-- end content-module-heading -->
						
						
						<div class="content-module-main cf">
					
							<div class="half-size-column fl">
						
								<cite>Si subes un Archivo debe de llevar un nombre especifico</cite>
								<p></p>
							    <p>El archivo que subira estara alojado en nuestro servidos asi que debe se menor o igual a 10mb.</p>
							</div>
							
							<div class="half-size-column fr">
							 <asp:Label ID="Label1" CssClass="another-simple-input" runat="server" Text="Nombre Archivo"></asp:Label>
						        <asp:TextBox ID="txtnombre_doc" runat="server" Width="159px"></asp:TextBox>
                                <p></p>	
							<asp:Label ID="Label2" CssClass="another-simple-input" runat="server" Text="Archivo a Subir"></asp:Label>
                            <asp:FileUpload ID="txt_subirArchivo" runat="server" />
                            <p></p>
                            <p align="center">
                                <asp:Button ID="CmdGuardar2"   CssClass="Button blue" runat="server" Text="Guardar Archivo" />
                                <asp:Label ID="lblerror2" runat="server" Text=""></asp:Label>
                            </p>

							</div>
							
						</div> <!-- end content-module-main -->
						
					</div> <!-- end content-module -->

		

				</div> <!--end half-size-column-->

			</div> <!-- end content-module -->
		
		</div> <!-- end full-width -->
			
	</div> <!-- end content -->


</asp:Content>
