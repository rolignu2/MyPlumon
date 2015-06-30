<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="mensaje.aspx.cs" Inherits="ProyectoAsp.Formulario_web126" %>
<%@ MasterType VirtualPath="~/Principal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
<div id="content">
		
			<div id="Div1">
		
		<div class="page-full-width cf">

			<div class="content-module">
			
				<div class="content-module-heading cf">
				
					<h3 class="fl" id="txtpara" runat="server"></h3>
					<span class="fr expand-collapse-text"></span>
					<span class="fr expand-collapse-text initial-expand"></span>
				
				</div> <!-- end content-module-heading -->
				
				
				<div class="content-module-main fl">
				
					
					<h1>&nbsp;</h1>
                            <p>
                                &nbsp;&nbsp; Asunto:</p>
                            <p>
                                <asp:TextBox ID="txtasunto" runat="server" Width="431px" 
                                    CssClass="default-width-input"></asp:TextBox>

                            </p>
                            <p>
                                Mensaje:</p>
                            <p>
                                <asp:TextBox ID="txtmensaje" runat="server" Height="228px" TextMode="MultiLine" 
                                    Width="471px"></asp:TextBox>

                            </p>
							
							<div class="stripe-separator"><!-- -->
                                <br />
                                <br />
                                <br />
                            </div>
						        <p>
                                    <asp:Button ID="cmdenviar" CssClass="blue" runat="server" Text="Enviar Mensaje" 
                                        Width="176px" onclick="cmdenviar_Click" />
                            </p>
                    <p id="divmensaje" runat="server">
                                   </p>
					
					
				</div> <!-- end content-module-main -->
			
			</div> <!-- end content-module -->
		
		</div> <!-- end full-width -->
			
	</div> <!-- end content -->

</asp:Content>
