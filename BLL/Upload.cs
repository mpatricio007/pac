using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.IO;
using System.Web.UI.WebControls;

namespace BLL
{   
    public class Upload
    {
        private string[] extensoes = new string[]
        {
            ".doc",
            ".docx",
            ".xls",
            ".xlsx",
            ".pdf",
            ".jpg",            
        };

        private int max = 25000000;
        public Dictionary<FileUpload, string> DicArquivos = new Dictionary<FileUpload, string>();

        public string Caminho { get; set; }

        public string Add(FileUpload file)
        {
            if (file.HasFile)
            {
                if (file.PostedFile.ContentLength <= max)
                {
                    if (extensoes.Contains(Path.GetExtension(file.PostedFile.FileName).ToLower()))
                    {
                        if (!DicArquivos.Values.Contains(file.PostedFile.FileName))
                        {
                            DicArquivos.Add(file, file.PostedFile.FileName);
                            return "arquivo adicionado";
                        }
                        else
                            return "arquivo já adicionado";
                    }
                    else
                        return "extensão de arquivo não suportado!";
                }
                else
                    return "tamanho do arquivo maior que 25MB!";
            }
            else
                return "selecione um arquivo!";
        }

        public string Add(FileUpload file, string fileName)
        {
            if (file.HasFile)
            {
                if (file.PostedFile.ContentLength <= max)
                {
                    if (extensoes.Contains(Path.GetExtension(file.PostedFile.FileName).ToLower()))
                    {
                        DicArquivos.Add(file, fileName);
                        return "arquivo adicionado";
                    }
                    else
                        return "extensão de arquivo não suportado!";
                }
                else
                    return "tamanho do arquivo maior que 25MB!";
            }
            else
                return "selecione um arquivo!";
        }

        public string Remove(int index)
        {
            //FileUpload file = new FileUpload();
            //file.PostedFile.FileName = DicArquivos.Keys.ToArray()[index];
            //DicArquivos.Remove(file);
            DicArquivos.Remove(DicArquivos.Keys.ToArray()[index]); ;
            return "arquivo removido com sucesso!";
        }

        public string UploadArquivos()
        {
            if (DicArquivos.Count > 0)
            {
                foreach (FileUpload file in DicArquivos.Keys)
                {   
                    file.PostedFile.SaveAs(Caminho + DicArquivos[file]);
                }
                
                return String.Format("Upload de: {0} arquivo(s) realizado(s) com sucesso!", DicArquivos.Count.ToString());
            }
            else
                return "adicione ao menos um arquivo!";
        }

        public IEnumerable GetAll()
        {   
            var ds = from f in DicArquivos
                     select new
                     {
                         arquivo = f.Value
                     };
            return ds;
        }

        public void Clear()
        {
            DicArquivos.Clear();
        }
    }
}