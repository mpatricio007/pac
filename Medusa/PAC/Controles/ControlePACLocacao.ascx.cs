using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using Medusa.Classes;

namespace Medusa.PAC.Controles
{
    public partial class ControlePACLocacao : System.Web.UI.UserControl
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BasePage.setTextDateEntry(PACLocacaoTxtDtInicio, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");
                BasePage.setTextDateEntry(PACLocacaoTxtDtTermino, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");
                setAdd();
            }
        }

        public void Get(PACLocacaoBem pacLocacaoBem)
        {
            this.PACLocacaoBemTxtEspecificacao.Text = pacLocacaoBem.especificacao;
            this.PACLocacaoBemTxtQtdade.Text = Convert.ToString(pacLocacaoBem.quantidade);
            this.PACLocacaoBemTxtUnidade.Text = pacLocacaoBem.unidade;
            this.PACLocacaoBemTxtValorEstimado.Text = Convert.ToString(pacLocacaoBem.valor_unitario);
            this.PACLocacaoBemTxtMetaEtapa.Text = pacLocacaoBem.meta_etapa;
            this.PACLocacaoBemTxtRubricaItem.Text = pacLocacaoBem.rubrica_item;
            this.PACLocacaoTxtDtInicio.Text = Convert.ToString(pacLocacaoBem.data_inicio);
            this.PACLocacaoTxtDtTermino.Text = Convert.ToString(pacLocacaoBem.data_termino);
            this.PACLocacaoRdRetira_locadora.SelectedValue = Convert.ToString(pacLocacaoBem.retira_locadora);
            this.PACLocacaoRdDevolucao_Locadora.SelectedValue = Convert.ToString(pacLocacaoBem.devolucao_locadora);

           
        }       

        protected void setView()
        {
            mvLocacaoBem.SetActiveView(vCadastro);
            pCadastro.Visible = false;
        }

        protected void setAdd()
        {
            mvLocacaoBem.SetActiveView(vCadastro);
            pCadastro.Visible = true;
        }

        protected void setList()
        {
            mvLocacaoBem.SetActiveView(vListar);
        }

        protected void PACLocacaoBemBtAdd_Click(object sender, EventArgs e)
        {
            PACLocacaoBem pacLocacaoBem = new PACLocacaoBem();

            pacLocacaoBem.especificacao = this.PACLocacaoBemTxtEspecificacao.Text;
            pacLocacaoBem.quantidade = Convert.ToInt32(this.PACLocacaoBemTxtQtdade.Text);
            pacLocacaoBem.unidade = this.PACLocacaoBemTxtUnidade.Text;
            pacLocacaoBem.valor_unitario = Convert.ToDecimal(this.PACLocacaoBemTxtValorEstimado.Text);
            pacLocacaoBem.meta_etapa = this.PACLocacaoBemTxtMetaEtapa.Text;
            pacLocacaoBem.rubrica_item = this.PACLocacaoBemTxtRubricaItem.Text;
            pacLocacaoBem.data_inicio = Convert.ToDateTime(PACLocacaoTxtDtInicio.Text);
            pacLocacaoBem.data_termino = Convert.ToDateTime(this.PACLocacaoTxtDtTermino.Text);
            pacLocacaoBem.retira_locadora = Convert.ToBoolean(this.PACLocacaoRdRetira_locadora.SelectedValue);
            pacLocacaoBem.devolucao_locadora = Convert.ToBoolean(this.PACLocacaoRdDevolucao_Locadora.SelectedValue);           

            pacLocacaoBem.valor_total = pacLocacaoBem.quantidade * pacLocacaoBem.valor_unitario;
            ListPACItens.Add(pacLocacaoBem);

            setList();
            gridLocacaoBem.DataSource = ListPACItens;
            gridLocacaoBem.DataBind();
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            setAdd();
            Get(new PACLocacaoBem());
        }

        protected void gridLocacaoBem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ListPACItens.RemoveAt(e.RowIndex);
            gridLocacaoBem.DataSource = ListPACItens;
            gridLocacaoBem.DataBind();
        }
       
        protected void PACLocacaoBemBtCancelar_Click(object sender, EventArgs e)
        {
            Get(new PACLocacaoBem());
        }


    }
}