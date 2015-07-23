using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Medusa.Classes;
using DAL;

namespace Medusa.Bolsa.Paginas
{
    public partial class Bolsistas : BasePage
    {
        private const string PRIMARY_KEY = "id_bolsista";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);

                setTextDateEntry(txtDtNascto, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(TxtDtInicioContrato, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(TxtDtFimContrato, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(TxtDtInicioSeguro, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(TxtDtFimSeguro, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(TxtDtRescisaoContrato, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(TxtDtRelatorio, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(txtDataPagto, TextboxDateEntryType.Full, true, true, "-100:+50");     

                ViewState["SortExpression"] = "cpf";
                ViewState["SortDirection"] = "DESC";

                EstadosDAL objEstados = new EstadosDAL();
                DllUF.DataSource =objEstados.ListaEstados();
                DllUF.DataBind();

                DllUF.SelectedValue = "SP";
                DllUF_SelectedIndexChanged(null, null);

                ProjetoBLL objProj = new ProjetoBLL();
                ddlProjeto.DataTextField = "CodDef_Projeto";
                ddlProjeto.DataValueField = "Id_Projeto";

                ddlProjeto.DataSource = objProj.Find(it => it.CodDef_Projeto != null, "CodDef_Projeto", "ASC");
                ddlProjeto.DataBind();

                ddlProjeto.Items.Add(new ListItem("Selecione", "0"));
                ddlProjeto.SelectedValue = "0";

                BolsaBLL bol = new BolsaBLL();
                ddlTipoBolsa.DataTextField = "Nome";
                ddlTipoBolsa.DataValueField = "Id";

                ddlTipoBolsa.DataSource = bol.GetAll();
                ddlTipoBolsa.DataBind();

                ddlTipoBolsa.Items.Add(new ListItem("Selecione", "0"));
                ddlTipoBolsa.SelectedValue = "0";


                TipoDocumentoBLL objDoc = new TipoDocumentoBLL();
                ddlTipoContrato.DataTextField = "Nome";
                ddlTipoContrato.DataValueField = "Id_TipoDocumento";

                ddlTipoContrato.DataSource = objDoc.GetAll();
                ddlTipoContrato.DataBind();

                ddlTipoContrato.Items.Add(new ListItem("Selecione", "0"));
                ddlTipoContrato.SelectedValue = "0";

                SetView();
                SetGrid();

                this.btExcluir.OnClientClick = "return AlertaExclusao()";
                this.btExcluir0.OnClientClick = "return AlertaExclusao()";
            }
        }

        protected void SetView()
        {
            Tabs.ActiveTab = tbPesquisa;
        }

        protected void SetAdd()
        {
            lblMsg.Text = String.Empty;

            Tabs.ActiveTab = tbCadastro;

            btInserir.Visible = true;
            btInserir0.Visible = true;
            btAlterar.Visible = false;
            btAlterar0.Visible = false;
            btExcluir.Visible = false;
            btExcluir0.Visible = false;
        }

        protected void SetModify()
        {
            lblMsg.Text = String.Empty;
            Tabs.ActiveTab = tbCadastro;
            btInserir.Visible = false;
            btInserir0.Visible = false;
            btAlterar.Visible = true;
            btAlterar0.Visible = true;
            btExcluir.Visible = true;
            btExcluir0.Visible = true;
        }

        protected void SetGrid()
        {
            BolsistaBLL obj = new BolsistaBLL();
            grid.DataKeyNames = new string[] { PRIMARY_KEY };            
            grid.DataSource = obj.Find(it => it.nome.Contains(this.txtProcura.Text) || it.cpf.Contains(this.txtProcura.Text),
                (string)ViewState["SortExpression"], (string)ViewState["SortDirection"], 1000);
            grid.DataBind();

            this.txtProcura.Text = String.Empty;
            this.txtProcura.Focus();
        }

        protected void Get(int intId)
        {
            BolsistaBLL ObjBLL = new BolsistaBLL();           

            ObjBLL.Get(new KeyValuePair<string, object>(PRIMARY_KEY, intId));

            if (String.IsNullOrEmpty(ObjBLL.ObjEF.cpf))
            {
                SetAdd();
                tbContratos.Enabled = false;
                tbPagamentos.Enabled = false;
            }
            else
            {
                SetModify();
                tbContratos.Enabled = true;
            }

            this.txtCodigo.Text = Convert.ToString(ObjBLL.ObjEF.id_bolsista);
            this.ControleCPF1.SetCpf(ObjBLL.ObjEF.cpf);
            this.txtNome.Text = ObjBLL.ObjEF.nome;
            this.ControleCPF1.SetCpf(ObjBLL.ObjEF.cpf);
            this.TxtRG.Text = ObjBLL.ObjEF.rg;
            this.txtDtNascto.Text = Util.DateToString(ObjBLL.ObjEF.dtNascto);
            this.txtBanco.Text = ObjBLL.ObjEF.banco;
            this.txtAgencia.Text = ObjBLL.ObjEF.agencia;
            this.txtConta.Text = ObjBLL.ObjEF.conta;
            this.txtEmail.Text = ObjBLL.ObjEF.email;
            this.TxtTelefone.Text = ObjBLL.ObjEF.tel_residencial;
            this.TxtCelular.Text = ObjBLL.ObjEF.tel_celular;

            this.TxtLogradouro.Text = ObjBLL.ObjEF.logradouro;
            this.TxtNumero.Text = ObjBLL.ObjEF.numero;
            this.TxtComplemento.Text = ObjBLL.ObjEF.complemento;
            this.TxtBairro.Text = ObjBLL.ObjEF.bairro;
            this.TxtCep.Text = ObjBLL.ObjEF.cep;

            if (!String.IsNullOrEmpty(ObjBLL.ObjEF.uf))
                this.DllUF.SelectedValue = ObjBLL.ObjEF.uf;

            DllUF_SelectedIndexChanged(null, null);

            if (!String.IsNullOrEmpty(ObjBLL.ObjEF.cidade))
                this.DllCidade.SelectedValue = ObjBLL.ObjEF.cidade;

            this.lblMsg.Text = String.Empty;
        }

        protected void Set(BolsistaBLL ObjBLL)
        {
            ObjBLL.ObjEF.id_bolsista = Convert.ToInt32(this.txtCodigo.Text);
            ObjBLL.ObjEF.cpf = ControleCPF1.GetCpf();
            ObjBLL.ObjEF.nome = this.txtNome.Text;
            ObjBLL.ObjEF.cpf = this.ControleCPF1.GetCpf();
            ObjBLL.ObjEF.rg = this.TxtRG.Text;
            ObjBLL.ObjEF.dtNascto = Util.StringToDate(this.txtDtNascto.Text);
            ObjBLL.ObjEF.banco = this.txtBanco.Text;
            ObjBLL.ObjEF.agencia = this.txtAgencia.Text;
            ObjBLL.ObjEF.conta = this.txtConta.Text;
            ObjBLL.ObjEF.email = this.txtEmail.Text;
            ObjBLL.ObjEF.tel_residencial = this.TxtTelefone.Text;
            ObjBLL.ObjEF.tel_celular = this.TxtCelular.Text;
            

            ObjBLL.ObjEF.logradouro = this.TxtLogradouro.Text;
            ObjBLL.ObjEF.numero = this.TxtNumero.Text;
            ObjBLL.ObjEF.complemento = this.TxtComplemento.Text;
            ObjBLL.ObjEF.bairro = this.TxtBairro.Text;
            ObjBLL.ObjEF.cep = this.TxtCep.Text;
            ObjBLL.ObjEF.uf = this.DllUF.SelectedValue;
            ObjBLL.ObjEF.cidade = this.DllCidade.SelectedValue;
        }

        protected void btInserir_Click(object sender, EventArgs e)
        {
            try
            {
                BolsistaBLL obj = new BolsistaBLL();
                Set(obj);
                obj.Add();
                if (ControleCPF1.IsValid)
                    if (obj.SaveChanges())
                        this.lblMsg.Text = "Inserido com sucesso!";
                    else
                        this.lblMsg.Text = "Erro!";
                Get(obj.ObjEF.id_bolsista);
                SetModify();
            }
            catch (Exception)
            {
                this.lblMsg.Text = "Erro!";                
            }
            
        }

        protected void btAlterar_Click(object sender, EventArgs e)
        {
            try
            {
                BolsistaBLL obj = new BolsistaBLL();
                obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtCodigo.Text)));
                Set(obj);
                obj.Update();
                if (ControleCPF1.IsValid)
                    if (obj.SaveChanges())
                        this.lblMsg.Text = "Atualizado com sucesso!";
                    else
                        this.lblMsg.Text = "Erro!";
            }
            catch (Exception)
            {
                this.lblMsg.Text = "Erro!";
            }
            
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            try
            {
                BolsistaBLL obj = new BolsistaBLL();
                obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtCodigo.Text)));
                obj.Delete();
                obj.SaveChanges();
                this.lblMsg.Text = "Excluído com sucesso!";
                Get(0);
                SetAdd();
            }
            catch (Exception)
            {
                
                this.lblMsg.Text = "Impossível excluir! Verifique dependências.";
            }
           
        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            this.txtCodigo.Text = String.Empty;
            SetGrid();
            SetView();
        }

        protected void btCriar_Click(object sender, EventArgs e)
        {
            Get(0);
            SetAdd();
        }

        protected void btProcurar_Click(object sender, EventArgs e)
        {
            SetGrid();
            SetView();
        }

        protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Get(Convert.ToInt32(grid.DataKeys[e.NewEditIndex][PRIMARY_KEY].ToString()));
            grid.DataBind();
            SetModify();
            e.Cancel = true;
        }

        protected void DllUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            CidadeDAL objCidades = new CidadeDAL();
            DllCidade.DataSource = objCidades.GetCidadesPorUF(DllUF.SelectedValue);
            DllCidade.DataBind();

            if (DllUF.SelectedValue == "SP")
                DllCidade.SelectedValue = "São Paulo";
        }

        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid.PageIndex = e.NewPageIndex;
            SetGrid();
        }

        protected void grid_Sorting(object sender, GridViewSortEventArgs e)
        {
            ViewState["SortExpression"] = e.SortExpression;
            SetGrid();

            if (ViewState["SortDirection"].Equals("ASC"))
                ViewState["SortDirection"] = "DESC";
            else
                ViewState["SortDirection"] = "ASC";
        }

        protected void grid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (!e.Row.Equals(null) & e.Row.RowType.Equals(DataControlRowType.Header))
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (cell.HasControls())
                    {
                        LinkButton button = (LinkButton)cell.Controls[0];

                        if (!button.Equals(null))
                        {
                            Image image = new Image();
                            if (ViewState["SortExpression"].Equals(button.CommandArgument))
                            {
                                if (ViewState["SortDirection"].Equals("ASC"))
                                    image.ImageUrl = @"~/Styles/img/SortAsc.png";
                                else
                                    image.ImageUrl = @"~/Styles/img/SortDesc.png";

                                cell.Controls.Add(image);
                            }
                        }
                    }
                }
            }

        }

        protected void Tabs_ActiveTabChanged(object sender, EventArgs e)
        {
            switch (Tabs.ActiveTab.ID)
            {
                case ("tbPesquisa"):
                    {
                        SetGrid();
                        tbPagamentos.Visible = false;
                        break;
                    }
                case ("tbCadastro"):
                    {
                        Get(Convert.ToInt32(this.txtCodigo.Text));
                        tbPagamentos.Visible = false;
                        break;
                    }
                case ("tbContratos"):
                    {
                        SetGridContratos();
                        GetContrato(0);
                        tbPagamentos.Visible = false;
                        break;
                    }
                case ("tbPagamentos"):
                    {
                        SetGridPagamentos(Convert.ToInt32(this.txtId_contrato.Text));
                        GetPagamento(0);
                        break;
                    }
            }
        }

        protected void SetGridContratos()
        {
            BolsistaBLL ObjBLL = new BolsistaBLL();

            ObjBLL.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtCodigo.Text)));
           
            this.lbBolsista.Text = ObjBLL.ObjEF.nome;
            this.lbCPF.Text = ObjBLL.ObjEF.cpf;

            gridContratos.DataKeyNames = new string[] { "id_contrato" };
            gridContratos.DataSource = ObjBLL.ObjEF.Contratos;
            gridContratos.DataBind();
        }

        protected void GetContrato(int intIdcontrato)
        {

            
            ContratoBolsaBLL ObjBLL = new ContratoBolsaBLL();
            ObjBLL.Get(new KeyValuePair<string, object>("id_contrato", intIdcontrato));

            if (ObjBLL.ObjEF.id_contrato == 0)
                SetAddContrato();
            else
                SetModifyContrato();
            this.txtId_contrato.Text = Convert.ToString(ObjBLL.ObjEF.id_contrato);
            this.ddlProjeto.SelectedValue = Convert.ToString(ObjBLL.ObjEF.id_projeto);
            this.ddlTipoBolsa.SelectedValue = Convert.ToString(ObjBLL.ObjEF.id_bolsa);
            this.ddlTipoContrato.SelectedValue = Convert.ToString(ObjBLL.ObjEF.id_tipoDocumento);
            this.TxtDtInicioContrato.Text = Util.DateToString(ObjBLL.ObjEF.inicio_contrato);
            this.TxtDtFimContrato.Text = Util.DateToString(ObjBLL.ObjEF.termino_contrato);
            this.TxtDtInicioSeguro.Text = Util.DateToString(ObjBLL.ObjEF.inicio_seguro);
            this.TxtDtFimSeguro.Text = Util.DateToString(ObjBLL.ObjEF.termino_seguro);
            this.TxtDtRescisaoContrato.Text = Util.DateToString(ObjBLL.ObjEF.rescisao);
            this.txtObsContrato.Text = ObjBLL.ObjEF.observacao;
            this.TxtDtRelatorio.Text = Util.DateToString(ObjBLL.ObjEF.dt_relatorio);
            this.rdContratoSuspenso.SelectedValue = Convert.ToString(ObjBLL.ObjEF.suspenso);
        }

        protected void SetContrato(ContratoBolsaBLL ObjBLL)
        {
            ObjBLL.ObjEF.id_contrato = Convert.ToInt32(this.txtId_contrato.Text);
            ObjBLL.ObjEF.id_bolsista = Convert.ToInt32(this.txtCodigo.Text);
            ObjBLL.ObjEF.id_projeto = Convert.ToInt32(this.ddlProjeto.Text);
            ObjBLL.ObjEF.id_bolsa = Convert.ToInt32(this.ddlTipoBolsa.SelectedValue);
            ObjBLL.ObjEF.id_tipoDocumento = Convert.ToInt32(this.ddlTipoContrato.SelectedValue);
            ObjBLL.ObjEF.inicio_contrato = Util.StringToDate(this.TxtDtInicioContrato.Text);
            ObjBLL.ObjEF.termino_contrato = Util.StringToDate(this.TxtDtFimContrato.Text);
            if (!String.IsNullOrEmpty(this.TxtDtInicioSeguro.Text))
                ObjBLL.ObjEF.inicio_seguro = Util.StringToDate(this.TxtDtInicioSeguro.Text);
            if (!String.IsNullOrEmpty(this.TxtDtFimSeguro.Text))
                ObjBLL.ObjEF.termino_seguro = Util.StringToDate(this.TxtDtFimSeguro.Text);
            if (!String.IsNullOrEmpty(this.TxtDtRescisaoContrato.Text)) 
                ObjBLL.ObjEF.rescisao = Util.StringToDate(this.TxtDtRescisaoContrato.Text);
            if (!String.IsNullOrEmpty(this.TxtDtRelatorio.Text))
                ObjBLL.ObjEF.dt_relatorio = Util.StringToDate(this.TxtDtRelatorio.Text);
            ObjBLL.ObjEF.suspenso = Convert.ToBoolean(this.rdContratoSuspenso.SelectedValue);
            ObjBLL.ObjEF.observacao = this.txtObsContrato.Text;
        }

        protected void SetAddContrato()
        {
            lblMsg.Text = String.Empty;

            Tabs.ActiveTab = tbContratos;

            btInserirContrato.Visible = true;
            btInserirContrato0.Visible = true;
            btAlterarContrato.Visible = false;
            btAlterarContrato0.Visible = false;
            btExcluirContrato.Visible = false;
            btExcluirContrato0.Visible = false;
            lbMsgContrato.Text = String.Empty;
        }

        protected void SetModifyContrato()
        {            
            Tabs.ActiveTab = tbContratos;
            btInserirContrato.Visible = false;
            btInserirContrato0.Visible = false;
            btAlterarContrato.Visible = true;
            btAlterarContrato0.Visible = true;
            btExcluirContrato.Visible = true;
            btExcluirContrato0.Visible = true;
            lbMsgContrato.Text = String.Empty;
        }

        protected void gridContratos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GetContrato(Convert.ToInt32(gridContratos.DataKeys[e.NewSelectedIndex]["id_contrato"].ToString()));
            gridContratos.DataBind();
            SetModifyContrato();
            e.Cancel = true;
        }

        protected void btInserirContrato_Click(object sender, EventArgs e)
        {
            ContratoBolsaBLL obj = new ContratoBolsaBLL();
            SetContrato(obj);
            if (!obj.PossuiOutroContratoAtivo(this.ControleCPF1.GetCpf()))
            {
                obj.Add();
                obj.SaveChanges();
                SetGridContratos();
                SetAddContrato();
                GetContrato(0);
            }
            else
                lbMsgContrato.Text = "Bolsista possui contrato ativo como autônomo!";
        }

        protected void btAlterarContrato_Click(object sender, EventArgs e)
        {
            ContratoBolsaBLL obj = new ContratoBolsaBLL();
            obj.Get(new KeyValuePair<string, object>("id_contrato", Convert.ToInt32(this.txtId_contrato.Text)));
            SetContrato(obj);
            if (!obj.PossuiOutroContratoAtivo(this.ControleCPF1.GetCpf()))
            {
                obj.Update();
                obj.SaveChanges();
                SetGridContratos();
                GetContrato(0);
            }
            else
                lbMsgContrato.Text = "Bolsista possui contrato ativo como autônomo!";
        }

        protected void btExcluirContrato_Click(object sender, EventArgs e)
        {
            ContratoBolsaBLL obj = new ContratoBolsaBLL();
            obj.Get(new KeyValuePair<string, object>("id_contrato", Convert.ToInt32(this.txtId_contrato.Text)));
            obj.Delete();
            obj.SaveChanges();            
            SetGridContratos();
            SetAddContrato();
            GetContrato(0);
        }

        protected void btCancelarContrato_Click(object sender, EventArgs e)
        {
            SetGridContratos();
            SetAddContrato();
            GetContrato(0);
        }

        protected void btCancelarParcela_Click(object sender, EventArgs e)
        {
            SetGridPagamentos(Convert.ToInt32(this.txtId_contrato.Text));
            SetAddParcela();
            GetPagamento(0);
        }

        protected void btExcluirParcela_Click(object sender, EventArgs e)
        {
            ContratosParcelaBLL ObjBLL = new ContratosParcelaBLL();
            ObjBLL.Get(new KeyValuePair<string, object>("id_parcela", Convert.ToInt32(this.txtId_pagamento.Text)));
            ObjBLL.Delete();
            ObjBLL.SaveChanges();
            SetGridPagamentos(Convert.ToInt32(this.txtId_contrato.Text));
            SetAddParcela();
            GetPagamento(0);
        }

        protected void btAlterarParcela_Click(object sender, EventArgs e)
        {
            ContratosParcelaBLL ObjBLL = new ContratosParcelaBLL();
            ObjBLL.Get(new KeyValuePair<string, object>("id_parcela", Convert.ToInt32(this.txtId_pagamento.Text)));
            SetPagamento(ObjBLL);
            ObjBLL.Update();
            ObjBLL.SaveChanges();
            if(ckReplicarPagamento.Checked)
                ObjBLL.ReplicarParcela(ObjBLL.ObjEF.id_parcela);

            SetGridPagamentos(Convert.ToInt32(this.txtId_contrato.Text));
            SetAddParcela();
            GetPagamento(0);
        }

        protected void btInserirParcela_Click(object sender, EventArgs e)
        {
            ContratosParcelaBLL ObjBLL = new ContratosParcelaBLL();
            SetPagamento(ObjBLL);
            ObjBLL.Add();
            ObjBLL.SaveChanges();
            SetGridPagamentos(Convert.ToInt32(this.txtId_contrato.Text));
            SetAddParcela();
            GetPagamento(0);
        }

        protected void SetGridPagamentos(int intId_contrato)
        {
            ContratoBolsaBLL ObjBLL = new ContratoBolsaBLL();
            ObjBLL.Get(new KeyValuePair<string, object>("id_contrato", intId_contrato));        

            this.lbBolsista1.Text = ObjBLL.ObjEF.Bolsista.nome;
            this.lbCpf1.Text = ObjBLL.ObjEF.Bolsista.cpf;
            this.lbProjeto.Text = Convert.ToString(ObjBLL.ObjEF.Projeto.CodDef_Projeto);
            this.lbTipoContrato.Text = ObjBLL.ObjEF.TipoDocumento.Nome;
            this.lbBolsa.Text = ObjBLL.ObjEF.Bolsa.Nome;
            this.lbDtInicioContrato.Text = Util.DateToString(ObjBLL.ObjEF.inicio_contrato);
            this.lbDtFimContrato.Text = Util.DateToString(ObjBLL.ObjEF.termino_contrato);
            this.lbDtRescisao.Text = Util.DateToString(ObjBLL.ObjEF.rescisao);
            this.lbDtInicioSeguro.Text = Util.DateToString(ObjBLL.ObjEF.inicio_seguro);
            this.lbDtFimSeguro.Text = Util.DateToString(ObjBLL.ObjEF.termino_seguro);

            this.txtDataPagto.Enabled = ObjBLL.ObjEF.Bolsa.excluir_do_fechamento;
            gridPagamentos.DataKeyNames = new string[] { "id_parcela" };
            gridPagamentos.DataSource = ObjBLL.ObjEF.Parcelas.OrderBy(it => it.num_parcela);
            gridPagamentos.DataBind();


            gridVigencias.DataSource = ObjBLL.ObjEF.Bolsa.BolsaVigencias.Where(it => it.status = true).OrderByDescending(it => it.Id);
            gridVigencias.DataBind();
        }

        protected void GetPagamento(int intId_pagamento)
        {
            ContratosParcelaBLL ObjBLL = new ContratosParcelaBLL();
            ObjBLL.Get(new KeyValuePair<string, object>("id_parcela", intId_pagamento));
            
            if (ObjBLL.ObjEF.id_parcela == 0)
                SetAddParcela();
            else
                SetModifyParcela();
            this.txtId_pagamento.Text = Convert.ToString(ObjBLL.ObjEF.id_parcela);
            this.TxtParcela.Text = Convert.ToString(ObjBLL.ObjEF.num_parcela);
            this.TxtMes.Text = ObjBLL.ObjEF.mes_ano;
            this.TxtValor.Text = Convert.ToString(ObjBLL.ObjEF.valor);
            this.TxtObs.Text = ObjBLL.ObjEF.observacao;
            this.chkCancelado.Checked = ObjBLL.ObjEF.cancelado.GetValueOrDefault();
            this.ckReplicarPagamento.Checked = false;
            this.txtDataPagto.Text = Util.DateToString(ObjBLL.ObjEF.data_pgto);
        }

        protected void SetPagamento(ContratosParcelaBLL ObjBLL)
        {
            ObjBLL.ObjEF.id_contrato = Convert.ToInt32(this.txtId_contrato.Text);
            ObjBLL.ObjEF.id_parcela = Convert.ToInt32(this.txtId_pagamento.Text);
            ObjBLL.ObjEF.num_parcela = Convert.ToInt32(this.TxtParcela.Text);
            ObjBLL.ObjEF.mes_ano = this.TxtMes.Text;
            ObjBLL.ObjEF.valor = Convert.ToDecimal(this.TxtValor.Text);
            ObjBLL.ObjEF.cancelado = this.chkCancelado.Checked;
            ObjBLL.ObjEF.observacao = this.TxtObs.Text;
            ObjBLL.ObjEF.data = DateTime.Now;
            ObjBLL.ObjEF.id_usuario = Convert.ToInt32(Session["id_usuario"]);
            ContratoBolsaBLL contrato = new ContratoBolsaBLL();
            contrato.Get(new KeyValuePair<string, object>("id_contrato", ObjBLL.ObjEF.id_contrato));
            if(contrato.ObjEF.Bolsa.excluir_do_fechamento)
                ObjBLL.ObjEF.data_pgto = ((contrato.ObjEF.Bolsa.excluir_do_fechamento) & (ObjBLL.ObjEF.id_parcela != 0) & !String.IsNullOrEmpty(this.txtDataPagto.Text)) ?
            Util.StringToDate(this.txtDataPagto.Text) : new DateTime();
        }

        protected void SetAddParcela()
        {
            lblMsg.Text = String.Empty;

            Tabs.ActiveTab = tbPagamentos;

            btInserirParcela.Visible = true;
            btInserirParcela0.Visible = true;
            btAlterarParcela.Visible = false;
            btAlterarParcela0.Visible = false;
            btExcluirParcela.Visible = false;
            btExcluirParcela0.Visible = false;
            ckReplicarPagamento.Visible = false;
        }

        protected void SetModifyParcela()
        {
            Tabs.ActiveTab = tbPagamentos;
            btInserirParcela.Visible = false;
            btInserirParcela0.Visible = false;
            btAlterarParcela.Visible = true;
            btAlterarParcela0.Visible = true;
            btExcluirParcela.Visible = true;
            btExcluirParcela0.Visible = true;
            ckReplicarPagamento.Visible = true;
        }

        protected void gridPagamentos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GetPagamento(Convert.ToInt32(gridPagamentos.DataKeys[e.NewSelectedIndex]["id_parcela"].ToString()));
            gridPagamentos.DataBind();
            SetModifyParcela();
            e.Cancel = true;
        }

        protected void gridContratos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.txtId_contrato.Text = Convert.ToString(gridContratos.DataKeys[e.NewEditIndex]["id_contrato"].ToString());
            SetGridPagamentos(Convert.ToInt32(gridContratos.DataKeys[e.NewEditIndex]["id_contrato"].ToString()));
            gridPagamentos.DataBind();
            SetAddParcela();
            tbPagamentos.Enabled = true;
            Tabs.ActiveTab = tbPagamentos;
            tbPagamentos.Visible = true;
            e.Cancel = true;
        }

        protected void rdContratoSuspenso_SelectedIndexChanged(object sender, EventArgs e)
        {
            rfvObsContrato.Enabled = Convert.ToBoolean(rdContratoSuspenso.SelectedValue);
        }

        protected void btGerarPagtos0_Click(object sender, EventArgs e)
        {
            if (cvGerarPagamentos.IsValid)
            {
                ContratosParcelaBLL obj = new ContratosParcelaBLL();
                obj.GerarPagamentos(Convert.ToInt32(this.txtId_contrato.Text), Convert.ToInt32(gridVigencias.SelectedDataKey.Value),Convert.ToInt32(Session["id_usuario"]));
                mpePagamentos.Hide();
                SetGridPagamentos(Convert.ToInt32(this.txtId_contrato.Text));
            }
            else
                mpePagamentos.Show();
        }

        protected void cvGerarPagamentos_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = gridVigencias.SelectedIndex != -1;
        }

        protected void btGerarPagtos_Click(object sender, EventArgs e)
        {
            mpePagamentos.Show();
            gridVigencias.SelectedIndex = -1;
        }

        protected void gridVigencias_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            mpePagamentos.Show();
        }

        protected void btOk_Click(object sender, EventArgs e)
        {
            mpePagamentos.Hide();
        }

        protected void gridPagamentos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DAL.ContratosParcela parcela = (DAL.ContratosParcela)e.Row.DataItem;
                if (parcela.data_pgto.GetValueOrDefault() == DateTime.MinValue)
                    e.Row.Cells[2].Text = String.Empty;

            }
        }
    }
}