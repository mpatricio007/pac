using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Medusa.Classes;

namespace Medusa.Bolsa.Paginas
{
    public partial class Fechamento : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                setTextDateEntry(txtDtPagto, TextboxDateEntryType.Full, true, true, "-100:+50");                
            }
        }
     
        protected void btFecharFolha_Click(object sender, EventArgs e)
        {
            string msg = String.Empty;
            VPagtosBolsistasBLL objBLL = new VPagtosBolsistasBLL();
            objBLL.FecharFolha(this.txtMes.Text, this.txtAno.Text, this.txtDtPagto.Text,out msg);
            lblMsg.Text = msg;
        }
    }
}