using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Web.UI.WebControls;

namespace BLL
{
    public class SecurityBLL
    {
        public static string GetMD5Hash(string input)
        {
            System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hash = md5.ComputeHash(inputBytes);
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }

        public static string GeraSenha()
        {
            Random rd = new Random(System.DateTime.Now.Millisecond);
            StringBuilder senha = new StringBuilder();

            for (int i = 0; i < 10; i++)
            {
                char ch = Convert.ToChar(rd.Next('A', 'Z' + 1));
                if (i % 2 == 0)
                    ch = Convert.ToChar(ch.ToString().ToLower());
                senha.Append(ch);
            }
            return senha.ToString();
        }

        public static bool GetPermission(string strUrl, int intId_usuario)
        {
            UsuarioBLL usu = new UsuarioBLL();
            usu.Get(new KeyValuePair<string, object>("Id_Usuario", intId_usuario));
            if (usu.ObjEF.Grupos.Where(it => it.Nome == "admin").FirstOrDefault() != null)
                return true;

            strUrl = strUrl.ToUpper().Replace("ASP.", "");
            strUrl = strUrl.Contains("_ASPX") ? strUrl.Replace("_ASPX", ".ASPX") : strUrl.Replace("_ASCX", ".ASCX");
            strUrl = strUrl.Replace("_", @"/");
            strUrl = @"~/" + strUrl;

            var pgs = from g in usu.ObjEF.Grupos
                        from i in g.Interfaces
                        where i.Url.ToUpper() == strUrl
                        select i;

            return pgs.Count() > 0;
        }

        public static System.Web.UI.WebControls.Menu CreateMenu(int intId_usuario)
        {
            UsuarioBLL usu = new UsuarioBLL();
            usu.Get(new KeyValuePair<string, object>("Id_Usuario", intId_usuario));

            System.Web.UI.WebControls.Menu webMenu = new System.Web.UI.WebControls.Menu();
            webMenu.CssClass = "menu";
            webMenu.EnableViewState = false;
            webMenu.IncludeStyleBlock = false;
            webMenu.Orientation = Orientation.Horizontal;

            var pgs = (from g in usu.ObjEF.Grupos
                       from i in g.Interfaces
                       where i.Tipo == "Página"
                       select i).Distinct();

            var menus = (from p in pgs
                        select p.Menu).Distinct();                
            
            foreach (DAL.Menu mn in menus)
            {
                MenuItem menuItem = new MenuItem();
                menuItem.Text = mn.Nome;
                menuItem.NavigateUrl = mn.Url;

                foreach (Interface interEF in pgs.Where(it => it.Id_Menu == mn.Id_Menu))
                {   
                        MenuItem childMenu = new MenuItem(interEF.Nome);
                        childMenu.NavigateUrl = interEF.Url;
                        childMenu.ToolTip = interEF.Descricao;
                        menuItem.ChildItems.Add(childMenu);
                }
                webMenu.Items.Add(menuItem);
            }
            return webMenu;
        }
    }
}
