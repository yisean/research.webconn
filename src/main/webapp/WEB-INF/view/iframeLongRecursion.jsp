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
        (function iframePolling() {
            var url = "${pageContext.request.contextPath}/conn/ajax?timed=" + new Date().getTime();
            var $iframe = $('<iframe id="frame" name="polling" style="display: none;" src="' + url + '"></iframe>');
            $("body").append($iframe);
        
            $iframe.load(function () {
                $("#logs").append("[data: " + $($iframe.get(0).contentDocument).find("body").text() + " ]<br/>");
                $iframe.remove();
                
                // 递归
                iframePolling();
            });
        })();    
    });
</script>
    </head>
    
    <body>
        这种方式虽然保证了请求的顺序，但是它不会处理请求延时的错误或是说很长时间没有返回结果的请求，它会一直等到返回请求后才能创建下一个iframe请求，总会和服务器保持一个连接。和以上轮询比较，缺点就是消息不及时，但保证了请求的顺序。
        
        <div id="logs"></div>
    </body>
</html>