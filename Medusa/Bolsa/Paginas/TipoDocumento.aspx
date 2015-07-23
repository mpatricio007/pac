﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="TipoDocumento.aspx.cs" Inherits="Medusa.Bolsa.Paginas.TipoDocumento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="conteudoDir">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="pesquisar">
           <asp:Label ID="Label1" runat="server" Text="procurar"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlOptions" runat="server">           
                <asp:ListItem Value="Nome">nome</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtProcura" runat="server" Width="137px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlMode" runat="server">
                <asp:ListItem Value="Equals">igual</asp:ListItem>
                <asp:ListItem Value="StartsWith" Selected="True">começando com</asp:ListItem>
                <asp:ListItem Value="EndsWith">terminando com</asp:ListItem>
                <asp:ListItem Value="Contains">que contém</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label2" runat="server" Text="mostrar"></asp:Label>&nbsp;
            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlSize_SelectedIndexChanged">
                <asp:ListItem Selected="True">10</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btSearch" runat="server" 
                Text="Procurar" onclick="btProcurar_Click" CausesValidation="False" />
            <asp:Button ID="btCriar" runat="server" Text="novo" CausesValidation="False" 
                    onclick="btCriar_Click" style="height: 26px" />
        </div>
                <asp:Panel ID="panelGrid" runat="server">
                    <asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" Caption="Lista de Tipo de Documentos" CellPadding="4" 
                        CssClass="tableView" ForeColor="#333333" GridLines="None" 
                        onpageindexchanging="grid_PageIndexChanging" onrowediting="grid_RowEditing" 
                        Width="100%" onsorting="grid_Sorting" onrowcreated="grid_RowCreated">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                        
                            <asp:BoundField DataField="Id_TipoDocumento" HeaderText="código" 
                                SortExpression="Id_TipoDocumento">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>             
                            <asp:BoundField DataField="Nome" HeaderText="nome" 
                                SortExpression="Nome">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="status" SortExpression="status">
                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:CheckBoxField>
                            <asp:CommandField EditText="selecionar" ShowEditButton="True">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" 
                            CssClass="SortedAscendingCellStyle" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" 
                            CssClass="SortedAscendingHeaderStyle" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" 
                            CssClass="SortedDescendingCellStyle" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" 
                            CssClass="SortedDescendingHeaderStyle " />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="panelCadastro" runat="server">
                    <table class="cadastro">
                        <tr>
                            <th colspan="1">
                                cadastro de tipo de documento</th>
                            <th colspan="1">
                                <asp:Button ID="btInserir" runat="server" onclick="btInserir_Click" 
                                    Text="inserir" />
                                <asp:Button ID="btAlterar" runat="server" onclick="btAlterar_Click" 
                                    Text="salvar" />
                                <asp:Button ID="btExcluir" runat="server" CausesValidation="False" 
                                    onclick="btExcluir_Click" Text="excluir" />
                                <asp:Button ID="btCancelar" runat="server" CausesValidation="False" 
                                    onclick="btCancelar_Click" Text="cancelar" />
                            </th>
                        </tr>
                        <tr>
                            <td class="esquerdo">
                                nome:
                                <asp:RequiredFieldValidator ID="rfvNome" runat="server" 
                                    ControlToValidate="txtNome" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                <asp:Label ID="txtCodigo" runat="server" Text="0" Visible="False"></asp:Label>
                            </td>
                            <td class="direito">
                                <asp:TextBox ID="txtNome" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                            </td>
                        </tr>                
                        <tr>
                            <td class="esquerdo">
                                status:</td>
                            <td class="direito">
                                <asp:CheckBox ID="ckStatus" runat="server" Text="ativo" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <asp:Button ID="btInserir0" runat="server" onclick="btInserir_Click" 
                                    style="height: 26px" Text="inserir" />
                                <asp:Button ID="btAlterar0" runat="server" onclick="btAlterar_Click" 
                                    Text="salvar" />
                                <asp:Button ID="btExcluir0" runat="server" CausesValidation="False" 
                                    onclick="btExcluir_Click" Text="excluir" />
                                <asp:Button ID="btCancelar0" runat="server" CausesValidation="False" 
                                    onclick="btCancelar_Click" Text="cancelar" />
                            </th>
                        </tr>
                    </table>
                </asp:Panel>
                </ContentTemplate>
        </asp:UpdatePanel>
          
    </div>
</asp:Content>
