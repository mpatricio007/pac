using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BLL;

namespace Medusa.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
  
        }
        protected void btLogin_Click(object sender, EventArgs e)
        {
            string saida = String.Empty;
            UsuarioBLL userBLL = new UsuarioBLL();
            Session["id_usuario"] = userBLL.Login(this.txtLogin.Text,this.txtSenha.Text,out saida);
            this.lbLog.Text = saida;
            if((int)Session["id_usuario"] != 0)
                Response.Redirect("../Home.aspx");
                
        }
        protected void btEsqueceuSenha_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EsqueceuSenha.aspx");
        }
    }
}
