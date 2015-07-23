using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using Medusa.Classes;

namespace Medusa.PAC.Paginas
{
    public partial class PrintPac : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                PACBLL objPacBll = new PACBLL();
                int id_pac = 0;
                if (int.TryParse(Request.QueryString["id"], out id_pac))
                {
                    objPacBll.Get(new KeyValuePair<string, object>("id_pac", id_pac));
                    Get(objPacBll);
                }
                else
                    Response.Redirect("~/pac/paginas/Pacpesquisa.aspx");
            }
        }

        public void Get(PACBLL objPacBll)
        {
            bem.Visible = false;
            servicospj.Visible = false;
            locacaobem.Visible = false;
            locacaoveiculos.Visible = false;
            passagem.Visible = false;

            VUsuariosMySqlDAL usuMySQL = new VUsuariosMySqlDAL();
            usuMySQL.Get(objPacBll.ObjEF.cpf_requisitante);
            this.lbNomeSolicitante.Text = usuMySQL.ObjEF.nome;
            this.lbCPFSolicitante.Text = usuMySQL.ObjEF.cpf;
            this.lbEmailSolicitante.Text = usuMySQL.ObjEF.email;


            this.lbId_pac.Text = Convert.ToString(objPacBll.ObjEF.id_pac);
            this.lbProjeto.Text = Convert.ToString(objPacBll.ObjEF.Projeto.CodDef_Projeto.GetValueOrDefault());
            this.lbEmpresa.Text = objPacBll.ObjEF.empresa;
            this.lbCnpj.Text = objPacBll.ObjEF.cnpj;
            this.lbModalidade.Text = objPacBll.ObjEF.PACModalidadeCompra != null ? objPacBll.ObjEF.PACModalidadeCompra.nome : String.Empty;
            gridFinanciadores.DataSource = objPacBll.ObjEF.Projeto.FinProjetos;
            gridFinanciadores.DataBind();

            gridCoordenadores.DataSource = objPacBll.ObjEF.Projeto.CoordenadoresProjetos;
            gridCoordenadores.DataBind();

            this.lbUnidade.Text = objPacBll.ObjEF.Projeto.Unidade != null ? objPacBll.ObjEF.Projeto.Unidade.nome : "não cadastrado";
            this.lbDeptoNucleo.Text = objPacBll.ObjEF.Projeto.Departamento != null ? objPacBll.ObjEF.Projeto.Departamento.nome : "não cadastrado";
            this.lbLaboratorio.Text = objPacBll.ObjEF.Projeto.Laboratorio != null ? objPacBll.ObjEF.Projeto.Laboratorio.nome : "não cadastrado";

            DataList dt = (DataList)FindControl(objPacBll.ObjEF.PACTipoAquisicao.descricao);
            dt.Visible = true;
            dt.DataSource = objPacBll.ObjEF.PACItens;
            dt.DataBind();
            
        }
    }
}