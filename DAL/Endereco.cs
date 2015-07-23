using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public partial class Endereco
    {
        public override string ToString()
        {
            return String.Format("{0},{1} {2} {3} {4}-{5} CEP:{6}",
                logradouro,
                numero,
                complemento,
                bairro,
                cidade,
                uf,
                cep);
        }
 
    }
}
