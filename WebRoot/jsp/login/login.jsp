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
	
</head>
<body>
		<form id="loginForm" action="<%=basePath %>loginAction!login.action" method="post">
			<p>用户名:<input type="text" name="loginNo" id="loginNo"/></p>
			<p>密码:<input type="password" name="pwd" id="pwd" /></p>
			<input type="button" value="submit"/>
           </form>

	<a href="<%=basePath %>loginAction!login.action?loginNo=system&pwd=123">login</a>
</body>
</html>