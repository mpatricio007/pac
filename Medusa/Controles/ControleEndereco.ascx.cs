using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace Medusa.Controles
{
    public partial class ControleEndereco : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setUf();
                this.ddlUf.SelectedValue = "SP";

                setCidades(this.ddlUf.SelectedValue);            
                this.ddlCidade.SelectedValue = "São Paulo";

                setPais();
                this.ddlPais.SelectedValue = "BRASIL";
            }
        }

        public void SetEndereco(EnderecoInternacional end)
        {
            end.pais = ddlPais.SelectedValue;
            end.cep = txtCep.Text;
            end.numero = txtNum.Text;
            end.bairro = txtBairro.Text;
            end.logradouro = txtLogradouro.Text;
            end.complemento = txtComplemento.Text;
            if (end.pais.Equals("BRASIL"))
            {
                end.cidade = ddlCidade.SelectedValue;
                end.uf = ddlUf.SelectedValue;
            }
            else
            {
                end.cidade = txtCidade.Text;
                end.uf = txtUf.Text;
            }
        }

        public void GetEndereco(EnderecoInternacional end)
        {
            setPais();

            if (!String.IsNullOrEmpty(end.pais))
                this.ddlPais.SelectedValue = end.pais;
            else
                this.ddlPais.SelectedValue = "BRASIL";
            ddlPaisChanged(String.IsNullOrEmpty(end.pais) ? "BRASIL" : end.pais);
            this.txtCep.Text = end.cep;
            this.txtNum.Text = end.numero;
            this.txtBairro.Text = end.bairro;
            this.txtLogradouro.Text = end.logradouro;
            this.txtComplemento.Text = end.complemento;
            if (this.ddlPais.SelectedValue.Equals("BRASIL"))
            {
                setUf();
                this.ddlUf.SelectedValue = String.IsNullOrEmpty(end.uf) ? "SP" : end.uf;
                setCidades(this.ddlUf.SelectedValue);

                this.ddlCidade.SelectedValue = String.IsNullOrEmpty(end.cidade) ? "São Paulo" : end.cidade;
            }
        }

        protected void ddlUf_SelectedIndexChanged(object sender, EventArgs e)
        {
            setCidades(this.ddlUf.SelectedValue);
        }

        protected void btCEP_Click(object sender, EventArgs e)
        {
            CepBLL cepBLL = new CepBLL();            
            GetEndereco(cepBLL.GetEndereco(this.txtCep.Text));
        }

        protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPaisChanged(this.ddlPais.SelectedValue);
        }

        private void ddlPaisChanged(string pais)
        {
            bool enable = pais != "BRASIL";
            this.txtCidade.Visible = enable;
            this.rfvCidade.Enabled = enable;
            this.txtUf.Visible = enable;
            this.rfvUf.Enabled = enable;
            this.ddlCidade.Visible = !enable;
            this.ddlUf.Visible = !enable;
            this.txtCep_MaskedEditExtender.Enabled = !enable;
            this.txtCep.Text = String.Empty;
            this.mevCep.ValidationExpression = enable ? String.Empty : @"\d{5}\-\d{3}";
        }

        protected void setUf()
        {
            EstadosDAL objEstados = new EstadosDAL();
            this.ddlUf.DataSource =objEstados.ListaEstados();
            this.ddlUf.DataBind();

            this.ddlUf.Items.Add(new ListItem("UF", "UF"));
        }

        protected void setCidades(string uf)
        {
            CidadeDAL objCidades = new CidadeDAL();
            if (uf == "UF")
            {
                this.ddlCidade.Items.Clear();
                this.ddlCidade.DataBind();
                this.ddlCidade.Enabled = false;
            }
            else
            {
                this.ddlCidade.DataSource = objCidades.GetCidadesPorUF(uf);
                this.ddlCidade.DataBind();
                this.ddlCidade.Items.Add(new ListItem("Selecione", String.Empty));
                this.ddlCidade.Enabled = true;
            }
        }

        protected void setPais()
        {
            PaisBLL paisBLL = new PaisBLL();
            this.ddlPais.DataSource = paisBLL.GetAll("ASC", "Nome",0);
            this.ddlPais.DataBind();
        }
    }
}