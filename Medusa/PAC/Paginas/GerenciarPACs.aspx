<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true" CodeBehind="GerenciarPACs.aspx.cs" Inherits="Medusa.PAC.Paginas.GerenciarPACs" %>

<%@ Register src="../Controles/ControlePACDetalhe.ascx" tagname="ControlePACDetalhe" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <h2>PACS PENDENTES</h2>
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
                             <asp:BoundField DataField="sigla" HeaderText="sigla" 
                                 SortExpression="Projeto.sigla_projeto" />
                            <asp:BoundField DataField="tipo_aquisicao" HeaderText="tipo de compra" 
                                SortExpression="PACTipoAquisicao.nome" />
                            <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="data" 
                                SortExpression="data" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="modalidade" HeaderText="modalidade" 
                                SortExpression="PACModalidadeCompra.nome" />
                             <asp:BoundField DataField="empresa" HeaderText="empresa" 
                                 SortExpression="empresa" />
                            <asp:BoundField DataField="status" HeaderText="status" />

                             

                             <asp:BoundField DataField="soma" DataFormatString="{0:N2}" 
                                 HeaderText="valor total" />

                             

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
                                   justificativa:
                                   <asp:RequiredFieldValidator ID="rfvJustificativa" runat="server" 
                                       ControlToValidate="txtJustificativa" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                               </td>
                               <td class="direito">
                                   <asp:TextBox ID="txtJustificativa" runat="server" Height="100px" 
                                       TextMode="MultiLine" Width="500px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td class="esquerdo">
                                   modalidade:
                                   <asp:CompareValidator ID="cvModalidade" runat="server" 
                                       ControlToValidate="ddlModalidade" ErrorMessage="selecione" Operator="NotEqual" 
                                       ValueToCompare="0"></asp:CompareValidator>
                               </td>
                               <td class="direito">
                                   <asp:DropDownList ID="ddlModalidade" runat="server" Width="500px">
                                   </asp:DropDownList>
                               </td>
                           </tr>
                           <tr>
                               <th colspan="2">
                                   <asp:Button ID="btAprovar" runat="server" onclick="btAprovar_Click" 
                                       Text="aprovar" />
                                   <asp:Button ID="btRecusar" runat="server" onclick="btRecusar_Click" 
                                       Text="recusar" />
                                   <asp:Button ID="btVoltar" runat="server" onclick="btVoltar_Click" 
                                       Text="voltar" />
                               </th>
                           </tr>
                      
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
