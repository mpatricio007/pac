<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlePACPassagem.ascx.cs" Inherits="Medusa.PAC.Controles.ControlePACPassagem" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="../../Controles/ControleCPF.ascx" tagname="ControleCPF" tagprefix="uc1" %>
<asp:Button ID="btNew" runat="server" onclick="btNew_Click" 
    Text="nova passagem" />
<asp:MultiView ID="mvPassagem" runat="server">
    <asp:View ID="vListar" runat="server">
        <asp:GridView ID="gridBens" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowdeleting="gridBens_RowDeleting" Width="100%">
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
                    Passagem</th>
                <th colspan="1">
                    &nbsp;</th>
            </tr>

               <tr>
                      <td class="esquerdo">
                          tipo de compra:
                          <asp:CompareValidator ID="cvTipoCompraPassagem" runat="server" 
                              ControlToValidate="ddlTipoPassagem" ErrorMessage="obrigatório" ForeColor="Red" 
                              Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                      </td>
                      <td class="direito">
                          <asp:DropDownList ID="ddlTipoPassagem" runat="server" DataTextField="nome" 
                              DataValueField="id_tipo_passagem" Width="400px">
                          </asp:DropDownList>
                      </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    internacional:</td>
                <td class="direito">
                    <asp:RadioButtonList ID="PACPassagemRdEh_internacional" runat="server" 
                        RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" 
                        onselectedindexchanged="PACPassagemRdEh_internacional_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="False">não</asp:ListItem>
                        <asp:ListItem Value="True">sim</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
               <tr>
                <td class="esquerdo">
                    ida e volta:</td>
                <td class="direito">
                    <asp:RadioButtonList ID="PACPassagemRdIda_Volta" runat="server" 
                        RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" 
                        onselectedindexchanged="PACPassagemRdIda_Volta_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="False">não</asp:ListItem>
                        <asp:ListItem Value="True">sim</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    data de ida:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvDtIda" runat="server" 
                        ControlToValidate="PACPassagemTxtDtIda" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtDtIda" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    período:</td>
                <td class="direito">
                    <asp:RadioButtonList ID="rdPeriodoIda" runat="server" 
                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">manhã</asp:ListItem>
                        <asp:ListItem>tarde</asp:ListItem>
                        <asp:ListItem>noite</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    data de volta:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvDtVolta" runat="server" 
                        ControlToValidate="PACPassagemTxtDtVolta" Enabled="False" 
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtDtVolta" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    período:</td>
                <td class="direito">
                    <asp:RadioButtonList ID="rdPeriodoVolta" runat="server" 
                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">manhã</asp:ListItem>
                        <asp:ListItem>tarde</asp:ListItem>
                        <asp:ListItem>noite</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    origem/destino:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvEspecificacao" runat="server" 
                        ControlToValidate="PACPassagemTxtEspecificacao" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtEspecificacao" runat="server" MaxLength="100" 
                        Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    valor total:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvValorTotal" runat="server" 
                        ControlToValidate="PACPassagemTxtValorTotal" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtValorTotal" runat="server" MaxLength="18" 
                        onkeyup="formataValor(this,event);" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    meta/etapa:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvMeta" runat="server" 
                        ControlToValidate="PACPassagemTxtMetaEtapa" Enabled="False" 
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtMetaEtapa" runat="server" MaxLength="30" 
                        Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    rubrica/item:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvRubrica" runat="server" 
                        ControlToValidate="PACPassagemTxtRubricaItem" Enabled="False" 
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtRubricaItem" runat="server" MaxLength="30" 
                        Width="100px"></asp:TextBox>
                </td>
            </tr>
               
                  <tr>
                                    <td class="esquerdo">
                                        passageiros:</td>
                                    <td class="direito">
                                        <asp:LinkButton ID="lkAdicionarPassageiros" runat="server" 
                                            onclick="lkAdicionarCondutores_Click" CausesValidation="False">adicionar passageiros</asp:LinkButton>
                                        <asp:GridView ID="gridPassageiros" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" ForeColor="#333333" GridLines="None" 
                                            onrowdeleting="gridPassageiros_RowDeleting" Width="500px">
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
                        <asp:CustomValidator ID="cvPassageiros" runat="server" 
                            ErrorMessage="adicione ao menos um passageiro" ForeColor="Red" 
                            onservervalidate="cvPassageiros_ServerValidate"></asp:CustomValidator>
                        <asp:Button ID="PACPassagemBtAdd" runat="server" onclick="PACPassagemBtAdd_Click" 
                            Text="salvar passagem" />
                        <asp:Button ID="PACPassagemBtCancelar" runat="server" CausesValidation="False" 
                            onclick="PACPassagemBtCancelar_Click" Text="cancelar" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="vPassageiros" runat="server">
  <table class="cadastro">
  <tr>
   <th colspan="1">
                                        Dados do Passageiro</th>
                                    <th colspan="1">
                                        </th>
              
            </tr>
                <tr>
                <td class="esquerdo">
                    passageiros cadastrados:<asp:CompareValidator ID="cvPassageiro" runat="server" 
                        ControlToValidate="ddlPassageiros" ErrorMessage="selecione" Operator="NotEqual" 
                        ValidationGroup="passageiro" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                <td class="direito">
                    <asp:DropDownList ID="ddlPassageiros" runat="server" Width="350px">
                    </asp:DropDownList>
                    <asp:Button ID="btPassageiro" runat="server" onclick="btPassageiro_Click" 
                        Text="carregar dados" ValidationGroup="passageiro" />
                </td>
            </tr>
             
                <tr>
                    <td class="esquerdo">
                        cpf:
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtCpf" runat="server" AutoPostBack="True" MaxLength="14" 
                            onkeyup="formataCPF(this,event);"></asp:TextBox>
                        <asp:CustomValidator ID="cvCpf" runat="server" 
                            ClientValidationFunction="valida_cpf" ControlToValidate="txtCpf" 
                            Display="Dynamic" EnableTheming="False" ErrorMessage="cpf inválido" 
                            ForeColor="Red" onservervalidate="cvCpf_ServerValidate"></asp:CustomValidator>
                    </td>
      </tr>
             
                <tr>
                <td class="esquerdo">
                    nome:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvNome" runat="server" 
                        ControlToValidate="PACPassagemTxtNome" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtNome" runat="server" MaxLength="200" 
                        Width="500px"></asp:TextBox>
                </td>
            </tr>
        
            <tr>
                <td class="esquerdo">
                    rg:</td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtRg" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    data de nascimento:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvDtNascto" runat="server" 
                        ControlToValidate="PACPassagemTxtDtNascto" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtDtNascto" runat="server"></asp:TextBox>
                </td>
      </tr>
            <tr>
                <td class="esquerdo">
                    passaporte:
                    <asp:RequiredFieldValidator ID="rfvPassaporte" runat="server" 
                        ControlToValidate="PAcPassagemTxtPassaporte" Enabled="False" 
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                    </td>
                <td class="direito">
                    <asp:TextBox ID="PAcPassagemTxtPassaporte" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    validade do passaporte:
                    <asp:RequiredFieldValidator ID="rfvValidadePassaporte" runat="server" 
                        ControlToValidate="PACPassagemTxtDtValidadePassaporte" Enabled="False" 
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtDtValidadePassaporte" runat="server"></asp:TextBox>
                </td>
      </tr>
      <tr>
          <td class="esquerdo">
              familiar no Brasil:
              <asp:RequiredFieldValidator ID="rfvFamiliar" runat="server" 
                  ControlToValidate="PACPassagemTxtDtIda" Enabled="False" 
                  ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
          </td>
          <td class="direito">
              <asp:TextBox ID="PACPassagemTxtFamiliar" runat="server" MaxLength="200" 
                  Width="500px"></asp:TextBox>
          </td>
      </tr>
      <tr>
          <td class="esquerdo">
              telefone:
              <asp:RequiredFieldValidator ID="rfvTelefone" runat="server" 
                  ControlToValidate="PACPassagemTxtTelefone" 
                  ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
          </td>
          <td class="direito">
              <asp:TextBox ID="PACPassagemTxtTelefone" runat="server" MaxLength="50" 
                  Width="100px"></asp:TextBox>
          </td>
      </tr>
            <tr>
                <td class="esquerdo">
                    email:
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="PACPassagemTxtEmail" 
                        ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtEmail" runat="server" MaxLength="50" 
                        Width="500px"></asp:TextBox>
                </td>
      </tr>
            <tr>
                <td colspan="2">
                    endereço</td>
            </tr>
            <tr>
                <td class="esquerdo">
                    logradouro:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvLogradouro" runat="server" 
                        ControlToValidate="PACPassagemTxtLogradouro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtLogradouro" runat="server" MaxLength="200" 
                        Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    número:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvNumero" runat="server" 
                        ControlToValidate="PACPassagemTxtNumero" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtNumero" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    bairro:
                    <asp:RequiredFieldValidator ID="PACPassagemRfvBairro" runat="server" 
                        ControlToValidate="PACPassagemTxtBairro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtBairro" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    complemento:</td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtComplemento" runat="server" MaxLength="100" 
                        Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    uf:</td>
                <td class="direito">
                    <asp:DropDownList ID="PACPassagemDllUF" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="PACPassagemDllUF_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    cidade:</td>
                <td class="direito">
                    <asp:DropDownList ID="PACPassagemDllCidade" runat="server" Width="500px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    cep:
                    <asp:MaskedEditValidator ID="PACPassagemMevCep" runat="server" 
                        ControlExtender="PACPassagemMeeCep" ControlToValidate="PACPassagemTxtCep" 
                        Display="Dynamic" EmptyValueMessage="obrigatório" ErrorMessage="inválido" 
                        ForeColor="Red" InvalidValueMessage="inválido" IsValidEmpty="False" 
                        ValidationExpression="\d{5}\-\d{3}"></asp:MaskedEditValidator>
                </td>
                <td class="direito">
                    <asp:TextBox ID="PACPassagemTxtCep" runat="server" MaxLength="9" Width="100px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="PACPassagemMeeCep" runat="server" 
                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                        Mask="99999-999" TargetControlID="PACPassagemTxtCep"></asp:MaskedEditExtender>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Button ID="PACPassageiroBtAdd" runat="server" onclick="PACPassageiroBtAdd_Click" 
                            Text="salvar passageiro" />
                        <asp:Button ID="PACPassageiroBtCancelar" runat="server" CausesValidation="False" 
                            onclick="PACPassageiroBtCancelar_Click" Text="cancelar" />
                    </asp:Panel>
                </td>
            </tr>
            </table>
 </asp:View>
</asp:MultiView>


