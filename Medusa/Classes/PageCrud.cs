using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Linq.Expressions;

namespace Medusa.Classes
{
    public abstract class PageCrud<T> : BasePage where T : class
    {
        public string PRIMARY_KEY { get; set; }

        private object pkValue;

        public object PkValue
        {
            get 
            {                
                return pkValue;  
            }
            set { pkValue = value; }
        }
        
        public object pk_default { get; set; }
        
        public Panel pGrid { get; set; }
        public Panel pCadastro { get; set; }
        public Label lbMsg { get; set; }
        public Button _btInserir { get; set; }
        public Button _btInserir0 { get; set; }
        public Button _btAlterar { get; set; }
        public Button _btAlterar0 { get; set; }
        public Button _btExcluir { get; set; }
        public Button _btExcluir0 { get; set; }
        public GridView _grid { get; set; }
        public DropDownList _ddlSize { get; set; }
        public DropDownList _ddlOptions { get; set; }
        public DropDownList _ddlMode { get; set; }
        public TextBox _txtProcura { get; set; }


        protected T objBLL;

        public T ObjBLL
        {
            get
            {
                if (objBLL == null)
                {
                    Type tipo = typeof(T);
                    Type[] types = new Type[]{};
                    ConstructorInfo cInfo = tipo.GetConstructor(types);
                    objBLL = (T)cInfo.Invoke(new object[] { });
                }

                return objBLL;
            }
            set { objBLL = value; }
        }

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
            pGrid.Visible = true;
            pCadastro.Visible = false;
        }

        protected void SetAdd()
        {
            lbMsg.Text = String.Empty;
            pGrid.Visible = false;
            pCadastro.Visible = true;
            _btInserir.Visible = true;
            _btInserir0.Visible = true;
            _btAlterar.Visible = false;
            _btAlterar0.Visible = false;
            _btExcluir.Visible = false;
            _btExcluir0.Visible = false;
        }

        protected void SetModify()
        {
            lbMsg.Text = String.Empty;
            pCadastro.Visible = true;
            pGrid.Visible = false;
            _btInserir.Visible = false;
            _btInserir0.Visible = false;
            _btAlterar.Visible = true;
            _btAlterar0.Visible = true;
            _btExcluir.Visible = true;
            _btExcluir0.Visible = true;
        }            

        protected abstract void Get();

        protected abstract void Set();

        protected void btInserir_Click(object sender, EventArgs e)
        {   
            Set();
            Type tipo = typeof(T);
            MethodInfo metodo = tipo.GetMethod("Add");
            metodo.Invoke(ObjBLL, new object[] { });
            metodo = tipo.GetMethod("SaveChanges");
            metodo.Invoke(ObjBLL, new object[] { });
            pkValue = pk_default;
            Get();
        }

        protected void btAlterar_Click(object sender, EventArgs e)
        {

            Type tipo = typeof(T);
            MethodInfo metodo = tipo.GetMethod("Get");
            metodo.Invoke(ObjBLL, new object[] { new KeyValuePair<string, object>(PRIMARY_KEY, pkValue) });

            Set();

            metodo = tipo.GetMethod("Update");
            metodo.Invoke(ObjBLL, new object[] { });

            metodo = tipo.GetMethod("SaveChanges");
            metodo.Invoke(ObjBLL, new object[] { });          
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            Type tipo = typeof(T);
            MethodInfo metodo = tipo.GetMethod("Get");
            metodo.Invoke(ObjBLL, new object[] { new KeyValuePair<string, object>(PRIMARY_KEY, pkValue) });

            metodo = tipo.GetMethod("Delete");
            metodo.Invoke(ObjBLL, new object[] { });

            metodo = tipo.GetMethod("SaveChanges");
            metodo.Invoke(ObjBLL, new object[] { });
            pkValue = pk_default;
            Get();
            SetAdd();
        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            SetGrid();
            SetView();
        }

        protected void btCriar_Click(object sender, EventArgs e)
        {
            pkValue = pk_default;
            Get();            
            SetAdd();
        }

        protected void btProcurar_Click(object sender, EventArgs e)
        {
            SetGrid();
            SetView();
        }

        protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            PkValue = _grid.DataKeys[e.NewEditIndex][PRIMARY_KEY];
            Get();
            _grid.DataBind();
            SetModify();
            e.Cancel = true;
        }

        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            _grid.PageIndex = e.NewPageIndex;
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

        protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            _grid.PageSize = Convert.ToInt32(_ddlSize.SelectedValue);
            SetGrid();
        }

        protected void grid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (!e.Row.Equals(null) & e.Row.RowType.Equals(DataControlRowType.Header))
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (cell.HasControls())
                    {
                        LinkButton button = (LinkButton)cell.Controls[0];

                        if (!button.Equals(null))
                        {
                            Image image = new Image();
                            if (ViewState["SortExpression"].Equals(button.CommandArgument))
                            {
                                if (ViewState["SortDirection"].Equals("ASC"))
                                    image.ImageUrl = @"~/Styles/img/SortAsc.png";
                                else
                                    image.ImageUrl = @"~/Styles/img/SortDesc.png";

                                cell.Controls.Add(image);
                            }
                        }
                    }
                }
            }

        }

        protected void SetGrid()
        {
            int size = 10 * Convert.ToInt32(this._ddlSize.SelectedValue);
            
            _grid.DataKeyNames = new string[] { PRIMARY_KEY };

            Type tipo = typeof(T);            
            Type tipoObjDAL = tipo.GetProperty("ObjEF").PropertyType;
            MethodInfo filterByObjString = tipo.GetMethod("FilterByObjString");

            MethodInfo find = tipo.GetMethods().Where(it => it.Name == "Find").First();
            var ds = find.Invoke(ObjBLL, new object[] { filterByObjString.Invoke(ObjBLL, new object[]{ this._txtProcura.Text , this._ddlOptions.SelectedValue, this._ddlMode.SelectedValue}),
                (string)ViewState["SortExpression"], (string)ViewState["SortDirection"], size});

            _grid.DataSource = ds;
            _grid.DataBind();
        }
    }
}
