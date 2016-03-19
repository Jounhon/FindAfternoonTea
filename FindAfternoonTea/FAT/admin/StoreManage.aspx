<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreManage.aspx.cs" Inherits="FindAfternoonTea.FAT.admin.StoreManage" %>

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
        <input id="storeButton" type="button" value="餐廳管理" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="storePicButton" type="button" value="餐廳圖片管理" /><br />
        <br />
        <br />
            <input id="insertButton" type="button" value="新增餐廳" /><br />
        <br />
        <div id="InsertBlock" style="display:none">
            <table>
                <tr>
                    <td>餐廳名稱</td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>價格</td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>營業時間</td>
                    <td>
                        <asp:TextBox ID="openTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>公休日</td>
                    <td>星期<asp:CheckBoxList ID="closeCheckBoxList" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>一</asp:ListItem>
                        <asp:ListItem>二</asp:ListItem>
                        <asp:ListItem>三</asp:ListItem>
                        <asp:ListItem>四</asp:ListItem>
                        <asp:ListItem>五</asp:ListItem>
                        <asp:ListItem>六</asp:ListItem>
                        <asp:ListItem>日</asp:ListItem>
                        </asp:CheckBoxList>
                        <asp:HiddenField ID="closeHiddenField" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>電話</td>
                    <td>
                        <asp:TextBox ID="phoneTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>地址</td>
                    <td>
                        <asp:DropDownList ID="cityDropDownList" runat="server" Enabled="False">
                            <asp:ListItem Selected="True" Value="A">台北市</asp:ListItem>
                            <asp:ListItem Value="F">新北市</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="districtDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="districtName" DataValueField="districtNum" >
                        </asp:DropDownList>
                        <asp:TextBox ID="addrTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="district" HeaderText="district" SortExpression="district" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="open" HeaderText="open" SortExpression="open" />
                <asp:BoundField DataField="close" HeaderText="close" SortExpression="close" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" DeleteCommand="DELETE FROM [FAT_Store] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FAT_Store] ([name], [price], [address], [phone], [district], [open], [close]) VALUES (@name, @price, @address, @phone, @district, @open, @close)" SelectCommand="SELECT * FROM [FAT_Store] ORDER BY [Id] DESC" UpdateCommand="UPDATE [FAT_Store] SET [name] = @name, [price] = @price, [address] = @address, [phone] = @phone, [district] = @district, [open] = @open, [close] = @close WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="nameTextBox" Name="name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="priceTextBox" Name="price" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="addrTextBox" Name="address" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="phoneTextBox" Name="phone" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="districtDropDownList" Name="district" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="openTextBox" Name="open" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="closeHiddenField" Name="close" PropertyName="Value" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="district" Type="String" />
                <asp:Parameter Name="open" Type="String" />
                <asp:Parameter Name="close" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT districtName, districtNum FROM FAT_District WHERE (city = @CityNo)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cityDropDownList" DefaultValue="" Name="CityNo" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>    
    </div>
    </form>
</body>
</html>
<script src="../../Scripts/jquery-1.10.2.js"></script>
<script src="../JavaScript/StoreJQuery.js"></script>
<script src="../JavaScript/MenuJQuery.js"></script>
<script src="../JavaScript/LogInOut.js"></script>
<script src="http://connect.facebook.net/en_us/all.js"></script>
<script src="http://apis.google.com/js/client.js?onload=onLoadCallback"></script>