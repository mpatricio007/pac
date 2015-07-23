<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlePACBem.ascx.cs" Inherits="Medusa.PAC.Controles.ControlePACBem" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Button ID="btNew" runat="server" onclick="btNew_Click" Text="novo bem" />
<asp:MultiView ID="mvBem" runat="server">
    <asp:View ID="vListar" runat="server">
   




                             <asp:GridView ID="gridBens" runat="server" CellPadding="4" ForeColor="#333333" 
                                 GridLines="None" AutoGenerateColumns="False" 
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
                                        Bem</th>
                                    <th colspan="1">
                                        </th>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        por importação:</td>
                                    <td class="direito">
                                        <asp:RadioButtonList ID="PACBemRdEh_Importacao" runat="server" 
                                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Value="False" Selected="True">não</asp:ListItem>
                                            <asp:ListItem Value="True">sim</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        especificação: 
                                        <asp:RequiredFieldValidator ID="PACBemRfvEspecificacao" runat="server" 
                                            ControlToValidate="PACBemTxtEspecificacao" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtEspecificacao" runat="server" Width="500px" 
                                            MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                        <asp:RequiredFieldValidator ID="PACBemRfvQtdade" runat="server" 
                                            ControlToValidate="PACBemTxtQtdade" ErrorMessage="obrigatório"  ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtQtdade" runat="server" Width="100px" MaxLength="10" onkeyup="formataInteiro(this,event);"></asp:TextBox>
                                    </td>
                                </tr>
             
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                        <asp:RequiredFieldValidator ID="PACBemRfvUnidade" runat="server" 
                                            ControlToValidate="PACBemTxtUnidade" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtUnidade" runat="server" MaxLength="20"  Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                        <asp:RequiredFieldValidator ID="PACBemRfvValorEstimado" runat="server" 
                                            ControlToValidate="PACBemTxtValorEstimado" ErrorMessage="obrigatório" ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtValorEstimado" runat="server" Width="100px" 
                                            MaxLength="18" onkeyup="formataValor(this,event);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                        <asp:RequiredFieldValidator ID="PACBemRfvMeta" runat="server" 
                                            ControlToValidate="PACBemTxtMetaEtapa" ErrorMessage="obrigatório" 
                                            Enabled="False" ></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtMetaEtapa" runat="server" Width="100px" 
                                            MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
        <td class="esquerdo">
            rubrica/item:
            <asp:RequiredFieldValidator ID="PACBemRfvRubrica" runat="server" 
                ControlToValidate="PACBemTxtRubricaItem" Enabled="False" 
                ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtRubricaItem" runat="server" MaxLength="30" 
                                            Width="100px"></asp:TextBox>
                                    </td>
        </tr>      
                                <tr>
                                    <td class="esquerdo" >
                                        endereço de entrega</td>
                                    <td class="direito" >
                                        <asp:Label ID="lbEndereco" runat="server" 
                                            Text="é o mesmo endereço do item anterior?" Visible="False"></asp:Label>
                                        <asp:RadioButtonList ID="rdCopiarEndereco" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="rdCopiarEndereco_SelectedIndexChanged" 
                                            RepeatDirection="Horizontal" RepeatLayout="Flow" Visible="False">
                                            <asp:ListItem Selected="True" Value="False">não</asp:ListItem>
                                            <asp:ListItem Value="True">sim</asp:ListItem>
                                        </asp:RadioButtonList>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        logradouro:
                                        <asp:RequiredFieldValidator ID="PACBemRfvLogradouro" runat="server" 
                                            ControlToValidate="PACBemTxtLogradouro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtLogradouro" runat="server" MaxLength="200" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        número:
                                        <asp:RequiredFieldValidator ID="PACBemRfvNumero" runat="server" 
                                            ControlToValidate="PACBemTxtNumero" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtNumero" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        bairro:
                                        <asp:RequiredFieldValidator ID="PACBemRfvBairro" runat="server" 
                                            ControlToValidate="PACBemTxtBairro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtBairro" runat="server" MaxLength="50" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        complemento:</td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtComplemento" runat="server" MaxLength="100" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        uf:</td>
                                    <td class="direito">
                                        <asp:DropDownList ID="PACBemDllUF" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="PACBemDllUF_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        cidade:</td>
                                    <td class="direito">
                                        <asp:DropDownList ID="PACBemDllCidade" runat="server" Width="500px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
        <td class="esquerdo">
            cep:
            <asp:MaskedEditValidator ID="PACBemMevCep" runat="server" 
                ControlExtender="PACBemMeeCep" ControlToValidate="PACBemTxtCep" 
                Display="Dynamic" EmptyValueMessage="obrigatório" ErrorMessage="inválido" 
                ForeColor="Red" InvalidValueMessage="inválido" IsValidEmpty="False" 
                ValidationExpression="\d{5}\-\d{3}"></asp:MaskedEditValidator>
            
            </td>
                                    <td class="direito">
                                        <asp:TextBox ID="PACBemTxtCep" runat="server" MaxLength="9" Width="100px"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="PACBemMeeCep" runat="server" 
                                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                            Mask="99999-999" TargetControlID="PACBemTxtCep">
                                            

                                        </asp:MaskedEditExtender>
                                    </td>
        </tr>      
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Panel ID="pCadastro" runat="server">
                                            <asp:Button ID="PACBemBtAdd" runat="server" onclick="PACBemBtAdd_Click" 
                                                Text="salvar bem" />
                                            <asp:Button ID="PACBemBtCancelar" runat="server" CausesValidation="False" 
                                                onclick="PACBemBtCancelar_Click" Text="cancelar" />
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
   </asp:View>
</asp:MultiView>
                        