using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class CidadeDAL : Abstract_Crud<Cidades>
    {
        public IQueryable GetCidadesPorUF(string strUf)
        {
            return from c in Find(it => it.Uf == strUf, "Nome", "ASC")
                   select c.Nome;
        }
    }
}
