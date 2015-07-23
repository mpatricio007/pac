using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using Medusa.Classes;

namespace Medusa.Admin
{
    public partial class Grupos : BasePage
    {
        private const string PRIMARY_KEY = "Id_grupo";

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
            GrupoBLL obj = new GrupoBLL();
            grid.DataKeyNames = new string[] { PRIMARY_KEY };
            grid.DataSource = obj.Find(it => it.Nome.Contains(this.txtProcura.Text), (string)ViewState["SortExpression"], (string)ViewState["SortDirection"], 1000);
            grid.DataBind();
        }

        protected void Get(int intId)
        {
            InterfaceBLL objInter = new InterfaceBLL();
            ckInterfaces.DataTextField = "Url";
            ckInterfaces.DataValueField = "Id_interface";
            ckInterfaces.DataSource = objInter.GetAll();
            ckInterfaces.DataBind();                

            GrupoBLL obj = new GrupoBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, intId));

            this.txtId.Text = Convert.ToString(obj.ObjEF.Id_grupo);
            this.txtNome.Text = obj.ObjEF.Nome;
            this.txtSigla.Text = obj.ObjEF.Sigla;

            ckInterfaces.ClearSelection();
            foreach(Interface inter in obj.ObjEF.Interfaces)            
                ckInterfaces.Items.FindByValue(Convert.ToString(inter.Id_interface)).Selected = true;   
        }

        protected void Set(GrupoBLL obj)
        {
            obj.ObjEF.Id_grupo = Convert.ToInt32(this.txtId.Text);
            obj.ObjEF.Nome = this.txtNome.Text;
            obj.ObjEF.Sigla = this.txtSigla.Text;
            
            obj.lstInterfaces = new List<int>();            
            foreach (ListItem item in ckInterfaces.Items)
                if (item.Selected)
                    obj.lstInterfaces.Add(Convert.ToInt32(item.Value));             
        }

        protected void btInserir_Click(object sender, EventArgs e)
        {
            GrupoBLL obj = new GrupoBLL();
            Set(obj);
            obj.Add();
            obj.SaveChanges();
            Get(0);
        }

        protected void btAlterar_Click(object sender, EventArgs e)
        {
            GrupoBLL obj = new GrupoBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtId.Text)));
            Set(obj);
            obj.Update();
            obj.SaveChanges();
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            GrupoBLL obj = new GrupoBLL();
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