using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;
using System.Reflection;
using System.Collections;
using System.Web.UI;
using System.Linq.Expressions;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.Objects;

namespace BLL
{
    public class PACBLL : PACDAL
    {

        public bool EnabledModalidade { get; set; }

        public void SalvarPrimeiroStatus()
        {
            int firstStatus = setFirstStatus();

            PAC_PACStatusBLL objStatusBLL = new PAC_PACStatusBLL();
            objStatusBLL.ObjEF.id_pac = ObjEF.id_pac;
            objStatusBLL.ObjEF.id_pacstatus = firstStatus;
            objStatusBLL.ObjEF.data = DateTime.Now;

            objStatusBLL.Add();
            objStatusBLL.SaveChanges();
        }

        private int setFirstStatus()
        {
            PACStatusBLL primeiroStatusBLL = new PACStatusBLL();
            return primeiroStatusBLL.Find(it => it.nome == ObjEF.Projeto.prestacao_contas).FirstOrDefault().id_pacstatus;
                //ObjEF.Projeto.prestacao_contas.GetValueOrDefault() ?
                //primeiroStatusBLL.Find(it => it.nome == "AFC").FirstOrDefault().id_pacstatus :
                //primeiroStatusBLL.Find(it => it.nome == "FIN").FirstOrDefault().id_pacstatus;
        }

        public void MudarStatus(string acao, string strJustificativa)
        {
            
            int lastStatus = ObjEF.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().id_pacstatus;    

            var status = contexto.MaquinaEstados.Where(it => it.PACStatus_Inicial.id_pacstatus == lastStatus
                & it.acao == acao & it.maquina == "PAC").FirstOrDefault();

            lastStatus = status != null ?  status.PACStatus_Final.id_pacstatus : setFirstStatus(); 

            int id_usu = Convert.ToInt32(System.Web.HttpContext.Current.Session["id_usuario"]);   

            PAC_PACStatusBLL pacStatus = new PAC_PACStatusBLL();
            pacStatus.ObjEF = new PAC_PACStatus()
            {
                id_pac = ObjEF.id_pac,
                id_pacstatus = lastStatus,
                justificativa = strJustificativa,
                data = DateTime.Now,
                id_usuario = id_usu
            };
            pacStatus.Add();
            pacStatus.SaveChanges();
        }

        public void VoltarPAC(int intId_pac)
        {
            Get(new KeyValuePair<string, object>("id_pac", intId_pac));
            PAC_PACStatusBLL ultimoStatusBLL = new PAC_PACStatusBLL();
            ultimoStatusBLL.Get(new KeyValuePair<string,object>("id",ObjEF.PAC_PACStatus.LastOrDefault().id));
            ultimoStatusBLL.Delete();
            ultimoStatusBLL.SaveChanges();
        }

        public IQueryable GetMeusPacs(string strCpf, string strProcura, string sortExpression, string sortDirection)
        {
            int intProcura;
            DateTime dtProcura;

            int.TryParse(strProcura, out intProcura);
            DateTime.TryParse(strProcura, out dtProcura);

            VUsuariosMySqlDAL usuMySQL = new VUsuariosMySqlDAL();
            usuMySQL.Get(strCpf);      

            var pacs = from p in GetAll(sortExpression, sortDirection, 0)                       
                       select p;

            if (int.TryParse(strProcura, out intProcura))
                pacs = from p in pacs
                       where p.id_pac == intProcura || p.Projeto.CodDef_Projeto == intProcura
                       select p;

            else if (DateTime.TryParse(strProcura, out dtProcura))
                pacs = from p in pacs
                       where p.data >= dtProcura
                       select p;
            else
                pacs = from p in pacs
                       where p.PACTipoAquisicao.nome.Contains(strProcura) ||
                             p.PACModalidadeCompra.nome.Contains(strProcura)
                       select p;

            if (usuMySQL.ObjEF.perfil == "F")
                return from p in pacs
                       select new
                       {
                           p.id_pac,
                           projeto = p.Projeto.CodDef_Projeto,
                           sigla = p.Projeto.Sigla_Projeto,
                           tipo_aquisicao = p.PACTipoAquisicao.nome,
                           p.data,
                           modalidade = p.PACModalidadeCompra.nome,
                           soma = p.PACItens.Sum(it => it.valor_total),
                           status = p.PAC_PACStatus.Where(it => it.PACStatus.visivel == true).OrderByDescending(it => it.data).FirstOrDefault().PACStatus.descricao
                       };

            return from p in pacs
                   join projs in contexto.vUsuariosMySQLProjetos.Where(it => it.cpf == strCpf)
                   on p.Projeto.CodDef_Projeto equals projs.projeto

                   select new
                     {
                         p.id_pac,
                         projeto = p.Projeto.CodDef_Projeto,
                         tipo_aquisicao = p.PACTipoAquisicao.nome,
                         p.data,
                         modalidade = p.PACModalidadeCompra.nome,
                         soma = p.PACItens.Sum(it => it.valor_total),
                         status = p.PAC_PACStatus.Where(it => it.PACStatus.visivel == true).OrderByDescending(it => it.data).FirstOrDefault().PACStatus.descricao
                     };            
        }
       
