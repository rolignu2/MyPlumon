<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="editar_curso.aspx.cs" Inherits="ProyectoAsp.Formulario_web124" %>
<%@ MasterType VirtualPath="~/Principal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">

   <p>
        <br />
    </p>
      <div class="content-module-main cf" id="cmd_">
				
						<div align="center" class="half-size-column fl">
					
							
						
							
						
										<label>ACTIVAR CURSO</label>
                                        <asp:DropDownList ID="dropestado" runat="server" Height="16px" 
                                            Width="111px">
                                            <asp:ListItem Value="1">Si</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:DropDownList>
                                            <br />
                                            <br />
                                            <p></p>
                                            <p></p>
										<label for="dropdown-actions">
                        
                            Cambia tu imagen</label><asp:FileUpload ID="subir_img"
                                            runat="server" />
                                         <br />
					
							<p></p>
                                        <p>
                                            <asp:Image ID="imagen_curso" runat="server" Height="149px" Width="188px" 
                                                ImageUrl="~/images/Sin_imagen_disponible.jpg" />
                                        </p>
                                        <p>
                                         <p></p>
                                            <p></p>
										<label>Curso abierto</label></p>
                                        <p>
                                        <em id="em2" runat="server">
                                            <asp:CheckBox ID="checkabierto" runat="server" /></em></p>
                                        <p>
                                            &nbsp;</p>
						
							
						
						</div> <!-- end half-size-column -->
						
						<div class="half-size-column fr">
						
							
								<fieldset>

                                   <p>
										<label>CODIGO DEL CURSO</label>
										<asp:TextBox ID="txtrcod" runat="server" CssClass="round default-width-input"></asp:TextBox>
									    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtrcod" CssClass="error-box" 
                                            ErrorMessage="Se necesita un codigo"></asp:RequiredFieldValidator>
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
                                          <p>
                                            <asp:Button ID="CmdGuardar" runat="server" Text="Guardar Curso"  
                                                CssClass="round blue ic-right-arrow" onclick="CmdGuardar_Click"   />
                                        </p>
                                    <p align="center" visible="false" runat="server" class="confirmation-box" id="lblmensaje">

                                            
                                    </p>
								</fieldset>

						</div> <!-- end half-size-column -->
				
					</div>

</asp:Content>
