<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.8.3.min.js"></script>
        
        <script type="text/javascript">
            $(function () {
            
                window.setInterval(function () {
                    var url = "${pageContext.request.contextPath}/conn/ajax?timed=" + new Date().getTime();
                    var $iframe = $('<iframe id="frame" name="polling" style="display: none;" src="' + url + '"></iframe>');
                    $("body").append($iframe);
                
                    $iframe.load(function () {
                        $("#logs").append("[data: " + $($iframe.get(0).contentDocument).find("body").text() + " ]<br/>");
                        $iframe.remove();
                    });
                }, 5000);
                
            });
        </script>
    </head>
    
    <body>
        每个请求都有自己独立的一个iframe，当这个iframe得到响应的数据后就把数据push到当前页面上。使用此方法已经类似于ajax的异步交互了，这种方法也是不能保证顺序的、比较耗费资源、而且总是有一个加载的条在地址栏或状态栏附件（当然要解决可以利用htmlfile，Google的攻城师们已经做到了，网上也有封装好的lib库）
        <div id="logs"></div>
    </body>
</html>