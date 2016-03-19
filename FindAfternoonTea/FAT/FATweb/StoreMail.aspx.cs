using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.FATweb
{
    public partial class StoreMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginProvider"] == null) Response.Redirect("index.aspx");
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            MailServiceReference.MailServiceMailData mailData = new MailServiceReference.MailServiceMailData();

            mailData.senderName = Session["name"].ToString();
            mailData.senderAddress = Session["mail"].ToString();
            mailData.receiverName = "Server";
            mailData.receiverAddress = "h6g2682@gmail.com";
            mailData.subject = "意見回饋";
            mailData.message = Session["name"].ToString()+ ":<br><br>" + commentTextBox.Text;

            MailServiceReference.MailServiceClient mailService = new MailServiceReference.MailServiceClient();

            mailService.sendMail(mailData);
           
            Response.Redirect("StoreMain.aspx");
        }
    }
}