using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;

namespace BLL
{
    public class RelatorioTotaisContratos
    {
        public string tipo_bolsa { get; set; }

        public int total { get; set; }

        public decimal soma_total { get; set; }

        public RelatorioTotaisContratos()
        {
            
        }


        public IQueryable<RelatorioTotaisContratos> GetContratos(string strDtPagtoDe, string strDtPagtoAte)
        {
            DateTime dtPagtoDe;
            DateTime dtPagtoAte;
            DateTime.TryParse(strDtPagtoDe, out dtPagtoDe);
            DateTime.TryParse(strDtPagtoAte, out dtPagtoAte);

            var ctx = new MedusaEntities();


            return from c in ctx.ContratoBolsa
                     where c.suspenso == false & c.inicio_contrato >= dtPagtoDe & c.inicio_contrato <= dtPagtoAte
                     orderby c.Bolsa.Sigla
                     group c by new { c.Bolsa }
                         into g
                         select new RelatorioTotaisContratos()
                         {
                             tipo_bolsa = g.Key.Bolsa.Sigla,
                             total = g.Count(),
                         };
        }
    }
}