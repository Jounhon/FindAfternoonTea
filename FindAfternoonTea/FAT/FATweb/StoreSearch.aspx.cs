using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.FATweb
{
    public partial class StoreSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginProvider"] == null) Response.Redirect("index.aspx");
            var searchText = Request.Params["searchText"];
            if (searchText == null) searchText = "";
            SqlDataSource1.SelectCommand = "WITH CTE AS ( SELECT FAT_StorePic.pic, FAT_Store.name, FAT_Store.Id, FAT_Store.address, FAT_District.districtName, ROW_NUMBER() OVER (Partition BY FAT_Store.Id ORDER BY FAT_StorePic.Id) AS 'Sort' FROM FAT_Store INNER JOIN FAT_StorePic ON FAT_Store.Id = FAT_StorePic.storeId INNER JOIN FAT_District ON FAT_Store.district = FAT_District.districtNum ) SELECT * FROM CTE WHERE Sort = 1 AND (name LIKE '%" + searchText.ToString() + "%' OR districtName LIKE '%" + searchText.ToString() + "%' OR address LIKE '%" + searchText.ToString() + "%') ORDER BY Id DESC";
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            HiddenField storeID = (HiddenField)e.Item.FindControl("storeIdHiddenField");
            Session["storeId"] = storeID.Value;
            Response.Redirect("StoreDetails.aspx?storeId="+storeID.Value);
        }
    }
}