<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Medusa.Admin.Usuarios" %>

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
       <h2>USUÁRIOS</h2>
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
                <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" 
                    SortExpression="id_usuario">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="login" HeaderText="login" 
                    SortExpression="login">
                <HeaderStyle HorizontalAlign="Left" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="email" SortExpression="email">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("email", "mailto:{0}") %>'
                            Text='<%# Eval("email") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
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
                login:
                <asp:RequiredFieldValidator ID="rfvLogin" runat="server" 
                    ControlToValidate="txtLogin" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
            </td>
            <td class="direito">
                <asp:TextBox ID="txtLogin" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="esquerdo">
                email:
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="reEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="inválido" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            <td class="direito">
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="esquerdo">
                ramal:
                <asp:RequiredFieldValidator ID="rfvRamal" runat="server" 
                    ControlToValidate="txtRamal" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
            </td>
            <td class="direito">
                <asp:TextBox ID="txtRamal" runat="server" MaxLength="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="esquerdo">
                data de nascimento:
                <asp:RequiredFieldValidator ID="rfvDtNascto" runat="server" 
                    ControlToValidate="txtDtNascto" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
            </td>
            <td class="direito">
                <asp:TextBox ID="txtDtNascto" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="esquerdo">
                senha:
                <asp:RequiredFieldValidator ID="rfvSenha" runat="server" 
                    ControlToValidate="txtSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
            </td>
            <td class="direito">
                <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="esquerdo">
                confirmar senha:
                <asp:RequiredFieldValidator ID="rfvSenha2" runat="server" 
                    ControlToValidate="txtSenha2" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
            </td>
            <td class="direito">
                <asp:TextBox ID="txtSenha2" runat="server" TextMode="Password"></asp:TextBox>
                &nbsp;<asp:CompareValidator ID="cvSenha" runat="server" ControlToCompare="txtSenha" 
                    ControlToValidate="txtSenha2" ErrorMessage="as senhas não coincidem"></asp:CompareValidator>
            </td>
        </tr>

             
        <tr>
            <td class="esquerdo">
                grupos:</td>
            <td class="direito">
                <asp:CheckBoxList ID="ckGrupos" runat="server">
                </asp:CheckBoxList>
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