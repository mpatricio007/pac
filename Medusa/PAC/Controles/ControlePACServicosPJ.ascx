<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlePACServicosPJ.ascx.cs" Inherits="Medusa.PAC.Controles.ControlePACServicosPJ" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Button ID="btNew" runat="server" onclick="btNew_Click" 
    Text="novo serviços pj" />
<asp:MultiView ID="mvServicosPJ" runat="server">
    <asp:View ID="vListar" runat="server">
   




                             <asp:GridView ID="gridServicosPJ" runat="server" CellPadding="4" ForeColor="#333333" 
                                 GridLines="None" AutoGenerateColumns="False" 
                                 onrowdeleting="gridServicosPJ_RowDeleting" Width="100%">
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
                                        Serviços PJ</th>
                                    <th colspan="1">
                                        </th>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        com contrato:</td>
                                    <td class="direito">
                                        <asp:RadioButtonList ID="PACServicosPJRdContrato" runat="server" 
                                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Value="False" Selected="True">não</asp:ListItem>
                                            <asp:ListItem Value="True">sim</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        aditamento:&nbsp;</td>
                                    <td class="direito">
                                        <asp:RadioButtonList ID="PACServicosPJRdAditamento" runat="server" 
                                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" Value="False">não</asp:ListItem>
                                            <asp:ListItem Value="True">sim</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        prazo:<asp:RequiredFieldValidator ID="PACServicosPJRfvPrazo" runat="server" 
                                            ControlToValidate="PACServicosPJTxtPrazo" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtPrazo" runat="server" MaxLength="10" 
                                            onkeyup="formataInteiro(this,event);" Width="100px"></asp:TextBox>
                                        &nbsp;dias</td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        especificação: 
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvEspecificacao" runat="server" 
                                            ControlToValidate="PACServicosPJTxtEspecificacao" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtEspecificacao" runat="server" Width="500px" 
                                            MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvQtdade" runat="server" 
                                            ControlToValidate="PACServicosPJTxtQtdade" ErrorMessage="obrigatório"  ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtQtdade" runat="server" Width="100px" MaxLength="10" onkeyup="formataInteiro(this,event);"></asp:TextBox>
                                    </td>
                                </tr>
             
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvUnidade" runat="server" 
                                            ControlToValidate="PACServicosPJTxtUnidade" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtUnidade" runat="server" MaxLength="20"  Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvValorEstimado" runat="server" 
                                            ControlToValidate="PACServicosPJTxtValorEstimado" ErrorMessage="obrigatório" ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtValorEstimado" runat="server" Width="100px" 
                                            MaxLength="18" onkeyup="formataValor(this,event);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvMeta" runat="server" 
                                            ControlToValidate="PACServicosPJTxtMetaEtapa" ErrorMessage="obrigatório" 
                                            Enabled="False" ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtMetaEtapa" runat="server" Width="100px" 
                                            MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
        <td class="esquerdo">
            rubrica/item:
            <asp:RequiredFieldValidator ID="PACServicosPJRfvRubrica" runat="server" 
                ControlToValidate="PACServicosPJTxtRubricaItem" Enabled="False" 
                ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtRubricaItem" runat="server" MaxLength="30" 
                                            Width="100px"></asp:TextBox>
                                    </td>
        </tr>      
                                <tr>
                                    <td colspan="2">
                                        endereço de prestação de serviço</td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        logradouro:
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvLogradouro" runat="server" 
                                            ControlToValidate="PACServicosPJTxtLogradouro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtLogradouro" runat="server" MaxLength="200" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        número:
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvNumero" runat="server" 
                                            ControlToValidate="PACServicosPJTxtNumero" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtNumero" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        bairro:
                                        <asp:RequiredFieldValidator ID="PACServicosPJRfvBairro" runat="server" 
                                            ControlToValidate="PACServicosPJTxtBairro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtBairro" runat="server" MaxLength="50" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        complemento:</td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtComplemento" runat="server" MaxLength="100" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        uf:</td>
                                    <td class="direito">
                                        <asp:DropDownList ID="PACServicosPJDllUF" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="PACServicosPJDllUF_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        cidade:</td>
                                    <td class="direito">
                                        <asp:DropDownList ID="PACServicosPJDllCidade" runat="server" Width="500px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
        <td class="esquerdo">
            cep:
            <asp:MaskedEditValidator ID="PACServicosPJMevCep" runat="server" 
                ControlExtender="PACServicosPJMeeCep" ControlToValidate="PACServicosPJTxtCep" 
                Display="Dynamic" EmptyValueMessage="obrigatório" ErrorMessage="inválido" 
                ForeColor="Red" InvalidValueMessage="inválido" IsValidEmpty="False" 
                ValidationExpression="\d{5}\-\d{3}"></asp:MaskedEditValidator>
            
            </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACServicosPJTxtCep" runat="server" MaxLength="9" Width="100px"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="PACServicosPJMeeCep" runat="server" 
                                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                            Mask="99999-999" TargetControlID="PACServicosPJTxtCep">
                                        </asp:MaskedEditExtender>
                                    </td>
        </tr>      
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Panel ID="pCadastro" runat="server">
                                            <asp:Button ID="PACServicosPJBtAdd" runat="server" onclick="PACServicosPJBtAdd_Click" 
                                                Text="salvar serviços pj" />
                                            <asp:Button ID="PACServicosPJBtCancelar" runat="server" CausesValidation="False" 
                                                onclick="PACServicosPJBtCancelar_Click" Text="cancelar" />
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
   </asp:View>
</asp:MultiView>
                        