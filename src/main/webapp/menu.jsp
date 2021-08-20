<%--
  Created by IntelliJ IDEA.
  User: W10
  Date: 2021/8/17
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Verdana, Arial, Helvetica, sans-serif;
        }

        .accordion,
        .accordion ul { /* 折叠菜单及其子菜单的通用样式 */
            font-size: 14px;
            font-weight: bold;
            width: 300px;
            margin: 0;
            padding: 0;
            list-style: none;
            text-align: center;
            border: 5px solid #ffffff;
        }

        .accordion ul {
            border: 0;
        }

        .accordion ul li { /* 子菜单的菜单项样式 */
            line-height: 50px;
            height: 50px;
            color: rgba(0, 0, 0, 0.39);
            border-bottom: 1px solid #e6efee;
            background-color: #ffffff;
        }

        .accordion li span { /* 折叠菜单的标题样式 */
            line-height: 60px;
            display: block;
            height: 60px;
            color: rgba(0, 0, 0, 0.39);
            border: 2px solid #ffffff;
            background-color: #e6efee;
        }

        .accordion li.selected span { /* 折叠菜单选中项的标题样式 */
            color: rgba(0, 0, 0, 0.39);
            background-color: #e6efee;
        }

        .accordion li div { /* 子菜单平时不显示 */
            display: none;
        }

        .accordion li.selected div { /* 添加了selected样式时才显示 */
            display: block;
        }
    </style>
</head>
<body>
<ul class="accordion">
    <li class="selected">
        <span>类型管理</span>
        <div>
            <ul>
                <li><a href="${APP_PATH}/getCategories/1" target="right">类型查看</a></li>
            </ul>
        </div>
    </li>
    <li>
        <span>新闻管理</span>
        <div>
            <ul>
                <li><a href="${APP_PATH}/newsList/1" target="right">新闻查看</a></li>
                <li><a href="${APP_PATH}/toNewsAdd" target="right">新闻发布</a></li>
            </ul>
        </div>
    </li>
</ul>
<script type="text/javascript">
    $(function () {
        $("ul.accordion li span").on('click', function () {
            $(this).parent().siblings().removeClass('selected').find('div').hide();
            $(this).parent().addClass('selected');
            $(this).next().slideDown(500);
        });
    });
</script>
</body>
</html>
