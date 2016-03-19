<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FindAfternoonTea.FAT.FATweb.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Css/indexStyleSheet.css" rel="stylesheet" />
    <title>找茶|F.A.T.</title>
</head>
    <script>
        var loginProvider = '<%=Session["loginProvider"]%>';
        var loginUserName = '<%=Session["name"]%>';
        var loginUserpic = '<%=Session["pic"]%>';
    </script>
<body>
    <form id="form1" runat="server">
    <div id="main" align="center">
        <div id="loginBox">
            <div id="info">
                <div id="imgBox"></div><br />
                <p id="nameLabel"></p>
            </div>
            <div id="logButton">
                <div class="logo"></div>
                <div id="time"></div>
                <div id="welcome">Welcome ! Please Login First !</div>
                <div class="fb" onclick="FBlogin()"></div>
                <div class="google"  onclick="GoogleLogin()"></div>
            </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" DeleteCommand="DELETE FROM [FAT_Member] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FAT_Member] ([position], [name], [pic], [FBmail], [Gmail], [authority]) VALUES (@position, @name, @pic, @FBmail, @Gmail, @authority)" SelectCommand="SELECT Id, name, pic, FBmail, Gmail, authority FROM FAT_Member WHERE (FBmail = @fbMail) OR (Gmail = @gMail)" UpdateCommand="UPDATE [FAT_Member] SET [position] = @position, [name] = @name, [pic] = @pic, [FBmail] = @FBmail, [Gmail] = @Gmail, [authority] = @authority WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="position" Type="String" />
                <asp:SessionParameter Name="name" SessionField="name" Type="String" />
                <asp:SessionParameter Name="pic" SessionField="pic" Type="String" />
                <asp:SessionParameter Name="FBmail" SessionField="FBmail" Type="String" />
                <asp:SessionParameter Name="Gmail" SessionField="Googlemail" Type="String" />
                <asp:SessionParameter Name="authority" SessionField="authority" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="fbMail" SessionField="mail" />
                <asp:SessionParameter Name="gMail" SessionField="mail" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="pic" Type="String" />
                <asp:Parameter Name="FBmail" Type="String" />
                <asp:Parameter Name="Gmail" Type="String" />
                <asp:Parameter Name="authority" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
<script src="../../Scripts/jquery-1.10.2.js"></script>
<script src="../JavaScript/indexJQuery.js"></script>
<script src="../JavaScript/LogInOut.js"></script>
<script src="http://connect.facebook.net/en_us/all.js"></script>
<script src="http://apis.google.com/js/client.js?onload=onLoadCallback"></script>
