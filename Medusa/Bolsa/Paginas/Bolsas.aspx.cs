using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medusa.Classes;
using BLL;


namespace Medusa.Bolsa.Paginas
{
    public partial class Bolsas : PageCrud<BolsaBLL>
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            PRIMARY_KEY = "Id";
            pk_default = 0;
            
            if(!String.IsNullOrEmpty(this.txtCodigo.Text))
                PkValue = Convert.ToInt32(this.txtCodigo.Text);
            pGrid = panelGrid;
            pCadastro = panelCadastro;
            _grid = grid;
            lbMsg = lblMsg;
            _btAlterar = btAlterar;
            _btAlterar0 = btAlterar0;
            _btInserir = btInserir;
            _btInserir0 = btInserir0;
            _btExcluir = btExcluir;
            _btExcluir0 = btExcluir0;
            _ddlSize = ddlSize;
            _ddlMode = ddlMode;
            _ddlOptions = ddlOptions;
            _txtProcura = txtProcura;

            if (!IsPostBack)
                base.Page_Load(sender, e);
        }

        protected override void Get()
        {
            ObjBLL.Get(new KeyValuePair<string, object>(PRIMARY_KEY, PkValue));

            this.txtCodigo.Text = Convert.ToString(ObjBLL.ObjEF.Id);
            this.txtNome.Text = ObjBLL.ObjEF.Nome;
            this.txtSigla.Text = ObjBLL.ObjEF.Sigla;
            this.ckStatus.Checked = ObjBLL.ObjEF.Status;
            this.txtNumHoras.Text = Convert.ToString(ObjBLL.ObjEF.Num_Horas);
            this.rdExcluirFechamento.SelectedValue = Convert.ToString(ObjBLL.ObjEF.excluir_do_fechamento);
            this.txtNumDespesa.Text = ObjBLL.ObjEF.num_despesa;
        }

        protected override void Set()
        {
            ObjBLL.ObjEF.Id = Convert.ToInt32(this.txtCodigo.Text);            
            ObjBLL.ObjEF.Nome = this.txtNome.Text;
            ObjBLL.ObjEF.Sigla = this.txtSigla.Text;
            ObjBLL.ObjEF.Status = this.ckStatus.Checked;
            ObjBLL.ObjEF.Num_Horas = Convert.ToInt32(this.txtNumHoras.Text);
            ObjBLL.ObjEF.excluir_do_fechamento = Convert.ToBoolean(this.rdExcluirFechamento.SelectedValue);
            ObjBLL.ObjEF.num_despesa = this.txtNumDespesa.Text;
        }

       
    }
}