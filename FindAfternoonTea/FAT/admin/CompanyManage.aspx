<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyManage.aspx.cs" Inherits="FindAfternoonTea.FAT.admin.CompanyManage" %>

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
            <a href="../FATweb/StoreMain.aspx"><img src="../pic/logo.png" /></a>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#FFFFCC" Width="500px" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="name" HeaderText="公司名稱" SortExpression="name">
                            <HeaderStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="phone" HeaderText="電話" SortExpression="phone" />
                            <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
                            <asp:BoundField DataField="mail" HeaderText="信箱" SortExpression="mail" />
                            <asp:ImageField DataImageUrlField="logo" HeaderText="Logo">
                            </asp:ImageField>
                            <asp:BoundField DataField="about" HeaderText="關於" SortExpression="about" />
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" DeleteCommand="DELETE FROM [FAT_Company] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FAT_Company] ([name], [logo], [phone], [address], [mail], [about]) VALUES (@name, @logo, @phone, @address, @mail, @about)" SelectCommand="SELECT * FROM [FAT_Company]" UpdateCommand="UPDATE [FAT_Company] SET [name] = @name, [logo] = @logo, [phone] = @phone, [address] = @address, [mail] = @mail, [about] = @about WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="logo" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="mail" Type="String" />
                            <asp:Parameter Name="about" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="logo" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="mail" Type="String" />
                            <asp:Parameter Name="about" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    
    </div>
    </form>
</body>
</html>
<script src="../../Scripts/jquery-1.10.2.js"></script>
<script src="../JavaScript/MenuJQuery.js"></script>
<script src="../JavaScript/LogInOut.js"></script>
<script src="http://connect.facebook.net/en_us/all.js"></script>
<script src="http://apis.google.com/js/client.js?onload=onLoadCallback"></script>