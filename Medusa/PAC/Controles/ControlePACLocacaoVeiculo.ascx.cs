using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Medusa.Classes;
using BLL;

namespace Medusa.PAC.Controles
{
    public partial class ControlePACLocacaoVeiculo : System.Web.UI.UserControl
    {
        private List<PACItem> ListPACItens
        {
            get
            {
                return (List<PACItem>)Parent.Page.GetType().GetProperty("ListPACItens").GetValue(Parent.Page, new object[] { });
            }
            set
            {
                Parent.Page.GetType().GetProperty("ListPACItens").SetValue(Parent.Page, value, new object[] { });
            }
        }

        public PACLocacaoVeiculo pacLocacaoVeiculo
        {
            get
            {
                PACLocacaoVeiculoBtAdd.Visible = ((PACLocacaoVeiculo)ViewState["PACVeiculo"]).PACVeiculos_Condutores.Count() > 0;
                PACLocacaoVeiculoBtCancelar.Visible = ((PACLocacaoVeiculo)ViewState["PACVeiculo"]).PACVeiculos_Condutores.Count() > 0;
                return (PACLocacaoVeiculo)ViewState["PACVeiculo"];
            }
            set
            {
                ViewState["PACVeiculo"] = value;
                PACLocacaoVeiculoBtAdd.Visible = value.PACVeiculos_Condutores.Count() > 0;
                PACLocacaoVeiculoBtCancelar.Visible = value.PACVeiculos_Condutores.Count() > 0;

            }
        }

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BasePage.setTextDateEntry(PACLocacaoTxtDtInicio, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");
                BasePage.setTextDateEntry(PACLocacaoTxtDtTermino, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");
                BasePage.setTextDateEntry(PAcCondutorTxtCNHValidade, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");

                EstadosDAL objEstados = new EstadosDAL();
                PACCondutorDllUF.DataSource =objEstados.ListaEstados();
                PACCondutorDllUF.DataBind();
                PACCondutorDllUF.SelectedValue = "SP";
                PACCondutorDllUF_SelectedIndexChanged(null, null);

                setAdd();
                pacLocacaoVeiculo = new PACLocacaoVeiculo();
                Get();
            }
        }

        public void Get()
        {            
            this.PACLocacaoVeiculoTxtEspecificacao.Text = pacLocacaoVeiculo.especificacao;
            this.PACLocacaoVeiculoTxtQtdade.Text = Convert.ToString(pacLocacaoVeiculo.quantidade);
            this.PACLocacaoVeiculoTxtUnidade.Text = "dia";
            this.PACLocacaoVeiculoTxtValorEstimado.Text = Convert.ToString(pacLocacaoVeiculo.valor_unitario);
            this.PACLocacaoVeiculoTxtMetaEtapa.Text = pacLocacaoVeiculo.meta_etapa;
            this.PACLocacaoVeiculoTxtRubricaItem.Text = pacLocacaoVeiculo.rubrica_item;
            this.PACLocacaoTxtDtInicio.Text = Util.DateToString(pacLocacaoVeiculo.data_inicio);
            this.PACLocacaoTxtDtTermino.Text = Util.DateToString(pacLocacaoVeiculo.data_termino);
            this.PACLocacaoRdRetira_locadora.SelectedValue = Convert.ToString(pacLocacaoVeiculo.retira_locadora);
            this.PACLocacaoRdDevolucao_Locadora.SelectedValue = Convert.ToString(pacLocacaoVeiculo.devolucao_locadora);
            
            gridCondutores.DataSource = pacLocacaoVeiculo.PACVeiculos_Condutores;
            gridCondutores.DataBind();
        }

        protected void setView()
        {
            mvLocacaoVeiculo.SetActiveView(vCadastro);
            pCadastro.Visible = false;
        }

        protected void setAdd()
        {
            mvLocacaoVeiculo.SetActiveView(vCadastro);
            pCadastro.Visible = true;
        }

        protected void setList()
        {
            mvLocacaoVeiculo.SetActiveView(vListar);
        }

        protected void PACLocacaoVeiculoBtAdd_Click(object sender, EventArgs e)
        {
            if (cvCondutores.IsValid)
            {

                pacLocacaoVeiculo.locadora = this.PACLocacaoVeiculoTxtLocadora.Text;
                pacLocacaoVeiculo.num_reserva = this.PACLocacaoVeiculoTxtReserva.Text;
                pacLocacaoVeiculo.autorizacao = this.PACLocacaoVeiculoTxtAutorizacao.Text;                

                pacLocacaoVeiculo.especificacao = this.PACLocacaoVeiculoTxtEspecificacao.Text;
                pacLocacaoVeiculo.quantidade = Convert.ToInt32(this.PACLocacaoVeiculoTxtQtdade.Text);
                pacLocacaoVeiculo.unidade = this.PACLocacaoVeiculoTxtUnidade.Text;
                pacLocacaoVeiculo.valor_unitario = Convert.ToDecimal(this.PACLocacaoVeiculoTxtValorEstimado.Text);
                pacLocacaoVeiculo.meta_etapa = this.PACLocacaoVeiculoTxtMetaEtapa.Text;
                pacLocacaoVeiculo.rubrica_item = this.PACLocacaoVeiculoTxtRubricaItem.Text;
                pacLocacaoVeiculo.data_inicio = Convert.ToDateTime(PACLocacaoTxtDtInicio.Text);
                pacLocacaoVeiculo.data_termino = pacLocacaoVeiculo.data_inicio.AddDays(pacLocacaoVeiculo.quantidade);
                pacLocacaoVeiculo.retira_locadora = Convert.ToBoolean(this.PACLocacaoRdRetira_locadora.SelectedValue);
                pacLocacaoVeiculo.devolucao_locadora = Convert.ToBoolean(this.PACLocacaoRdDevolucao_Locadora.SelectedValue);

                pacLocacaoVeiculo.valor_total = pacLocacaoVeiculo.quantidade * pacLocacaoVeiculo.valor_unitario;
                ListPACItens.Add(pacLocacaoVeiculo);

                setList();
                gridLocacaoVeiculo.DataSource = ListPACItens;
                gridLocacaoVeiculo.DataBind();
            }
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            setAdd();
            pacLocacaoVeiculo = new PACLocacaoVeiculo();
            Get();
        }

        protected void gridLocacaoVeiculo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ListPACItens.RemoveAt(e.RowIndex);
            gridLocacaoVeiculo.DataSource = ListPACItens;
            gridLocacaoVeiculo.DataBind();
        }

