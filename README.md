# research.webconn
This is a demo shows the http long  connection！！http 长连接示例！

http 长连接实现原理：前端发送请求，后端用一个循环模拟阻塞，当请求超时或循环符合条件正常返回后，下一个请求继续重复此操作。

示例采用 spring MVC 实现控制层，用maven管理项目， 模拟了ajax请求、iframe 请求。
