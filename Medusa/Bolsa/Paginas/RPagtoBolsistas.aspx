<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="RelatorioPagtoBolsistas.aspx.cs" Inherits="Medusa.Bolsa.Paginas.RelatorioPagtoBolsistas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
                            <th colspan="2" class="style1">
                                relatório de pagamento de bolsistas</th>
                           
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
                            <td class="esquerdo">
                                pagos:</td>
                            <td class="direito">
                                <asp:RadioButtonList ID="rdPago" runat="server" RepeatDirection="Horizontal" 
                                    RepeatLayout="Flow">
                                    <asp:ListItem Selected="True" Value="False">não</asp:ListItem>
                                    <asp:ListItem Value="True">sim</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>

         
                        <tr>
                            <td class="esquerdo">
                                data de pagamento:</td>
                            <td class="direito">
                                de<asp:TextBox ID="txtDataPagtoDe" runat="server"></asp:TextBox>
                                até<asp:TextBox ID="txtDataPagtoAte" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="esquerdo">
                                cpf:</td>
                            <td class="direito">
                                               <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
                 
                            </td>
                        </tr>
                        <tr>
                            <td class="esquerdo">
                                projeto:</td>
                            <td class="direito">
                                <asp:TextBox ID="txtProjeto" runat="server"></asp:TextBox>
                                <asp:Button ID="btGerarRelatorio" runat="server" CausesValidation="False" 
                                    onclick="btGerarRelatorio_Click" Text="gerar relatório" />
                            </td>
                        </tr>
                  
               
         
                    </table>
        <rsweb:ReportViewer ID="rvPagamentosMes" runat="server" Font-Names="Verdana" 
                 Font-Size="8pt" InteractiveDeviceInfos="(Collection)" Visible="False" 
                 WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
            <LocalReport ReportPath="Bolsa\Relatorios\ReportPagoBolsistas.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>

                    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
