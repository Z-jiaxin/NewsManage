<%--
  Created by IntelliJ IDEA.
  User: W10
  Date: 2021/8/18
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>新闻列表</title>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/css">
        .page_info_area{
            text-align: center;
        }
    </script>
<body>

<h1>新闻列表：</h1>
<table class="table table-hover">
    <tr>
        <th>新闻编号</th>
        <th>新闻标题</th>
        <th>发布时间</th>
        <th>新闻类型</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${pageInfo.list}" var="news">
        <tr>
            <td>${news.id}</td>
            <td><a href="${APP_PATH}/toNewsDetail/${news.id}"> ${news.title}</a></td>
            <td>${news.issuetime}</td>
            <td>${news.category.categoryname}</td>
            <td>
                <button class="btn btn-primary btn-sm edit_btn" id="news_update_btn" update_id="${news.id}">
                    <span class="glyphicon glyphicon-pencil"></span>
                    修改</button>
                <button class="btn btn-danger btn-sm delete_btn" delete_id="${news.id}">
                    <span class="glyphicon glyphicon-trash"></span>
                    删除</button>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- 显示分页信息 -->
<div class="container">
<div class="row">
    <!--分页文字信息  -->
    <div id="page_info_area" class=".col-md-6 .col-md-offset-1">
        当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总
        ${pageInfo.total}条记录
    </div>
    <!--分页条信息  -->
    <div id="page_nav_area"  class=".col-md-6 .col-md-offset-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="${APP_PATH}/newsList/1">首页</a></li>
                <li>
                    <a href="${APP_PATH}/newsList/${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                    <li><a href="${APP_PATH}/newsList/${pageNum}">${pageNum}</a></li>
                </c:forEach>
                <li>
                    <a href="${APP_PATH}/newsList/${pageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <li><a href="${APP_PATH}/newsList/${pageInfo.total}">尾页</a></li>
            </ul>
        </nav>
    </div>
</div>
</div>

<script>
    //点击修改按钮跳转到修改界面
    $(".edit_btn").click(function(){
        //跳转到修改界面
        self.location="${APP_PATH}/toNewsUpdate/"+$(this).attr("update_id");
    });

    //点击删除按钮
    $(".delete_btn").click(function(){
        var title = $(this).parents("tr").find("td:eq(1)").text();
        //弹出确认删除框
        if(confirm("确认删除【"+title+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_PATH}/deleteNews/"+$(this).attr("delete_id"),
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到本页面
                    self.location="${APP_PATH}/getNews/"+${pageInfo.pageNum};
                }
            });
        }
    });

</script>
</body>
</html>

