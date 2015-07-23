<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true" CodeBehind="VoltarPACs.aspx.cs" Inherits="Medusa.PAC.Paginas.VoltarPACs" %>

<%@ Register src="../Controles/ControlePACDetalhe.ascx" tagname="ControlePACDetalhe" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <h2>PACS FINALIZADOS</h2>
                 <div class="pesquisar">
                    <asp:TextBox ID="txtProcura" runat="server" MaxLength="50" Width="600px"></asp:TextBox>
                    <asp:Button ID="btProcurar" runat="server" CausesValidation="False" 
                        onclick="btProcurar_Click" Text="procurar" />
                </div>               
                <asp:Panel ID="panelGrid" runat="server">                    
                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="id_pac" ForeColor="#333333" GridLines="None" 
                        onrowediting="grid_RowEditing" Width="100%" AllowPaging="True" 
                        AllowSorting="True" onpageindexchanging="grid_PageIndexChanging" 
                        onsorting="grid_Sorting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                             <asp:BoundField DataField="id_pac" HeaderText="nº" SortExpression="id_pac">
                            <HeaderStyle Width="50px" HorizontalAlign="Left" />
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                SortExpression="Projeto.CodDef_Projeto" />
                            <asp:BoundField DataField="tipo_aquisicao" HeaderText="tipo de compra" 
                                SortExpression="PACTipoAquisicao.nome" />
                            <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="data" 
                                SortExpression="data" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="modalidade" HeaderText="modalidade" 
                                SortExpression="PACModalidadeCompra.nome" />
                            <asp:BoundField DataField="status" HeaderText="status" />

                             

                            <asp:TemplateField>
                             <ItemTemplate>
                                <a href='<%# Eval("id_pac", "PrintPac.aspx?id={0}") %>' target="_blank">
                                    <img src="../../Styles/img/print.gif" /></a>        
                            </ItemTemplate>
                            </asp:TemplateField>

                             

                            <asp:CommandField EditText="selecionar" ShowEditButton="True">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="50px" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="panelCadastro" runat="server">
                <uc1:ControlePACDetalhe ID="ControlePACDetalhe1" runat="server" />
                    <table class="cadastro">
                      
                
                           <tr>
                               <td class="esquerdo">
                                   modalidade:
                                   </td>
                               <td class="direito">
                                   <asp:Label ID="lbModalidade" runat="server"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <th colspan="2">
                                   <asp:Button ID="btVoltar" runat="server" onclick="btVoltar_Click" 
                                       Text="voltar" Width="200px" />
                               </th>
                           </tr>
                      
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
