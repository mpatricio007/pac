<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="CategoriaLcto.aspx.cs" Inherits="Medusa.SCB.Paginas.CategoriaLcto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Panel ID="panelGrid" runat="server">
        </asp:Panel>
        <asp:Panel ID="panelCadastro" runat="server">
            <table class="cadastro">
                <tr>
                    <th colspan="1">
                        categoria lançamento</th>
                    <th colspan="1">
                        &nbsp;</th>
                </tr>
                <tr>
                    <td class="esquerdo" style="height: 30px">
                        codigo:
                    </td>
                    <td class="direito" style="height: 30px">
                        <asp:TextBox ID="TxtCodigo" runat="server" MaxLength="3" Width="46px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        descrição:</td>
                    <td class="direito">
                        <asp:TextBox ID="TxtDescricao" runat="server" MaxLength="40" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        tipo (débito ou crédito)</td>
                    <td class="direito">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="D">Débito</asp:ListItem>
                            <asp:ListItem Value="C">Crédito</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:Button ID="Button1" runat="server" onclick="BtAdd_Click" 
                                Text="adicionar" />
                            <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                onclick="BtCancelar_Click" Text="cancelar" />
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
