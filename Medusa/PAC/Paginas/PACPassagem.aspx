<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="PACPassagem.aspx.cs" Inherits="Medusa.PAC.Paginas.PACPassagem" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h2>
                PACS</h2>
            <div class="pesquisar">
                <asp:TextBox ID="txtProcura" runat="server" MaxLength="50" Width="600px"></asp:TextBox>
                <asp:Button ID="btProcurar" runat="server" CausesValidation="False" 
                    onclick="btProcurar_Click" Text="procurar" />
            </div>
            <asp:Panel ID="panelGrid" runat="server">
                <asp:GridView ID="grid" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_pac" 
                    ForeColor="#333333" GridLines="None" 
                    onpageindexchanging="grid_PageIndexChanging" onrowediting="grid_RowEditing" 
                    onsorting="grid_Sorting" Width="100%" PageSize="20">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id_pac" HeaderText="nº" SortExpression="id_pac">
                        <HeaderStyle HorizontalAlign="Left" Width="50px" />
                        <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="projeto" HeaderText="projeto" 
                            SortExpression="Projeto.CodDef_Projeto" />
                        <asp:BoundField DataField="tipo_aquisicao" HeaderText="tipo de compra" 
                            SortExpression="PACTipoAquisicao.nome" />
                        <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="data" 
                            SortExpression="data">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="modalidade" HeaderText="modalidade" 
                            SortExpression="PACModalidadeCompra.nome" />
                        <asp:BoundField DataField="status" HeaderText="status" />
                        <asp:BoundField DataField="soma" DataFormatString="{0:N2}" 
                            HeaderText="valor total" />
                        <asp:CommandField EditText="" ShowEditButton="True" ButtonType="Image" 
                            EditImageUrl="~/Styles/img/print.gif">
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle Width="50px" />
                        </asp:CommandField>
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
            </asp:Panel>
            <asp:Panel ID="pRelatorio" runat="server" Width="100%" Height="100%">  
          <rsweb:ReportViewer ID="rv" runat="server" Font-Names="Verdana" 
                 Font-Size="8pt" InteractiveDeviceInfos="(Collection)" Visible="False" 
                 WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                 <LocalReport ReportPath="PAC\Relatorios\RPassagem.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
          </asp:Panel>
   
  
      </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
