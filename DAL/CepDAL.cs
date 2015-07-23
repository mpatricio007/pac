using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class CepDAL : Abstract_Crud<Cep>
    {
        public EnderecoInternacional GetEndereco(string strCep)
        {
            Cep cep = Find(it => it.cep1 == strCep).FirstOrDefault();
            if (cep != null)
            {
                EnderecoInternacional end = new EnderecoInternacional();
                end.cep = cep.cep1;
                end.logradouro = String.Format("{0} {1}", cep.tipoLOGRADOURO, cep.logradouro);
                end.complemento = cep.complemento;
                end.bairro = cep.bairro;
                end.cidade = cep.cidade;
                end.uf = cep.uf;
                end.pais = cep.pais;
                return end;
            }
            else
                return new EnderecoInternacional();
        }
    }
}
