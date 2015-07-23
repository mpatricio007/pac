<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="Fechamento.aspx.cs" Inherits="Medusa.Bolsa.Paginas.Fechamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table class="cadastro">
                        <tr>
                            <th colspan="2">
                                fechamento folha de bolsistas</th>
                           
                        </tr>
                       
        

        <tr>
            <td class="esquerdo">
                mês/ano:
                </td>
            <td class="direito">
                <asp:TextBox ID="txtMes" runat="server" MaxLength="2" Width="30px" onkeyup="formataInteiro(this,event);"></asp:TextBox>
                /<asp:TextBox ID="txtAno" runat="server" MaxLength="4" Width="50px" onkeyup="formataInteiro(this,event);"></asp:TextBox>
            </td>
        </tr>

         
         <tr>
    <td class="esquerdo">data de pagamento: </td>
                    <td class="direito"><asp:TextBox runat="server" MaxLength="10" ID="txtDtPagto"></asp:TextBox>
                        <asp:Button ID="btFecharFolha" runat="server" onclick="btFecharFolha_Click" 
                            Text="fechar folha" />
</td>
                    </tr>
         <tr><td colspan="2"><asp:Label ID="lblMsg" runat="server"></asp:Label></td></tr>
                    </table>
                    </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>
