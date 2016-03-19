using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.FATweb
{
    public partial class StoreDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (Session["loginProvider"] == null) Response.Redirect("index.aspx");
            var storeId = Request.Params["storeId"];
            Session["storeId"] = storeId.ToString();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            FormView2.PageIndex = DataList1.SelectedIndex;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            SqlDataSource3.InsertParameters.Clear();
            SqlDataSource3.InsertParameters.Add("storeid", Session["storeId"].ToString());
            SqlDataSource3.InsertParameters.Add("comment", TextBox1.Text);
            SqlDataSource3.InsertParameters.Add("mail", Session["mail"].ToString());
            SqlDataSource3.InsertParameters.Add("time", dt.ToString());
            TextBox1.Text = "";
            SqlDataSource3.Insert();
        }
    }
}