using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class PacPassageiroBLL:PacPassageiroDAL
    {
        public IQueryable GetPassageiros(string strCpf)
        {
            try
            {

                return (from p in contexto.PACPassageiro
                        join projs in contexto.vUsuariosMySQLProjetos.Where(it => it.cpf == strCpf)
                        on p.PACPassagem.PAC.Projeto.CodDef_Projeto equals projs.projeto
                        group p by p.nome
                            into g
                            select new
                            {
                                nome = g.Key,
                                id_passageiro = g.OrderByDescending(it => it.Id_passageiro).FirstOrDefault().Id_passageiro
                            }).Distinct().OrderBy(it => it.nome);
            }
            catch (Exception)
            {

            }

            return null;
        }


        public void Get(int id_passageiro)
        {
            Get(new KeyValuePair<string, object>("Id_passageiro", id_passageiro));
        }
        //public void Get(string strCpf)
        //{
        //    ObjEF = Find(it => it. cpf == strCpf, "Id_passageiro", "DESC").FirstOrDefault();
        //}
    }
}
