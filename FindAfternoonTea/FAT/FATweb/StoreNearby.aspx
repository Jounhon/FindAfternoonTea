<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreNearby.aspx.cs" Inherits="FindAfternoonTea.FAT.FATweb.StoreNearby" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Css/font-awesome.css" rel="stylesheet" />
    <link href="../Css/MainStyleSheet.css" rel="stylesheet" />
    <title>找茶|F.A.T.</title>
    <script>
        var loginProvider = '<%=Session["loginProvider"]%>';
        var UserAuthority = '<%=Session["authority"]%>';
    </script>
    <script src="https://apis.google.com/js/platform.js" async defer>
      {lang: 'zh-TW'}
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="world" align="center">
        <div id="topMenu">
            <a href="StoreMain.aspx"><img alt="" src="../pic/logo.png" /></a>
            <ul>
                <li><a href="StoreList.aspx">下午茶</a></li>
                <li><a href="StoreNearby.aspx">附近</a></li>
                <li id="manageLink" style="display:none;"><a href="../admin/StoreManage.aspx">管理</a></li>
                <li><a href="#" onclick="Logout();return false">登出</a></li>
            </ul>
            <div id="search">
                <button id="searchButton" class="searchButton">></button>
                <input class="searchText" id="searchText" type="text" />
                <img id="searchIcon" alt="" src="../pic/search_icon.png" />
            </div>
        </div>
        <div id="main">
        <div id="map">
        </div>
        </div>
        <div id="aboutInfo">
            <div class="about">
                <h4 class="name"></h4>
                <p class="details"></p>
                <div id="fb-root"></div>
                <div class="fb-like" data-href="http://iweb.csie.ntut.edu.tw:9080/Final38/FAT/FATweb/index" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
                <div class="g-plugin" ><div class="g-plus" data-action="share" data-annotation="bubble" data-href="http://iweb.csie.ntut.edu.tw:9080/Final38/FAT/FATweb/index"></div></div>
            </div>
            <div class="info">
                <h4 class="name"></h4>
                <ul>
                    <li class="addresss"></li>
                    <li class="phone"></li>
                    <li class="email"></li>
                </ul>
            </div>
            <div class="logo">
                <img src="" />
            </div>
        </div>
        <div id="rightBox">
            <p class="text-right">© 2015 FAT. Design Rights Reserved.</p>
        </div>
        <asp:HiddenField ID="addressHiddenField" runat="server" />
        <asp:HiddenField ID="storeIdHiddenField" runat="server" />
        <asp:HiddenField ID="nameHiddenField" runat="server" />
        <asp:HiddenField ID="priceHiddenField" runat="server" />
        <asp:HiddenField ID="phoneHiddenField" runat="server" />
        <asp:HiddenField ID="openHiddenField" runat="server" />
        <asp:HiddenField ID="closeHiddenField" runat="server" />
        <asp:HiddenField ID="picHiddenField" runat="server" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT FAT_Store.Id, FAT_District.districtName, FAT_Store.address, FAT_Store.name, FAT_Store.price, FAT_Store.phone, FAT_Store.[open], FAT_Store.[close] FROM FAT_Store INNER JOIN FAT_District ON FAT_Store.district = FAT_District.districtNum"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT pic FROM FAT_StorePic WHERE (storeId = @storeId)">
            <SelectParameters>
                <asp:Parameter Name="storeId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
<script src="../../Scripts/jquery-1.10.2.js"></script>
<script src="http://maps.google.com/maps/api/js?v=3.9&sensor=true"></script>
<script src="../JavaScript/StoreNearbyJQuery.js"></script>
<script src="../JavaScript/MenuJQuery.js"></script>
<script src="../JavaScript/LogInOut.js"></script>
<script src="http://connect.facebook.net/en_us/all.js"></script>
<script src="http://apis.google.com/js/client.js?onload=onLoadCallback"></script>