using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medusa.Classes;

namespace Medusa
{
    public partial class Home : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                base.Page_Load(sender, e);
        }
    }
}