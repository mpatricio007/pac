using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class ProjetoDAL : Abstract_Crud<Projeto>
    {
        public void GetProjeto(int intCod)
        {
            ObjEF = (from p in contexto.Projeto
                    where p.CodDef_Projeto == intCod
                    select p).FirstOrDefault();
        }
    }
}
