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
    public partial class ControlePACBem : System.Web.UI.UserControl
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
            lbEndereco.Visible = ViewState["endereco"] != null;
            rdCopiarEndereco.Visible = ViewState["endereco"] != null;
            if (!IsPostBack)
            {
                EstadosDAL objEstados = new EstadosDAL();
                PACBemDllUF.DataSource =objEstados.ListaEstados();
                PACBemDllUF.DataBind();
                PACBemDllUF.SelectedValue = "SP";

                PACBemDllUF_SelectedIndexChanged(null, null);
                setAdd();
            }
        }

        protected void PACBemBtCancelar_Click(object sender, EventArgs e)
        {
            Get(new PACBem());
        }

        public void Get(PACBem pacBem)
        {   
            this.PACBemRdEh_Importacao.SelectedValue = Convert.ToString(pacBem.eh_importacao);
            this.PACBemTxtEspecificacao.Text = pacBem.especificacao;
            this.PACBemTxtQtdade.Text = Convert.ToString(pacBem.quantidade);
            this.PACBemTxtUnidade.Text = pacBem.unidade;
            this.PACBemTxtValorEstimado.Text = Convert.ToString(pacBem.valor_unitario);
            this.PACBemTxtMetaEtapa.Text = pacBem.meta_etapa;
            this.PACBemTxtRubricaItem.Text = pacBem.rubrica_item;
            
        }

        public void GetEndereco(Endereco ender)
        {
            this.PACBemTxtLogradouro.Text = ender.logradouro;
            this.PACBemTxtNumero.Text = ender.numero;
            this.PACBemTxtComplemento.Text = ender.complemento;
            this.PACBemTxtBairro.Text = ender.bairro;
            this.PACBemTxtCep.Text = ender.cep;
            this.PACBemDllUF.SelectedValue = ender.uf;
            this.PACBemDllUF_SelectedIndexChanged(null, null);
            this.PACBemDllCidade.SelectedValue = ender.cidade;            
        }

        protected void PACBemDllUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            CidadeDAL objCidades = new CidadeDAL();
            PACBemDllCidade.DataSource = objCidades.GetCidadesPorUF(PACBemDllUF.SelectedValue);
            PACBemDllCidade.DataBind();

            if (PACBemDllUF.SelectedValue == "SP")
                PACBemDllCidade.SelectedValue = "São Paulo";
        }

        protected void setView()
        {
            mvBem.SetActiveView(vCadastro);
            pCadastro.Visible = false;
        }

        protected void setAdd()
        {
            mvBem.SetActiveView(vCadastro);
            pCadastro.Visible = true;
        }

        protected void setList()
        {
            mvBem.SetActiveView(vListar);
        }

        protected void PACBemBtAdd_Click(object sender, EventArgs e)
        {
            PACBem pacBem = new PACBem();
            pacBem.eh_importacao = Convert.ToBoolean(this.PACBemRdEh_Importacao.SelectedValue);
            pacBem.especificacao = this.PACBemTxtEspecificacao.Text;
            pacBem.quantidade = Convert.ToInt32(this.PACBemTxtQtdade.Text);
            pacBem.valor_unitario = Convert.ToDecimal(this.PACBemTxtValorEstimado.Text);
            pacBem.meta_etapa = this.PACBemTxtMetaEtapa.Text;
            pacBem.rubrica_item = this.PACBemTxtRubricaItem.Text;
            pacBem.unidade = this.PACBemTxtUnidade.Text;
            pacBem.Ender = new Endereco();
            pacBem.Ender.logradouro = this.PACBemTxtLogradouro.Text;
            pacBem.Ender.numero = this.PACBemTxtNumero.Text;
            pacBem.Ender.complemento = this.PACBemTxtComplemento.Text;
            pacBem.Ender.bairro = this.PACBemTxtBairro.Text;
            pacBem.Ender.cidade = this.PACBemDllCidade.SelectedValue;
            pacBem.Ender.uf = this.PACBemDllUF.SelectedValue;
            pacBem.Ender.cep = this.PACBemTxtCep.Text;
            pacBem.valor_total = pacBem.quantidade * pacBem.valor_unitario;
            ListPACItens.Add(pacBem);
            ViewState["endereco"] = pacBem.Ender;
            rdCopiarEndereco.SelectedValue = "False";
            setList();
            gridBens.DataSource = ListPACItens;
            gridBens.DataBind();
        }

        protected void btNew_Click(object sender, EventArgs e)
        {            
            setAdd();
            Get(new PACBem());
            GetEndereco(new Endereco());
        }

        protected void gridBens_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ListPACItens.RemoveAt(e.RowIndex);
            gridBens.DataSource = ListPACItens;
            gridBens.DataBind();
        }

        protected void rdCopiarEndereco_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(this.rdCopiarEndereco.SelectedValue))
            {
                GetEndereco((Endereco)ViewState["endereco"]);
            }
            else
                GetEndereco(new Endereco());
        }
    }
}