using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Medusa.Classes;

namespace Medusa.PAC.Paginas
{
    public partial class PACStatus : BasePage
    {
        private const string PRIMARY_KEY = "id_pacstatus";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                SetView();
                SetGrid();
            }
        }

        protected void SetView()
        {
            panelGrid.Visible = true;
            panelCadastro.Visible = false;
        }

        protected void SetAdd()
        {
            lblMsg.Text = String.Empty;
            panelGrid.Visible = false;
            panelCadastro.Visible = true;
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
            panelCadastro.Visible = true;
            panelGrid.Visible = false;
            btInserir.Visible = false;
            btInserir0.Visible = false;
            btAlterar.Visible = true;
            btAlterar0.Visible = true;
            btExcluir.Visible = true;
            btExcluir0.Visible = true;
        }

        protected void SetGrid()
        {
            PACStatusBLL obj = new PACStatusBLL();
            grid.DataKeyNames = new string[] { PRIMARY_KEY };
            grid.DataSource = obj.Find(it => it.nome.Contains(this.txtProcura.Text));
            grid.DataBind();
        }

        protected void Get(int intId)
        {
            PACStatusBLL obj = new PACStatusBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, intId));

            this.txtId.Text = Convert.ToString(obj.ObjEF.id_pacstatus);
            this.txtNome.Text = obj.ObjEF.nome;
            this.txtDescricao.Text = obj.ObjEF.descricao;
            this.ckStatus.Checked = obj.ObjEF.ativo;
            this.ckVisible.Checked = obj.ObjEF.visivel.GetValueOrDefault();
        }

        protected void Set(PACStatusBLL obj)
        {
            obj.ObjEF.id_pacstatus = Convert.ToInt32(this.txtId.Text);
            obj.ObjEF.nome = this.txtNome.Text;
            obj.ObjEF.descricao = this.txtDescricao.Text;
            obj.ObjEF.ativo = this.ckStatus.Checked;
            obj.ObjEF.visivel = this.ckVisible.Checked;
        }

        protected void btInserir_Click(object sender, EventArgs e)
        {
            PACStatusBLL obj = new PACStatusBLL();
            Set(obj);
            obj.Add();
            obj.SaveChanges();
            Get(0);
        }

        protected void btAlterar_Click(object sender, EventArgs e)
        {
            PACStatusBLL obj = new PACStatusBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtId.Text)));
            Set(obj);
            obj.Update();
            obj.SaveChanges();
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            PACStatusBLL obj = new PACStatusBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtId.Text)));
            obj.Delete();
            obj.SaveChanges();
            Get(0);
            SetAdd();
        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
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
    }
}