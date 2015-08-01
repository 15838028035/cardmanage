<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>计划管理</title>
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
<form action="planAction!save.action" method="post" name="planForm" id="planForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
            <td align="right">还款金额</td>
            <td><input type="text" id="inMoney" name="inMoney" value="${inMoney}" maxlength="30"/> </td>
        </tr>
          <tr>
            <td align="right"> <font color="red">刷卡金额</td>
             <td><input type="text" id="outMoney" name="outMoney" value="${outMoney}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font>剩余金额</td>
             <td><input type="text" id="remainMoney" name="remainMoney" value="${remainMoney}" maxlength="30"/> </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
 				<div class="window_button marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
		       	<div class="window_button marg_lef10 float_lef"><input type="button" id="cancelOpe" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="取消" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
        $("#submitButton").click(function() {
        	$("#planForm").submit();
        	return false;
        })

		$("#planForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			}
		});


        $("#cancelOpe").click(function() {
			jQuery.FrameDialog.closeDialog();
        });
</script>
</body>
</html>
