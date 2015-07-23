using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class VUsuariosMySqlDAL:Abstract_Crud<vUsuariosMySQL>
    {
        public void Get(string strCpf)
        {
            ObjEF = contexto.vUsuariosMySQL.Where(it => it.cpf == strCpf).FirstOrDefault();
        }

        public void Get(string strCpf, string strSenha, out string saida)
        {
            ObjEF = contexto.vUsuariosMySQL.Where(it => it.cpf == strCpf & it.senha == strSenha).FirstOrDefault();
            saida = String.IsNullOrEmpty(ObjEF.cpf) ? "Senha e/ou Login inválidos!" : String.Empty;
        }

        public IEnumerable<int> GetCodProjetos()
        {    
            ProjetoDAL objDAL = new ProjetoDAL();
            List<int> projetos = objDAL.Find(it => it.CodDef_Projeto != null).Select(it => (int)it.CodDef_Projeto).ToList();
            try
            {
         

                if (ObjEF.perfil != "F")
                {
                    return from pMySQl in contexto.vUsuariosMySQLProjetos
                           join p in contexto.Projeto
                           on pMySQl.projeto equals p.CodDef_Projeto
                           where pMySQl.cpf == ObjEF.cpf
                           orderby pMySQl.projeto
                           select pMySQl.projeto;

                }
                else
                {
                    return from pMySQl in contexto.vMySQLProjetos
                           join p in contexto.Projeto
                           on pMySQl.Projeto equals p.CodDef_Projeto
                           orderby pMySQl.Projeto
                           select pMySQl.Projeto;
                }
                
            }
            catch (Exception)
            {

            }
            return null;
        }
    }
}
