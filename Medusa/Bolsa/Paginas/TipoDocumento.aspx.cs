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
    public partial class TipoDocumento : PageCrud<TipoDocumentoBLL>
    {
         protected override void Page_Load(object sender, EventArgs e)
        {
            PRIMARY_KEY = "Id_TipoDocumento";
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

            this.txtCodigo.Text = Convert.ToString(ObjBLL.ObjEF.Id_TipoDocumento);
            this.txtNome.Text = ObjBLL.ObjEF.Nome;            
            this.ckStatus.Checked = ObjBLL.ObjEF.Status;
        }

        protected override void Set()
        {
            ObjBLL.ObjEF.Id_TipoDocumento = Convert.ToInt32(this.txtCodigo.Text);            
            ObjBLL.ObjEF.Nome = this.txtNome.Text;            
            ObjBLL.ObjEF.Status = this.ckStatus.Checked;
        }
    }
    
}