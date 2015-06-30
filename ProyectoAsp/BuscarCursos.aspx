<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="BuscarCursos.aspx.cs" Inherits="ProyectoAsp.Formulario_web116" %>
<%@ MasterType VirtualPath="~/Principal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
    
    
	<!-- MAIN CONTENT -->
	<div id="content">
		
		<div class="page-full-width cf">

			<div class="side-menu fl">
				
				
        
					
                     <asp:Button runat="server" CssClass="blue button" Text="Buscar todo" />
                     <br />
                     <h3>Buscar Por Patrones</h3>
                     <p align="center">
					    <asp:TextBox ID="TextBox1" runat="server" Height="17px" Width="168px"></asp:TextBox>
                    </p>
                     <p align="center">
					     <asp:Button ID="Button1" runat="server" CssClass="blue button" Text="Buscar" />
                    </p>
                    
              

			</div> <!-- end side-menu -->
			
			<div class="side-content fr">
			
				<div class="full-size-column fl">
				
					<div class="content-module">
					
						<div class="content-module-heading cf" runat="server" id="Cabecera_arreglo">
						
							<h3 class="fl">Cursos Disponibles </h3>

						
						</div> <!-- end content-module-heading -->
						
						
						<div class="content-module-main">
						
							
					
						    <asp:GridView ID="Grilla_datos" runat="server" AllowPaging="True" 
                                CellPadding="3" GridLines="Horizontal" BackColor="White" 
                                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                                onpageindexchanging="Grilla_datos_PageIndexChanging">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>
						
							<div id="cuadro_error" class="error-box" runat="server" visible="false" >
                              
                            </div>
					
						</div> <!-- end content-module-main -->
					
					</div> <!-- end content-module -->
				
				</div> <!--end half-size-column-->

			
	
			</div> <!-- end side-content -->
		
		</div> <!-- end full-width -->
			
	</div> <!-- end content -->
	

</asp:Content>
