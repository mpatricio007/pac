using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medusa.Classes;
using BLL;
using DAL;

namespace Medusa.Styles
{
    public partial class SitePAC : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   
                viewLogin();
            }
            Common.RegisterStyleSheet(StyleSheet, Common.GetHost() + "Shared/StyleSheet/jquery.css");
            Common.RegisterStyleSheet(StyleSheet, Common.GetHost() + "Shared/StyleSheet/jquery.dateentry.css");
            Common.RegisterStyleSheet(StyleSheet, Common.GetHost() + "Shared/StyleSheet/jquery.timeentry.css");
            
        }

        protected void lbSair_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            viewLogin();
            //Response.Redirect("~/pac/paginas/login.aspx");
            Response.Redirect("http://demonstrativo.fusp.org.br");
        }

        protected void viewLogin()
        {
            VUsuariosMySqlDAL usuMySQL = new VUsuariosMySqlDAL();
            usuMySQL.Get(Convert.ToString(Session["cpf_usuMySQL"]));
            lkAlterarSenha.Visible = !String.IsNullOrEmpty(usuMySQL.ObjEF.cpf);
            lbLogin.Visible = String.IsNullOrEmpty(usuMySQL.ObjEF.cpf);
            lbSair.Visible = !String.IsNullOrEmpty(usuMySQL.ObjEF.cpf);

            if (!String.IsNullOrEmpty(usuMySQL.ObjEF.cpf))
                this.txtUser.Text = String.Format("Bem-vindo, {0}!", usuMySQL.ObjEF.nome);
            else
                this.txtUser.Text = String.Empty;
        }
    }
}