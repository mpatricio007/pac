using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Medusa.Controles
{
    public partial class ControleCNPJ : System.Web.UI.UserControl
    {
        private bool isValid;

        public bool IsValid
        {
            get { return isValid; }
        }

        public string GetCnpj()
        {
            return this.txtCnpj.Text;
        }

        public void SetCnpj(string cnpj)
        {
            this.txtCnpj.Text = cnpj;
        }

        protected void cvCnpj_ServerValidate(object source, ServerValidateEventArgs args)
        {
            BLL.CNPJ cnpj = new BLL.CNPJ(this.txtCnpj.Text);
            args.IsValid = cnpj.IsValid;
            isValid = args.IsValid;
        }
    }
}