        public IQueryable GetAllPorGrupoUsuario(string strProcura, string sortExpression,string sortDirection)
        {
            int intProcura;
            DateTime dtProcura;

            UsuarioBLL usuBLL = new UsuarioBLL();
            usuBLL.Get(new KeyValuePair<string, object>("Id_Usuario", Convert.ToInt32(System.Web.HttpContext.Current.Session["id_usuario"])));

            var grupos =  usuBLL.ObjEF.Grupos.Select(it => it.Sigla);
            var pacs = from p in GetAll(sortExpression,sortDirection,0)
                       where grupos.Contains(p.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().PACStatus.nome)
                       select p;
            
            if(int.TryParse(strProcura, out intProcura))
               pacs = from p in pacs
                      where p.id_pac == intProcura || p.Projeto.CodDef_Projeto == intProcura                      
                      select p;
                    
            else if(DateTime.TryParse(strProcura, out dtProcura))
                pacs = from p in pacs
                       where p.data >= dtProcura                       
                       select p;
            else
                pacs = from p in pacs
                       where p.PACTipoAquisicao.nome.Contains(strProcura) ||
                             p.PACModalidadeCompra.nome.Contains(strProcura) ||
                             p.empresa.Contains(strProcura)
                       select p;
            EnabledModalidade = grupos.Contains("LIC");
            return from p in pacs
                   select new
                   {
                       p.id_pac,
                       projeto = p.Projeto.CodDef_Projeto,
                       sigla = p.Projeto.Sigla_Projeto,
                       tipo_aquisicao = p.PACTipoAquisicao.nome,
                       p.data,
                       modalidade = p.PACModalidadeCompra.nome,
                       soma = p.PACItens.Sum(it => it.valor_total),
                       status = p.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().PACStatus.nome,
                       empresa = p.empresa

                   };            
        }

        public IQueryable GetAllFinalizados(string strProcura, string sortExpression, string sortDirection)
        {
            int intProcura;
            DateTime dtProcura;
            var grupos = new List<string>() { "APROVADO", "REPROVADO" };
            var pacs = from p in GetAll(sortExpression, sortDirection, 0)
                       where grupos.Contains(p.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().PACStatus.nome)
                       select p;

            if (int.TryParse(strProcura, out intProcura))
                pacs = from p in pacs
                       where p.id_pac == intProcura || p.Projeto.CodDef_Projeto == intProcura
                       select p;

            else if (DateTime.TryParse(strProcura, out dtProcura))
                pacs = from p in pacs
                       where p.data >= dtProcura
                       select p;
            else
                pacs = from p in pacs
                       where p.PACTipoAquisicao.nome.Contains(strProcura) ||
                             p.PACModalidadeCompra.nome.Contains(strProcura)
                       select p;
            
            return from p in pacs
                   select new
                   {
                       p.id_pac,
                       projeto = p.Projeto.CodDef_Projeto,
                       sigla = p.Projeto.Sigla_Projeto,
                       tipo_aquisicao = p.PACTipoAquisicao.nome,
                       p.data,
                       modalidade = p.PACModalidadeCompra.nome,
                       status = p.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().PACStatus.descricao
                   };
        }

