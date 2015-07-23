<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlePACLocacaoVeiculo.ascx.cs" Inherits="Medusa.PAC.Controles.ControlePACLocacaoVeiculo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../../Controles/ControleCPF.ascx" tagname="ControleCPF" tagprefix="uc1" %>

<asp:Button ID="btNew" runat="server" onclick="btNew_Click" Text="nova locação de veículo" 
    CausesValidation="False" />
<asp:MultiView ID="mvLocacaoVeiculo" runat="server">
    <asp:View ID="vListar" runat="server">
   




                             <asp:GridView ID="gridLocacaoVeiculo" runat="server" CellPadding="4" ForeColor="#333333" 
                                 GridLines="None" AutoGenerateColumns="False" 
                                 onrowdeleting="gridLocacaoVeiculo_RowDeleting" HorizontalAlign="Left" 
                                 Width="100%">
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
                                     <asp:BoundField DataField="valor_unitario" HeaderText="vl. unitário" />
                                     <asp:BoundField DataField="valor_total" HeaderText="vl. total" />
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
                                        Locação Veículo</th>
                                    <th colspan="1">
                                        </th>
                                </tr>
                                  <tr>
                                    <td class="esquerdo">
                                        locadora:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvLocadora" runat="server" 
                                            ControlToValidate="PACLocacaoVeiculoTxtLocadora" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtLocadora" runat="server" MaxLength="100" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="esquerdo">
                                        nº da reserva:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvReserva" runat="server" 
                                            ControlToValidate="PACLocacaoVeiculoTxtReserva" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtReserva" runat="server" MaxLength="20" 
                                            Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        envio da autorização p/:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvAutorizacao" runat="server" 
                                            ControlToValidate="PACLocacaoVeiculoTxtAutorizacao" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtAutorizacao" runat="server" 
                                            MaxLength="100" Width="500px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="esquerdo">
                                        descrição do veículo:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvEspecificacao" runat="server" 
                                            ControlToValidate="PACLocacaoVeiculoTxtEspecificacao" 
                                            ErrorMessage="obrigatório"  ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtEspecificacao" runat="server" 
                                            Width="500px" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
             
                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvQtdade" runat="server" 
                                            ControlToValidate="PACLocacaoVeiculoTxtQtdade" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtQtdade" runat="server" MaxLength="10"  
                                            Width="100px" onkeyup="formataInteiro(this,event);" AutoPostBack="True" 
                                            ontextchanged="PACLocacaoVeiculoTxtQtdade_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvUnidade" runat="server" 
                                            ControlToValidate="PACLocacaoVeiculoTxtUnidade" 
                                            ErrorMessage="obrigatório" ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtUnidade" runat="server" Width="100px" 
                                            MaxLength="20" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvValorEstimado" 
                                            runat="server" ControlToValidate="PACLocacaoVeiculoTxtValorEstimado"
                                            ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtValorEstimado" runat="server" 
                                            Width="100px" MaxLength="18" onkeyup="formataValor(this,event);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvMeta" runat="server" ControlToValidate="PACLocacaoVeiculoTxtMetaEtapa"
                                            Enabled="False" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtMetaEtapa" runat="server" MaxLength="30" 
                                            Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        rubrica/item:
                                        <asp:RequiredFieldValidator ID="PACLocacaoVeiculoRfvRubrica" runat="server" ControlToValidate="PACLocacaoVeiculoTxtRubricaItem"
                                            ErrorMessage="obrigatório" Enabled="False"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoVeiculoTxtRubricaItem" runat="server" MaxLength="30" 
                                            Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        data de início:
                                        <asp:RequiredFieldValidator ID="PACLocacaoRfvDtInicio" runat="server" ControlToValidate="PACLocacaoTxtDtInicio"
                                            ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoTxtDtInicio" runat="server" AutoPostBack="True" 
                                            ontextchanged="PACLocacaoTxtDtInicio_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        data de término:
                                        <asp:RequiredFieldValidator ID="PACLocacaoRfvDtTermino" runat="server" 
                                            ControlToValidate="PACLocacaoTxtDtTermino" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACLocacaoTxtDtTermino" runat="server" ReadOnly="True"></asp:TextBox>
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
                                    <td class="esquerdo">
                                        condutores:</td>
                                    <td class="direito">
                                        <asp:LinkButton ID="lkAdicionarCondutores" runat="server" 
                                            onclick="lkAdicionarCondutores_Click" CausesValidation="False">adicionar condutores</asp:LinkButton>
                                        <asp:GridView ID="gridCondutores" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" ForeColor="#333333" GridLines="None" 
                                            onrowdeleting="gridCondutores_RowDeleting" Width="500px">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:BoundField DataField="nome" HeaderText="nome"></asp:BoundField>
                                                <asp:BoundField DataField="cpf" HeaderText="cpf"></asp:BoundField>
                                                <asp:CommandField DeleteText="excluir" ShowDeleteButton="True" />
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Panel ID="pCadastro" runat="server">
                                            <asp:CustomValidator ID="cvCondutores" runat="server" 
                                                ErrorMessage="adicione ao menos um condutor" 
                                                onservervalidate="cvCondutores_ServerValidate" ForeColor="Red"></asp:CustomValidator>
                                            <asp:Button ID="PACLocacaoVeiculoBtAdd" runat="server" 
                                                OnClick="PACLocacaoVeiculoBtAdd_Click" Text="salvar locação de veículo" />
                                            <asp:Button ID="PACLocacaoVeiculoBtCancelar" runat="server" 
                                                CausesValidation="False" OnClick="PACLocacaoVeiculoBtCancelar_Click" 
                                                Text="cancelar" />
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
 </asp:View>

 <asp:View ID="vCondutores" runat="server">
  <table class="cadastro">
  <tr>
   <th colspan="1">
                                        Dados do Condutor</th>
                                    <th colspan="1">
                                        </th>
              
            </tr>
                <tr>
                <td class="esquerdo">
                    nome:
                    <asp:RequiredFieldValidator ID="PACCondutorRfvNome" runat="server" 
                        ControlToValidate="PACCondutorTxtNome" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACCondutorTxtNome" runat="server" MaxLength="200" 
                        Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    cpf:
                    </td>
                <td class="direito">
                    <uc1:ControleCPF ID="ControleCPF1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    rg:
                    <asp:RequiredFieldValidator ID="PACCondutorRfvRg" runat="server" 
                        ControlToValidate="PACCondutorTxtRg" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACCondutorTxtRg" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    cnh:
                    <asp:RequiredFieldValidator ID="PACCondutorRfvCNH" runat="server" 
                        ControlToValidate="PAcCondutorTxtCNH" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PAcCondutorTxtCNH" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    validade da cnh:
                    <asp:RequiredFieldValidator ID="PACCondutorRfvCNHValidade" runat="server" 
                        ControlToValidate="PAcCondutorTxtCNHValidade" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PAcCondutorTxtCNHValidade" runat="server"></asp:TextBox>
                </td>
      </tr>
            <tr>
                <td colspan="2">
                    endereço</td>
            </tr>
            <tr>
                <td class="esquerdo">
                    logradouro:
                    <asp:RequiredFieldValidator ID="PACCondutorRfvLogradouro" runat="server" 
                        ControlToValidate="PACCondutorTxtLogradouro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACCondutorTxtLogradouro" runat="server" MaxLength="200" 
                        Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    número:
                    <asp:RequiredFieldValidator ID="PACCondutorRfvNumero" runat="server" 
                        ControlToValidate="PACCondutorTxtNumero" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACCondutorTxtNumero" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    bairro:
                    <asp:RequiredFieldValidator ID="PACCondutorRfvBairro" runat="server" 
                        ControlToValidate="PACCondutorTxtBairro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACCondutorTxtBairro" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    complemento:</td>
                <td class="direito">
                    <asp:TextBox ID="PACCondutorTxtComplemento" runat="server" MaxLength="100" 
                        Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    uf:</td>
                <td class="direito">
                    <asp:DropDownList ID="PACCondutorDllUF" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="PACCondutorDllUF_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    cidade:</td>
                <td class="direito">
                    <asp:DropDownList ID="PACCondutorDllCidade" runat="server" Width="500px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    cep:
                    <asp:MaskedEditValidator ID="PACCondutorMevCep" runat="server" 
                        ControlExtender="PACCondutorMeeCep" ControlToValidate="PACCondutorTxtCep" 
                        Display="Dynamic" EmptyValueMessage="obrigatório" ErrorMessage="inválido" 
                        ForeColor="Red" InvalidValueMessage="inválido" IsValidEmpty="False" 
                        ValidationExpression="\d{5}\-\d{3}"></asp:MaskedEditValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACCondutorTxtCep" runat="server" MaxLength="9" Width="100px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="PACCondutorMeeCep" runat="server" 
                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                        Mask="99999-999" TargetControlID="PACCondutorTxtCep"></asp:MaskedEditExtender>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Button ID="PACCondutorBtAdd" runat="server" onclick="PACCondutorBtAdd_Click" 
                            Text="salvar condutor" />
                        <asp:Button ID="PACCondutorBtCancelar" runat="server" CausesValidation="False" 
                            onclick="PACCondutorBtCancelar_Click" Text="cancelar" />
                    </asp:Panel>
                </td>
            </tr>
            </table>
 </asp:View>
</asp:MultiView>
