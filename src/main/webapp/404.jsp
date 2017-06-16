<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
    //获得当前页面路径目录
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="GB2312">
    <title>您迷路了</title>
     <style> 
	 body{ background-color:#E2E2E2; color:#00FF00;}
     body{ text-align:center} 
    .div{ margin:0 auto; width:400px; height:100px; border:1px solid #F00} 
    /* css注释：为了观察效果设置宽度 边框 高度等样式 */ 
</style> 
</head>
<body>
<div id="tips_error">
    <i class="fa fa-bug fa-3x"></i><br>
    <font color="#FF00FF"><font size=50><b>温馨提示<b></font> 
	<br><font color="#CFB53B"><font size=18>你访问的页面不存在或你无权访问该页面！</font>
    <div class="bottom_c"><a href="javascript:window.history.go(-1)"><font size=5>返回</font></a></div>
</div>
<div id="tips_bg"></div>
<script src="js/jQuery1.12.4.js"></script>
<script>
    $(function () {
        //tips提示框居中
        $('#tips_error').css({
            top:'50%',
            left:'50%',
            margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'
        });
        $('#tips_bg').css({
            width:$(window).width(),
            height:$(document).height()
        });
    });
</script>
</body>
</html>
