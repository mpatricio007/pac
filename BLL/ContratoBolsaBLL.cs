using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class ContratoBolsaBLL :ContratoBolsaDAL
    {
        public bool PossuiOutroContratoAtivo(string strcpf)
        {
            //var newCtx = new NewMedusaEntities();            
            //return newCtx.vContratosPessoa.Where(it => it.tipo == "AUTÔNOMO" & it.inicio <= DateTime.Now & it.termino >= DateTime.Now & it.cpf == strcpf).Count() > 0;
            return false;
        }

    }
}
