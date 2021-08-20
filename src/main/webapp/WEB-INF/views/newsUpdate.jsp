<%--
  Created by IntelliJ IDEA.
  User: W10
  Date: 2021/8/18
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻修改</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <%--引入bootstrap-datetimepicker时间控件--%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

    <%--引入百度编辑器--%>
    <script type="text/javascript" charset="utf-8" src="${APP_PATH}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${APP_PATH}/ueditor/ueditor.all.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${APP_PATH}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">var ue = UE.getEditor("content");</script>
</head>

<body>

<h1>修改新闻：</h1>
<form class="form-horizontal" action="${APP_PATH}/updateNews/${news.id}" method="post">
    <div class="form-group">
        <label class="col-sm-2 control-label">新闻标题:</label>
        <div class="col-sm-10">
            <input type="text" name="title" class="form-control" id="newstitle_add_input" value="${news.title}">
            <span class="help-block"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">新闻内容:</label>
        <div class="col-sm-10">
            <textarea type="text" name="content" id="content">${news.content}</textarea></p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">新闻类型:</label>
        <div class="col-sm-4">
            <!-- 新闻类型提交部门id即可 -->
            <select class="form-control" name="categoryId" id="category_update_select" default="${news.categoryId}">

            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">发布时间:</label>
        <div class="col-sm-4">
            <!--指定 date标记-->
            <div class='input-group date' id='datetimepicker'>
                <input type='text' class="form-control" name="issuetime" value="${news.issuetime}"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">新闻来源:</label>
        <div class="col-sm-10">
            <input type="text" name="froms" class="form-control" id="froms" value="${news.froms}">
        </div>
    </div>
    <button type="submit" class="btn btn-primary" id="save_btn">保存</button>
</form>
<script>
    //1、页面加载完成以后，直接发送一个ajax请求，要到类型数据
    $(function(){
        $.ajax({
            url:"${APP_PATH}/getCate",
            type:"GET",
            success:function(result){
                //显示部门信息在下拉列表中
                $.each(result.extend.categories,function(){
                    var cid = $("#category_update_select").attr("default");
                    if(this.id == cid){
                        var optionEle = $("<option></option>").append(this.categoryname).attr("value",this.id).attr("selected","selected");
                    }else{
                        var optionEle = $("<option></option>").append(this.categoryname).attr("value",this.id);
                    }
                    optionEle.appendTo("#category_update_select");
                });
            }
        });
        $('#datetimepicker').datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
    });


</script>
</body>
</html>
