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
					    <asp:TextBox ID="TextBox1" CssClass="round" runat="server" Height="16px"></asp:TextBox>
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
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
