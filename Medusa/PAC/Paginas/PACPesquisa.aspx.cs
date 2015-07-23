using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using BLL;
using Medusa.Classes;

namespace Medusa.PAC.Paginas
{
    public partial class PACPesquisa : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                ViewState["SortExpression"] = "id_pac";
                ViewState["SortDirection"] = "DESC";
                SetView();
                SetGrid();
            }
        }

        protected void SetView()
        {
            panelGrid.Visible = true;
            panelCadastro.Visible = false;
        }

        protected void SetGrid()
        {
            PACBLL objPacBll = new PACBLL();
            grid.DataSource = objPacBll.GetAll(this.txtProcura.Text,(string)ViewState["SortExpression"], (string)ViewState["SortDirection"]);
            grid.DataBind();
        }

        protected void SetModify()
        {
            panelCadastro.Visible = true;
            panelGrid.Visible = false;
        }

        protected void btProcurar_Click(object sender, EventArgs e)
        {
            SetGrid();
            SetView();
        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            SetGrid();
            SetView();
        }

        protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            SetModify();
            Get(Convert.ToInt32(grid.DataKeys[e.NewEditIndex]["id_pac"].ToString()));
            grid.DataBind();
            e.Cancel = true;
        }

        protected void Get(int intId)
        {
            ViewState["id_pac"] = intId;
            PACBLL objPacBll = new PACBLL();

            objPacBll.Get(new KeyValuePair<string, object>("id_pac", intId));
            ControlePACDetalhe1.Get(objPacBll);
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