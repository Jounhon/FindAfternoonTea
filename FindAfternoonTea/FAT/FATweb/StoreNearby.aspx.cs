using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindAfternoonTea.FAT.FATweb
{
    public partial class StoreNearby : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginProvider"] == null) Response.Redirect("index.aspx");
            addressHiddenField.Value="";
            storeIdHiddenField.Value = "";
            nameHiddenField.Value = "";
            priceHiddenField.Value = "";
            phoneHiddenField.Value = "";
            openHiddenField.Value = "";
            closeHiddenField.Value = "";
            picHiddenField.Value = "";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int countRows = dv.Count;
            for (int i = 0; i < countRows; i++)
            {
                addressHiddenField.Value += "台北市" + dv.Table.Rows[i][1].ToString() + dv.Table.Rows[i][2].ToString() + ";";
                storeIdHiddenField.Value += dv.Table.Rows[i][0].ToString()+";";
                nameHiddenField.Value += dv.Table.Rows[i][3].ToString() + ";";
                priceHiddenField.Value += dv.Table.Rows[i][4].ToString() + ";";
                phoneHiddenField.Value += dv.Table.Rows[i][5].ToString() + ";";
                openHiddenField.Value += dv.Table.Rows[i][6].ToString() + ";";
                closeHiddenField.Value += dv.Table.Rows[i][7].ToString() + ";";
                SqlDataSource2.SelectParameters.Clear();
                SqlDataSource2.SelectParameters.Add("storeId", dv.Table.Rows[i][0].ToString());
                DataView dvp = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                picHiddenField.Value += dvp.Table.Rows[0][0].ToString() + ";";
            }
        }
    }
}