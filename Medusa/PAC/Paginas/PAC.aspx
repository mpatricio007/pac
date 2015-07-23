<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/SitePAC.master" AutoEventWireup="true" CodeBehind="PAC.aspx.cs" Inherits="Medusa.PAC.Paginas.PAC" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Controles/ControlePACBem.ascx" tagname="ControlePACBem" tagprefix="uc4" %>


<%@ Register src="../Controles/ControlePACServicosPJ.ascx" tagname="ControlePACServicosPJ" tagprefix="uc1" %>


<%@ Register src="../Controles/ControlePACLocacao.ascx" tagname="ControlePACLocacao" tagprefix="uc2" %>


<%@ Register src="../Controles/ControlePACPassagem.ascx" tagname="ControlePACPassagem" tagprefix="uc5" %>


<%@ Register src="../Controles/ControlePACLocacaoVeiculo.ascx" tagname="ControlePACLocacaoVeiculo" tagprefix="uc3" %>


<%@ Register src="../../Controles/ControleCNPJ.ascx" tagname="ControleCNPJ" tagprefix="uc6" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #File1
        {
            width: 400px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuContent" runat="server">
        
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

   <script language="javascript" type="text/javascript">
       function teste(msg) {

           var count = document.getElementById("<%=txtCount.ClientID%>").value;

           if (Page_ClientValidate()) {
               if (count != "0")
                   return confirm(msg);
                else
                    alert("Adicione pelo menos um item!");
           }
           else
               alert("Erros de preenchimento. Verifique!");
              
       }

</script> 

   
      
                <h2>
                    PAC - PEDIDO DE AUTORIZAÇÃO DE COMPRA</h2>
                <p>
                    Caso seja constatado divergências de informações sobre o projeto, favor 
                    solicitar as devidas correções enviando e-mail para
                    <a href="mailto:rosana@fusp.org.br">rosana@fusp.org.br</a>.</p>
    <p>
                    Selecione o projeto e o tipo de compra. Para maiores informações sobre o 
                    preenchimento acesse o <a href="../Manual_do_PAC.pdf" target="_blank">Manual do PAC</a>.</p>
    
                <div class="cad">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
           <table  class="cadastro" >
        <tr><th colspan="1">Informações do Projeto</th>
        <th colspan="1">
            &nbsp;</th></tr>
        <tr>
                    <td class="esquerdo">
                        projeto:
                        <asp:CompareValidator ID="cvProjeto" runat="server" 
                            ControlToValidate="ddlProjeto" ValueToCompare="0" ErrorMessage="selecione" 
                            Operator="NotEqual"></asp:CompareValidator>
                        <asp:Label ID="txtId" runat="server" Text="0" Visible="False"></asp:Label>
                    </td>
                    <td class="direito">
                        <asp:DropDownList ID="ddlProjeto" runat="server" Width="100%" 
                            onselectedindexchanged="ddlProjeto_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        patrocinador(es):</td>
                    <td class="direito">
                        <asp:GridView ID="gridFinanciadores" runat="server" AutoGenerateColumns="False" 
                            EmptyDataText="nenhum financiador cadastrado" Width="100%" 
                            ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Bind("Financiador.Nome_Financiador") %>'></asp:Label>
                                    </ItemTemplate>                                   
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>

                    <tr>
                    <td class="esquerdo">
                        coordenador(es):</td>
                    <td class="direito">
                        
                        
                        
                         <asp:GridView ID="gridCoordenadores" runat="server" AutoGenerateColumns="False" 
                            EmptyDataText="nenhum coordenador cadastrado" Width="100%" 
                             ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Bind("Coordenador.Nome_Coord") %>'></asp:Label>
                                    </ItemTemplate>                                   
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </td>
                </tr>

                     <tr>
                    <td class="esquerdo">
                        unidade:</td>
                    <td class="direito">
                        
                        
                        
                        <asp:Label ID="lbUnidade" runat="server"></asp:Label>
                         </td>
                </tr>     <tr>
                    <td class="esquerdo">
                        departamento/núcleo:</td>
                    <td class="direito">
                        
                        
                        
                        <asp:Label ID="lbDeptoNucleo" runat="server"></asp:Label>
                        
                        
                        
                       </td>
                </tr>  
                   <tr>
                    <td class="esquerdo">
                        laboratório:</td>
                    <td class="direito">
                        
                        
                        
                        <asp:Label ID="lbLaboratorio" runat="server"></asp:Label>
                       </td>
                </tr>
                      <tr>
                    <td class="esquerdo">
                        tipo de compra:</td>
                    <td class="direito">
                        
                        
                        
                        <asp:RadioButtonList ID="rdTipoAquisicao" runat="server" 
                            onselectedindexchanged="rdTipoAquisicao_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:RadioButtonList>
                          </td>
                </tr>
                <tr>
                    <td class="esquerdo">
                        empresa pretendida:</td>
                    <td class="direito">
                        <asp:TextBox ID="txtEmpresa" runat="server" MaxLength="250" Width="500px"></asp:TextBox>
                    </td>
               </tr>
               <tr>
                   <td class="esquerdo">
                       cnpj:</td>
                   <td class="direito">
                       <uc6:ControleCNPJ ID="ControleCNPJ2" runat="server" />
                   </td>
               </tr>
                </table>
                </ContentTemplate>
    </asp:UpdatePanel>
                <table  class="cadastro" >
                 <tr>
                <td colspan="2">cotações de preço</td>
                </tr>
                <tr>
                <td class="esquerdo">
                        cotações: 
                    </td>
                    <td class="direito">
                     <asp:FileUpload ID="fupArquivo" runat="server" Width="400px" />
                                        
                        <asp:Button ID="btnAdicionarCotacao" runat="server" CausesValidation="False" 
                            onclick="btnAdicionar_Click" Text="adicionar" />
                            <asp:UpdatePanel ID="UpdatePanel3"
                                runat="server">
                                <ContentTemplate>
                        <asp:GridView ID="gridCotacoes" runat="server" AutoGenerateColumns="False" 
                            EmptyDataText="nenhuma cotação adicionada" 
                            onselectedindexchanging="gridCotacoes_SelectedIndexChanging" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="arquivo" />
                                <asp:CommandField SelectText="excluir" ShowSelectButton="True">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                        </ContentTemplate>
                            </asp:UpdatePanel>
                        <asp:Label ID="lblMensagemCotacao" runat="server"></asp:Label>
                      
                    </td>
                </tr>       
                </table>        
             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate> 
                <table class="cadastro">
                 <tr>
                <td colspan="2">
                    

                    <asp:MultiView ID="mvTipoCompra" runat="server">
                        <asp:View ID="vBens" runat="server">
                            <uc4:ControlePACBem ID="ControlePACBem1" runat="server" />
                            
                        </asp:View>
                        <asp:View ID="vServicosPJ" runat="server">
                            <uc1:ControlePACServicosPJ ID="ControlePACServicosPJ1" runat="server" />
                        </asp:View>
                        <asp:View ID="vLocacaoBem" runat="server">
                            <uc2:ControlePACLocacao ID="ControlePACLocacao1" runat="server" />
                        </asp:View>
                        <asp:View ID="vPassagem" runat="server">
                           
                            <uc5:ControlePACPassagem ID="ControlePACPassagem1" runat="server" />
                           
                        </asp:View>
                          <asp:View ID="vLocacaoVeiculo" runat="server">
                              <uc3:ControlePACLocacaoVeiculo ID="ControlePACLocacaoVeiculo2" runat="server" />
                           </asp:View>
                      
                    </asp:MultiView>
                   
                    </td>
                </tr>
               
                        <tr>
                       <td colspan="2" align="right">
            <asp:Panel ID="pCadastro" runat="server">
            
                
                <input id="txtCount" type="text" value="0" runat="server" style="display:none" />
            
            <asp:Button ID="BtSalvar" runat="server" onclick="BtSalvar_Click" 
                Text="salvar PAC" onclientclick="return teste('Confirma inclusão ?')" />
            <asp:Button ID="BtCancelar" runat="server" CausesValidation="False" 
                onclick="BtCancelar_Click" Text="cancelar" />
                </asp:Panel>
            </td>
            </tr>
        
      
    </table>
            </ContentTemplate>
    </asp:UpdatePanel>      
                </div>         
   
   
    
</asp:Content>
