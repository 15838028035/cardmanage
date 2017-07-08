<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			window.open("${ctx}/index.jsp",'_new','fullscreen=yes,scrollbars=yes');
			window.opener=null;
			window.close();			
		});	
	</script>
</head>
<body>
</body>
</html>