        protected void salvarCotacoes(Upload up)
        {
            FileUpload[] ar = up.DicArquivos.Keys.ToArray();
            for (int i = 0; i < ar.Length; i++)            
            {               
                PAC_CotacaoBLL objCotacao = new PAC_CotacaoBLL();

                objCotacao.ObjEF.id_pac = ObjEF.id_pac;
                objCotacao.ObjEF.data_inclusao = DateTime.Now;
                objCotacao.ObjEF.arquivo = String.Empty;
                objCotacao.Add();
                objCotacao.SaveChanges();
                up.DicArquivos[ar[i]] = String.Format("{0}{1}", objCotacao.ObjEF.id_cotacao, Path.GetExtension(ar[i].PostedFile.FileName.ToLower()));
                objCotacao.ObjEF.arquivo = String.Format(@"<a href='../cotacoes/{0}' target='blank'>arquivo</a>", up.DicArquivos[ar[i]]);

                objCotacao.Update();
                objCotacao.SaveChanges();
            }
            up.UploadArquivos();
        }

        public string SalvarPAC(Upload up)
        {
            string msg = String.Empty;
            try
            {
                Add();
                SaveChanges();
                SalvarPrimeiroStatus();
                salvarCotacoes(up);
                
                msg = String.Format(" Alerta('PAC número {0} gerado com sucesso!');", ObjEF.id_pac);
            }
            catch (Exception ex)
            {
                msg = String.Format("Alerta('Erro na inclusão! {0}');",ex.Message);
            }
            
            return msg;
        }

        public IQueryable<PAC_PACStatus> GetStatus()
        {
            if(!String.IsNullOrEmpty(Convert.ToString(System.Web.HttpContext.Current.Session["id_usuario"])))
                return ObjEF.PAC_PACStatus.OrderByDescending(it => it.data).AsQueryable<PAC_PACStatus>();

            VUsuariosMySqlDAL usuMySQL = new VUsuariosMySqlDAL();
            usuMySQL.Get(Convert.ToString(System.Web.HttpContext.Current.Session["cpf_usuMySQL"]));            
            if(usuMySQL.ObjEF.perfil != "F")
                return ObjEF.PAC_PACStatus.Where(it => it.PACStatus.visivel == true).OrderByDescending(it => it.data).AsQueryable<PAC_PACStatus>();
            else
                return ObjEF.PAC_PACStatus.OrderByDescending(it => it.data).AsQueryable<PAC_PACStatus>();
        }

        public IQueryable GetAllAprovados(string strProcura, string sortExpression, string sortDirection)
        {
            int intProcura;
            DateTime dtProcura;

            
            var pacs = from p in GetAll(sortExpression, sortDirection, 0)                       
                       select p;

            if (int.TryParse(strProcura, out intProcura))
                pacs = from p in pacs
                       where p.id_pac == intProcura || p.Projeto.CodDef_Projeto == intProcura
                       select p;

            else if (DateTime.TryParse(strProcura, out dtProcura))
                pacs = from p in pacs
                       where p.data >= dtProcura
                       select p;
            else
                pacs = from p in pacs
                       where p.PACTipoAquisicao.nome.Contains(strProcura) ||
                             p.PACModalidadeCompra.nome.Contains(strProcura)
                       select p;            
            var ds = from p in pacs
                   select new
                   {
                       p.id_pac,
                       projeto = p.Projeto.CodDef_Projeto,
                       tipo_aquisicao = p.PACTipoAquisicao.nome,
                       p.data,
                       modalidade = p.PACModalidadeCompra.nome,
                       soma = p.PACItens.Sum(it => it.valor_total),
                       status = p.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().PACStatus.descricao
                   };
            return ds.Where(it => it.status == "APROVADO");
        }

