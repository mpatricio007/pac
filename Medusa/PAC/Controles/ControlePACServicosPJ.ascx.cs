using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

namespace Medusa.PAC.Controles
{
    public partial class ControlePACServicosPJ : System.Web.UI.UserControl
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
                EstadosDAL objEstados = new EstadosDAL();
                PACServicosPJDllUF.DataSource = objEstados.ListaEstados();
                PACServicosPJDllUF.DataBind();
                PACServicosPJDllUF.SelectedValue = "SP";

                PACServicosPJDllUF_SelectedIndexChanged(null, null);
                setAdd();
            }
        }

        protected void PACServicosPJBtCancelar_Click(object sender, EventArgs e)
        {
            Get(new PACServicosPJ());
        }

        public void Get(PACServicosPJ pacServicosPJ)
        {
            this.PACServicosPJRdContrato.SelectedValue = Convert.ToString(pacServicosPJ.contrato);
            this.PACServicosPJRdAditamento.SelectedValue = Convert.ToString(pacServicosPJ.aditamento);
            this.PACServicosPJTxtPrazo.Text = Convert.ToString(pacServicosPJ.prazo);
            this.PACServicosPJTxtEspecificacao.Text = pacServicosPJ.especificacao;
            this.PACServicosPJTxtQtdade.Text = Convert.ToString(pacServicosPJ.quantidade);
            this.PACServicosPJTxtUnidade.Text = pacServicosPJ.unidade;
            this.PACServicosPJTxtValorEstimado.Text = Convert.ToString(pacServicosPJ.valor_unitario);
            this.PACServicosPJTxtMetaEtapa.Text = pacServicosPJ.meta_etapa;
            this.PACServicosPJTxtRubricaItem.Text = pacServicosPJ.rubrica_item;
            this.PACServicosPJTxtLogradouro.Text = pacServicosPJ.Ender.logradouro;
            this.PACServicosPJTxtNumero.Text = pacServicosPJ.Ender.numero;
            this.PACServicosPJTxtComplemento.Text = pacServicosPJ.Ender.complemento;
            this.PACServicosPJTxtBairro.Text = pacServicosPJ.Ender.bairro;
            this.PACServicosPJTxtCep.Text = pacServicosPJ.Ender.cep;
            this.PACServicosPJDllUF.SelectedValue = pacServicosPJ.Ender.uf;
            this.PACServicosPJDllUF_SelectedIndexChanged(null, null);
            this.PACServicosPJDllCidade.SelectedValue = pacServicosPJ.Ender.cidade;
        }

        protected void PACServicosPJDllUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            CidadeDAL objCidades = new CidadeDAL();
            PACServicosPJDllCidade.DataSource = objCidades.GetCidadesPorUF(PACServicosPJDllUF.SelectedValue);
            PACServicosPJDllCidade.DataBind();

            if (PACServicosPJDllUF.SelectedValue == "SP")
                PACServicosPJDllCidade.SelectedValue = "São Paulo";
        }

        protected void setView()
        {
            mvServicosPJ.SetActiveView(vCadastro);
            pCadastro.Visible = false;
        }

        protected void setAdd()
        {
            mvServicosPJ.SetActiveView(vCadastro);
            pCadastro.Visible = true;
        }

        protected void setList()
        {
            mvServicosPJ.SetActiveView(vListar);
        }

        protected void PACServicosPJBtAdd_Click(object sender, EventArgs e)
        {
            PACServicosPJ pacServicosPJ = new PACServicosPJ();
            pacServicosPJ.contrato = Convert.ToBoolean(this.PACServicosPJRdContrato.SelectedValue);
            pacServicosPJ.aditamento = Convert.ToBoolean(this.PACServicosPJRdAditamento.SelectedValue);
            pacServicosPJ.prazo = Convert.ToInt32(this.PACServicosPJTxtPrazo.Text);
            pacServicosPJ.especificacao = this.PACServicosPJTxtEspecificacao.Text;
            pacServicosPJ.quantidade = Convert.ToInt32(this.PACServicosPJTxtQtdade.Text);
            pacServicosPJ.valor_unitario = Convert.ToDecimal(this.PACServicosPJTxtValorEstimado.Text);
            pacServicosPJ.meta_etapa = this.PACServicosPJTxtMetaEtapa.Text;
            pacServicosPJ.rubrica_item = this.PACServicosPJTxtRubricaItem.Text;
            pacServicosPJ.unidade = this.PACServicosPJTxtUnidade.Text;
            pacServicosPJ.Ender = new Endereco();
            pacServicosPJ.Ender.logradouro = this.PACServicosPJTxtLogradouro.Text;
            pacServicosPJ.Ender.numero = this.PACServicosPJTxtNumero.Text;
            pacServicosPJ.Ender.complemento = this.PACServicosPJTxtComplemento.Text;
            pacServicosPJ.Ender.bairro = this.PACServicosPJTxtBairro.Text;
            pacServicosPJ.Ender.cidade = this.PACServicosPJDllCidade.SelectedValue;
            pacServicosPJ.Ender.uf = this.PACServicosPJDllUF.SelectedValue;
            pacServicosPJ.Ender.cep = this.PACServicosPJTxtCep.Text;
            pacServicosPJ.valor_total = pacServicosPJ.quantidade * pacServicosPJ.valor_unitario;
            ListPACItens.Add(pacServicosPJ);

            setList();
            gridServicosPJ.DataSource = ListPACItens;
            gridServicosPJ.DataBind();
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            setAdd();
            Get(new PACServicosPJ());
        }

        protected void gridServicosPJ_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ListPACItens.RemoveAt(e.RowIndex);
            gridServicosPJ.DataSource = ListPACItens;
            gridServicosPJ.DataBind();
        }
    }
}