using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.admin
{
    public partial class AuthorityManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string loginProvider = "";
            if (Session["loginProvider"] == null) Response.Redirect("../FATweb/index.aspx");
            else loginProvider = Session["authority"].ToString();
            if (String.Compare(loginProvider, "custom", true) == 0) Response.Redirect("../FATweb/StoreMain.aspx");
        }

        protected void authRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvContainer = (GridViewRow)((RadioButtonList)sender).NamingContainer;
            HiddenField idHide = (HiddenField)gvContainer.FindControl("IdHiddenField");
            RadioButtonList authRBL = (RadioButtonList)gvContainer.FindControl("authRadioButtonList");

            Session["id"] = idHide.Value;
            Session["auth"] = authRBL.SelectedValue;

            SqlDataSource1.Update();
        }
    }
}