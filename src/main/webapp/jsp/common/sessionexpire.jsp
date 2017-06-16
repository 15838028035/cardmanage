<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
<style> 
	 body{ background-color:#E2E2E2; color:#00FF00;}
     body{ text-align:center} 
    .div{ margin:0 auto; width:400px; height:100px; border:1px solid #F00} 
    /* css注释：为了观察效果设置宽度 边框 高度等样式 */ 
</style> 
</head>

<body>
	<div><h1><font color="#FF00FF"><font size=20><b>登录超时,请重新登录<b></font></h1></div>
		<div class="bottom_c"><a href="javascript:login()"><font size=18>登录</a></div>
</body>

<script language="javascript">
		function login() {
			window.parent.location.href="${ctx }/loginAction!login.action";
		}
</script>
</html>
