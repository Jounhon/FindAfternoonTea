<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorePicManage.aspx.cs" Inherits="FindAfternoonTea.FAT.admin.StorePicManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Css/MainStyleSheet.css" rel="stylesheet" />
    <title>找茶|F.A.T.</title>
    <script>
        var loginProvider = '<%=Session["loginProvider"]%>';
        var UserAuthority = '<%=Session["authority"]%>';
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="world" align="center">
        <div id="topMenu">
            <a href="../FATweb/StoreMain.aspx"><img alt="" src="../pic/logo.png" /></a>
            <ul>
                <li><a href="../admin/CompanyManage.aspx">公司管理</a></li>
                <li><a href="../admin/StoreManage.aspx">店家管理</a></li>
                <li id="authorityLink" style="display:none;"><a href="../admin/AuthorityManage.aspx">權限管理</a></li>
                <li><a href="#" onclick="Logout();return false">登出</a></li>
            </ul>
        </div>
        <div id="main">
            <br /><br /><br /><br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <input id="storeButton" type="button" value="餐廳管理" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="storePicButton" type="button" value="餐廳圖片管理" /><br />
        <br />
        <br />
            <input id="insertButton" type="button" value="新增圖片" /><br />
        <br />
        <div id="InsertBlock" style="display:none">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT name, Id FROM FAT_Store WHERE (district = @DistrictNo)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="DistrictNo" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    區域：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="districtName" DataValueField="districtNum">
                    </asp:DropDownList>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            餐廳：<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="Id">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table id="picsUP">
                <tr>
                    <td>圖片網址：</td>
                    <td>
                        <input type="text" class="fieldname" id="field1" /></td>
                </tr>
                </table>
            <asp:HiddenField ID="pathHiddenField" runat="server" />
            <br />
            <input id="addButton" type="button" value="增加欄位" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click" />
        </div>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="序號" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="storeId" HeaderText="餐廳序號" SortExpression="storeId" />
                <asp:ImageField DataImageUrlField="pic" HeaderText="圖片">
                    <ControlStyle Height="80px" Width="120px" />
                </asp:ImageField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
            <br /><br /><br /><br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" DeleteCommand="DELETE FROM [FAT_StorePic] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FAT_StorePic] ([storeId], [pic]) VALUES (@storeId, @pic)" SelectCommand="SELECT * FROM [FAT_StorePic]" UpdateCommand="UPDATE [FAT_StorePic] SET [storeId] = @storeId, [pic] = @pic WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="storeId" Type="Int32" />
                <asp:Parameter Name="pic" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="storeId" Type="Int32" />
                <asp:Parameter Name="pic" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT districtName, districtNum FROM FAT_District WHERE (city = @CityNo)">
            <SelectParameters>
                <asp:Parameter DefaultValue="A" Name="CityNo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" DeleteCommand="DELETE FROM [FAT_Store] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FAT_Store] ([name], [price], [address], [phone], [district], [open], [close], [likes]) VALUES (@name, @price, @address, @phone, @district, @open, @close, @likes)" SelectCommand="SELECT * FROM [FAT_Store]" UpdateCommand="UPDATE [FAT_Store] SET [name] = @name, [price] = @price, [address] = @address, [phone] = @phone, [district] = @district, [open] = @open, [close] = @close, [likes] = @likes WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="district" Type="String" />
                <asp:Parameter Name="open" Type="String" />
                <asp:Parameter Name="close" Type="String" />
                <asp:Parameter Name="likes" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="district" Type="String" />
                <asp:Parameter Name="open" Type="String" />
                <asp:Parameter Name="close" Type="String" />
                <asp:Parameter Name="likes" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>    
    </div>
    </form>
</body>
</html>
<script src="../../Scripts/jquery-1.10.2.js"></script>
<script src="../JavaScript/StorePicJQuery.js"></script>
<script src="../JavaScript/MenuJQuery.js"></script>
<script src="../JavaScript/LogInOut.js"></script>
<script src="http://connect.facebook.net/en_us/all.js"></script>
<script src="http://apis.google.com/js/client.js?onload=onLoadCallback"></script>