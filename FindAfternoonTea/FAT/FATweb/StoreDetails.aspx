<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreDetails.aspx.cs" Inherits="FindAfternoonTea.FAT.FATweb.StoreDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Css/font-awesome.css" rel="stylesheet" />
    <link href="../Css/MainStyleSheet.css" rel="stylesheet" />
    <title>找茶|F.A.T.</title>
</head>
    <script type="text/javascript" language="javascript">
        var val=<%= Session["storeId"] %>;
        var loginProvider = '<%=Session["loginProvider"]%>';
        var UserAuthority = '<%=Session["authority"]%>';
    </script>
    <script src="https://apis.google.com/js/platform.js" async defer>
      {lang: 'zh-TW'}
    </script>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="photo">
                    <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
                        <EditItemTemplate>
                            pic:
                            <asp:TextBox ID="picTextBox" runat="server" Text='<%# Bind("pic") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            pic:
                            <asp:TextBox ID="picTextBox" runat="server" Text='<%# Bind("pic") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" CssClass="detailImg" ImageUrl='<%# Eval("pic") %>' />
                        </ItemTemplate>
                    </asp:FormView>
                    &nbsp;<div id="photoList">
                        <asp:DataList ID="DataList1" runat="server" CellPadding="0" DataSourceID="SqlDataSource2" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="80px" ImageUrl='<%# Eval("pic") %>' Width="120px" />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT pic FROM FAT_StorePic WHERE (storeId = @storeID) ORDER BY Id">
                            <SelectParameters>
                                <asp:SessionParameter Name="storeID" SessionField="storeId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    
        <br />
        <div id="details">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" CssClass="FV">
                <EditItemTemplate>
                    name:
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    <br />
                    price:
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    <br />
                    open:
                    <asp:TextBox ID="openTextBox" runat="server" Text='<%# Bind("open") %>' />
                    <br />
                    close:
                    <asp:TextBox ID="closeTextBox" runat="server" Text='<%# Bind("close") %>' />
                    <br />
                    phone:
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    districtName:
                    <asp:TextBox ID="districtNameTextBox" runat="server" Text='<%# Bind("districtName") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                    <br />
                    likes:
                    <asp:TextBox ID="likesTextBox" runat="server" Text='<%# Bind("likes") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    name:
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    <br />
                    price:
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    <br />
                    open:
                    <asp:TextBox ID="openTextBox" runat="server" Text='<%# Bind("open") %>' />
                    <br />
                    close:
                    <asp:TextBox ID="closeTextBox" runat="server" Text='<%# Bind("close") %>' />
                    <br />
                    phone:
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    districtName:
                    <asp:TextBox ID="districtNameTextBox" runat="server" Text='<%# Bind("districtName") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                    <br />
                    likes:
                    <asp:TextBox ID="likesTextBox" runat="server" Text='<%# Bind("likes") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table class="detailsTable">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' CssClass="nameLabel" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td1-width">
                                價格：</td>
                            <td class="td1-width">
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                            </td>
                            <td class="td2-width">
                                電話：<asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="td1-width">
                                營業時間：</td>
                            <td class="td1-width">
                                <asp:Label ID="openLabel" runat="server" Text='<%# Bind("open") %>' />
                            </td>
                            <td class="td2-width">
                                地址：<asp:Label ID="districtNameLabel" runat="server" Text='<%# Bind("districtName") %>' />
                                <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="td1-width">
                                公休日：</td>
                            <td class="td1-width">
                                <asp:Label ID="closeLabel" runat="server" Text='<%# Bind("close") %>' />
                            </td>
                            <td class="td2-width">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />

                </ItemTemplate>
            </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT FAT_Store.name, FAT_Store.price, FAT_Store.[open], FAT_Store.[close], FAT_Store.phone, FAT_District.districtName, FAT_Store.address FROM FAT_Store INNER JOIN FAT_District ON FAT_Store.district = FAT_District.districtNum WHERE (FAT_Store.Id = @storeID)">
            <SelectParameters>
                <asp:SessionParameter Name="storeID" SessionField="storeId" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
        <div id="map"></div>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="comment">
                    <br />
                    <br />
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <table class="commentBox">
                                <tr class="tr1">
                                    <td>
                                        <asp:Image ID="Image2" runat="server" Height="50px" ImageUrl='<%# Eval("pic") %>' Width="50px" />
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' Font-Bold="True" Font-Size="18px" />
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="commentLabel" runat="server" Text='<%# Eval("comment") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Height="86px" TextMode="MultiLine" Width="336px"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="發表評論" />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WWW38ConnectionString %>" SelectCommand="SELECT FAT_Comment.comment, FAT_Comment.time, FAT_Member.pic, FAT_Member.name FROM FAT_Comment INNER JOIN FAT_Member ON FAT_Comment.email = FAT_Member.FBmail OR FAT_Comment.email = FAT_Member.Gmail WHERE (FAT_Comment.storeId = @storeID)" InsertCommand="INSERT INTO FAT_Comment(storeId, comment, time, email) VALUES (@storeid, @comment, @time, @mail)">
                        <InsertParameters>
                            <asp:Parameter Name="storeid" />
                            <asp:Parameter Name="comment" />
                            <asp:Parameter Name="time" />
                            <asp:Parameter Name="mail" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="storeID" SessionField="storeId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
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
    </div>
    </form>
</body>
</html>
<script src="../../Scripts/jquery-1.10.2.js"></script>
<script src="http://maps.google.com/maps/api/js?v=3.9&sensor=false"></script>
<script src="http://connect.facebook.net/en_us/all.js"></script>
<script src="http://apis.google.com/js/client.js?onload=onLoadCallback"></script>
<script src="../JavaScript/StoreDetailJQuery.js"></script>
<script src="../JavaScript/MenuJQuery.js"></script>
<script src="../JavaScript/LogInOut.js"></script>