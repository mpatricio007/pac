<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="HistoricoBancario.aspx.cs" Inherits="Medusa.SCB.Paginas.HistoricoBancario" %>
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
                histórico do banco</th>
            <th colspan="1">
                &nbsp;</th>
        </tr>
        <tr>
            <td class="esquerdo" style="height: 30px">
                codigo: 
            </td>
            <td class="direito" style="height: 30px">
                <asp:TextBox ID="TxtCodigo" runat="server" MaxLength="100" Width="46px"></asp:TextBox>
            </td>
        </tr>
            <tr>
                <td class="esquerdo">
                    descrição:</td>
                <td class="direito">
                    <asp:TextBox ID="TxtDescricao" runat="server" MaxLength="25" 
                        Width="200px"></asp:TextBox>
                </td>
            </tr>

           <tr>
               <td class="esquerdo">
                   categoria do lançamento</td>
               <td class="direito">
                   <asp:DropDownList ID="ddlCategoriaLcto" runat="server" Height="29px" 
                       Width="233px">
                   </asp:DropDownList>
               </td>
        </tr>

           <tr>

               <th colspan="1">
                   Usuários que são avisados deste histórico</th>
               <th colspan="1">
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                       CellPadding="4" ForeColor="#333333" GridLines="None" Width="625px">
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       <Columns>
                           <asp:CommandField ShowSelectButton="True" />
                           <asp:BoundField HeaderText="Setor" />
                           <asp:BoundField HeaderText="Nome" />
                           <asp:CommandField ShowDeleteButton="True" />
                       </Columns>
                       <EditRowStyle BackColor="#999999" />
                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                       <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                       <SortedAscendingCellStyle BackColor="#E9E7E2" />
                       <SortedAscendingHeaderStyle BackColor="#506C8C" />
                       <SortedDescendingCellStyle BackColor="#FFFDF8" />
                       <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                   </asp:GridView>
               </th>
               </tr>
        <tr>
            <td align="right" colspan="2">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:Button ID="Button1" runat="server" onclick="BtAdd_Click" Text="adicionar" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        onclick="BtCancelar_Click" Text="cancelar" />
                </asp:Panel>
            </td>
        </tr>


    </table>

 </asp:Panel>
</div>

</asp:Content>
