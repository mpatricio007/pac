using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data.Objects;
using System.Data.Common;

namespace BLL
{
    public class VPagtosBolsistasBLL: VPagtosBolsistasDAL
    {
        public bool FecharFolha(string strMes, string strAno,string strDtPgto,out string strMsg)
        {
            DbTransaction trans = null;
            bool rt = false;
            strMsg = String.Empty;
            try
            {
                int intMes;
                int intAno;
                DateTime dtPgto;

                contexto.Connection.Open();
                trans = contexto.Connection.BeginTransaction();              
                if (int.TryParse(strMes, out intMes) & int.TryParse(strAno, out intAno) & DateTime.TryParse(strDtPgto, out dtPgto))
                {
                    rt = contexto.ExecuteStoreCommand("UPDATE VPagtosBolsistas SET data_pgto = {0} WHERE mes<={1} AND ano={2} AND data_pgto IS NULL AND cancelado = 0 AND SUSPENSO = 0 AND excluir_do_fechamento = 0", dtPgto, intMes, intAno) > 0;
                    trans.Commit();
                    strMsg = "Folha de pagamento fechada com sucesso!";
                }
                else
                    strMsg = "Erro! Entre com os dados!";
            }
            catch (Exception ex)
            {
                trans.Rollback();
                strMsg = "Erro!" + ex.Message;
            }
            finally
            {
                contexto.Connection.Close();
                trans.Dispose();
            }
            return rt;
        }
    }
}
