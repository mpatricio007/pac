using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace Medusa.PAC.Paginas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string saida = Request.QueryString["msg"];
                this.lbLog.Text = saida;
            }
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {            
            Response.Redirect(String.Format("~/PAC/Paginas/MeusPACs.aspx?um={0}&pm={1}",
                this.txtLogin.Text.Replace(".","").Replace("-","")
                , MD5.GetMD5Hash(this.txtSenha.Text)));
        }

        protected void btEsqueceuSenha_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://demonstrativo.fusp.org.br/esqueceu.php");
        }
    }
}