using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Medusa.Controles
{
    public partial class ControleCPF : System.Web.UI.UserControl
    {
        private bool isValid;

        public bool IsValid
        {
            get { return isValid; }
        }


        public bool EnableValidator
        {
            get
            {
                return cvCpf.Enabled;
            }
            set
            {
                cvCpf.Enabled = value;

            }
        }

        public string GetCpf()
        {
            return this.txtCpf.Text.Replace(".","").Replace("-","");
        }

        public void SetCpf(string cpf)
        {
            this.txtCpf.Text = cpf;
        }

        protected void cvCpf_ServerValidate(object source, ServerValidateEventArgs args)
        {
            BLL.CPF cpf = new BLL.CPF(this.txtCpf.Text);
            args.IsValid = cpf.IsValid;
            isValid = args.IsValid;            
        }
    }
}