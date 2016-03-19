using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.FATweb
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var loginProvider = Request.Params["loginProvider"];
            if (loginProvider != null && loginProvider!="logout") { 
                
                Session["loginProvider"] = loginProvider.ToString();
                Session["name"] =Request.Params["name"];
                Session["id"] =Request.Params["id"];
                Session["mail"] = Request.Params["email"];
                Session[loginProvider+"mail"] = Request.Params["email"];
                Session["pic"] = Request.Params["pic"];

                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv.Count == 0)
                {
                    Session["authority"] = "custom";
                    SqlDataSource1.Insert();
                }
                else Session["authority"] = dv.Table.Rows[0]["authority"].ToString();
                Response.Redirect("index.aspx");
            }
            else if (loginProvider == "logout")
            {
                Session["loginProvider"] = null;
                Session["name"] = null;
                Session["id"] = null;
                Session["mail"] = null;
                Session["pic"] = null;
                Session["authority"] = null;
                Response.Redirect("index.aspx");
            }
        }
    }
}