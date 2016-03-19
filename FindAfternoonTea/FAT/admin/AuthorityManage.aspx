<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthorityManage.aspx.cs" Inherits="FindAfternoonTea.FAT.admin.AuthorityManage" %>

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
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="序號" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="name" HeaderText="名字" SortExpression="name" />
                            <asp:ImageField DataImageUrlField="pic" HeaderText="照片">
                            </asp:ImageField>
                            <asp:TemplateField HeaderText="權限" SortExpression="authority">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("authority") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="authRadioButtonList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="authRadioButtonList_SelectedIndexChanged" RepeatDirection="Horizontal" SelectedValue='<%# Bind("authority") %>'>
                                        <asp:ListItem Value="custom">Custom</asp:ListItem>
                                        <asp:ListItem Value="manager">Manager</asp:ListItem>
                                        <asp:ListItem Value="admin">Admin</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:HiddenField ID="IdHiddenField" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT Id, name, pic, authority FROM FAT_Member WHERE ( Id Not in ('16'))" UpdateCommand="UPDATE [FAT_Member] SET [name] = @name, [pic] = @pic, [authority] = @authority WHERE [Id] = @Id" DeleteCommand="DELETE FROM [FAT_Member] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FAT_Member] ([name], [pic], [authority]) VALUES (@name, @pic, @authority)">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="pic" Type="String" />
                            <asp:Parameter Name="authority" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="pic" Type="String" />
                            <asp:Parameter Name="authority" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br /><br />
            <br />
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