using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class ContratosParcelaBLL: ContratosParcelaDAL
    {
        public void ReplicarParcela(int intId_parcela)
        {
            Get(new KeyValuePair<string, object>("id_parcela", intId_parcela));
            ContratosParcela obj = ObjEF;
            ObjEF = new ContratosParcela(); ;
            ObjEF.id_contrato = obj.id_contrato;
            ObjEF.num_parcela = obj.num_parcela;
            ObjEF.mes_ano = obj.mes_ano;
            ObjEF.valor = obj.valor;
            ObjEF.cancelado = false;
            ObjEF.observacao = String.Empty;
            Add();
            SaveChanges();
        }

        public void GerarPagamentos(int intId_contrato, int intId_vigencia,int id_usuario)
        {
            ContratoBolsa objContrato = contexto.ContratoBolsa.Where(it => it.id_contrato == intId_contrato).FirstOrDefault();
            BolsaVigencia bv = objContrato.Bolsa.BolsaVigencias.Where(it => it.Id == intId_vigencia).FirstOrDefault();
            int num_parcela = 1;
            DateTime data = objContrato.inicio_contrato;
            while (data <= objContrato.termino_contrato)
            {   
                decimal valor = bv.valor;
                decimal dias = data.Day;
                decimal diasNoMes = DateTime.DaysInMonth(data.Year,data.Month);
                if (data == objContrato.inicio_contrato)
                    valor = (bv.valor / diasNoMes) * (diasNoMes + 1 - dias);
                
                else if (data == objContrato.termino_contrato)                
                    valor = (bv.valor / diasNoMes ) * dias;
                
                ObjEF = new ContratosParcela(); 
                ObjEF.id_contrato = objContrato.id_contrato;
                ObjEF.num_parcela = num_parcela;
                ObjEF.mes_ano = data.ToString("MM/yyyy");
                ObjEF.valor = valor;
                ObjEF.cancelado = false;
                ObjEF.observacao = String.Empty;
                ObjEF.data = DateTime.Now;
                ObjEF.id_usuario = id_usuario;
                Add();
                data = data.AddMonths(1);
                if ((data.Month == objContrato.termino_contrato.Month) & (data.Year == objContrato.termino_contrato.Year))
                    data = objContrato.termino_contrato;
                num_parcela += 1;
            }
            SaveChanges();            
        }
    }
}
