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
                    $("#logs").append("[data: " + $($("#frame").get(0).contentDocument).find("body").text() + " ]<br/>");
                    $("#frame").attr("src", "${pageContext.request.contextPath}/conn/ajax?timed=" + new Date().getTime());
                    // 延迟1秒再重新请求
                    window.setTimeout(function () {
                        window.frames["polling"].location.reload();
                    }, 1000);
                }, 5000);
                
            });
        </script>
    </head>
    
    <body>
        <iframe id="frame" name="polling" style="display: none;"></iframe>
        <div id="logs"></div>
    </body>
</html>