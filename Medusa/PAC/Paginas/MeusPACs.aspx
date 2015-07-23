<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/SitePAC.Master" AutoEventWireup="true" CodeBehind="MeusPACs.aspx.cs" Inherits="Medusa.PAC.Paginas.MeusPACs" %>
<%@ Register src="../Controles/ControlePACDetalhe.ascx" tagname="ControlePACDetalhe" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
        
               <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" 
        EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem Text="Novo PAC" Value="Novo PAC" 
                        NavigateUrl="~/PAC/Paginas/PAC.aspx">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/PAC/Paginas/MeusPACs.aspx" Text="Meus PACs" 
                        Value="Meus PACs"></asp:MenuItem>
                </Items>
    </asp:Menu>
         
  </asp:Content>     

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
  
  
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
             
            <h2>MEUS PACS</h2>
               <div class="pesquisar">
                    <asp:TextBox ID="txtProcura" runat="server" MaxLength="50" Width="600px"></asp:TextBox>
                    <asp:Button ID="btProcurar" runat="server" CausesValidation="False" 
                        onclick="btProcurar_Click" Text="procurar" />
                    <asp:Button ID="btNew" runat="server" onclick="btNew_Click" Text="novo" />
                </div>       
                <asp:Panel ID="panelGrid" runat="server">
                    
                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="id_pac" ForeColor="#333333" GridLines="None" 
                        onrowediting="grid_RowEditing" Width="100%" 
                        onpageindexchanging="grid_PageIndexChanging" AllowPaging="True" 
                        AllowSorting="True" onsorting="grid_Sorting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="id_pac" HeaderText="nº" SortExpression="id_pac">
                            <HeaderStyle Width="50px" HorizontalAlign="Left" />
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="projeto" HeaderText="projeto" 
                                SortExpression="Projeto.CodDef_Projeto" />
                            <asp:BoundField DataField="tipo_aquisicao" HeaderText="tipo de compra" 
                                SortExpression="PACTipoAquisicao.nome" />
                            <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="data" 
                                SortExpression="data" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="modalidade" HeaderText="modalidade" 
                                SortExpression="PACModalidadeCompra.nome" />
                            <asp:BoundField DataField="status" HeaderText="status" />
                            <asp:BoundField DataField="soma" DataFormatString="{0:N2}" 
                                HeaderText="valor total" />
                            <asp:CommandField EditText="selecionar" ShowEditButton="True">
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
                <asp:Panel ID="panelCadastro" runat="server">
                <uc1:ControlePACDetalhe ID="ControlePACDetalhe1" runat="server" />    

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    
</asp:Content>
