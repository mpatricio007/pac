<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControleEndereco.ascx.cs" Inherits="Medusa.Controles.ControleEndereco" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
 
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="cad">
            <table class="cadastro">
                <tr>
                    <th colspan="2">
                        endereço</th>
                </tr>
                <tr>
                    <td class="esquerdo">
                        país:</td>
                    <td class="direito">
                        <asp:DropDownList ID="ddlPais" runat="server" AutoPostBack="True" 
                            DataTextField="Nome" DataValueField="Nome" 
                            onselectedindexchanged="ddlPais_SelectedIndexChanged" Width="500px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        CEP:<asp:MaskedEditValidator ID="mevCep" runat="server" 
                            ControlToValidate="txtCep" Display="Dynamic" 
                            EmptyValueMessage="CEP obrigatório" ErrorMessage="CEP inválido" 
                            InvalidValueMessage="CEP inválido" IsValidEmpty="False" 
                            SetFocusOnError="True" ValidationExpression="\d{5}\-\d{3}" 
                            ControlExtender="txtCep_MaskedEditExtender" ForeColor="Red"></asp:MaskedEditValidator>
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtCep" runat="server" AutoCompleteType="HomeZipCode" 
                            MaxLength="9" Width="100px"></asp:TextBox>
                        <asp:MaskedEditExtender ID="txtCep_MaskedEditExtender" runat="server" 
                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            Mask="99999-999" TargetControlID="txtCep">
                        </asp:MaskedEditExtender>
                        <asp:Button ID="btCEP" runat="server" CausesValidation="False" 
                            onclick="btCEP_Click" Text="buscar CEP" />
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        logradouro:
                        <asp:RequiredFieldValidator ID="rfvLogradouro" runat="server" 
                            ControlToValidate="txtLogradouro" ErrorMessage="obrigatório" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtLogradouro" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        nº:
                        <asp:RequiredFieldValidator ID="rfvN" runat="server" ControlToValidate="txtNum" 
                            ErrorMessage="obrigatório" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtNum" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        bairro:
                        <asp:RequiredFieldValidator ID="rfvBairro" runat="server" 
                            ControlToValidate="txtBairro" ErrorMessage="obrigatório" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtBairro" runat="server" MaxLength="30" Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        complemento:
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtComplemento" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        cidade::<asp:RequiredFieldValidator ID="rfvCidade" runat="server" 
                            ControlToValidate="txtCidade" Enabled="False" ErrorMessage="obrigatório" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td class="direito">
                        <asp:DropDownList ID="ddlCidade" runat="server" DataTextField="cidade" 
                            DataValueField="cidade" Width="500px">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtCidade" runat="server" MaxLength="100" Visible="False" 
                            Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        uf:<asp:RequiredFieldValidator ID="rfvUf" runat="server" 
                            ControlToValidate="txtUf" Enabled="False" ErrorMessage="obrigatório" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td class="direito">
                        <asp:DropDownList ID="ddlUf" runat="server" AutoPostBack="True" 
                            DataTextField="uf" DataValueField="uf" 
                            onselectedindexchanged="ddlUf_SelectedIndexChanged" Width="50px">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtUf" runat="server" MaxLength="10" Visible="False" 
                            Width="100px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
    
    

            
   