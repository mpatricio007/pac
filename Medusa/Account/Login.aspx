<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Medusa.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="conteudoEsq">
    <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" 
        EnableViewState="false" IncludeStyleBlock="false">
                <Items>
                    <asp:MenuItem Text="Entrar" Value="Entrar" NavigateUrl="~/Account/Login.aspx">
                    </asp:MenuItem>
                </Items>
    </asp:Menu>
    </div>
    <div class="conteudoDir">
    <h2>ENTRAR</h2>  

         <div>
            <fieldset>
                <legend>Login</legend>
                
                <div class="editor-label">
                 <asp:Label ID="lbLogin" runat="server" Text="Login"></asp:Label>
                    </div>
                <div class="editor-field">
                    <asp:TextBox ID="txtLogin" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLogin" runat="server" 
                    ControlToValidate="txtLogin" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </div>
                 <div class="editor-field">
                    <asp:Label ID="lblSenha" runat="server" Text="Senha "></asp:Label>
                </div>
                
                <div class="editor-label">
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="150px" 
                        MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSenha" runat="server" 
                    ControlToValidate="txtSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </div>
                <br/>
               
                <div class="editor-label">
                    <asp:Button ID="btLogin" runat="server" Text="entrar" CommandName="Login" 
                        onclick="btLogin_Click" />&nbsp;
                    <asp:Button ID="btEsqueceuSenha" runat="server" Text="esqueceu sua senha" 
                        PostBackUrl="~/Account/EsqueceuSenha.aspx" 
                        onclick="btEsqueceuSenha_Click" CausesValidation="False" />
                    <asp:Label ID="lbLog" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </fieldset>
        </div>
    </div>

</asp:Content>
