using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class Rpassagem
    {
        public string projeto { get; set; }
        public string patrocinador { get; set; }
        public string coordenador { get; set; }
        public string contrato { get; set; }
        public string data { get; set; }
        public string unidade { get; set; }
        public string depto { get; set; }
        public string laboratorio { get; set; }
        public string requisitante { get; set; }
        public string cpf_requisistante { get; set; }
        public string email_requisitante { get; set; }
        public string pac { get; set; }
        public string nac_inter { get; set; }
        public string ida_volta { get; set; }
        public string valor_total { get; set; }
        public string destino { get; set; }
        public string periodo_ida { get; set; }
        public string periodo_volta { get; set; }
        public string nome_passageiro { get; set; }
        public string cpf { get; set; }
        public string data_nascto { get; set; }
        public string passaporte { get; set; }
        public string validade_passaporte { get; set; }
        public string endereco { get; set; }
        public string email { get; set; }
        public string telefone { get; set; }
        public string rg { get; set; }
        public string familiar { get; set; }
        public string data_ida { get; set; }
        public string data_volta { get; set; }
        public string tipocompra { get; set; }
        public string sigla_tipo_compra { get; set; }
        public string texto_tipo_compra { get; set; }

        public List<Rpassagem> GetAll(int id_pac)
        {
            MedusaEntities ctx = new MedusaEntities();
            
            List<Rpassagem> l = new List<Rpassagem>();
            foreach (PACPassagem passagem in ctx.PACItem.Where(it => it.id_pac == id_pac))
            {
                foreach (PACPassageiro passageiro in passagem.PACPassageiros)
                {
                    Rpassagem rel = new Rpassagem();

                    rel.projeto = Convert.ToString(passagem.PAC.Projeto.CodDef_Projeto);
                    rel.patrocinador = passagem.PAC.Projeto.FinProjetos.FirstOrDefault() != null ?
                        passagem.PAC.Projeto.FinProjetos.FirstOrDefault().Financiador.Nome_Financiador : "";
                    rel.coordenador = passagem.PAC.Projeto.CoordenadoresProjetos.Where(it => it.Tipo == "coordenador").FirstOrDefault() != null ?
                        passagem.PAC.Projeto.CoordenadoresProjetos.Where(it => it.Tipo == "coordenador").FirstOrDefault().Coordenador.Nome_Coord : "";
                    rel.contrato = passagem.PAC.Projeto.NumContrato_Projeto;
                    rel.data = passagem.PAC.data.ToShortDateString();
                    rel.unidade = passagem.PAC.Projeto.Unidade != null ? passagem.PAC.Projeto.Unidade.nome : "não cadastrado";
                    rel.depto = passagem.PAC.Projeto.Departamento != null ? passagem.PAC.Projeto.Departamento.nome : "não cadastrado";
                    rel.laboratorio = passagem.PAC.Projeto.Laboratorio != null ? passagem.PAC.Projeto.Laboratorio.nome : "não cadastrado";
                    rel.data_ida = passagem.DtIda.ToShortDateString();
                    rel.data_volta = passagem.DtVolta.HasValue ? passagem.DtVolta.Value.ToShortDateString() : "";
                    vUsuariosMySQL requisitante = ctx.vUsuariosMySQL.Where(it => it.cpf == passagem.PAC.cpf_requisitante).FirstOrDefault();
                    rel.requisitante = requisitante.nome;
                    rel.cpf_requisistante = requisitante.cpf;
                    rel.email_requisitante = requisitante.email;
                    rel.pac = Convert.ToString(passagem.id_pac);
                    rel.nac_inter = passagem.internacional ? "internacional" : "nacional";
                    rel.ida_volta = passagem.ida_e_volta ? "Sim" : "Não";
                    rel.valor_total = String.Format("{0:C2}", passagem.valor_total);
                    rel.destino = passagem.especificacao;
                    rel.periodo_ida = passagem.periodoIda;
                    rel.periodo_volta = passagem.periodoVolta;
                    rel.nome_passageiro = passageiro.nome;
                    rel.cpf = passageiro.cpf;
                    rel.rg = passageiro.rg;
                    rel.familiar = passageiro.familiar;
                    rel.data_nascto = passageiro.dtNascto.HasValue ? passageiro.dtNascto.Value.ToShortDateString() : "";
                    rel.passaporte = passageiro.passaporte;
                    rel.validade_passaporte = passageiro.validade_passaporte.HasValue ? passageiro.validade_passaporte.Value.ToShortDateString() : "";
                    rel.endereco = passageiro.Ender.ToString();
                    rel.email = passageiro.email;                 
                    rel.telefone = passageiro.telefone;
                    rel.tipocompra = passagem.TipoPassagem.descricao;
                    rel.sigla_tipo_compra = passagem.TipoPassagem.sigla;
                    rel.texto_tipo_compra = passagem.TipoPassagem.texto_relatorio;
                    l.Add(rel);
                }
                    
            }
            return l;
        }
    }
}
