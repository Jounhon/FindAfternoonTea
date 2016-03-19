using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.FATweb
{
    public partial class StoreMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginProvider"] == null) Response.Redirect("index.aspx");
            PicHiddenField.Value = "";
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            int countRows = dv.Count;
            for (int i = 0; i < countRows; i++)
            {
                PicHiddenField.Value += dv.Table.Rows[i][1].ToString() + ";";
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            HiddenField storeID = (HiddenField)e.Item.FindControl("storeIdHiddenField");
            Session["storeId"] = storeID.Value;
            Response.Redirect("StoreDetails.aspx?storeId=" + storeID.Value.ToString());
        }
    }
}