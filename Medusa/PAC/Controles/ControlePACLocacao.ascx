<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlePACLocacao.ascx.cs" Inherits="Medusa.PAC.Controles.ControlePACLocacao" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Button ID="btNew" runat="server" onclick="btNew_Click" 
    Text="nova locação de bem" />
<asp:MultiView ID="mvLocacaoBem" runat="server">
    <asp:View ID="vListar" runat="server">
   




        <asp:GridView ID="gridLocacaoBem" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None" AutoGenerateColumns="False" 
            OnRowDeleting="gridLocacaoBem_RowDeleting" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="especificacao" HeaderText="especificação">
                    <HeaderStyle HorizontalAlign="Left" Width="200px" />
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="unidade" HeaderText="unidade">
                    <HeaderStyle HorizontalAlign="Left" Width="50px" />
                    <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="quantidade" HeaderText="quantidade">
                    <HeaderStyle HorizontalAlign="Left" Width="70px" />
                    <ItemStyle Width="70px" />
                </asp:BoundField>
                <asp:BoundField DataField="valor_unitario" HeaderText="vl. unitário" 
                    DataFormatString="{0:C2}" />
                <asp:BoundField DataField="valor_total" HeaderText="vl. total" 
                    DataFormatString="{0:C2}" />
                <asp:BoundField DataField="meta_etapa" HeaderText="meta/etapa" />
                <asp:BoundField DataField="rubrica_item" HeaderText="rubrica/item" />
                <asp:CommandField DeleteText="excluir" ShowDeleteButton="True" />
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
    </asp:View>
    <asp:View ID="vCadastro" runat="server">
        <table class="cadastro">
            <tr>
                <th colspan="1">
                    Locação de Bem</th>
                <th colspan="1">
                </th>
            </tr>
            <tr>
                <td class="esquerdo">
                    especificação:
                    <asp:RequiredFieldValidator ID="PACLocacaoBemRfvEspecificacao" runat="server" ControlToValidate="PACLocacaoBemTxtEspecificacao"
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoBemTxtEspecificacao" runat="server" Width="500px" MaxLength="100"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    quantidade:
                    <asp:RequiredFieldValidator ID="PACLocacaoBemRfvQtdade" runat="server" ControlToValidate="PACLocacaoBemTxtQtdade"
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoBemTxtQtdade" runat="server" Width="100px" MaxLength="10"
                        onkeyup="formataInteiro(this,event);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    unidade:
                    <asp:RequiredFieldValidator ID="PACLocacaoBemRfvUnidade" runat="server" ControlToValidate="PACLocacaoBemTxtUnidade"
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoBemTxtUnidade" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    valor unitário:
                    <asp:RequiredFieldValidator ID="PACLocacaoBemRfvValorEstimado" runat="server" ControlToValidate="PACLocacaoBemTxtValorEstimado"
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoBemTxtValorEstimado" runat="server" Width="100px" MaxLength="18"
                        onkeyup="formataValor(this,event);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    meta/etapa:
                    <asp:RequiredFieldValidator ID="PACLocacaoBemRfvMeta" runat="server" ControlToValidate="PACLocacaoBemTxtMetaEtapa"
                        ErrorMessage="obrigatório" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoBemTxtMetaEtapa" runat="server" Width="100px" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    rubrica/item:
                    <asp:RequiredFieldValidator ID="PACLocacaoBemRfvRubrica" runat="server" ControlToValidate="PACLocacaoBemTxtRubricaItem"
                        Enabled="False" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoBemTxtRubricaItem" runat="server" MaxLength="30" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    data de início:
                    <asp:RequiredFieldValidator ID="PACLocacaoRfvDtInicio" runat="server" ControlToValidate="PACLocacaoTxtDtInicio"
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoTxtDtInicio" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    data de término:
                    <asp:RequiredFieldValidator ID="PACLocacaoRfvDtTermino" runat="server" ControlToValidate="PACLocacaoTxtDtTermino"
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACLocacaoTxtDtTermino" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                                    <td class="esquerdo">
                                        local de retirada:</td>
                                    <td class="direito">
                                        <asp:RadioButtonList ID="PACLocacaoRdRetira_locadora" runat="server" 
                                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" Value="False">outro</asp:ListItem>
                                            <asp:ListItem Value="True">locadora</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                          
                                <tr>
                                    <td class="esquerdo">
                                        local de devolução:</td>
                                    <td class="direito">
                                        <asp:RadioButtonList ID="PACLocacaoRdDevolucao_Locadora" runat="server" 
                                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" Value="False">outro</asp:ListItem>
                                            <asp:ListItem Value="True">locadora</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
        
            <tr>
                <td align="right" colspan="2">
                    <asp:Panel ID="pCadastro" runat="server">
                        <asp:Button ID="PACLocacaoBemBtAdd" runat="server" OnClick="PACLocacaoBemBtAdd_Click"
                            Text="salvar locação de bem" />
                        <asp:Button ID="PACLocacaoBemBtCancelar" runat="server" CausesValidation="False"
                            OnClick="PACLocacaoBemBtCancelar_Click" Text="cancelar" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>
