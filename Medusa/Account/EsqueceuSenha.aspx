<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="EsqueceuSenha.aspx.cs" Inherits="Medusa.Account.EsqueceuSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="conteudoEsq">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" 
        EnableViewState="false" IncludeStyleBlock="false">
                <Items>
                    <asp:MenuItem Text="Entrar" Value="Entrar" NavigateUrl="~/Account/Login.aspx">
                    </asp:MenuItem>
                </Items>
    </asp:Menu>
   </div>
    <div class="conteudoDir">
    <h2>ESQUECEU SUA SENHA</h2>
    <p>
        Entre com o seu login e email e clique em enviar. Uma nova senha será gerada e enviada 
        para o email cadastrado.</p>
            <div>
            <fieldset>
                <legend>Recuperar Senha</legend>
                
                <div class="editor-label">
                 <asp:Label ID="lbLogin" runat="server" Text="Login"></asp:Label>
                    </div>
                <div class="editor-field">
                    <asp:TextBox ID="txtLogin" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLogin" runat="server" 
                    ControlToValidate="txtLogin" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </div>
                
                
                
                <br/>
               
                <div class="editor-label">
                    <asp:Button ID="btSendSenha" runat="server" Text="enviar" 
                        onclick="btSendSenha_Click" />
                    <asp:Label ID="lbLog" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </fieldset>
        </div>
         
    </div>

</asp:Content>



