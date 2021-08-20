<%--
  Created by IntelliJ IDEA.
  User: W10
  Date: 2021/8/17
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        .frame_top{
            width:100%;
            height:10%;
            float:top;
        }
        .frame_left{
            width:20%;
            height:200%;
            float:left;
            text-align: center;
            font-size: medium;
        }
        .frame_right{
            width:80%;
            height:200%;
            float:left;
        }
    </style>
</head>
<body>
<div class="frame_top">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#">新闻管理系统</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">登录</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>

<div class="frame_left">
    <iframe src="menu.jsp" height="800" width="100%" frameborder=0 ></iframe>
</div>
<div class="frame_right">
    <iframe src="http://baidu.com"  name="right" height="800" width="100%" frameborder=0 ></iframe>
</div>
</body>
</html>
