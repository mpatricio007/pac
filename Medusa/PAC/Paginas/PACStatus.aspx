<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true" CodeBehind="PACStatus.aspx.cs" Inherits="Medusa.PAC.Paginas.PACStatus" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
   <asp:ScriptManager ID="ScriptManager1" runat="server">
           </asp:ScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
       <h2>CADASTRO DE STATUS DO PAC</h2>  

   <div class="pesquisar">
        <asp:TextBox ID="txtProcura" runat="server" MaxLength="50" Width="600px"></asp:TextBox>
        <asp:Button ID="btProcurar" runat="server" Text="procurar" 
            CausesValidation="False" onclick="btProcurar_Click" 
              />
        <asp:Button ID="btCriar" runat="server" Text="novo" 
            CausesValidation="False" style="height: 26px" onclick="btCriar_Click" />
    </div>
    <asp:Panel ID="panelGrid" runat="server">
        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
            onrowediting="grid_RowEditing">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="nome">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="descricao" HeaderText="descrição">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="ativo" HeaderText="ativo">
                <HeaderStyle Width="50px" />
                <ItemStyle Width="50px" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="visivel" Text="visivel" />
                <asp:CommandField EditText="selecionar" ShowEditButton="True">
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
        <tr><th colspan="1">cadastro de status do pac</th>
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
                        nome:
                        <asp:RequiredFieldValidator ID="rfvNome" runat="server" 
                            ControlToValidate="txtNome" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                        <asp:Label ID="txtId" runat="server" Text="0" Visible="False"></asp:Label>
                    </td>
                    <td class="direito">
                        <asp:TextBox ID="txtNome" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
                    </td>
                </tr>

                       <tr>
                    <td class="esquerdo">
                        descrição: </td>
                    <td class="direito">
                        <asp:TextBox ID="txtDescricao" runat="server" MaxLength="150" Width="500px"></asp:TextBox>
                    </td>
                </tr>
      <tr>
                    <td class="esquerdo">
                        status:
                     </td>
                    <td class="direito">
                        
                        <asp:CheckBox ID="ckStatus" runat="server" Text="ativo" />
                        
                    </td>
                </tr>         
        <tr>
            <td class="esquerdo">
                visivel:</td>
            <td class="direito">
                <asp:CheckBox ID="ckVisible" runat="server" Text="visivel" />
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
     
</asp:Content>