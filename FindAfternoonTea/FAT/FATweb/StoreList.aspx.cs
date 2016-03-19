using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.FATweb
{
    public partial class StoreList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["loginProvider"] == null) Response.Redirect("index.aspx");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            HiddenField storeID = (HiddenField)e.Item.FindControl("storeIdHiddenField");
            Session["storeId"] = storeID.Value;
            Response.Redirect("StoreDetails.aspx?storeId="+storeID.Value.ToString());
        }
    }
}