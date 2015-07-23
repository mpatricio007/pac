<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintPac.aspx.cs" Inherits="Medusa.PAC.Paginas.PrintPac" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="../../Styles/SitePrintPac.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>
<body class="print">
    <form id="form1" runat="server">
    <div class="main">
   <fieldset>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/img/logofusp.jpg" 
            Width="15%" />
&nbsp;<asp:Label ID="txt" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="Black" style="text-align: right" 
            Text="PEDIDO DE AUTORIZAÇÃO DE COMPRA  Nº " Width="450px"></asp:Label>
                    <asp:Label ID="lbId_pac" runat="server" Text="0" Font-Bold="True" 
            Font-Size="Large" ForeColor="Black"></asp:Label>
                    
   <fieldset><legend>Informações do Solicitante</legend>
       <table class="print">
         <tr>
                <td class="esquerdo">
                    nome:</td>
                <td class="direito">
                    <asp:Label ID="lbNomeSolicitante" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    CPF:</td>
                <td class="direito">
                    <asp:Label ID="lbCPFSolicitante" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    email:</td>
                <td class="direito">
                    <asp:Label ID="lbEmailSolicitante" runat="server"></asp:Label>
                </td>
            </tr>
       </table>
    </fieldset>
     <fieldset><legend>Informações do Projeto</legend>
       <table class="print">
        <tr>
                <td class="esquerdo">
                    projeto:</td>
                <td class="direito">
                    <asp:Label ID="lbProjeto" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    patrocinador(es):</td>
                <td class="direito">
                    <asp:GridView ID="gridFinanciadores" runat="server" AutoGenerateColumns="False" 
                        EmptyDataText="nenhum financiador cadastrado" ShowHeader="False" 
                        Width="100%" CssClass="print">
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
                        EmptyDataText="nenhum coordenador cadastrado" ShowHeader="False" 
                        Width="100%" CssClass="print">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" 
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
            </tr>
            <tr>
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
       </table>
       </fieldset>
       <fieldset><legend>Detalhes</legend>
        <table class="print">          
                       
            <tr style="display:none">
                <td class="esquerdo" style="height: 29px">
                    empresa pretendida:</td>
                <td class="direito" style="height: 29px">
                    <asp:Label ID="lbEmpresa" runat="server"></asp:Label>
                </td>
            </tr>
             <tr style="display:none">
                <td class="esquerdo">
                    cnpj:</td>
                <td class="direito">
                    <asp:Label ID="lbCnpj" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="esquerdo">
                    modalidade:</td>
                <td class="direito">
                    <asp:Label ID="lbModalidade" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>            
                <td colspan="2">
                
                    <asp:DataList ID="bem" runat="server" Width="100%">
                        <ItemTemplate>
                       <fieldset><legend>Bem</legend>
                            <table class="print">                            
                                <tr>
                                    <td class="esquerdo">
                                        por importação:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("eh_importacao")) ? "Sim" : "Não" %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        especificação:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("especificacao") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("quantidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("unidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_unitario", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor total:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_total", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("meta_etapa") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        rubrica/item:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("rubrica_item") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        endereço de entrega:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("Ender") %>
                                                       </td>
                                </tr>
                            </table>
                            </fieldset>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:DataList ID="servicospj" runat="server" Width="100%">
                        <ItemTemplate>
                       <fieldset><legend>Serviços PJ</legend>
                            <table class="print">
                        
                                <tr>
                                    <td class="esquerdo">
                                        com contrato:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("contrato")) ? "Sim" : "Não" %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        aditamento:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("aditamento")) ? "Sim" : "Não"%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        prazo(dias):</td>
                                    <td class="direito">
                                                           <%# Eval("prazo")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        especificação:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("especificacao") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("quantidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("unidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_unitario", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor total:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_total", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("meta_etapa") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        rubrica/item:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("rubrica_item") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        endereço da prestação de serviço:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("Ender") %>
                                                       </td>
                                </tr>
                            </table>
                            </fieldset>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:DataList ID="locacaobem" runat="server" Width="100%">
                        <ItemTemplate>
                       <fieldset><legend>Locação Bem</legend>
                            <table class="print">
                          
                                <tr>
                                    <td class="esquerdo">
                                        data de início:</td>
                                    <td class="direito">
                                                           <%# Eval("data_inicio","{0:dd/MM/yyyy}") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        data de término:</td>
                                    <td class="direito">
                                                           <%# Eval("data_termino","{0:dd/MM/yyyy}") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        local de retirada:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("retira_locadora")) ? "locadora" : "outro"%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        local de devolução:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("devolucao_locadora")) ? "locadora" : "outro"%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        especificação:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("especificacao") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("quantidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("unidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_unitario", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor total:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_total", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("meta_etapa") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        rubrica/item:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("rubrica_item") %>
                                                       </td>
                                </tr>
                            </table>
                            </fieldset>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:DataList ID="locacaoveiculos" runat="server" Width="100%">
                        <ItemTemplate>
                       <fieldset><legend>Locação de Veículos</legend>
                            <table class="print">
                             
                                <tr>
                                    <td class="esquerdo">
                                        locadora:</td>
                                    <td class="direito">
                                                           <%# Eval("locadora") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        nº da reserva:</td>
                                    <td class="direito">
                                                           <%# Eval("num_reserva") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        envio da autorização p/:</td>
                                    <td class="direito">
                                                           <%# Eval("autorizacao") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        data de início:</td>
                                    <td class="direito">
                                                           <%# Eval("data_inicio","{0:dd/MM/yyyy}") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        data de término:</td>
                                    <td class="direito">
                                                           <%# Eval("data_termino","{0:dd/MM/yyyy}") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        local de retirada:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("retira_locadora")) ? "locadora" : "outro"%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        local de devolução:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("devolucao_locadora")) ? "locadora" : "outro"%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        descrição do veículo:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("especificacao") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("quantidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("unidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_unitario", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor total:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_total", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("meta_etapa") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        rubrica/item:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("rubrica_item") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        condutores:
                                    </td>
                                    <td class="direito">
                                        <asp:DataList ID="dtListaCondutores" runat="server" 
                                            DataSource='<%# Eval("PACVeiculos_Condutores") %>'>
                                            <ItemTemplate>
                                           <fieldset><legend>Dados do Condutor</legend>
                                                <table class="print">
                                                    
                                                    <tr>
                                                        <td class="esquerdo">
                                                            nome:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtNome" runat="server" Text='<%# Eval("nome") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            cpf:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtCpf" runat="server" Text='<%# Eval("cpf") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            rg:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtRg" runat="server" Text='<%# Eval("rg") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            cnh:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="Label4" runat="server" 
                                                                Text='<%# Eval("cnh") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            validade cnh:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtDtValidade_cnh" runat="server" 
                                                                Text='<%# Eval("validade_cnh","{0:d}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            endereço:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtEndereco" runat="server" Text='<%# Eval("Ender") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                </fieldset>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                            </fieldset>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:DataList ID="passagem" runat="server" Width="100%">
                        <ItemTemplate>
                       <fieldset><legend>Passagem</legend>
                            <table class="print">
                          
                                <tr>
                                    <td class="esquerdo">
                                        data de ida:</td>
                                    <td class="direito">
                                                           <%# Eval("DtIda","{0:dd/MM/yyyy}") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        período:</td>
                                    <td class="direito">
                                                           <%# Eval("periodoIda")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        data de volta:</td>
                                    <td class="direito">
                                                           <%# Eval("DtVolta","{0:dd/MM/yyyy}") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        período:</td>
                                    <td class="direito">
                                                           <%# Eval("periodoVolta")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        ida e volta:</td>
                                    <td class="direito">
                                                           <%# Convert.ToBoolean(Eval("ida_e_volta")) ? "Sim" : "Não"%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        origem/destino:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("especificacao") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        quantidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("quantidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        unidade:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("unidade") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor unitário:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_unitario", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        valor total:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("valor_total", "{0:c}")%>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        meta/etapa:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("meta_etapa") %>
                                                       </td>
                                </tr>
                                <tr>
                                    <td class="esquerdo">
                                        rubrica/item:
                                    </td>
                                    <td class="direito">
                                                           <%# Eval("rubrica_item") %>
                                                       </td>
                                </tr>
                                <tr>
                                 <td colspan="2" class="tudo">
                                        <asp:DataList ID="dtListaPassageiros" Width="100%" runat="server" 
                                            DataSource='<%# Eval("PACPassageiros") %>'>
                                            <ItemTemplate>
                                           <fieldset><legend>Dados do Passageiro</legend>
                                                <table class="print">
                                             
                                                    <tr>
                                                        <td class="esquerdo">
                                                            nome:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtNome0" runat="server" Text='<%# Eval("nome") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            cpf:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtCpf0" runat="server" Text='<%# Eval("cpf") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            rg:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtRg0" runat="server" Text='<%# Eval("rg") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            data de nascimento:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtDtNascto" runat="server" 
                                                                Text='<%# Eval("dtNascto","{0:d}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            passaporte:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtPassaporte" runat="server" Text='<%# Eval("passaporte") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            validade do passaporte:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtValidade_passaporte" runat="server" 
                                                                Text='<%# Eval("validade_passaporte","{0:d}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            email:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            endereço:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtEndereco0" runat="server" Text='<%# Eval("Ender") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            familiar no Brasil:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtFamiliar" runat="server" Text='<%# Eval("familiar") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="esquerdo">
                                                            telefone:
                                                        </td>
                                                        <td class="direito">
                                                            <asp:Label ID="txtTelefone" runat="server" Text='<%# Eval("telefone") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                </fieldset>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                            </fieldset>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
        </fieldset>
        
       <fieldset><legend>Despacho da Autoridade Competente</legend>
        <p align="center">
            De acordo com as informações acima, autorizo o prosseguimento do processo de compra.
            <br />
            <br />
            <br />
        </p>
                  
            <asp:Label ID="Label2" runat="server" Text="Diretor Executivo" Width="65%" Style="text-align:center"></asp:Label>     
            <asp:Label ID="Label3" runat="server" Text="Data " Width="30%" 
                Style="text-align:center"></asp:Label>   

        
        </fieldset>
        
    </fieldset>
    </div>
    </form>
</body>
</html>
