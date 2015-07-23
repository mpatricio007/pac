using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medusa.Classes;
using BLL;

namespace Medusa.Styles
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setMenu();
                viewLogin();
            }
            Common.RegisterStyleSheet(StyleSheet, Common.GetHost() + "Shared/StyleSheet/jquery.css");
            Common.RegisterStyleSheet(StyleSheet, Common.GetHost() + "Shared/StyleSheet/jquery.dateentry.css");
            Common.RegisterStyleSheet(StyleSheet, Common.GetHost() + "Shared/StyleSheet/jquery.timeentry.css");
            
        }

        protected void setMenu()
        {
            int id_usuario = Convert.ToInt32(Session["id_usuario"]);
            if (id_usuario != 0)
            {

                cphMenu.Controls.Clear();
                cphMenu.Controls.Add(SecurityBLL.CreateMenu(id_usuario));
            }
        }

        protected void lbSair_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            viewLogin();
            Response.Redirect("~/Account/Login.aspx");
        }

        protected void viewLogin()
        {
            int id_usuario = Convert.ToInt32(Session["id_usuario"]);
            UsuarioBLL usuBLL = new UsuarioBLL();
            usuBLL.Get(new KeyValuePair<string, object>("Id_Usuario", id_usuario));            
            lkAlterarSenha.Visible = (id_usuario != 0);
            lbLogin.Visible = (id_usuario == 0);
            lbSair.Visible = (id_usuario != 0);
           
            if (id_usuario != 0)            
                this.txtUser.Text = String.Format("Bem-vindo, {0}!", usuBLL.ObjEF.Nome);            
            else
                this.txtUser.Text = String.Empty;
        }
    }
}