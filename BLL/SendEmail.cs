using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;

namespace BLL
{
    public class SendEmail
    {
        private string[] destinatarios;
        private SmtpClient smtpClient;
        private MailMessage message;
        private string smtp;
        private string from;
        private string subject;
        private string body;

        public string[] Destinatarios
        {
            get { return destinatarios; }
            set { destinatarios = value; }
        }

        public SmtpClient SmtpClient
        {
            get { return smtpClient; }
            set { smtpClient = value; }
        }

        public MailMessage Message
        {
            get { return message; }
            set { message = value; }
        }

        public string Smtp
        {
            get
            {
                if (String.IsNullOrEmpty(smtp))
                    return String.Empty;
                else
                    return smtp;
            }
            set { smtp = value; }
        }

        public string From
        {
            get
            {
                if (String.IsNullOrEmpty(from))
                    return String.Empty;
                else
                    return from;
            }
            set { from = value; }
        }

        public string Subject
        {
            get
            {
                if (String.IsNullOrEmpty(subject))
                    return String.Empty;
                else
                    return subject;
            }
            set { subject = value; }
        }

        public string Body
        {
            get
            {
                if (String.IsNullOrEmpty(body))
                    return String.Empty;
                else
                    return body;
            }
            set { body = value; }
        }

        public SendEmail()
        {
            from = "fusp@usp.br";
            smtp = "smtp.usp.br";
            message = new MailMessage();
        }
        private void InsertFrom()
        {
            MailAddress rem = new MailAddress(from, "FUSP");
            message.From = rem;
        }

        private void InsertTo()
        {
            foreach (string rec in Destinatarios)
            {
                if (!String.IsNullOrEmpty(rec.Trim()))
                    message.To.Add(new MailAddress(rec));
            }
        }

        private void InsertSubject()
        {
            message.Subject = Subject;
        }

        private void InsertBody()
        {
            message.Body = body;
        }

        public void InsertAttachments(string arq)
        {
            if (arq != "") message.Attachments.Add(new Attachment(arq));
        }


        public void InsertAttachments(Attachment attach)
        {
            if (!attach.Equals(null)) message.Attachments.Add(attach);
        }
        public bool Send()
        {
            try
            {
                InsertFrom();
                InsertTo();
                InsertSubject();
                InsertBody();

                smtpClient = new SmtpClient(Smtp);

                smtpClient.Send(message);
                smtpClient.Timeout = 5;
                return true;
            }
            catch (Exception e)
            {
                string erro = "Erro:" + e;
                return false;
            }
        }
    }
}
