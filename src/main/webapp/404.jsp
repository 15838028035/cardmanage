<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
    //��õ�ǰҳ��·��Ŀ¼
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="GB2312">
    <title>����·��</title>
     <style> 
	 body{ background-color:#E2E2E2; color:#00FF00;}
     body{ text-align:center} 
    .div{ margin:0 auto; width:400px; height:100px; border:1px solid #F00} 
    /* cssע�ͣ�Ϊ�˹۲�Ч�����ÿ�� �߿� �߶ȵ���ʽ */ 
</style> 
</head>
<body>
<div id="tips_error">
    <i class="fa fa-bug fa-3x"></i><br>
    <font color="#FF00FF"><font size=50><b>��ܰ��ʾ<b></font> 
	<br><font color="#CFB53B"><font size=18>����ʵ�ҳ�治���ڻ�����Ȩ���ʸ�ҳ�棡</font>
    <div class="bottom_c"><a href="javascript:window.history.go(-1)"><font size=5>����</font></a></div>
</div>
<div id="tips_bg"></div>
<script src="js/jQuery1.12.4.js"></script>
<script>
    $(function () {
        //tips��ʾ�����
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