        protected void PACLocacaoVeiculoBtCancelar_Click(object sender, EventArgs e)
        {
            Get();
        }

        protected void PACCondutorBtAdd_Click(object sender, EventArgs e)
        {
            PACVeiculos_Condutor pacCondutor = new PACVeiculos_Condutor();
            pacCondutor = new PACVeiculos_Condutor();
            pacCondutor.nome = this.PACCondutorTxtNome.Text;
            pacCondutor.cpf = this.ControleCPF1.GetCpf();
            pacCondutor.rg = this.PACCondutorTxtRg.Text;
            pacCondutor.cnh = this.PAcCondutorTxtCNH.Text;
            pacCondutor.validade_cnh = Util.StringToDate(this.PAcCondutorTxtCNHValidade.Text);
            pacCondutor.Ender = new Endereco();
            pacCondutor.Ender.logradouro = this.PACCondutorTxtLogradouro.Text;
            pacCondutor.Ender.numero = this.PACCondutorTxtNumero.Text;
            pacCondutor.Ender.complemento = this.PACCondutorTxtComplemento.Text;
            pacCondutor.Ender.bairro = this.PACCondutorTxtBairro.Text;
            pacCondutor.Ender.cidade = this.PACCondutorDllCidade.SelectedValue;
            pacCondutor.Ender.uf = this.PACCondutorDllUF.SelectedValue;
            pacCondutor.Ender.cep = this.PACCondutorTxtCep.Text;

            pacLocacaoVeiculo.PACVeiculos_Condutores.Add(pacCondutor);

            gridCondutores.DataSource = pacLocacaoVeiculo.PACVeiculos_Condutores;
            gridCondutores.DataBind();

            mvLocacaoVeiculo.ActiveViewIndex = 1;
        }

        protected void PACCondutorBtCancelar_Click(object sender, EventArgs e)
        {
            GetCondutor(new PACVeiculos_Condutor());
            mvLocacaoVeiculo.ActiveViewIndex = 1;
        }

        public void GetCondutor(PACVeiculos_Condutor pacCondutor)
        {
            this.PACCondutorTxtNome.Text = pacCondutor.nome;
            this.ControleCPF1.SetCpf(pacCondutor.cpf);
            this.PACCondutorTxtRg.Text = pacCondutor.rg;
            this.PAcCondutorTxtCNH.Text = pacCondutor.cnh;
            this.PAcCondutorTxtCNHValidade.Text = Util.DateToString(pacCondutor.validade_cnh);
            this.PACCondutorTxtLogradouro.Text = pacCondutor.Ender.logradouro;
            this.PACCondutorTxtNumero.Text = pacCondutor.Ender.numero;
            this.PACCondutorTxtComplemento.Text = pacCondutor.Ender.complemento;
            this.PACCondutorTxtBairro.Text = pacCondutor.Ender.bairro;
            this.PACCondutorTxtCep.Text = pacCondutor.Ender.cep;
            this.PACCondutorDllUF.SelectedValue = pacCondutor.Ender.uf;
            this.PACCondutorDllUF_SelectedIndexChanged(null, null);
            this.PACCondutorDllCidade.SelectedValue = pacCondutor.Ender.cidade;
        }

        protected void PACCondutorDllUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            CidadeDAL objCidades = new CidadeDAL();

            PACCondutorDllCidade.DataSource = objCidades.GetCidadesPorUF(PACCondutorDllUF.SelectedValue);
            PACCondutorDllCidade.DataBind();

            if (PACCondutorDllUF.SelectedValue == "SP")
                PACCondutorDllCidade.SelectedValue = "São Paulo";
        }

        protected void gridCondutores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            pacLocacaoVeiculo.PACVeiculos_Condutores.Remove(pacLocacaoVeiculo.PACVeiculos_Condutores.ToList()[e.RowIndex]);
            gridCondutores.DataSource = pacLocacaoVeiculo.PACVeiculos_Condutores;
            gridCondutores.DataBind();
        }

        protected void lkAdicionarCondutores_Click(object sender, EventArgs e)
        {
            mvLocacaoVeiculo.ActiveViewIndex = 2;
            GetCondutor(new PACVeiculos_Condutor());
        }

        protected void cvCondutores_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = pacLocacaoVeiculo.PACVeiculos_Condutores.Count() > 0;
        }

        protected void PACLocacaoTxtDtInicio_TextChanged(object sender, EventArgs e)
        {
            setDtTermino();
        }

        private void setDtTermino()
        {
            int dias = 0;
            DateTime dt = DateTime.MinValue;
            if (DateTime.TryParse(this.PACLocacaoTxtDtInicio.Text, out dt) & int.TryParse(this.PACLocacaoVeiculoTxtQtdade.Text, out dias))
                this.PACLocacaoTxtDtTermino.Text = Util.DateToString(dt.AddDays(dias));
        }

        protected void PACLocacaoVeiculoTxtQtdade_TextChanged(object sender, EventArgs e)
        {
            setDtTermino();
        }


    }
}