<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="Bolsistas.aspx.cs" Inherits="Medusa.Bolsa.Paginas.Bolsistas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="../../Controles/ControleCPF.ascx" tagname="ControleCPF" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
  
    <ContentTemplate>
    <asp:TabContainer ID="Tabs" runat="server" ActiveTabIndex="2" 
        onactivetabchanged="Tabs_ActiveTabChanged" AutoPostBack="True">
     <asp:TabPanel runat="server" HeaderText="pesquisa" ID="tbPesquisa">
         <HeaderTemplate>
             pesquisa
         </HeaderTemplate>
         <ContentTemplate><div class="pesquisar"><asp:Label ID="Label1" runat="server" Text="procurar"></asp:Label>&nbsp;<asp:TextBox ID="txtProcura" runat="server" Width="500px"></asp:TextBox>&nbsp;&nbsp;&nbsp; <asp:Button ID="btSearch" runat="server" 
                Text="Procurar" onclick="btProcurar_Click" CausesValidation="False" /><asp:Button ID="btCriar" runat="server" Text="novo" CausesValidation="False" 
                    onclick="btCriar_Click" style="height: 26px" /></div><asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" Caption="Lista de Bolsistas" CellPadding="4" 
                        CssClass="tableView" ForeColor="#333333" GridLines="None" 
                        onpageindexchanging="grid_PageIndexChanging" onrowediting="grid_RowEditing" 
                        Width="100%" onsorting="grid_Sorting" onrowcreated="grid_RowCreated"><AlternatingRowStyle BackColor="White" ForeColor="#284775" /><Columns><asp:BoundField DataField="cpf" HeaderText="cpf" SortExpression="cpf"></asp:BoundField><asp:BoundField DataField="Nome" HeaderText="nome" 
                                SortExpression="Nome"><HeaderStyle HorizontalAlign="Left" /><ItemStyle HorizontalAlign="Left" /></asp:BoundField><asp:BoundField DataField="rg" HeaderText="rg" SortExpression="rg" /><asp:BoundField DataField="dtNascto" DataFormatString="{0:d}" 
                                HeaderText="data de nascimento" SortExpression="dtNascto" /><asp:TemplateField HeaderText="email" SortExpression="email"><ItemTemplate><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("email", "mailto:{0}") %>'
                            Text='<%# Eval("email") %>'></asp:HyperLink></ItemTemplate><HeaderStyle HorizontalAlign="Left" /></asp:TemplateField><asp:CommandField EditText="selecionar" ShowEditButton="True"><HeaderStyle HorizontalAlign="Right" /><ItemStyle HorizontalAlign="Right" /></asp:CommandField></Columns><EditRowStyle BackColor="#999999" /><FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" /><HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" /><RowStyle BackColor="#F7F6F3" ForeColor="#333333" /><SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" /><SortedAscendingCellStyle BackColor="#E9E7E2" 
                            CssClass="SortedAscendingCellStyle" /><SortedAscendingHeaderStyle BackColor="#506C8C" 
                            CssClass="SortedAscendingHeaderStyle" /><SortedDescendingCellStyle BackColor="#FFFDF8" 
                            CssClass="SortedDescendingCellStyle" /><SortedDescendingHeaderStyle BackColor="#6F8DAE" 
                            CssClass="SortedDescendingHeaderStyle " /></asp:GridView></ContentTemplate></asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="cadastros" ID="tbCadastro"><ContentTemplate><table class="cadastro"> <tr><th 
                    colspan="1">cadastro de bolsistas</th><th 
                colspan="1"><asp:Button ID="btInserir" runat="server" OnClick="btInserir_Click" 
                    Text="inserir"></asp:Button><asp:Button ID="btAlterar" runat="server" 
                    OnClick="btAlterar_Click" Text="salvar"></asp:Button><asp:Button 
                    ID="btExcluir" runat="server" CausesValidation="False" 
                    OnClick="btExcluir_Click" Text="excluir"></asp:Button><asp:Button 
                    ID="btCancelar" runat="server" CausesValidation="False" 
                    OnClick="btCancelar_Click" Text="cancelar"></asp:Button></th></tr><tr><td class="esquerdo">nome: <asp:RequiredFieldValidator 
                ID="rfvNome" runat="server" ControlToValidate="txtNome" 
                ErrorMessage="obrigatório"></asp:RequiredFieldValidator><asp:Label 
                ID="txtCodigo" runat="server" Text="0" Visible="False"></asp:Label></td><td class="direito"><asp:TextBox 
                    ID="txtNome" runat="server" MaxLength="50" Width="500px"></asp:TextBox></td></tr>
                   
                    <tr><th colspan="1">dados bancários</th><th 
                colspan="1"></th></tr>
                        <tr><td class="esquerdo">cpf: </td><td                 class="esquerdo"><uc1:ControleCPF ID="ControleCPF1" 
                        runat="server"></uc1:ControleCPF></td></tr>
                       
                        <tr><td                 class="esquerdo">rg: <asp:RequiredFieldValidator ID="rfvRG" runat="server" 
                ControlToValidate="TxtRG" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td 
                class="direito"><asp:TextBox ID="TxtRG" runat="server" MaxLength="20" 
                    Width="100px"></asp:TextBox></td></tr><tr><td class="esquerdo">data de nascimento: <asp:RequiredFieldValidator ID="rfvDtNascto" runat="server" 
                    ControlToValidate="txtDtNascto" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td class="direito"><asp:TextBox ID="txtDtNascto" runat="server" MaxLength="10"></asp:TextBox></td></tr><tr><td class="esquerdo">banco: <asp:RequiredFieldValidator ID="rfvBanco" runat="server" 
                    ControlToValidate="txtBanco" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td class="direito"><asp:TextBox ID="txtBanco" runat="server" Width="54px" MaxLength="3"></asp:TextBox></td></tr><tr><td class="esquerdo">agência: <asp:RequiredFieldValidator ID="rfvAgencia" runat="server" 
                    ControlToValidate="txtAgencia" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td class="direito"><asp:TextBox ID="txtAgencia" runat="server" MaxLength="20" Width="91px"></asp:TextBox></td></tr><tr><td class="esquerdo">conta: <asp:RequiredFieldValidator ID="rfvConta" runat="server" 
                    ControlToValidate="txtConta" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td class="direito"><asp:TextBox ID="txtConta" runat="server" MaxLength="20" Width="115px"></asp:TextBox></td></tr><tr><th>endereço</th><th></th></tr><tr><td 
                class="esquerdo">logradouro: <asp:RequiredFieldValidator ID="rfvLogradouro" 
                runat="server" ControlToValidate="TxtLogradouro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td 
                class="direito"><asp:TextBox ID="TxtLogradouro" runat="server" MaxLength="200" 
                    Width="500px"></asp:TextBox></td></tr><tr><td class="esquerdo">número: <asp:RequiredFieldValidator ID="rfvNumero" runat="server" 
                        ControlToValidate="TxtNumero" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td class="direito"><asp:TextBox ID="TxtNumero" runat="server" MaxLength="20" Width="100px"></asp:TextBox></td></tr><tr><td class="esquerdo">bairro: <asp:RequiredFieldValidator ID="rfvBairro" runat="server" 
                        ControlToValidate="TxtBairro" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td class="direito"><asp:TextBox ID="TxtBairro" runat="server" MaxLength="50" Width="500px"></asp:TextBox></td></tr><tr><td class="esquerdo">complemento: </td><td class="direito"><asp:TextBox ID="TxtComplemento" runat="server" MaxLength="100" 
                        Width="500px"></asp:TextBox></td></tr><tr><td class="esquerdo">uf:</td><td class="direito"><asp:DropDownList 
                    ID="DllUF" runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="DllUF_SelectedIndexChanged"></asp:DropDownList></td></tr><tr><td class="esquerdo">cidade:</td><td class="direito"><asp:DropDownList ID="DllCidade" runat="server" Width="500px"></asp:DropDownList></td></tr><tr><td class="esquerdo">cep: <asp:RequiredFieldValidator ID="rfvCep" runat="server" 
                ControlToValidate="TxtCep" ErrorMessage="obrigatório"></asp:RequiredFieldValidator></td><td class="direito"><asp:TextBox ID="TxtCep" runat="server" MaxLength="9" Width="100px" onkeyup="formataCEP(this,event);"></asp:TextBox></td></tr><tr><td class="esquerdo">telefones:</td><td class="direito">residencial <asp:TextBox ID="TxtTelefone" runat="server" MaxLength="100" 
                        Width="130px" onkeyup="formataTelefone(this,event);"></asp:TextBox>celular <asp:TextBox ID="TxtCelular" runat="server" MaxLength="100" 
                        Width="130px" onkeyup="formataTelefone(this,event);"></asp:TextBox></td></tr><tr><td class="esquerdo">email: <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="obrigatório" Enabled="False"></asp:RequiredFieldValidator>&nbsp;<asp:RegularExpressionValidator ID="reEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="inválido" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td><td class="direito"><asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="500px"></asp:TextBox></td></tr><tr><td colspan="2"><asp:Label ID="lblMsg" runat="server"></asp:Label></td></tr><tr><th 
                colspan="2"><asp:Button ID="btInserir0" runat="server" 
                OnClick="btInserir_Click" style="height: 26px" Text="inserir"></asp:Button><asp:Button 
                ID="btAlterar0" runat="server" OnClick="btAlterar_Click" Text="salvar"></asp:Button><asp:Button 
                ID="btExcluir0" runat="server" CausesValidation="False" 
                OnClick="btExcluir_Click" Text="excluir"></asp:Button><asp:Button 
                ID="btCancelar0" runat="server" CausesValidation="False" 
                OnClick="btCancelar_Click" Text="cancelar"></asp:Button></th></tr></table></ContentTemplate></asp:TabPanel>
         <asp:TabPanel runat="server" HeaderText="contratos" ID="tbContratos"><ContentTemplate><table class="cadastro"><tr><th colspan="1">identificação do bolsistas</th><th colspan="1">&nbsp;</th></tr><tr><td class="esquerdo" style="height: 30px">nome: </td><td class="direito" style="height: 30px"><asp:Label ID="lbBolsista" runat="server"></asp:Label></td></tr><tr><td class="esquerdo">CPF:</td><td class="direito"><asp:Label ID="lbCPF" runat="server"></asp:Label></td></tr><tr><th colspan="1">contratos</th><th colspan="1"><asp:GridView ID="gridContratos" runat="server" AutoGenerateColumns="False" 
                       CellPadding="4" ForeColor="#333333" GridLines="None" Width="625px" 
                       onselectedindexchanging="gridContratos_SelectedIndexChanging" 
                       onrowediting="gridContratos_RowEditing"><AlternatingRowStyle BackColor="White" ForeColor="#284775" /><Columns><asp:TemplateField HeaderText="projeto"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" 
                                       Text='<%# Bind("projeto.CodDef_Projeto") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" 
                                       Text='<%# Bind("projeto.CodDef_Projeto") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="tipo bolsa"><EditItemTemplate><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bolsa.Nome") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("Bolsa.Nome") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="tipo contrato"><EditItemTemplate><asp:TextBox ID="TextBox3" runat="server" 
                                       Text='<%# Bind("TipoDocumento.Nome") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Bind("TipoDocumento.Nome") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:BoundField HeaderText="início" DataField="inicio_contrato" 
                               DataFormatString="{0:d}" /><asp:BoundField HeaderText="término" DataField="termino_contrato" 
                               DataFormatString="{0:d}" /><asp:CommandField SelectText="selecione" ShowSelectButton="True" /><asp:CommandField EditText="pagamentos" ShowEditButton="True" /></Columns><EditRowStyle BackColor="#999999" /><FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" /><HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" /><RowStyle BackColor="#F7F6F3" ForeColor="#333333" /><SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" /><SortedAscendingCellStyle BackColor="#E9E7E2" /><SortedAscendingHeaderStyle BackColor="#506C8C" /><SortedDescendingCellStyle BackColor="#FFFDF8" /><SortedDescendingHeaderStyle BackColor="#6F8DAE" /></asp:GridView></th></tr><tr><th  class="esquerdo" colspan="1">detalhe do contrato</th><th  class="direito" colspan="1"><asp:Button ID="btInserirContrato" runat="server" onclick="btInserirContrato_Click" 
                                    Text="inserir" ValidationGroup="contratos" /><asp:Button ID="btAlterarContrato" runat="server" onclick="btAlterarContrato_Click" 
                                    Text="salvar" ValidationGroup="contratos" /><asp:Button ID="btExcluirContrato" runat="server" CausesValidation="False" 
                                    onclick="btExcluirContrato_Click" Text="excluir" 
                                    ValidationGroup="contratos" /><asp:Button ID="btCancelarContrato" runat="server" CausesValidation="False" 
                                    onclick="btCancelarContrato_Click" Text="cancelar" /></th></th></tr><tr ><td class="esquerdo" style="height: 30px">projeto: <asp:CompareValidator ID="cvProjeto" runat="server" 
                    ControlToValidate="ddlProjeto" ErrorMessage="selecione" Operator="NotEqual" 
                    ValueToCompare="0" ValidationGroup="contratos"></asp:CompareValidator></td><td class="direito" style="height: 30px"><asp:DropDownList ID="ddlProjeto" runat="server" Height="16px" Width="438px"></asp:DropDownList><asp:Label ID="txtId_contrato" runat="server" Text="0" Visible="False"></asp:Label></td></tr><tr><td class="esquerdo" style="height: 30px">tipo contrato: <asp:CompareValidator ID="cvTipoDocumento" runat="server" 
                        ControlToValidate="ddlTipoContrato" ErrorMessage="selecione" 
                        Operator="NotEqual" ValueToCompare="0" ValidationGroup="contratos"></asp:CompareValidator></td><td class="direito" style="height: 30px"><asp:DropDownList ID="ddlTipoContrato" runat="server" Height="16px" 
                        Width="438px"></asp:DropDownList></td></tr><tr><td class="esquerdo" style="height: 30px">tipo bolsa:<asp:CompareValidator ID="cvBolsa" runat="server" 
                       ControlToValidate="ddlTipoBolsa" ErrorMessage="selecione" Operator="NotEqual" 
                       ValueToCompare="0" ValidationGroup="contratos"></asp:CompareValidator></td><td class="direito" style="height: 30px"><asp:DropDownList ID="ddlTipoBolsa" runat="server" Height="16px" Width="438px"></asp:DropDownList></td></tr><tr><td class="esquerdo" style="height: 30px">período:</td><td class="direito" style="height: 30px">início <asp:TextBox ID="TxtDtInicioContrato" runat="server" MaxLength="10" 
                    Width="70px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvDtInicioContrato" runat="server" 
                    ControlToValidate="TxtDtInicioContrato" ErrorMessage="obrigatório" 
                    ValidationGroup="contratos"></asp:RequiredFieldValidator>&nbsp; término<asp:TextBox ID="TxtDtFimContrato" runat="server" MaxLength="10" 
                    Width="70px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvDtFimContrato" runat="server" 
                    ControlToValidate="TxtDtFimContrato" ErrorMessage="obrigatório" 
                    ValidationGroup="contratos"></asp:RequiredFieldValidator>&nbsp;rescisão <asp:TextBox ID="TxtDtRescisaoContrato" runat="server" MaxLength="10" 
                    Width="70px"></asp:TextBox></td></tr><tr><td class="esquerdo" style="height: 30px">seguro de vida:</td><td class="direito" style="height: 30px">início <asp:TextBox ID="TxtDtInicioSeguro" runat="server" MaxLength="10" Width="70px"></asp:TextBox>&nbsp; término<asp:TextBox ID="TxtDtFimSeguro" runat="server" MaxLength="10" 
                    Width="70px"></asp:TextBox>&nbsp;</td></tr>
             <tr>
                 <td class="esquerdo" style="height: 30px">
                     suspenso:&nbsp;</td>
                 <td class="direito" style="height: 30px">
                     <asp:RadioButtonList ID="rdContratoSuspenso" runat="server" AutoPostBack="True" 
                         onselectedindexchanged="rdContratoSuspenso_SelectedIndexChanged" 
                         RepeatDirection="Horizontal" RepeatLayout="Flow">
                         <asp:ListItem Selected="True" Value="False">não</asp:ListItem>
                         <asp:ListItem Value="True">sim</asp:ListItem>
                     </asp:RadioButtonList>
                     <br />
                 </td>
             </tr>
             <tr>
                 <td class="esquerdo" style="height: 30px">
                     observação:</td>
                 <td class="direito" style="height: 30px">
                     <asp:TextBox ID="txtObsContrato" runat="server" MaxLength="100" Width="500px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvObsContrato" runat="server" 
                         ControlToValidate="txtObsContrato" Enabled="False" ErrorMessage="obrigatório" 
                         ValidationGroup="contratos"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="esquerdo" style="height: 30px">
                     data relatório:</td>
                 <td class="direito" style="height: 30px">
                     <asp:TextBox ID="TxtDtRelatorio" runat="server" MaxLength="10" Width="70px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvDtRelatorio" runat="server" 
                         ControlToValidate="TxtDtRelatorio" Enabled="False" ErrorMessage="obrigatório" 
                         ValidationGroup="contratos"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr><th colspan="2"><asp:Button ID="btInserirContrato0" runat="server" onclick="btInserirContrato_Click" 
                                    Text="inserir" ValidationGroup="contratos" /><asp:Button ID="btAlterarContrato0" runat="server" onclick="btAlterarContrato_Click" 
                                    Text="salvar" ValidationGroup="contratos" /><asp:Button ID="btExcluirContrato0" runat="server" CausesValidation="False" 
                                    onclick="btExcluirContrato_Click" Text="excluir" 
                                    ValidationGroup="contratos" /><asp:Button ID="btCancelarContrato0" runat="server" CausesValidation="False" 
                                    onclick="btCancelarContrato_Click" Text="cancelar" />
                 <asp:Label ID="lbMsgContrato" runat="server" ForeColor="Red"></asp:Label>
                 </th></tr></table></ContentTemplate></asp:TabPanel>
         <asp:TabPanel runat="server" HeaderText="pagamentos" ID="tbPagamentos" Visible="false">
         <ContentTemplate><table class="cadastro"><tr><th colspan="1">identificação do bolsistas</th><th colspan="1">&nbsp;</th></tr>
         <tr><td class="esquerdo" style="height: 30px">nome: </td><td class="direito" style="height: 30px"><asp:Label ID="lbBolsista1" runat="server"></asp:Label></td></tr><tr><td class="esquerdo">CPF:</td><td class="direito"><asp:Label ID="lbCpf1" runat="server"></asp:Label></td></tr><tr>
         <th  class="esquerdo" colspan="1">detalhes do contrato</th><th  class="direito" colspan="1">&nbsp;</th></th></tr>
         <tr ><td class="esquerdo" style="height: 30px">projeto: </td><td class="direito" style="height: 30px"><asp:Label ID="lbProjeto" runat="server"></asp:Label></td></tr><tr><td class="esquerdo" style="height: 30px">tipo contrato: </td><td class="direito" style="height: 30px">
         <asp:Label ID="lbTipoContrato" runat="server"></asp:Label>
         </td></tr><tr><td class="esquerdo" style="height: 30px">tipo bolsa:</td><td class="direito" style="height: 30px">
         <asp:Label ID="lbBolsa" runat="server"></asp:Label></td></tr><tr><td class="esquerdo" style="height: 30px">período:</td>
         <td class="direito" style="height: 30px">início <asp:Label ID="lbDtInicioContrato" runat="server"></asp:Label>
         &nbsp; término <asp:Label ID="lbDtFimContrato" runat="server"></asp:Label>&nbsp;rescisão <asp:Label ID="lbDtRescisao" runat="server"></asp:Label>
         </td></tr><tr><td class="esquerdo" style="height: 30px">seguro de vida:</td><td class="direito" style="height: 30px">início 
         <asp:Label ID="lbDtInicioSeguro" runat="server"></asp:Label>&nbsp;&nbsp; término&nbsp;<asp:Label ID="lbDtFimSeguro" runat="server"></asp:Label></td></tr><tr><th class="esquerdo" style="height: 30px">Pagamentos</th><th class="direito" style="height: 30px">
         <asp:Button ID="btGerarPagtos" runat="server" Text="gerar pagamentos" 
                     onclick="btGerarPagtos_Click" CausesValidation="False" 
                     ValidationGroup="nada" />
             
                 <asp:LinkButton ID="btParcelas" runat="server" CausesValidation="False" 
                     style="display:none" Text="gerar parcelas" />
             
             <asp:Panel ID="pPagamentos" runat="server" CssClass="modalPopup" Width="800px">
                 
                
                 
                 <asp:GridView ID="gridVigencias" runat="server" AutoGenerateColumns="False" 
                     Caption="Lista de Vigências" CellPadding="4" CssClass="tableView" 
                     DataKeyNames="Id" ForeColor="#333333" GridLines="None" Width="100%" 
                         onselectedindexchanging="gridVigencias_SelectedIndexChanging">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         <asp:BoundField DataField="Id" HeaderText="código" SortExpression="Id">
                         <HeaderStyle HorizontalAlign="Left" />
                         <ItemStyle HorizontalAlign="Left" />
                         </asp:BoundField>
                         <asp:TemplateField HeaderText="sigla" SortExpression="Bolsa.sigla">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Bolsa.sigla") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("Bolsa.sigla") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="nome" SortExpression="Bolsa.Nome">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Bolsa.Nome") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("Bolsa.Nome") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" />
                         </asp:TemplateField>
                         <asp:BoundField DataField="inicio" DataFormatString="{0:d}" HeaderText="início" 
                             SortExpression="inicio" />
                         <asp:BoundField DataField="termino" DataFormatString="{0:d}" 
                             HeaderText="término" SortExpression="termino" />
                         <asp:BoundField DataField="valor" DataFormatString="{0:C2}" HeaderText="valor" 
                             SortExpression="valor" />
                         <asp:CheckBoxField DataField="status" SortExpression="status">
                         <ItemStyle HorizontalAlign="Right" Width="50px" />
                         </asp:CheckBoxField>
                         <asp:CommandField SelectText="selecionar" ShowSelectButton="True">
                         </asp:CommandField>
                     </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" 
                         CssClass="SortedAscendingCellStyle" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" 
                         CssClass="SortedAscendingHeaderStyle" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" 
                         CssClass="SortedDescendingCellStyle" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" 
                         CssClass="SortedDescendingHeaderStyle " />
                 </asp:GridView>
                 
                 <asp:Button ID="btGerarPagtos0" runat="server" onclick="btGerarPagtos0_Click" 
                     Text="gerar pagamentos" ValidationGroup="gerarParcelas" />
                 <asp:Button ID="btOk" runat="server" CausesValidation="False" 
                      Text="cancelar" onclick="btOk_Click" />
                 <asp:CustomValidator ID="cvGerarPagamentos" runat="server" 
                     ErrorMessage="selecione uma vigência"  ValidationGroup="gerarParcelas"
                     onservervalidate="cvGerarPagamentos_ServerValidate" Font-Bold="False" 
                     ForeColor="Red" ></asp:CustomValidator>
                   
             </asp:Panel>
             <asp:ModalPopupExtender ID="mpePagamentos" runat="server" 
                 backgroundcssclass="modalBackground" dropshadow="True" 
                 Enabled="True" popupcontrolid="pPagamentos"                 
                 targetcontrolid="btParcelas" DynamicServicePath="">
             </asp:ModalPopupExtender>
             </th></tr><tr><td colspan="2">
                 <asp:GridView ID="gridPagamentos" runat="server" AutoGenerateColumns="False" 
                       CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                       onselectedindexchanging="gridPagamentos_SelectedIndexChanging" 
                     onrowdatabound="gridPagamentos_RowDataBound" Caption="Lista de Parcelas">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                       <asp:BoundField HeaderText="parcela" DataField="num_parcela" /><asp:BoundField HeaderText="mês/ano" DataField="mes_ano" /><asp:BoundField HeaderText="data pagto" DataField="data_pgto" 
                               DataFormatString="{0:d}" /><asp:BoundField HeaderText="valor" DataField="valor" 
                               DataFormatString="{0:c2}" /><asp:BoundField HeaderText="observação" DataField="observacao" /><asp:CheckBoxField DataField="cancelado" HeaderText="cancelado" />
                         <asp:BoundField DataField="data" HeaderText="data de útilma alteração" />
                         <asp:TemplateField HeaderText="usuario">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Usuario.login") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("Usuario.login") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:CommandField ShowSelectButton="True" SelectText="selecione" /></Columns>
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
                 </asp:GridView></th></tr><tr><th  class="esquerdo" colspan="1">detalhe da parcela</th><th  class="direito" colspan="1"><asp:Button ID="btInserirParcela" runat="server" onclick="btInserirParcela_Click" 
                                    Text="inserir" ValidationGroup="pagamentos" /><asp:Button ID="btAlterarParcela" runat="server" onclick="btAlterarParcela_Click" 
                                    Text="salvar" ValidationGroup="pagamentos" /><asp:Button ID="btExcluirParcela" runat="server" CausesValidation="False" 
                                    onclick="btExcluirParcela_Click" Text="excluir" 
                                    ValidationGroup="pagamentos" /><asp:Button ID="btCancelarParcela" runat="server" CausesValidation="False" 
                                    onclick="btCancelarParcela_Click" Text="cancelar" /></th></th></tr><tr><td colspan="1">parcela: <asp:RequiredFieldValidator ID="rfvTxtParcela" runat="server" 
                    ControlToValidate="TxtParcela" ErrorMessage="obrigatório" 
                    ValidationGroup="pagamentos"></asp:RequiredFieldValidator></td><td colspan="1"><asp:TextBox ID="TxtParcela" runat="server" Width="29px" MaxLength="2" onkeyup="formataInteiro(this,event);"></asp:TextBox><asp:Label ID="txtId_pagamento" runat="server" Text="0" Visible="False"></asp:Label></td></tr><tr><td colspan="1">mês/ano: <asp:RequiredFieldValidator ID="rfvMes" runat="server" 
                    ControlToValidate="TxtMes" ErrorMessage="obrigatório" 
                    ValidationGroup="pagamentos"></asp:RequiredFieldValidator></td><td colspan="1"><asp:TextBox ID="TxtMes" runat="server" Width="70px" MaxLength="7"></asp:TextBox></td></tr><tr><td colspan="1">valor: <asp:RequiredFieldValidator ID="rfvValor" runat="server" 
                    ControlToValidate="TxtValor" ErrorMessage="obrigatório" 
                    ValidationGroup="pagamentos"></asp:RequiredFieldValidator></td><td colspan="1"><asp:TextBox ID="TxtValor" runat="server" Width="100px" onkeyup="formataValor(this,event);"></asp:TextBox></td></tr><tr><td colspan="1">observação:</td><td colspan="1"><asp:TextBox ID="TxtObs" runat="server" Width="500px"></asp:TextBox></td></tr>
             <tr>
                 <td colspan="1">
                     data de pagamento:</td>
                 <td colspan="1">
                     <asp:TextBox ID="txtDataPagto" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr><td colspan="1">cancelado:</td><td colspan="1"><asp:CheckBox ID="chkCancelado" runat="server" Text="cancelado" />
             &nbsp;<asp:CheckBox ID="ckReplicarPagamento" runat="server" 
                 Text="gerar novo pagamento" />
             </td></tr><tr><td align="right" colspan="2"><asp:Panel ID="Panel2" runat="server"></asp:Panel></td></tr><tr><th colspan="2"><asp:Button ID="btInserirParcela0" runat="server" 
                                    OnClick="btInserirParcela_Click" Text="inserir" ValidationGroup="pagamentos" /><asp:Button ID="btAlterarParcela0" runat="server" 
                                    OnClick="btAlterarParcela_Click" Text="salvar" ValidationGroup="pagamentos" /><asp:Button ID="btExcluirParcela0" runat="server" CausesValidation="False" 
                                    OnClick="btExcluirParcela_Click" Text="excluir" ValidationGroup="pagamentos" /><asp:Button ID="btCancelarParcela0" runat="server" CausesValidation="False" 
                                    OnClick="btCancelarParcela_Click" Text="cancelar" /></th></tr></table></ContentTemplate></asp:TabPanel>
    </asp:TabContainer>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
