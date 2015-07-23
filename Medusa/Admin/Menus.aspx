<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true" CodeBehind="Menus.aspx.cs" Inherits="Medusa.Admin.Menus" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="conteudoEsq">
           <asp:ScriptManager ID="ScriptManager1" runat="server">
           </asp:ScriptManager>
           <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" 
            EnableViewState="false" IncludeStyleBlock="false">
        </asp:Menu>
    </div>
   <div class="conteudoDir">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
       <h2>MENUS</h2>
    <asp:Panel ID="panelControle" runat="server" BackColor="Orange" Height="28px" 
        BorderColor="Orange" BorderStyle="Solid">
        <asp:TextBox ID="txtProcura" runat="server" MaxLength="50" Width="600px"></asp:TextBox>
        <asp:Button ID="btProcurar" runat="server" Text="procurar" 
            CausesValidation="False" onclick="btProcurar_Click" 
              />
        <asp:Button ID="btCriar" runat="server" Text="novo" 
            CausesValidation="False" style="height: 26px" onclick="btCriar_Click" />
    </asp:Panel>
    <asp:Panel ID="panelGrid" runat="server">
        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
            onrowediting="grid_RowEditing" AllowPaging="True" AllowSorting="True" 
            onpageindexchanging="grid_PageIndexChanging" onsorting="grid_Sorting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id_menu" HeaderText="id_menu" 
                    SortExpression="id_menu">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="descricao" HeaderText="descrição" 
                    SortExpression="descricao">
                <HeaderStyle HorizontalAlign="Left" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="url" HeaderText="url" SortExpression="url">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="url_default" HeaderText="url_default" 
                    SortExpression="url_default">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:CommandField EditText="selecionar" ShowEditButton="True">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle Width="50px" />
                </asp:CommandField>
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
   </asp:Panel>

    
    <asp:Panel ID="panelCadastro" runat="server">    
    <table  class="cadastro" >
        <tr><th colspan="1">cadastro de menus</th>
        <th colspan="1">
            <asp:Button ID="btInserir" runat="server" Text="inserir" 
                onclick="btInserir_Click" />
            <asp:Button ID="btAlterar" runat="server" 
                Text="salvar" onclick="btAlterar_Click" />
            <asp:Button ID="btExcluir" runat="server" CausesValidation="False" 
                Text="excluir" onclick="btExcluir_Click" />
            <asp:Button ID="btCancelar" runat="server" CausesValidation="False" 
                Text="cancelar" onclick="btCancelar_Click" />
            </th></tr>
   
                <tr>
                    <td class="esquerdo">
                        id_menu:
                        <asp:RequiredFieldValidator ID="rfvId" runat="server" ControlToValidate="txtId" 
                            ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="txtId_FilteredTextBoxExtender" runat="server" 
                            Enabled="True" FilterType="Numbers" TargetControlID="txtId">
                        </asp:FilteredTextBoxExtender>
                    </td>
                </tr>

                       <tr>
                           <td class="esquerdo">
                               nome:
                               <asp:RequiredFieldValidator ID="rfvNome" runat="server" 
                                   ControlToValidate="txtNome" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                           </td>
                           <td class="direito">
                               <asp:TextBox ID="txtNome" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                           </td>
        </tr>

                       <tr>
                    <td class="esquerdo">
                        descrição: 
                        <asp:RequiredFieldValidator ID="rfvDescricao" runat="server" 
                            ControlToValidate="txtDescricao" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                           </td>
                    <td class="direito">
                        <asp:TextBox ID="txtDescricao" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                    </td>
                </tr>
      <tr>
                    <td class="esquerdo">
                        url:
                        <asp:RequiredFieldValidator ID="rfvUrl" runat="server" 
                            ControlToValidate="txtUrl" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                     </td>
                    <td class="direito">
                        
                        <asp:TextBox ID="txtUrl" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                        
                    </td>
                </tr>         
        <tr>
            <td class="esquerdo">
                url default:</td>
            <td class="direito">
                <asp:TextBox ID="txtUrl_Default" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></td>
        </tr>
         <tr><th colspan="2">
            <asp:Button ID="btInserir0" runat="server" 
                style="height: 26px" Text="inserir" onclick="btInserir_Click" />
            <asp:Button ID="btAlterar0" runat="server" 
                Text="salvar" onclick="btAlterar_Click" />
            <asp:Button ID="btExcluir0" runat="server" CausesValidation="False" 
                 Text="excluir" onclick="btExcluir_Click" />
            <asp:Button ID="btCancelar0" runat="server" CausesValidation="False" 
                 Text="cancelar" onclick="btCancelar_Click" />
            </th></tr>
      
    </table>
    </asp:Panel>
    
    
    </ContentTemplate>
       </asp:UpdatePanel>
       </div>
</asp:Content>