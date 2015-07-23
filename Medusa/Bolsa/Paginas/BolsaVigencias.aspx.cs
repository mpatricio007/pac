using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Medusa.Classes;

namespace Medusa.Bolsa.Paginas
{
    public partial class BolsaVigencias : PageCrud<BolsaVigenciaBLL>
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            PRIMARY_KEY = "Id";
            pk_default = 0;
            
            if (!String.IsNullOrEmpty(this.txtCodigo.Text))
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
            {

                setTextDateEntry(txtInicio, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(txtTermino, TextboxDateEntryType.Full, true, true, "-100:+50");

                BolsaBLL bol = new BolsaBLL();
                dllBolsa.DataTextField = "Nome";
                dllBolsa.DataValueField = "Id";

                dllBolsa.DataSource = bol.GetAll();
                dllBolsa.DataBind();

                dllBolsa.Items.Add(new ListItem("Selecione", "0"));
                dllBolsa.SelectedValue = "0";
                base.Page_Load(sender, e);
            }
        }

        protected override void Get()
        {
            ObjBLL.Get(new KeyValuePair<string, object>(PRIMARY_KEY, PkValue));

            this.txtCodigo.Text = Convert.ToString(ObjBLL.ObjEF.Id);
            this.txtInicio.Text =  Util.DateToString(ObjBLL.ObjEF.inicio);
            this.txtTermino.Text = Util.DateToString(ObjBLL.ObjEF.termino);
            this.txtValor.Text = Convert.ToString(ObjBLL.ObjEF.valor);
            this.ckStatus.Checked = ObjBLL.ObjEF.status;
            this.dllBolsa.SelectedValue = Convert.ToString(ObjBLL.ObjEF.Id_bolsa);
        }

        protected override void Set()
        {
            ObjBLL.ObjEF.Id = Convert.ToInt32(this.txtCodigo.Text);
            ObjBLL.ObjEF.inicio = Util.StringToDate(this.txtInicio.Text);
            ObjBLL.ObjEF.termino = Util.StringToDate(this.txtTermino.Text);
            ObjBLL.ObjEF.valor = Convert.ToDecimal(this.txtValor.Text);
            ObjBLL.ObjEF.status = ckStatus.Checked;
            ObjBLL.ObjEF.Id_bolsa = Convert.ToInt32(this.dllBolsa.SelectedValue);
        }
    }
}