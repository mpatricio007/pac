using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Reflection;
using Medusa.Classes;

namespace Medusa.PAC.Paginas
{
    public partial class GerenciarPACs : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);

                ViewState["SortExpression"] = "id_pac";
                ViewState["SortDirection"] = "DESC";

                this.btAprovar.OnClientClick = "return ValidatePage('Confirma aprovação ?')";
                this.btRecusar.OnClientClick = "return ValidatePage('Confirma reprovação ?')";
                this.btVoltar.OnClientClick = "return ValidatePage('Confirma retorno para o status anterior ?')";
                SetView();
                SetGrid();

                PACModalidadeCompraBLL objModalidadeBLL = new PACModalidadeCompraBLL();                
                this.ddlModalidade.DataTextField = "nome";
                this.ddlModalidade.DataValueField = "id_modalidade_compra";
                this.ddlModalidade.DataSource = objModalidadeBLL.GetAll();
                this.ddlModalidade.DataBind();
                this.ddlModalidade.Items.Add(new ListItem("Selecione", "0"));
                this.ddlModalidade.SelectedValue = "0";

                
                
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
            grid.DataSource = objPacBll.GetAllPorGrupoUsuario(this.txtProcura.Text,(string)ViewState["SortExpression"], (string)ViewState["SortDirection"]);
            grid.DataBind();

            this.ddlModalidade.Enabled = objPacBll.EnabledModalidade;
            this.cvModalidade.Enabled = objPacBll.EnabledModalidade;
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

            this.txtJustificativa.Text = String.Empty;
            this.ddlModalidade.SelectedValue = objPacBll.ObjEF.PACModalidadeCompra != null ? Convert.ToString(objPacBll.ObjEF.id_modalidade_compra) : "0";
        }

        protected void btAprovar_Click(object sender, EventArgs e)
        {
            mudarStatus("A");
        }

        protected void btRecusar_Click(object sender, EventArgs e)
        {
            mudarStatus("R");
        }

        private void mudarStatus(string acao)
        {
            PACBLL objPacBll = new PACBLL();
            objPacBll.Get(new KeyValuePair<string, object>("id_pac", Convert.ToInt32(ViewState["id_pac"])));

            if(Convert.ToInt32(this.ddlModalidade.SelectedValue) != 0)
                objPacBll.ObjEF.id_modalidade_compra = Convert.ToInt32(this.ddlModalidade.SelectedValue);
            objPacBll.Update();
            objPacBll.SaveChanges();

            objPacBll.MudarStatus(acao, this.txtJustificativa.Text);
            SetView();
            SetGrid();
        }

        protected void btVoltar_Click(object sender, EventArgs e)
        {
            mudarStatus("V");
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