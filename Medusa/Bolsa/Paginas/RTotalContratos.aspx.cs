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
    public partial class RTotalContratos : BasePage
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
            ReportParameter[] parameters = new ReportParameter[2];
            parameters[0] = new ReportParameter("de", this.txtDataPagtoDe.Text);
            parameters[1] = new ReportParameter("ate", this.txtDataPagtoAte.Text);
            rvPagamentosMes.LocalReport.SetParameters(parameters);
            var objBLL = new RelatorioTotaisContratos();
            ReportDataSource rpDS = new ReportDataSource("dsContratos", objBLL.GetContratos(this.txtDataPagtoDe.Text, this.txtDataPagtoAte.Text));
            this.rvPagamentosMes.LocalReport.DataSources.Clear();
            this.rvPagamentosMes.LocalReport.DataSources.Add(rpDS);


            var objBLL1 = new VPagtosBolsistasBLL();
            ReportDataSource rpDS1 = new ReportDataSource("dsPgtos", objBLL1.GetPagtosPorMesAno(this.txtDataPagtoDe.Text, this.txtDataPagtoAte.Text));
            this.rvPagamentosMes.LocalReport.DataSources.Add(rpDS1);


            this.rvPagamentosMes.LocalReport.Refresh();
            this.rvPagamentosMes.Visible = true;
        }
    }
}