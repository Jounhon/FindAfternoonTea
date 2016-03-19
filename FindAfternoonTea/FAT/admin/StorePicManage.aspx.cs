using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.admin
{
    public partial class StorePicManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string loginProvider = "";
            if (Session["loginProvider"] == null) Response.Redirect("../FATweb/index.aspx");
            else loginProvider = Session["authority"].ToString();
            if (String.Compare(loginProvider, "custom", true) == 0) Response.Redirect("../FATweb/StoreMain.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string paths = pathHiddenField.Value.ToString();
            string[] split = paths.Split(new Char[] { ',' });
            foreach (string s in split)
            {
                if (s.Trim() != "")
                {
                    SqlDataSource1.InsertParameters.Clear();
                    SqlDataSource1.InsertParameters.Add("storeId", DropDownList2.SelectedValue);
                    SqlDataSource1.InsertParameters.Add("pic", s);
                    SqlDataSource1.Insert();

                }
            }
        }
    }
}