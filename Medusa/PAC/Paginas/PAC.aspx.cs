using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Collections;
using System.Reflection;
using Medusa.Classes;


namespace Medusa.PAC.Paginas
{
    public partial class PAC : BasePage
    {
        public static string listaProjeto = String.Empty;
        public static string listaTipoAquisicao = String.Empty;
        public List<PACItem> ListPACItens
        {
            get
            {
                txtCount.Value = Convert.ToString(((List<PACItem>)ViewState["PACItens"]).Count());
                BtSalvar.Visible = ((List<PACItem>)ViewState["PACItens"]).Count() > 0;
                BtCancelar.Visible = ((List<PACItem>)ViewState["PACItens"]).Count() > 0;
                return (List<PACItem>)ViewState["PACItens"];                
            }
            set
            {
                ViewState["PACItens"] = value;
                txtCount.Value = Convert.ToString(value.Count());     
                BtSalvar.Visible = value.Count() > 0;
                BtCancelar.Visible = value.Count() > 0;
            }
        }
        private Upload objUpload
        {
            get
            {
                if (Session["objUpload"] == null)
                    objUpload = new Upload();
                return (Upload)Session["objUpload"];
            }
            set
            {
                Session["objUpload"] = value;                
            }
        }
        
        public static string strUpload; 
        protected override void Page_Load(object sender, EventArgs e)
        {
            string cpf_usuMySQL = Convert.ToString(Session["cpf_usuMySQL"]);

            if (!String.IsNullOrEmpty(cpf_usuMySQL))
            {
            if (!IsPostBack)
            {
               
                    Seguranca = false;
                    objUpload = new Upload();
                    objUpload.Caminho = Server.MapPath("\\PAC\\cotacoes\\");                    
                    listaProjeto = ddlProjeto.ID;
                    listaTipoAquisicao = rdTipoAquisicao.ID;

                    ListPACItens = new List<PACItem>();

                    VUsuariosMySqlDAL usuMySQL = new VUsuariosMySqlDAL();
                    usuMySQL.Get(cpf_usuMySQL);

                    ddlProjeto.DataSource = usuMySQL.GetCodProjetos();
                    ddlProjeto.DataBind();

                    ddlProjeto.Items.Add(new ListItem("Selecione", "0"));
                    ddlProjeto.SelectedValue = "0";

                    PACTipoAquisicaoBLL pacTipoAquisicaoBLL = new PACTipoAquisicaoBLL();
                    rdTipoAquisicao.DataTextField = "nome";
                    rdTipoAquisicao.DataValueField = "id_tipo_aquisicao";
                    rdTipoAquisicao.DataSource = pacTipoAquisicaoBLL.GetAll("nome", "ASC", 0);
                    rdTipoAquisicao.DataBind();

                    BtSalvar.OnClientClick = "return ValidatePage('Confirma inclusão ?')";
                }             
            }
            else
                Response.Redirect("http://demonstrativo.fusp.org.br");
                //Response.Redirect("~/PAC/Paginas/Login.aspx");
            
        }

        protected void ddlProjeto_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProjetoBLL projBLL = new ProjetoBLL();
            projBLL.GetProjeto(Convert.ToInt32(this.ddlProjeto.SelectedValue));

            gridFinanciadores.DataSource = projBLL.ObjEF.FinProjetos;
            gridFinanciadores.DataBind();

            gridCoordenadores.DataSource = projBLL.ObjEF.CoordenadoresProjetos;
            gridCoordenadores.DataBind();
            
            this.lbUnidade.Text = projBLL.ObjEF.Unidade != null ? projBLL.ObjEF.Unidade.nome : "não cadastrado";
            this.lbDeptoNucleo.Text = projBLL.ObjEF.Departamento != null ? projBLL.ObjEF.Departamento.nome : "não cadastrado";
            this.lbLaboratorio.Text = projBLL.ObjEF.Laboratorio != null ? projBLL.ObjEF.Laboratorio.nome : "não cadastrado";
        }

        protected void rdTipoAquisicao_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListPACItens = new List<PACItem>();
            switch(rdTipoAquisicao.SelectedValue)
            {
                case("1"):
                    {
                        mvTipoCompra.SetActiveView(vBens);                        
                        break;
                    }
                case("2"):
                    {
                        mvTipoCompra.SetActiveView(vServicosPJ);                        
                        break;
                    }
                case ("3"):
                    {
                        mvTipoCompra.SetActiveView(vLocacaoBem);                        
                        break;
                    }
                case ("4"):
                    {
                        mvTipoCompra.SetActiveView(vPassagem);                        
                        break;
                    }
                case ("5"):
                    {
                        mvTipoCompra.SetActiveView(vLocacaoVeiculo);                        
                        break;
                    }
                default:
                    {
                        mvTipoCompra.ActiveViewIndex = -1;
                        break;
                    }
                    
            }
            mvTipoCompra.DataBind();
        }        

        protected void gridCotacoes_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {          
            objUpload.Remove(e.NewSelectedIndex);
            lblMensagemCotacao.Text = String.Empty;
            gridCotacoes.DataSource = objUpload.GetAll();
            gridCotacoes.DataBind();
        }

        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            lblMensagemCotacao.Text = objUpload.Add(fupArquivo);
            gridCotacoes.DataSource = objUpload.GetAll();
            gridCotacoes.DataBind();           
        }

        protected void BtSalvar_Click(object sender, EventArgs e)
        {
            if(String.IsNullOrEmpty(Convert.ToString(Session["cpf_usuMySQL"])))
                Response.Redirect("http://192.168.0.187:8080/html/login.php");
                //Response.Redirect("~/PAC/Paginas/Login.aspx");
            if ((!String.IsNullOrEmpty(Convert.ToString(Session["cpf_usuMySQL"]))) & (ListPACItens.Count() > 0))
            {
                PACBLL pacBLL = new PACBLL();

                ProjetoBLL projBLL = new ProjetoBLL();
                projBLL.GetProjeto(Convert.ToInt32(this.ddlProjeto.SelectedValue));

                pacBLL.ObjEF.id_projeto = projBLL.ObjEF.Id_Projeto;
                pacBLL.ObjEF.id_tipo_aquisicao = Convert.ToInt32(this.rdTipoAquisicao.SelectedValue);
                pacBLL.ObjEF.data = DateTime.Now;
                pacBLL.ObjEF.empresa = this.txtEmpresa.Text;
                pacBLL.ObjEF.cnpj = this.ControleCNPJ2.GetCnpj();
                pacBLL.ObjEF.cpf_requisitante = Convert.ToString(Session["cpf_usuMySQL"]);            
                foreach (PACItem item in ListPACItens)
                        pacBLL.ObjEF.PACItens.Add(item);
                
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "msg", pacBLL.SalvarPAC(objUpload), true);                
                limparCampos();
            }
        }

        protected void limparCampos()
        {
            ddlProjeto.SelectedValue = "0";
            ddlProjeto_SelectedIndexChanged(null, null);
            rdTipoAquisicao.ClearSelection();
            rdTipoAquisicao_SelectedIndexChanged(null, null);
            objUpload.Clear();
            gridCotacoes.DataSource = objUpload.GetAll();
            gridCotacoes.DataBind();
            this.txtEmpresa.Text = String.Empty;
            ControleCNPJ2.SetCnpj(String.Empty);
        }

        protected void BtCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PAC/Paginas/MeusPACs.aspx");
        }

        protected void cvItens_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = ListPACItens.Count() > 0;
        }       
    }
}