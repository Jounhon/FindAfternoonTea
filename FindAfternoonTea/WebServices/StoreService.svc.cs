using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace FindAfternoonTea.WebServices
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class StoreService
    {
        // 若要使用 HTTP GET，請加入 [WebGet] 屬性 (預設的 ResponseFormat 為 WebMessageFormat.Json)。
        // 若要建立可傳回 XML 的作業，
        //     請加入 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
        //     並在作業主體中包含下列這行程式:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        [WebGet]
        public StoreData getStoreDetails(int rows)
        {
            FindAfternoonTea.App_Start.StoreDataSetTableAdapters.StoreTableAdapter storeTableAdapter = new App_Start.StoreDataSetTableAdapters.StoreTableAdapter();
            FindAfternoonTea.App_Start.StoreDataSet.StoreDataTable dataTable = storeTableAdapter.getStoreDetails();
            FindAfternoonTea.App_Start.StoreDataSet.StoreRow dataRow = (FindAfternoonTea.App_Start.StoreDataSet.StoreRow)dataTable.Rows[2];

            StoreData storeData = new StoreData();

            storeData.name = dataRow.name;
            storeData.price = dataRow.price;
            storeData.open = dataRow.open;
            storeData.close = dataRow.close;
            storeData.phone = dataRow.phone;
            storeData.district = Convert.ToInt16(dataRow.district);
            storeData.address = dataRow.address;

            return storeData;

        }

        // 在此新增其他作業，並以 [OperationContract] 來標示它們
        public class StoreData
        {
            public string name;
            public string price;
            public string open;
            public string close;
            public string phone;
            public int district;
            public string address;
        }
    }
}
