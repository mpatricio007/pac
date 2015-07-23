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
    public partial class Usuarios : BasePage
    {
        private const string PRIMARY_KEY = "Id_Usuario";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                setTextDateEntry(txtDtNascto, TextboxDateEntryType.Full, true, true, "-100:+50");

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

            this.txtSenha.Enabled = true;
            this.txtSenha2.Enabled = true;
            this.rfvSenha.Enabled = true;
            this.rfvSenha2.Enabled = true;
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
            
            this.txtSenha.Enabled = false;
            this.txtSenha2.Enabled = false;
            this.rfvSenha.Enabled = false;
            this.rfvSenha2.Enabled = false;

        }

        protected void SetGrid()
        {
            UsuarioBLL obj = new UsuarioBLL();
            grid.DataKeyNames = new string[] { PRIMARY_KEY };
            grid.DataSource = obj.Find(it => it.Nome.Contains(this.txtProcura.Text), (string)ViewState["SortExpression"], (string)ViewState["SortDirection"], 1000);
            grid.DataBind();
        }

        protected void Get(int intId)
        {
            GrupoBLL objInter = new GrupoBLL();
            ckGrupos.DataTextField = "Nome";
            ckGrupos.DataValueField = "Id_grupo";
            ckGrupos.DataSource = objInter.GetAll();
            ckGrupos.DataBind();                

            UsuarioBLL obj = new UsuarioBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, intId));

            this.txtId.Text = Convert.ToString(obj.ObjEF.Id_Usuario);
            this.txtNome.Text = obj.ObjEF.Nome;
            this.txtEmail.Text = obj.ObjEF.Email;
            this.txtLogin.Text = obj.ObjEF.Login;
            this.txtRamal.Text = obj.ObjEF.Ramal;
            this.txtDtNascto.Text =  Util.DateToString(obj.ObjEF.DtNascto);

            ckGrupos.ClearSelection();
            foreach(Grupo gr in obj.ObjEF.Grupos)            
                ckGrupos.Items.FindByValue(Convert.ToString(gr.Id_grupo)).Selected = true;   
        }

        protected void Set(UsuarioBLL obj)
        {            
            obj.ObjEF.Nome = this.txtNome.Text;
            obj.ObjEF.Email = this.txtEmail.Text;
            obj.ObjEF.Login = this.txtLogin.Text;
            obj.ObjEF.Ramal = this.txtRamal.Text;
            obj.ObjEF.DtNascto = Util.StringToDate(this.txtDtNascto.Text);
            
            obj.lstGrupos = new List<int>();            
            foreach (ListItem item in ckGrupos.Items)
                if (item.Selected)
                    obj.lstGrupos.Add(Convert.ToInt32(item.Value));             
        }

        protected void btInserir_Click(object sender, EventArgs e)
        {
            UsuarioBLL obj = new UsuarioBLL();
            Set(obj);
            obj.ObjEF.Senha = SecurityBLL.GetMD5Hash(this.txtSenha.Text);
            obj.Add();
            obj.SaveChanges();
            Get(0);
        }

        protected void btAlterar_Click(object sender, EventArgs e)
        {
            UsuarioBLL obj = new UsuarioBLL();
            obj.Get(new KeyValuePair<string, object>(PRIMARY_KEY, Convert.ToInt32(this.txtId.Text)));
            Set(obj);
            obj.Update();
            obj.SaveChanges();
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            UsuarioBLL obj = new UsuarioBLL();
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