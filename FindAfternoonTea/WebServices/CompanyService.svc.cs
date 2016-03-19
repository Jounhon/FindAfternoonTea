using FindAfternoonTea.App_Start;
using FindAfternoonTea.App_Start.CompanyDataSetTableAdapters;
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
    public class CompanyService
    {
        // 若要使用 HTTP GET，請加入 [WebGet] 屬性 (預設的 ResponseFormat 為 WebMessageFormat.Json)。
        // 若要建立可傳回 XML 的作業，
        //     請加入 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
        //     並在作業主體中包含下列這行程式:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        [WebGet]
        public CompanyData getCompany()
        {
            FAT_CompanyTableAdapter companyTableAdapter=new FAT_CompanyTableAdapter();
            CompanyDataSet.FAT_CompanyDataTable dt = companyTableAdapter.getCompany();
            CompanyDataSet.FAT_CompanyRow dtr = (CompanyDataSet.FAT_CompanyRow)dt.Rows[0];

            CompanyData companyData = new CompanyData();

            companyData.name = dtr.name;
            companyData.logo = dtr.logo;
            companyData.phone = dtr.phone;
            companyData.address = dtr.address;
            companyData.mail = dtr.mail;
            companyData.about = dtr.about;
            return companyData;

        }

        // 在此新增其他作業，並以 [OperationContract] 來標示它們
        public class CompanyData
        {
            public string name;
            public string logo;
            public string phone;
            public string address;
            public string mail;
            public string about;
        }
    }
}
