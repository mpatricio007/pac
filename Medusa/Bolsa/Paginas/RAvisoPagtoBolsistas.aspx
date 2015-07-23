<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="RAvisoPagtoBolsistas.aspx.cs" Inherits="Medusa.Bolsa.Paginas.RAvisoPagtoBolsistas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register src="../../Controles/ControleCPF.ascx" tagname="ControleCPF" tagprefix="uc1" %>

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
                                relatório de aviso de pagamento de bolsistas</th>
                           
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
                                projeto:</td>
                            <td class="direito">
                                <asp:TextBox ID="txtProjeto" runat="server"></asp:TextBox>
                            </td>
                        </tr>

         
                        <tr>
                            <td class="esquerdo">
                                CPF:</td>
                            <td class="direito">
                                <uc1:ControleCPF ID="ControleCPF1" runat="server" EnableValidator="false" />
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
                            <th colspan="2">
                                <asp:Button ID="btGerarRelatorio" runat="server" CausesValidation="False" 
                                    onclick="btGerarRelatorio_Click" Text="gerar relatório" />
                            </th>
                        </tr>

         
                    </table>
        <rsweb:ReportViewer ID="rvPagamentosMes" runat="server" Font-Names="Verdana" 
                 Font-Size="8pt" InteractiveDeviceInfos="(Collection)" Visible="False" 
                 WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
            <LocalReport ReportPath="Bolsa\Relatorios\ReportAvisoPagtoBolsistas.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>

                    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
