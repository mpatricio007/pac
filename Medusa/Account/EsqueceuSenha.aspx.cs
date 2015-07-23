using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;


namespace Medusa.Account
{
    public partial class EsqueceuSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              
        }

        protected void btSendSenha_Click(object sender, EventArgs e)
        {
            UsuarioBLL usuBLL = new UsuarioBLL();

            usuBLL.Get(new KeyValuePair<string, object>("Id_Usuario", Convert.ToInt32(Session["id_usuario"])));

            if (usuBLL.ObjEF.Id_Usuario != 0)
            {
                this.lbLog.Text = String.Format("Usuário {0} logado!", usuBLL.ObjEF.Nome);              
            }
            else
                this.lbLog.Text = usuBLL.SendPasswordEmail(this.txtLogin.Text);
        }
    }
}