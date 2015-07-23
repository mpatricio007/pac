using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Microsoft.Reporting.WebForms;
using Medusa.Classes;

namespace Medusa.Bolsa.Paginas
{
    public partial class RelatorioPagtoBolsistas : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setTextDateEntry(txtDataPagtoDe, TextboxDateEntryType.Full, true, true, "-100:+50");
                setTextDateEntry(txtDataPagtoAte, TextboxDateEntryType.Full, true, true, "-100:+50");
                base.Page_Load(sender, e);
            }
        }

        protected void btGerarRelatorio_Click(object sender, EventArgs e)
        {
            VPagtosBolsistasBLL objBLL = new VPagtosBolsistasBLL();
            ReportDataSource rpDS = new ReportDataSource("dsPgtos", objBLL.GetPagtosPorMesAno(this.txtMes.Text, this.txtAno.Text, this.rdPago.SelectedValue, this.txtDataPagtoDe.Text, this.txtDataPagtoAte.Text,this.txtProjeto.Text));
            this.rvPagamentosMes.LocalReport.DataSources.Clear();
            this.rvPagamentosMes.LocalReport.DataSources.Add(rpDS);
            this.rvPagamentosMes.LocalReport.Refresh();
            this.rvPagamentosMes.Visible = true;
        }
    }
}