        public IQueryable GetAll(string strProcura, string sortExpression, string sortDirection)
        {
            int intProcura;
            DateTime dtProcura;


            var pacs = from p in GetAll(sortExpression, sortDirection, 0)
                       select p;

            if (int.TryParse(strProcura, out intProcura))
                pacs = from p in pacs
                       where p.id_pac == intProcura || p.Projeto.CodDef_Projeto == intProcura
                       select p;

            else if (DateTime.TryParse(strProcura, out dtProcura))
                pacs = from p in pacs
                       where p.data >= dtProcura
                       select p;
            else
                pacs = from p in pacs
                       where p.PACTipoAquisicao.nome.Contains(strProcura) ||
                             p.PACModalidadeCompra.nome.Contains(strProcura) ||
                             p.empresa.Contains(strProcura)
                       select p;
            return from p in pacs
                     select new
                     {
                         p.id_pac,
                         projeto = p.Projeto.CodDef_Projeto,
                         sigla = p.Projeto.Sigla_Projeto,
                         tipo_aquisicao = p.PACTipoAquisicao.nome,
                         p.data,
                         modalidade = p.PACModalidadeCompra.nome,
                         soma = p.PACItens.Sum(it => it.valor_total),
                         status = p.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().PACStatus.descricao,
                         p.empresa
                     };
          
        }


        public IQueryable GetAllPassagens(string strProcura, string sortExpression, string sortDirection)
        {
            int intProcura;
            DateTime dtProcura;

            var pacs = contexto.ExecuteStoreQuery<Pass>("select * from vPassagens", new object[] { }).AsQueryable();
            
            if (int.TryParse(strProcura, out intProcura))
                pacs = from p in pacs
                       where p.id_pac == intProcura || p.projeto == intProcura
                       select p;

            else if (DateTime.TryParse(strProcura, out dtProcura))
                pacs = from p in pacs
                       where p.data >= dtProcura
                       select p;
            else
                pacs = from p in pacs                       
                       where p.tipo_aquisicao.Contains(strProcura) ||
                             p.modalidade.Contains(strProcura) ||
                             p.passageiro.Contains(strProcura) ||
                             p.cpf.Contains(strProcura)
                       select p;
            var ds = (from p in pacs
                      orderby p.id_pac descending
                      select new Pass
                     {
                         id_pac =  p.id_pac,
                         projeto = p.projeto,
                         tipo_aquisicao = p.tipo_aquisicao,
                         data = p.data,
                         modalidade = p.modalidade,
                         soma = p.soma, 
                         status = p.status
                     }
                     ).Distinct();

            return ds;
        }

        [Obsolete]
        public IQueryable GetAllPassagens2(string strProcura, string sortExpression, string sortDirection)
        {
            int intProcura;
            DateTime dtProcura;

            var pacs = from p in GetAll(sortExpression, sortDirection, 0)
                       where p.id_tipo_aquisicao == 4
                       select p;

            if (int.TryParse(strProcura, out intProcura))
                pacs = from p in pacs
                       where p.id_pac == intProcura || p.Projeto.CodDef_Projeto == intProcura
                       select p;

            else if (DateTime.TryParse(strProcura, out dtProcura))
                pacs = from p in pacs
                       where p.data >= dtProcura
                       select p;
            else
                pacs =  from p in pacs
                        from passagem in p.PACItens.OfType<PACPassagem>()
                        from passageiro in passagem.PACPassageiros
                        where p.PACTipoAquisicao.nome.Contains(strProcura) ||
                              p.PACModalidadeCompra.nome.Contains(strProcura) ||
                              passageiro.nome.Contains(strProcura) ||
                              passageiro.cpf.Contains(strProcura)
                        select p;
            var ds = from p in pacs
                   select new
                   {
                       p.id_pac,
                       projeto = p.Projeto.CodDef_Projeto,
                       tipo_aquisicao = p.PACTipoAquisicao.nome,
                       p.data,
                       modalidade = p.PACModalidadeCompra.nome,
                       soma = p.PACItens.Sum(it => it.valor_total),
                       status = p.PAC_PACStatus.OrderByDescending(it => it.data).FirstOrDefault().PACStatus.descricao
                   };
            return (from d in ds
                    where d.status == "APROVADO"
                    select d).Distinct().OrderByDescending(it => it.id_pac);
        }
    }

    public class Pass
    {
        public int id_pac { get; set; } 
        public int projeto { get; set; }
        public DateTime data { get; set; }
        public string modalidade { get; set; }
        public string tipo_aquisicao { get; set; }
        public string status { get; set; }
        public decimal soma { get; set; }
        public string passageiro { get; set; }
        public string cpf { get; set; }
    }
   
}

