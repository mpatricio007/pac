using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Medusa.Classes;

namespace Medusa.PAC.Paginas
{
    public partial class DetalhePAC : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                PACBLL objPacBll = new PACBLL();
                int id_pac = 0;
                if (int.TryParse(Request.QueryString["id_pac"], out id_pac))
                {
                    objPacBll.Get(new KeyValuePair<string, object>("id_pac", id_pac));
                    if (objPacBll.ObjEF.id_pac != 0)
                        ControlePACDetalhe1.Get(objPacBll);
                    else
                    {
                        ControlePACDetalhe1.Visible = false;
                        lblMsg.Text = "PAC inexistente!";
                    }
                }
                else
                    ControlePACDetalhe1.Visible = false;
            }
        }
    }
}