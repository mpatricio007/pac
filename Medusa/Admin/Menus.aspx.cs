using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Medusa.Classes;

namespace Medusa.Admin
{
    public partial class Menus : BasePage
    {
        private const string PRIMARY_KEY = "Id_Menu";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                ViewState["SortExpression"] = PRIMARY_KEY;
                ViewState["SortDirection"] = "ASC";
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
            MenuBLL obj = new MenuBLL();
            grid.DataKeyNames = new string[] { PRIMARY_KEY };
            grid.DataSource = obj.Find(it => it.Nome.Contains(this.txtProcura.Text),(string)ViewState["SortExpression"], (string)ViewState["SortDirection"], 1000);
            grid.DataBind();
        }

        protected void Get(int intId)
        {
            MenuBLL obj = new MenuBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, intId));

            this.txtId.Text = Convert.ToString(obj.ObjEF.Id_Menu);
            this.txtNome.Text = obj.ObjEF.Nome;
            this.txtDescricao.Text = obj.ObjEF.Descricao;
            this.txtUrl.Text = obj.ObjEF.Url;
            this.txtUrl_Default.Text = obj.ObjEF.Url_Default;            
        }

        protected void Set(MenuBLL obj)
        {
            obj.ObjEF.Id_Menu = Convert.ToInt32(this.txtId.Text);
            obj.ObjEF.Nome = this.txtNome.Text;
            obj.ObjEF.Descricao = this.txtDescricao.Text;
            obj.ObjEF.Url = this.txtUrl.Text;
            obj.ObjEF.Url_Default = this.txtUrl_Default.Text;
        }

        protected void btInserir_Click(object sender, EventArgs e)
        {
            MenuBLL obj = new MenuBLL();
            Set(obj);
            obj.Add();
            obj.SaveChanges();
            Get(0);
        }

        protected void btAlterar_Click(object sender, EventArgs e)
        {
            MenuBLL obj = new MenuBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtId.Text)));
            Set(obj);
            obj.Update();
            obj.SaveChanges();
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            MenuBLL obj = new MenuBLL();
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

        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid.PageIndex = e.NewPageIndex;
            SetGrid();
        }

        protected void grid_Sorting(object sender, GridViewSortEventArgs e)
        {
            ViewState["SortExpression"] = e.SortExpression;
            SetGrid();

            if (ViewState["SortDirection"].Equals("ASC"))
                ViewState["SortDirection"] = "DESC";
            else
                ViewState["SortDirection"] = "ASC";
        }
    }
}