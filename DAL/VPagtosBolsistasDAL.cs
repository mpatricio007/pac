using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;

namespace DAL
{
    public class VPagtosBolsistasDAL : Abstract_Crud<vPagtosBolsistas>
    {
        public IQueryable<vPagtosBolsistas> GetPagtosPorMesAno(string strMes,string strAno,string strBlPago,string strDtPagtoDe,string strDtPagtoAte,string strProjeto, string strCpf = "" )
        {
            int mes;
            int ano;
            int projeto;
            bool pago;
            DateTime dtPagtoDe;
            DateTime dtPagtoAte;    
            bool.TryParse(strBlPago, out pago);

            var ds =  Find(it => it.cancelado == false,"nome_bolsista","ASC");

            if(int.TryParse(strMes,out mes) & int.TryParse(strAno,out ano))
                ds = ds.Where(it => it.ano == ano & it.mes <= mes);

            if (int.TryParse(strProjeto, out projeto))
                ds = ds.Where(it => it.projeto == projeto);

            if (pago)
            {
                if (DateTime.TryParse(strDtPagtoDe, out dtPagtoDe) & DateTime.TryParse(strDtPagtoAte, out dtPagtoAte))
                    ds = ds.Where(it => it.data_pgto >= dtPagtoDe & it.data_pgto <= dtPagtoAte);
                else
                    ds = ds.Where(it => it.data_pgto.HasValue);
            }
            
            else
                ds = ds.Where(it => !it.data_pgto.HasValue);

            if (!String.IsNullOrEmpty(strCpf))
                ds = ds.Where(it => it.cpf_bolsista == strCpf);
            return ds;
        }

        //public IQueryable<vPagtosBolsistas> GetPagtosPorMesAno(string strMes, string strAno, string strProjeto, string strCpf, string strDtPagtoDe, string strDtPagtoAte)
        //{
        //    int mes;
        //    int ano;
        //    int projeto;
        //    DateTime dtPagtoDe;
        //    DateTime dtPagtoAte;    

        //    var ds = Find(it => it.cancelado == false & it.data_pgto.HasValue, "nome_bolsista", "ASC");

        //    if (!String.IsNullOrEmpty(strCpf))
        //        ds = ds.Where(it => it.cpf_bolsista == strCpf);
        //    if (int.TryParse(strMes, out mes) & int.TryParse(strAno, out ano))
        //        ds = ds.Where(it => it.ano == ano & it.mes <= mes);

        //    if (int.TryParse(strProjeto, out projeto))
        //        ds = ds.Where(it => it.projeto == projeto);

        //    if (DateTime.TryParse(strDtPagtoDe, out dtPagtoDe) & DateTime.TryParse(strDtPagtoAte, out dtPagtoAte))
        //        ds = ds.Where(it => it.data_pgto >= dtPagtoDe & it.data_pgto <= dtPagtoAte);
            
        //    return ds;
        //}

        public IQueryable<vPagtosBolsistas> GetPagtosPorMesAno(string strDtPagtoDe, string strDtPagtoAte)
        {            
            DateTime dtPagtoDe;
            DateTime dtPagtoAte;
            DateTime.TryParse(strDtPagtoDe, out dtPagtoDe);
            DateTime.TryParse(strDtPagtoAte, out dtPagtoAte);
            
                    return from v in Find(it => /*it.data_pgto >= dtPagtoDe & it.data_pgto <= dtPagtoAte &*/ it.cancelado == false
                               & it.inicio_contrato >= dtPagtoDe & it.inicio_contrato <= dtPagtoAte , "tipo_bolsa", "ASC")
                           orderby v.tipo_bolsa
                           select v;            
        }
    }
}
