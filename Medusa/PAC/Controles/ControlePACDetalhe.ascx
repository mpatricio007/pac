<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlePACDetalhe.ascx.cs" Inherits="Medusa.PAC.Controles.ControlePACDetalhe" %>


              <table class="cadastro">
                        <tr>
                            <th colspan="1">
                                PAC</th>
                            <th colspan="1">
                                &nbsp;</th>
                        </tr>
                        <tr>
                            <th colspan="1">
                                Informações do Solicitante</th>
                            <th colspan="1">
                                &nbsp;</th>
                        </tr>
                                 <tr>
                            <td class="esquerdo">
                                nome:</td>
                            <td class="direito">
                                <asp:Label ID="lbNomeSolicitante" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="esquerdo">
                                CPF:</td>
                            <td class="direito">
                                <asp:Label ID="lbCPFSolicitante" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="esquerdo">
                                email:</td>
                            <td class="direito">
                                <asp:Label ID="lbEmailSolicitante" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        
                        <tr><th colspan="1">Informações do Projeto</th>
        <th colspan="1">
            &nbsp;</th></tr>
              <tr>
                            <td class="esquerdo">
                                nº</td>
                            <td class="direito">
                                <asp:Label ID="lbId_pac" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
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
                       <tr>
                       <td class="esquerdo" style="height: 29px">
                         
                           empresa pretendida:</td>
                           <td class="direito" style="height: 29px">
                               <asp:Label ID="lbEmpresa" runat="server"></asp:Label>
                           </td>
                           </tr>
                           <tr>
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
                               <td class="esquerdo">
                                   valor total:</td>
                               <td class="direito">
                                   <asp:Label ID="lbTotal" runat="server"></asp:Label>
                               </td>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                       <asp:DataList ID="bem" runat="server" Width="100%">
                                           <ItemTemplate>
                                               <table class="cadastro">
                                                   <tr>
                                                       <th colspan="1">
                                                           Bem</th>
                                                       <th colspan="1">
                                                       </th>
                                                   </tr>
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
                                           </ItemTemplate>
                                       </asp:DataList>
                                       <asp:DataList ID="servicospj" runat="server" Width="100%">
                                           <ItemTemplate>
                                               <table class="cadastro">
                                                   <tr>
                                                       <th colspan="1">
                                                           Serviços PJ</th>
                                                       <th colspan="1">
                                                       </th>
                                                   </tr>
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
                                           </ItemTemplate>
                                       </asp:DataList>
                                       <asp:DataList ID="locacaobem" runat="server" Width="100%">
                                           <ItemTemplate>
                                               <table class="cadastro">
                                                   <tr>
                                                       <th colspan="1">
                                                           Locação Bem</th>
                                                       <th colspan="1">
                                                       </th>
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
                                           </ItemTemplate>
                                       </asp:DataList>
                                       <asp:DataList ID="locacaoveiculos" runat="server" Width="100%">
                                           <ItemTemplate>
                                               <table class="cadastro">
                                                   <tr>
                                                       <th colspan="1">
                                                           Locação de Veículos</th>
                                                       <th colspan="1">
                                                       </th>
                                                   </tr>
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
                                                                 <asp:DataList ID="dtListaCondutores" runat="server" DataSource='<%# Eval("PACVeiculos_Condutores") %>'>
                                                           <ItemTemplate>
                                                           <table class="cadastro">
  <tr>
   <th colspan="1">
                                        dados do condutor</th>
                                    <th colspan="1">
                                        </th>
              
            </tr>
             
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
                    <asp:Label ID="txtCnh" runat="server" Text='<%# Eval("cnh") %>'></asp:Label>
                </td>
      </tr>
            <tr>
                <td class="esquerdo">
                    validade cnh:
                   
                </td>
                <td class="direito">
                    <asp:Label ID="txtDtValidade_cnh" runat="server" Text='<%# Eval("validade_cnh","{0:d}") %>'></asp:Label>
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
            </ItemTemplate>
                                                           </asp:DataList>
                                            
                                                       </td>
                                                   </tr>
                                               </table>
                                           </ItemTemplate>
                                       </asp:DataList>
                                       <asp:DataList ID="passagem" runat="server" Width="100%">
                                           <ItemTemplate>
                                               <table class="cadastro">
                                                   <tr>
                                                       <th colspan="1">
                                                           Passagem</th>
                                                       <th colspan="1">
                                                       </th>
                                                   </tr>
                                                    <tr>
                                                       <td class="esquerdo">
                                                           tipo de compra:</td>
                                                       <td class="direito">
                                                           <%# Eval("TipoPassagem.nome") %>
                                                       </td>
                                                   </tr>
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
                                                       <td class="esquerdo">
                                                           passageiros:
                                                       </td>
                                                       <td class="direito" >
                                                           <asp:DataList ID="dtListaPassageiros" runat="server" DataSource='<%# Eval("PACPassageiros") %>'>
                                                           <ItemTemplate>
                                                           <table class="cadastro">
  <tr>
   <th colspan="1">
                                        dados do passageiro</th>
                                    <th colspan="1">
                                        </th>
              
            </tr>
             
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
                    data de nascimento:
                   
                </td>
                <td class="direito">
                    <asp:Label ID="txtDtNascto" runat="server" Text='<%# Eval("dtNascto","{0:d}") %>'></asp:Label>
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
                    <asp:Label ID="txtValidade_passaporte" runat="server" Text='<%# Eval("validade_passaporte","{0:d}") %>'></asp:Label>
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
                <asp:Label ID="txtEndereco" runat="server" Text='<%# Eval("Ender") %>'></asp:Label>   
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
            </ItemTemplate>
                                                           </asp:DataList>
                                            
                                                       </td>
                                                   </tr>
                                               </table>
                                           </ItemTemplate>
                                       </asp:DataList>
                                   </td>
                               </tr>
                   
                    </table>
                    <asp:GridView ID="gridCotacoes" runat="server" AutoGenerateColumns="False" EmptyDataText="não existem cotações" 
                                    Width="100%" Caption="Lista de Cotações" CaptionAlign="Left" GridLines="None" 
                                    >
                                    <Columns>
                                        <asp:BoundField DataField="data_inclusao" HeaderText="data" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="arquivo">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("arquivo") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("arquivo") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                       <FooterStyle Font-Bold="False" />
                                       <HeaderStyle Font-Bold="False" BackColor="Silver" HorizontalAlign="Left"/>
                                       <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                       <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                       <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                       <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                       <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                       <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                       <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                          <asp:GridView ID="gridHistorico" runat="server" AutoGenerateColumns="False" 
                                       CellPadding="4" EmptyDataText="não há histórico" GridLines="None" 
                                       Width="100%" Caption="Histórico" CaptionAlign="Left" >
                                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                       <Columns>
                                           <asp:BoundField DataField="data" DataFormatString="{0: dd/MM/yyyy HH:mm}" 
                                               HeaderText="data">
                                           <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                           <ItemStyle Width="100px" />
                                           </asp:BoundField>
                                           <asp:TemplateField HeaderText="status">
                                               <ItemTemplate>
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("PACStatus.descricao") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle HorizontalAlign="Left" Width="200px" />
                                               <ItemStyle Width="100px" />
                                           </asp:TemplateField>
                                           <asp:BoundField DataField="justificativa" HeaderText="justificativa">
                                           <HeaderStyle HorizontalAlign="Left" Width="400px" />
                                           <ItemStyle Width="300px" />
                                           </asp:BoundField>
                                           <asp:TemplateField HeaderText="usuário" SortExpression="Usuario.Nome">
                                               <ItemTemplate>
                                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("Usuario.Nome") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                           </asp:TemplateField>
                                       </Columns>
                                       
                                       <EditRowStyle BackColor="#999999" />
                                       <FooterStyle Font-Bold="False" />
                                       <HeaderStyle Font-Bold="False" BackColor="Silver" HorizontalAlign="Left"/>
                                       <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                       <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                       <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                       <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                       <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                       <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                       <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                   </asp:GridView>