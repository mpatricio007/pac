using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medusa.Classes;
using BLL;


namespace Medusa.Account
{
    public partial class AlterarSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (String.IsNullOrEmpty(Convert.ToString(Session["id_usuario"])))
                    Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void btAlterarSenha_Click(object sender, EventArgs e)
        {
            UsuarioBLL usuBLL = new UsuarioBLL();

            usuBLL.Get(new KeyValuePair<string, object>("Id_Usuario", Convert.ToInt32(Session["id_usuario"])));

            if (usuBLL.ObjEF.Id_Usuario != 0)
            {                
                this.lbLog.Text = usuBLL.AlterarSenha(this.txtSenha.Text, this.txtNewSenha.Text);
            }
            else
                this.lbLog.Text = "Usuário não logado!";
        }
    }
}