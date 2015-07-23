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
    public partial class ControlePACPassagem : System.Web.UI.UserControl
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

        public PACPassagem pacPassagem
        {
            get
            {
                PACPassagemBtAdd.Visible = ((PACPassagem)ViewState["PACPassagem"]).PACPassageiros.Count() > 0;
                PACPassagemBtCancelar.Visible = ((PACPassagem)ViewState["PACPassagem"]).PACPassageiros.Count() > 0;
                return (PACPassagem)ViewState["PACPassagem"];
            }
            set
            {
                ViewState["PACPassagem"] = value;
                PACPassagemBtAdd.Visible = value.PACPassageiros.Count() > 0;
                PACPassagemBtCancelar.Visible = value.PACPassageiros.Count() > 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BasePage.setTextDateEntry(PACPassagemTxtDtIda, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");
                BasePage.setTextDateEntry(PACPassagemTxtDtVolta, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");
                BasePage.setTextDateEntry(PACPassagemTxtDtNascto, Medusa.Classes.BasePage.TextboxDateEntryType.Full, true, true, "-100:+50");

                EstadosDAL objEstados = new EstadosDAL();
                PACPassagemDllUF.DataSource =objEstados.ListaEstados();
                PACPassagemDllUF.DataBind();
                PACPassagemDllUF.SelectedValue = "SP";

                PACPassagemDllUF_SelectedIndexChanged(null, null);
                setAdd();

                pacPassagem = new PACPassagem();
                Get();

                PacPassageiroBLL pas = new PacPassageiroBLL();
                this.ddlPassageiros.DataTextField = "nome";
                this.ddlPassageiros.DataValueField = "id_passageiro";
                ddlPassageiros.DataSource = pas.GetPassageiros(Convert.ToString(Session["cpf_usuMySQL"]));
                ddlPassageiros.DataBind();
                this.ddlPassageiros.Items.Add(new ListItem("Selecione", "0"));
                this.ddlPassageiros.SelectedValue = "0";


                TipoPassagemDAL tipoPassDAL = new TipoPassagemDAL();

                this.ddlTipoPassagem.DataTextField = "nome";
                this.ddlTipoPassagem.DataValueField = "id_tipo_passagem";
                this.ddlTipoPassagem.DataSource = tipoPassDAL.GetAll("nome","ASC");
                this.ddlTipoPassagem.DataBind();
                this.ddlTipoPassagem.Items.Add(new ListItem("Selecione", "0"));
                this.ddlTipoPassagem.SelectedValue = "0";
            }
        }

        protected void PACPassagemBtCancelar_Click(object sender, EventArgs e)
        {
            Get();
        }

        public void Get()
        {
            this.PACPassagemRdEh_internacional.SelectedValue = Convert.ToString(pacPassagem.internacional);

            PACPassagemRdEh_internacional_SelectedIndexChanged(null, null);

            this.PACPassagemRdIda_Volta.SelectedValue = Convert.ToString(pacPassagem.ida_e_volta);
            this.PACPassagemTxtEspecificacao.Text = pacPassagem.especificacao;           
            this.PACPassagemTxtDtIda.Text = Util.DateToString(pacPassagem.DtIda);
            this.PACPassagemTxtDtVolta.Text = Util.DateToString(pacPassagem.DtVolta);
            this.PACPassagemTxtValorTotal.Text = Convert.ToString(pacPassagem.valor_total);
            this.PACPassagemTxtMetaEtapa.Text = pacPassagem.meta_etapa;
            this.PACPassagemTxtRubricaItem.Text = pacPassagem.rubrica_item;
            this.rdPeriodoVolta.SelectedValue = pacPassagem.periodoVolta;
            this.rdPeriodoIda.SelectedValue = pacPassagem.periodoIda;
            //this.ddlTipoPassagem.SelectedValue = pacPassagem.id_tipo_passagem.ToString();
            gridPassageiros.DataSource = pacPassagem.PACPassageiros;
            gridPassageiros.DataBind();
        }

        protected void PACPassagemDllUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            CidadeDAL objCidades = new CidadeDAL();
            PACPassagemDllCidade.DataSource = objCidades.GetCidadesPorUF(PACPassagemDllUF.SelectedValue);
            PACPassagemDllCidade.DataBind();

            if (PACPassagemDllUF.SelectedValue == "SP")
                PACPassagemDllCidade.SelectedValue = "São Paulo";
        }

        protected void setView()
        {
            mvPassagem.SetActiveView(vCadastro);
            pCadastro.Visible = false;
        }

        protected void setAdd()
        {
            mvPassagem.SetActiveView(vCadastro);
            pCadastro.Visible = true;
        }

        protected void setList()
        {
            mvPassagem.SetActiveView(vListar);
        }

        protected void PACPassagemBtAdd_Click(object sender, EventArgs e)
        {
            if (cvPassageiros.IsValid)
            {                
                pacPassagem.ida_e_volta = Convert.ToBoolean(this.PACPassagemRdIda_Volta.SelectedValue);
                pacPassagem.especificacao = this.PACPassagemTxtEspecificacao.Text;
                pacPassagem.quantidade = Convert.ToBoolean(this.PACPassagemRdIda_Volta.SelectedValue) ? 2 * pacPassagem.PACPassageiros.Count() : pacPassagem.PACPassageiros.Count();
                pacPassagem.valor_total = Convert.ToDecimal(this.PACPassagemTxtValorTotal.Text);
                pacPassagem.meta_etapa = this.PACPassagemTxtMetaEtapa.Text;
                pacPassagem.rubrica_item = this.PACPassagemTxtRubricaItem.Text;
                pacPassagem.unidade = "passagem";
                pacPassagem.DtIda = Util.StringToDate(this.PACPassagemTxtDtIda.Text);

                pacPassagem.id_tipo_passagem = Convert.ToInt32(this.ddlTipoPassagem.SelectedValue);

                if (!String.IsNullOrEmpty(this.PACPassagemTxtDtVolta.Text))
                    pacPassagem.DtVolta = Util.StringToDate(this.PACPassagemTxtDtVolta.Text);

                pacPassagem.periodoIda = rdPeriodoIda.SelectedValue;
                pacPassagem.periodoVolta = rdPeriodoVolta.SelectedValue;
                pacPassagem.valor_unitario = Decimal.Round(pacPassagem.valor_total / pacPassagem.quantidade, 2);
                ListPACItens.Add(pacPassagem);

                setList();
                gridBens.DataSource = ListPACItens;
                gridBens.DataBind();
            }
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            setAdd();
            pacPassagem = new PACPassagem();
            Get();
            
        }

        protected void gridBens_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ListPACItens.RemoveAt(e.RowIndex);
            gridBens.DataSource = ListPACItens;
            gridBens.DataBind();
        }

        protected void PACPassagemRdIda_Volta_SelectedIndexChanged(object sender, EventArgs e)
        {
            PACPassagemRfvDtVolta.Enabled = Convert.ToBoolean(this.PACPassagemRdIda_Volta.SelectedValue);
        }

        protected void PACPassageiroBtAdd_Click(object sender, EventArgs e)
        {
            PACPassageiro pacPassageiro = new PACPassageiro();
            if (cvCpf.IsValid)
            {
                pacPassageiro.nome = this.PACPassagemTxtNome.Text;
                pacPassageiro.cpf = this.txtCpf.Text;
                pacPassageiro.rg = this.PACPassagemTxtRg.Text;
                pacPassageiro.passaporte = this.PAcPassagemTxtPassaporte.Text;
                pacPassageiro.Ender = new Endereco();
                pacPassageiro.Ender.logradouro = this.PACPassagemTxtLogradouro.Text;
                pacPassageiro.Ender.numero = this.PACPassagemTxtNumero.Text;
                pacPassageiro.Ender.complemento = this.PACPassagemTxtComplemento.Text;
                pacPassageiro.Ender.bairro = this.PACPassagemTxtBairro.Text;
                pacPassageiro.Ender.cidade = this.PACPassagemDllCidade.SelectedValue;
                pacPassageiro.Ender.uf = this.PACPassagemDllUF.SelectedValue;
                pacPassageiro.Ender.cep = this.PACPassagemTxtCep.Text;

                pacPassageiro.dtNascto = Util.StringToDate(this.PACPassagemTxtDtNascto.Text);
                if (!String.IsNullOrEmpty(this.PACPassagemTxtDtValidadePassaporte.Text))
                    pacPassageiro.validade_passaporte = Util.StringToDate(this.PACPassagemTxtDtValidadePassaporte.Text);
                pacPassageiro.familiar = this.PACPassagemTxtFamiliar.Text;
                pacPassageiro.telefone = this.PACPassagemTxtTelefone.Text;
                pacPassageiro.email = this.PACPassagemTxtEmail.Text;

                pacPassagem.PACPassageiros.Add(pacPassageiro);

                gridPassageiros.DataSource = pacPassagem.PACPassageiros;
                gridPassageiros.DataBind();

                mvPassagem.ActiveViewIndex = 1;
            }
        }

        protected void PACPassageiroBtCancelar_Click(object sender, EventArgs e)
        {
            GetPassageiro(new PACPassageiro());
            mvPassagem.ActiveViewIndex = 1;
        }

        protected void gridPassageiros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            pacPassagem.PACPassageiros.Remove(pacPassagem.PACPassageiros.ToList()[e.RowIndex]);
            gridPassageiros.DataSource = pacPassagem.PACPassageiros;
            gridPassageiros.DataBind();
        }

        protected void cvPassageiros_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = pacPassagem.PACPassageiros.Count() > 0;
        }

        protected void lkAdicionarCondutores_Click(object sender, EventArgs e)
        {
            mvPassagem.ActiveViewIndex = 2;
            GetPassageiro(new PACPassageiro());
            this.ddlPassageiros.SelectedValue = "0";
        }

        public void GetPassageiro(PACPassageiro pacPassageiro)
        {
            this.PACPassagemTxtNome.Text = pacPassageiro.nome;
            this.txtCpf.Text = pacPassageiro.cpf;
            this.PACPassagemTxtRg.Text = pacPassageiro.rg;
            this.PAcPassagemTxtPassaporte.Text = pacPassageiro.passaporte;

            this.PACPassagemTxtLogradouro.Text = pacPassageiro.Ender.logradouro;
            this.PACPassagemTxtNumero.Text = pacPassageiro.Ender.numero;
            this.PACPassagemTxtComplemento.Text = pacPassageiro.Ender.complemento;
            this.PACPassagemTxtBairro.Text = pacPassageiro.Ender.bairro;
            this.PACPassagemTxtCep.Text = pacPassageiro.Ender.cep;
            this.PACPassagemDllUF.SelectedValue = pacPassageiro.Ender.uf;
            this.PACPassagemDllUF_SelectedIndexChanged(null, null);
            this.PACPassagemDllCidade.SelectedValue = pacPassageiro.Ender.cidade;
            this.PACPassagemTxtDtNascto.Text = Util.DateToString(pacPassageiro.dtNascto);
            this.PACPassagemTxtDtValidadePassaporte.Text = Util.DateToString(pacPassageiro.validade_passaporte);
            this.PACPassagemTxtFamiliar.Text = pacPassageiro.familiar;
            this.PACPassagemTxtTelefone.Text = pacPassageiro.telefone;
            this.PACPassagemTxtEmail.Text = pacPassageiro.email;
        }

        protected void PACPassagemRdEh_internacional_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool enabled = Convert.ToBoolean(PACPassagemRdEh_internacional.SelectedValue);
            rfvPassaporte.Enabled = enabled;
            rfvValidadePassaporte.Enabled = enabled;
            rfvFamiliar.Enabled = enabled;           
        }

       
       
        protected void cvCpf_ServerValidate(object source, ServerValidateEventArgs args)
        {
            BLL.CPF cpf = new BLL.CPF(this.txtCpf.Text);
            args.IsValid = cpf.IsValid;                  
        }

        protected void btPassageiro_Click(object sender, EventArgs e)
        {
            PacPassageiroBLL pas = new PacPassageiroBLL();
            pas.Get(Convert.ToInt32(this.ddlPassageiros.SelectedValue));
            GetPassageiro(pas.ObjEF);
            //if (!String.IsNullOrEmpty(pas.ObjEF.cpf))
            //    GetPassageiro(pas.ObjEF);
        }
    }
}