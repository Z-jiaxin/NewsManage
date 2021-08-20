<%--
  Created by IntelliJ IDEA.
  User: W10
  Date: 2021/8/19
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻详情</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<h1><p class="text-center">${news.title}</p><br></h1>
<p class="text-left">${news.froms}</p>
<p class="text-right">${news.issuetime}</p><br>
<p class="text-center">${news.content}<p><br>
</body>
</html>
