<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="AlterarSenha.aspx.cs" Inherits="Medusa.Account.AlterarSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="conteudoEsq">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
   </div>
    <div class="conteudoDir">
    <h2>ALTERAR SENHA</h2>
    <p>
        Entre com sua senha atual e&nbsp;cadastre uma nova senha.</p>

         <div>
            <fieldset>
                <legend>Alteração de senha</legend>
                
                <div class="editor-field">
                    <asp:Label ID="lblSenha" runat="server" Text="Senha "></asp:Label>
                </div>
                
                <div class="editor-label">
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="175px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfvSenha" runat="server" 
                    ControlToValidate="txtSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </div>
                <br/>

                <div class="editor-field">
                    <asp:Label ID="Label1" runat="server" Text="Nova Senha "></asp:Label>
                </div>
                
                <div class="editor-label">
                    <asp:TextBox ID="txtNewSenha" runat="server" TextMode="Password" Width="175px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNewSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </div>
                <br/>

                <div class="editor-field">
                    <asp:Label ID="Label2" runat="server" Text="Confirmar nova senha"></asp:Label>
                </div>
                
                <div class="editor-label">
                    <asp:TextBox ID="txtConfirmNewSenha" runat="server" TextMode="Password" 
                        Width="175px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtConfirmNewSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvSenha" runat="server" 
                        ControlToCompare="txtNewSenha" ControlToValidate="txtConfirmNewSenha" 
                        EnableTheming="False" ErrorMessage="as senhas não coincidem" ForeColor="Red"></asp:CompareValidator>
                </div>
                <br/>
               
                <div class="editor-label">
                    <asp:Button ID="btAlterarSenha" runat="server" Text="Salvar" 
                        onclick="btAlterarSenha_Click" />
                    <asp:Label ID="lbLog" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </fieldset>
        </div>
    </div>

</asp:Content>

