<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="mensajeria.aspx.cs" Inherits="ProyectoAsp.Formulario_web125" %>
<%@ MasterType VirtualPath="~/Principal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">


	<div id="content">
		
		<div class="page-full-width cf">

			<div class="side-content ">
			
				<div class="content-module">
				
					<div class="content-module-heading cf">
					
						<h3 class="fl" id="txtcontmensaje" runat="server" ></h3>

					</div> <!-- end content-module-heading -->
					
					
					<div class="content-module-main" id="TablonMensajes" runat="server">
					
						
					
					</div> <!-- end content-module-main -->
				
				</div> <!-- end content-module -->
				
		
		
			</div> <!-- end side-content -->
		
		</div> <!-- end full-width -->
			
	</div> <!-- end content -->

</asp:Content>
