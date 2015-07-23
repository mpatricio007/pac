<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="RTotalContratos.aspx.cs" Inherits="Medusa.Bolsa.Paginas.RTotalContratos" %>

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
                                relação de contratos de bolsistas</th>
                           
                        </tr>
                       
        

                        <tr>
                            <td class="esquerdo">
                                data de inicio</td>
                            <td class="direito">
                                de<asp:TextBox ID="txtDataPagtoDe" runat="server"></asp:TextBox>
                                até<asp:TextBox ID="txtDataPagtoAte" runat="server"></asp:TextBox>
                                <asp:Button ID="btGerarRelatorio" runat="server" CausesValidation="False" 
                                    onclick="btGerarRelatorio_Click" Text="gerar relatório" />
                            </td>
                        </tr>

         
                    </table>
        <rsweb:ReportViewer ID="rvPagamentosMes" runat="server" Font-Names="Verdana" 
                 Font-Size="8pt" InteractiveDeviceInfos="(Collection)" Visible="False" 
                 WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
            <LocalReport ReportPath="Bolsa\Relatorios\ReportTotalBolsistas.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>

                    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
