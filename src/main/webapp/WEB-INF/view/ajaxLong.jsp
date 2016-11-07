<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="author" content="hoojo & http://hoojo.cnblogs.com">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.8.3.min.js"></script>
		
        
        
        <script type="text/javascript">
            $(function () {
            
                (function longPolling() {
                
                    $.ajax({
                        url: "${pageContext.request.contextPath}/conn/ajax",
                        data: {"timed": new Date().getTime()},
                        dataType: "text",
                        timeout: 5000,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            $("#state").append("[state: " + textStatus + ", error: " + errorThrown + " ]<br/>");
                            if (textStatus == "timeout") { // 请求超时
                                    longPolling(); // 递归调用
                                
                                // 其他错误，如网络错误等
                                } else { 
                                    longPolling();
                                }
                            },
                        success: function (data, textStatus) {
                            $("#state").append("[state: " + textStatus + ", data: { " + data + "} ]<br/>");
                            
                            if (textStatus == "success") { // 请求成功
                                longPolling();
                            }
                        }
                    });
                })();
                
            });
        </script>
    </head>
    
    <body>
    如果当前连接请求成功后，将更新数据并且继续创建一个新的连接和服务器保持联系。如果连接超时或发生异常，这个时候程序也会创建一个新连接继续请求。这样就大大节省了服务器和网络资源，提高了程序的性能，从而也保证了程序的顺序。
    <h2>ajaxLong</h2>
        <div id="state"></div>
    </body>
</html>