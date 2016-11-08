﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testBanner.aspx.cs" Inherits="testJquery" %>

<!DOCTYPE html>

<style type="text/css">
#banner { position: relative; width: 478px; height: 286px; border: 1px solid #666; overflow: hidden; }
#banner_list img { border: 0px; }
#banner_bg { position: absolute; bottom: 0; background-color: #000; height: 30px; filter: Alpha(Opacity=30); opacity: 0.3; z-index: 1000; cursor: pointer; width: 478px; }
#banner_info { position: absolute; bottom: 0; left: 5px; height: 22px; color: #fff; z-index: 1001; cursor: pointer }
#banner_text { position: absolute; width: 120px; z-index: 1002; right: 3px; bottom: 3px; }
#banner ul { position: absolute; list-style-type: none; filter: Alpha(Opacity=80); opacity: 0.8; z-index: 1002; margin: 0; padding: 0; bottom: 3px; right: 5px; }
#banner ul li { padding: 0px 8px; float: left; display: block; color: #FFF; background: #6f4f67; cursor: pointer; border: 1px solid #333; }
#banner ul li.on { background-color: #000; }
#banner_list a { position: absolute; }

</style>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type="text/javascript">
    var t = n = 0,
    count;
    $(document).ready(function() {
        count = $("#banner_list a").length;
        $("#banner_list a:not(:first-child)").hide();
        $("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
        $("#banner_info").click(function() {
            window.open($("#banner_list a:first-child").attr('href'), "_blank")
        });
        $("#banner li").click(function() {
            var i = $(this).text() - 1; //获取Li元素内的值，即1，2，3，4
            n = i;
            if (i >= count) return;
            $("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
            $("#banner_info").unbind().click(function () {
                window.open($("#banner_list a").eq(i).attr('href'), "_blank")
            });$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
            document.getElementById("banner").style.background = "";
            $(this).toggleClass("on");
            $(this).siblings().removeAttr("class");
        });
        t = setInterval("showAuto()", 4000);
        $("#banner").hover(function() {
            clearInterval(t)
        },
        function() {
            t = setInterval("showAuto()", 4000);
        });
    })
 
    function showAuto() {
        n = n >= (count - 1) ? 0 : ++n;
        $("#banner li").eq(n).trigger('click');
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 <div id="banner">  
    <div id="banner_bg">       
    </div>
<!--标题背景-->
    <div id="banner_info"> 
    </div>
<!--标题-->
    <ul>   
        <li class="on">
            1
        </li>
        <li>
            2
        </li>
        <li>
            3
        </li>
        <li>
            4
        </li>
    </ul>
    <div id="banner_list">
        <a href="#" target="_blank"><img src="images/banner_1.jpg" title="重阳节" alt="重阳节"></a> <a href="#" target="_blank"><img src="images/banner_2.jpg" title="中秋节" alt="中秋节"></a> <a href="#" target="_blank"><img src="images/banner_3.jpg" title="天堂网" alt="天堂网"></a> <a href="#" target="_blank"><img src="images/banner_3.jpg" title="天堂网" alt="天堂网"></a>
    </div>
</div>      
    </form>
</body>
</html>
