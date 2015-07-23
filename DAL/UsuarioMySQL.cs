using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Data.Objects.DataClasses;

namespace DAL
{
    public class UsuarioMySQL
    {
        public string usuario_id { get; set; }
        public string cpf { get; set; }
        public string nome { get; set; }
        public string senha { get; set; }
        public string email { get; set; }        
        public string perfil { get; set; }



        public UsuarioMySQL(MySqlDataReader dr)
        {
            if (dr.HasRows)
            {
                dr.Read();
                usuario_id = Convert.ToString(dr["usuario_id"]);
                cpf = Convert.ToString(dr["cpf"]);
                nome = Convert.ToString(dr["nome"]);
                senha = Convert.ToString(dr["senha"]);
                email = Convert.ToString(dr["email"]);
                perfil = Convert.ToString(dr["cargo"]);               
                dr.Close();
            }
        }

        public static UsuarioMySQL GetUsuarioMySQL(string strCpf)
        {

            ClassDB db = new ClassDB();
            UsuarioMySQL usuMySQL = null; ;
            try
            {
                db.CommandSQL = "SELECT usuario_id,cpf,nome,senha,email,ativo,cargo FROM tbl_fusp_usuarios where md5(cpf)= md5(@cpf)";
                db.AddParameter("@cpf", ClassDB.NullToDbNull(strCpf));
                usuMySQL = new UsuarioMySQL(db.ExecuteReader());
            }
            catch (Exception)
            {

            }
            finally
            {
                db.Dispose();
            }
            return usuMySQL;
        }

        public static UsuarioMySQL GetUsuarioMySQL(string strCpf, string strSenha,out string saida)
        {
            ClassDB db = new ClassDB();
            UsuarioMySQL usuMySQL = null;
            try
            {
                db.CommandSQL = "SELECT usuario_id,cpf,nome,senha,email,ativo,cargo FROM tbl_fusp_usuarios where cpf=@cpf AND senha=@senha";
                db.AddParameter("@cpf", ClassDB.NullToDbNull(strCpf));
                db.AddParameter("@senha", ClassDB.NullToDbNull(strSenha));
                usuMySQL = new UsuarioMySQL(db.ExecuteReader());
            }
            catch (Exception)
            {

            }
            finally
            {
                db.Dispose();
            }
            saida = String.IsNullOrEmpty(usuMySQL.cpf) ? "Senha e/ou Login inválidos!" : String.Empty;
            return usuMySQL;
        }

        public IEnumerable<int> GetCodProjetos()
        {
            ClassDB db = new ClassDB();
            List<int> lstProjetos = new List<int>();
            try
            {                
                StringBuilder commandSQL = new StringBuilder();

                if (perfil != "F")
                {
                    commandSQL.Append("SELECT projeto FROM tbl_fusp_user_projetos ");
                    commandSQL.Append("where usuario_id=@usuario_id");
                }
                else
                {
                    commandSQL.Append("SELECT projeto FROM tbl_fusp_projetos");
                }

                db.CommandSQL = commandSQL.ToString();
                if (perfil != "F")
                    db.AddParameter("@usuario_id", ClassDB.NullToDbNull(usuario_id));
                MySqlDataReader dr = db.ExecuteReader();               
                while (dr.Read())
                    lstProjetos.Add(Convert.ToInt32(dr["projeto"]));
               
            }
            catch (Exception)
            {

            }
            finally
            {   
                db.Dispose();
            }
            ProjetoDAL objDAL = new ProjetoDAL();
            List<int> projetos = objDAL.Find(it => it.CodDef_Projeto != null).Select(it => (int)it.CodDef_Projeto).ToList();
            return lstProjetos.Intersect(projetos);
            
        }
    }
}
