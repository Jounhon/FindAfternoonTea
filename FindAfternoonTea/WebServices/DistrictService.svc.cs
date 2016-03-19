using FindAfternoonTea.App_Start;
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
    public class DistrictService
    {
        // 若要使用 HTTP GET，請加入 [WebGet] 屬性 (預設的 ResponseFormat 為 WebMessageFormat.Json)。
        // 若要建立可傳回 XML 的作業，
        //     請加入 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
        //     並在作業主體中包含下列這行程式:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        [WebGet]

        public DistrictData GetDistrict(string CityNo)
        {
            FindAfternoonTea.App_Start.districtDataSetTableAdapters.FAT_DistrictTableAdapter districtTableAdapter = new FindAfternoonTea.App_Start.districtDataSetTableAdapters.FAT_DistrictTableAdapter();
            districtDataSet.FAT_DistrictDataTable dataTable = districtTableAdapter.GetDistrict(CityNo);
            districtDataSet.FAT_DistrictRow dataRow = (districtDataSet.FAT_DistrictRow)dataTable.Rows[0];

            DistrictData districtData = new DistrictData();

            districtData.districtName = dataRow.districtName;
            districtData.districtNum = Convert.ToInt16(dataRow.districtNum);

            return districtData;

        }

        // 在此新增其他作業，並以 [OperationContract] 來標示它們
        public class DistrictData
        {
            public string districtName;
            public int districtNum;
        }
    }
}
