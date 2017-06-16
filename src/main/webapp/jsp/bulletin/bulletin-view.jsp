<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>公告管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script>
		$(document).ready(function(){
			if('${returnMessage}' != ""){
				showModalMessage("${returnMessage}","doUpdateSuccess()");
			}
		});
		function doUpdateSuccess(){
			jQuery.FrameDialog.closeDialog();
		   	parent.location.reload();
		}
	</script>
</head>
<body>
<form action="bulletinAction!save.action" method="post" name="bulletinForm" id="bulletinForm">
<input type="hidden" name="bulletinId" id="id" value="${bulletinId}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table>
        <tr>
			 <td align="right">类别名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="typeName" name="typeName" value="${typeName}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">等级名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="levelName" name="levelName" value="${levelName}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">标题<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="title" name="title" value="${title}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">目标类别名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="targetTypeName" name="targetTypeName" value="${targetTypeName}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">目标名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="targetName" name="targetName" value="${targetName}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">是否内部名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="isNestedName" name="isNestedName" value="${isNestedName}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">状态<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="state" name="state" value="${state}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">生效日期<font color="red">*</font></td>
			 <td>
				<input type="text" name="effDate" id = "effDate" value="<s:date name='effDate' format='yyyy-MM-dd' />" class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">有效期<font color="red">*</font></td>
			 <td>
				<input type="text" name="expDate" id = "expDate" value="<s:date name='expDate' format='yyyy-MM-dd' />" class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
            <td>
            </td>
            <td>
 				<div class="window_button marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
		       	<div class="window_button marg_lef10 float_lef"><input type="button" id="backToHomeButton" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="返回主页" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
 $("#submitButton").click(function() {
        	$("#bulletinForm").submit();
        	return false;
        })
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
