using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
namespace BLL
{
    public class UsuarioBLL: UsuarioDAL
    {
        public int Login(string strLogin, string strSenha,out string saida)
        {            
            strSenha = SecurityBLL.GetMD5Hash(strSenha);
            ObjEF = Find(it => it.Login == strLogin & it.Senha == strSenha).FirstOrDefault();
            saida = ObjEF.Id_Usuario == 0 ? "Senha e/ou Login inválidos!" : String.Empty;
            return ObjEF.Id_Usuario;
        }


        public string AlterarSenha(string strSenhaAtual, string strSenhaNova)
        {
            string saida = "Senha alterada com sucesso!";
            try 
	        {
                if (ObjEF.Senha == SecurityBLL.GetMD5Hash(strSenhaAtual))
                {
                    ObjEF.Senha = SecurityBLL.GetMD5Hash(strSenhaNova);                    
                    SaveChanges();
                }
                else
                    saida = "Senha atual incorreta!";
		
	        }
	        catch (Exception ex)
	        {

                saida = "Erro:! " + ex.Message;
	        }
            return saida;
                
        }

        public string SendPasswordEmail(string strLogin)
        {
            string rt = String.Empty;

            try
            {
                ObjEF = Find(it => it.Login == strLogin).FirstOrDefault();
                if (ObjEF.Id_Usuario != 0)
                {
                    string pass = SecurityBLL.GeraSenha();
                    SendEmail sendmail = new SendEmail();
                    sendmail.Destinatarios = new string[] { ObjEF.Email };
                    sendmail.Subject = "Nova senha de acesso ao ao Sistema de Cadastro de Projetos";

                    StringBuilder body = new StringBuilder();
                    body.Append("Esta é uma mensagem automática do sistema. Não responda este e-mail.");
                    body.AppendLine();
                    body.AppendFormat("Sua senha para acesso ao Sistema de Cadastro de Projetos da FUSP é: {0}.", pass);
                    body.AppendLine();
                    body.Append("Para acessar o sistema digite o seu login e em seguida informe a senha.");

                    sendmail.Body = body.ToString();

                    if (sendmail.Send())
                    {
                        ObjEF.Senha = SecurityBLL.GetMD5Hash(pass);
                        SaveChanges();
                        rt = "Uma nova senha foi enviada para seu e-mail.";
                    }
                }
                else
                {
                    rt = "Login inexistente!";
                }
            }
            catch (Exception ex)
            {
                rt = "Erro! " + ex.Message;
            }
            return rt;
        }
           
      
    }
}
