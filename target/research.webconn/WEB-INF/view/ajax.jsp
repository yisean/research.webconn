<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="author" content="hoojo & http://hoojo.cnblogs.com">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.3.min.js"></script>
		
        <script type="text/javascript">
            $(function () {
            
                window.setInterval(function () {
                
                    $.get("${pageContext.request.contextPath}/communication/user/ajax.mvc", 
                        {"timed": new Date().getTime()}, 
                        function (data) {
                            $("#logs").append("[data: " + data + " ]<br/>");
                    });
                }, 3000);
                
            });
        </script>
    </head>
    
    <body>
        <div id="logs"></div>
    </body>
</html>