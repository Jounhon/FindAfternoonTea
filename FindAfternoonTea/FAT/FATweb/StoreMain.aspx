<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreMain.aspx.cs" Inherits="FindAfternoonTea.FAT.FATweb.StoreMain" %>

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

        <div id="banner" class="banner">
            <ul>

            </ul>
        </div>
        <div id="newList">
            <p>NEW</p>
            <div class="border-top"></div>
            <asp:DataList ID="DataList1" runat="server" CellSpacing="80" DataKeyField="Id" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="120px" ImageUrl='<%# Eval("pic") %>' Width="180px" />
                    <br />
&nbsp;<asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br />
                    <asp:HiddenField ID="storeIdHiddenField" runat="server" Value='<%# Eval("Id") %>' />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="WITH CTE AS (SELECT FAT_StorePic.pic, FAT_Store.Id, FAT_Store.name, ROW_NUMBER() OVER (Partition BY FAT_Store.Id ORDER BY FAT_StorePic.Id) AS 'Sort' FROM FAT_StorePic INNER JOIN FAT_Store ON FAT_StorePic.storeId = FAT_Store.Id) SELECT TOP 6 Id,pic,name FROM CTE WHERE Sort = 1 ORDER BY Id DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT TOP (10) Id, pic FROM FAT_StorePic ORDER BY NEWID()"></asp:SqlDataSource>
        <asp:HiddenField ID="PicHiddenField" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <div id="able">
            <p class="title">『找茶』古笈記載，下午茶具有</p>
            <div class="container">
                <div class="box" >
                    <img src="../pic/happiness.png" width="80" height="80" />
                    <div class="subject"><h3 class="text-happiness">感到幸福</h3></div>
                </div>
                <div class="box" >
                    <img src="../pic/enjoy.png" width="80" height="80" />
                    <div class="subject"><h3 class="text-enjoy">覺得享受</h3></div>
                </div>
                <div class="box" >
                    <img src="../pic/relax.png" width="80" height="80" />
                    <div class="subject"><h3 class="text-relax">放鬆心情</h3></div>
                </div>
                <div class="box" >
                    <img src="../pic/social.png" width="80" height="80" />
                    <div class="subject"><h3 class="text-social">社交功能</h3></div>
                </div>
                <div class="box" >
                    <img src="../pic/strong.png" width="80" height="80" />
                    <div class="subject"><h3 class="text-strong">增強記性</h3></div>
                </div>
                <div class="box" >
                    <img src="../pic/recover.png" width="80" height="80" />
                    <div class="subject"><h3 class="text-recover">恢復體力</h3></div>
                </div>
                <div class="box" >
                    <img src="../pic/kickout.png" width="80" height="80" />
                    <div class="subject"><h3 class="text-kickout">趕走睡蟲</h3></div>
                </div>
            </div>
        </div>
        <div id="legend">
            <div class="story">
                <h2>傳說中的找茶之王：<br />F.A.T 菲特</h2>
                <div class="border-top"></div>
                <p class="words">一切的一切，都將從世界"最餓"的戰爭－找茶之爭－開始，<br />
以台灣為根據地的『汎德‧阿福特努替』聯盟，其領導者-菲特，<br />
因為找茶古笈有云：下午茶能帶來很多種好處，<br />
所以為了找出激勵聯盟，使聯盟在下次會戰開打時能贏的方法，<br />
開發了一個網頁『找茶』給成員使用。<br />
這個網頁讓成員更方便尋找好吃的下午茶在哪，<br />
若是非聯盟會員使用了這個網頁，
就會自願立下誓約加入聯盟而成為『找茶之民』！</p>
                <p class="words">而這一切，開啟了找茶聯盟的連勝，讓四處都成為汎德‧阿福特努替聯盟的附屬地....</p>
            </div>
            <div class="character">
                <img src="../pic/Fat.png" />
            </div>
        </div>
        <div id="space"></div>
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
        </div>
    </form>
</body>
</html>
<script src="../../Scripts/jquery-1.10.2.js"></script>
<script src="../JavaScript/unslider.js"></script>
<script src="../JavaScript/StoreMainJQuery.js"></script>
<script src="../JavaScript/MenuJQuery.js"></script>
<script src="../JavaScript/LogInOut.js"></script>
<script src="http://connect.facebook.net/en_us/all.js"></script>
<script src="http://apis.google.com/js/client.js?onload=onLoadCallback"></script>