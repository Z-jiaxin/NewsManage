<%--
  Created by IntelliJ IDEA.
  User: W10
  Date: 2021/8/17
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>新闻类型</title>
</head>
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
    <%--类型添加的模态框--%>
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加类型</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型名称</label>
                            <div class="col-sm-10">
                                <input type="text" name="categoryname" class="form-control" id="categoryname_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>
    <%--类别修改的模态框--%>
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改类型</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型编号</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="id_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型名称</label>
                            <div class="col-sm-10">
                                <input type="text" name="categoryname" class="form-control" id="categoryname_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="update_btn">修改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <h1>新闻类型：</h1>
    <div class="col-md-4 col-md-offset-8">
        <button class="btn btn-primary btn-sm" id="add_btn">新增</button>
    </div>
    <table class="table table-hover">
        <tr>
            <th>类型编号</th>
            <th>类型名称</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="category">
            <tr>
                <td>${category.id}</td>
                <td>${category.categoryname}</td>
                <td>
                    <button class="btn btn-primary btn-sm edit_btn" id="category_update_btn" update_id="${category.id}">
                        <span class="glyphicon glyphicon-pencil"></span>
                        修改</button>
                    <button class="btn btn-danger btn-sm delete_btn" delete_id="${category.id}">
                        <span class="glyphicon glyphicon-trash"></span>
                        删除</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div id="page_info_area" class=".col-md-6 .col-md-offset-1">
            当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总
            ${pageInfo.total}条记录
        </div>
        <!--分页条信息  -->
        <div id="page_nav_area">
            <nav aria-label="...">
                <ul class="pager">
                    <li id=" prePage"><a href="${APP_PATH}/getCategories/${pageInfo.pageNum-1}">Previous</a></li>
                    <li id="nextPage"><a href="${APP_PATH}/getCategories/${pageInfo.pageNum+1}">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>

    <script>
        //点击修改按钮弹出模态框
        $(".edit_btn").click(function(){
            //1、查出类型信息，显示类型列表
            $.ajax({
				url:"${APP_PATH}/getCategory/"+$(this).attr("update_id"),
				type:"GET",
				success:function(result){
					var category = result.extend.category;
					console.log(category);
					$("#id_update_static").text(category.id);
					$("#categoryname_update_input").val(category.categoryname);
				}
			});
            //2、把员工的id传递给模态框的更新按钮
            $("#update_btn").attr("update_id",$(this).attr("update_id"));
            //弹出模态框
            $("#updateModal").modal({
                backdrop:"static"
            });
        });

        //点击模态框修改按钮，更新类型信息
        $("#update_btn").click(function(){
            //发送ajax请求保存更新的类型数据
            $.ajax({
                url:"${APP_PATH}/updateCategory/"+$(this).attr("update_id"),
                type:"POST",
                data:$("#updateModal form").serialize()+"&_method=PUT",
                success:function(result){
                    //alert("处理成功");
                    //1、关闭模态框
                    $("#updateModal").modal("hide");
                    //2、回到本页面
                    self.location="${APP_PATH}/getCategories/"+${pageInfo.pageNum};
                }
            });
        });

        //点击删除按钮
        $(".delete_btn").click(function(){
            var categoryName = $(this).parents("tr").find("td:eq(1)").text();
            //弹出确认删除框
            if(confirm("确认删除【"+categoryName+"】吗？")){
                //确认，发送ajax请求删除即可
                $.ajax({
                    url:"${APP_PATH}/deleteCategory/"+$(this).attr("delete_id"),
                    type:"DELETE",
                    success:function(result){
                        alert(result.msg);
                        //回到本页面
                        self.location="${APP_PATH}/getCategories/"+${pageInfo.pageNum};
                    }
                });
            }
        });

        //点击新增按钮
        $("#add_btn").click(function () {
            //弹出模态框
            $("#addModal").modal({
                backdrop:"static"
            });
        });

        //点击模态框保存按钮，保存类型信息
        $("#save_btn").click(function () {
            //1、模态框中填写的表单数据提交给服务器进行保存
            //判断之前的ajax用户校验是否成功
            if($(this).attr("ajax_va")=="error"){
                return false;
            }
            //发送ajax请求保存类型数据
            $.ajax({
                url:"${APP_PATH}/addCategory",
                type:"POST",
                data:$("#addModal form").serialize(),
                success:function(result){
                    //alert("处理成功");
                    //1、关闭模态框
                    $("#addModal").modal("hide");
                    //2、回到本页面
                    self.location="${APP_PATH}/getCategories/"+${pageInfo.total};
                }
            });
        });

        //检验类型是否重复
        $("#categoryname_add_input").change(function(){
            //发送ajax请求检验用户名是否可用
            var categoryName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkCategory",
                data:"categoryName="+categoryName,
                type:"POST",
                success:function(result){
                    if(result.code == 100){
                        $("#categoryname_add_input").next("span").text("用户名可用");
                        $("#save_btn").attr("ajax_va","success");
                    }else{
                        $("#categoryname_add_input").next("span").text("用户名重复");
                        $("#save_btn").attr("ajax_va","error");
                    }
                }
            });
        });
    </script>
</body>
</html>
