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
    public partial class DestinosPACs : BasePage
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

                PACDestinoBLL objBLL = new PACDestinoBLL();                
                this.ddlDestino.DataTextField = "descricao";
                this.ddlDestino.DataValueField = "id_pac_destino";
                this.ddlDestino.DataSource = objBLL.GetAll();
                this.ddlDestino.DataBind();
                this.ddlDestino.Items.Add(new ListItem("Selecione", "0"));
                this.ddlDestino.SelectedValue = "0";
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
            grid.DataSource = objPacBll.GetAllAprovados(this.txtProcura.Text,(string)ViewState["SortExpression"], (string)ViewState["SortDirection"]);
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
            SetGridDestino();
            GetDestino(0);
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

        protected void GetDestino(int intId)
        {
            PAC_PACDestinoBLL obj = new PAC_PACDestinoBLL();
            obj.Get(new KeyValuePair<string, object>("id", intId));

            this.txtId.Text = Convert.ToString(obj.ObjEF.id);
            this.txtReferencia.Text = obj.ObjEF.numero;
            this.ddlDestino.SelectedValue = Convert.ToString(obj.ObjEF.id_pac_destino);
        }

        protected void Set(PAC_PACDestinoBLL obj)
        {
            obj.ObjEF.id = Convert.ToInt32(this.txtId.Text);
            obj.ObjEF.numero = this.txtReferencia.Text;
            obj.ObjEF.id_pac_destino = Convert.ToInt32(this.ddlDestino.SelectedValue);
            obj.ObjEF.id_usuario = Convert.ToInt32(Session["id_usuario"]);
            obj.ObjEF.data = DateTime.Now;
            obj.ObjEF.id_pac = Convert.ToInt32(ViewState["id_pac"]);
        }

        protected void btInserir_Click(object sender, EventArgs e)
        {
            PAC_PACDestinoBLL obj = new PAC_PACDestinoBLL();
            Set(obj);
            obj.Add();
            obj.SaveChanges();
            GetDestino(0);
            SetGridDestino();
        }

        protected void btAlterar_Click(object sender, EventArgs e)
        {
            PAC_PACDestinoBLL obj = new PAC_PACDestinoBLL();
            obj.Get(new KeyValuePair<string, object>("id", Convert.ToInt32(this.txtId.Text)));
            if (obj.ObjEF.id_usuario == Convert.ToInt32(Session["id_usuario"]))
            {
                Set(obj);
                obj.Update();
                obj.SaveChanges();
                GetDestino(0);
                SetAddDestino();
                SetGridDestino();
            }
            else
                lblMsg.Text = "Não é possível alterar ou excluir um destino atribuido por outro usuário!";
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            PAC_PACDestinoBLL obj = new PAC_PACDestinoBLL();
            obj.Get(new KeyValuePair<string, object>("id", Convert.ToInt32(this.txtId.Text)));
            
            if (obj.ObjEF.id_usuario == Convert.ToInt32(Session["id_usuario"]))
            {
                obj.Delete();
                obj.SaveChanges();
                GetDestino(0);
                SetAddDestino();
                SetGridDestino();
            }
            else
                lblMsg.Text = "Não é possível alterar ou excluir um destino atribuido por outro usuário!";
        }

        protected void btCancelar_Click1(object sender, EventArgs e)
        {
            GetDestino(0);
            SetGridDestino();
        }

        protected void gridDestino_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GetDestino(Convert.ToInt32(gridDestino.DataKeys[e.NewSelectedIndex]["id"].ToString()));
            grid.DataBind();
            SetModifyDestino();
            e.Cancel = true;
        }

        

        protected void SetAddDestino()
        {
            lblMsg.Text = String.Empty;          
            btInserir.Visible = true;           
            btAlterar.Visible = false;           
            btExcluir.Visible = false;
           
        }

        protected void SetModifyDestino()
        {
            lblMsg.Text = String.Empty;           
            btInserir.Visible = false;           
            btAlterar.Visible = true;            
            btExcluir.Visible = true;          
        }

        protected void SetGridDestino()
        {
            PAC_PACDestinoBLL obj = new PAC_PACDestinoBLL();
            gridDestino.DataKeyNames = new string[] { "id" };
            int intId_pac = Convert.ToInt32(ViewState["id_pac"]);
            gridDestino.DataSource = obj.Find(it => it.id_pac == intId_pac, "data", "desc");
            gridDestino.DataBind();
            SetAddDestino();
        }


    }
}