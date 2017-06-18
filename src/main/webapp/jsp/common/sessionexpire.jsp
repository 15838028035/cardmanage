<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>登陆提示 </title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<script>
		$(document).ready(function(){
				bootbox.confirm("登陆超时,请重新登陆",function (result) {  
	                if(result) {  
						window.parent.location.href="${ctx }/loginAction!login.action";
	                }
				});
		});
	</script>
</head>

<body>
</body>

</html>
