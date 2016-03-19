using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace FindAfternoonTea.WebServices
{
    // 注意: 您可以使用 [重構] 功能表上的 [重新命名] 命令同時變更程式碼、svc 和組態檔中的類別名稱 "MailService"。
    // 注意: 若要啟動 WCF 測試用戶端以便測試此服務，請在 [方案總管] 中選取 MailService.svc 或 MailService.svc.cs，然後開始偵錯。
    public class MailService : IMailService
    {
        public void sendMail(MailData mailData)
        {
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587;

            string username = "h6g2682";
            string password = "ozorhfnmhlfqowki";

            MailMessage mailMessage = new MailMessage();

            mailMessage.From = new MailAddress(mailData.senderAddress);
            mailMessage.To.Add(new MailAddress(mailData.receiverAddress));

            mailMessage.Subject = mailData.subject;
            mailMessage.SubjectEncoding = Encoding.UTF8;

            ContentType mimeType = new ContentType("text/html");
            AlternateView mimeTypeMessage = AlternateView.CreateAlternateViewFromString(mailData.message, mimeType);
            mailMessage.AlternateViews.Add(mimeTypeMessage);

            SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort);

            smtpClient.Credentials = new System.Net.NetworkCredential(username, password);
            smtpClient.EnableSsl = true;

            smtpClient.Send(mailMessage);
        }

        public class MailData
        {
            public string receiverName;
            public string receiverAddress;
            public string senderName;
            public string senderAddress;
            public string subject;
            public string message;
        }
    }
}
