<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>
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
<form action="creditCardAction!save.action" method="post" name="creditCardForm" id="creditCardForm">
<input type="hidden" name="id" value="${id }"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
           <td align="right"> <font color="red">*卡号</td>
           <td><input type="text" id="cardNo" name="cardNo" value="${cardNo}" maxlength="30"/> </td>
        </tr>
        <tr>
           <td align="right"> <font color="red">*银行</td>
           <td><input type="text" id="bankNo" name="bankNo" value="${bankNo}" maxlength="30"/> </td>
        </tr>
          <tr>
            <td align="right"> <font color="red">*用户名</td>
             <td><input type="text" id="userName" name="userName" value="${userName}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font>最大额度</td>
             <td><input type="text" id="maxLimit" name="maxLimit" value="${maxLimit}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font>安全码</td>
             <td><input type="text" id="secNo" name="secNo" value="${secNo}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font>有效期</td>
             <td><input type="text" id="validateDate" name="validateDate" value="${validateDate}" maxlength="30"/> </td>
        </tr>
        <tr>
            <td align="right"> <font color="red">*</font>账单日期</td>
             <td><input type="text" id="billDate" name="billDate" value="${billDate}" maxlength="30"/> </td>
        </tr>
        <tr>
            <td align="right"> <font color="red">*</font>还款日</td>
             <td><input type="text" id="repaymentDate" name="repaymentDate" value="${repaymentDate}" maxlength="30"/> </td>
        </tr>
        
        <tr>
            <td>
            </td>
            <td>
 				<div class="window_button marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="<s:text name='common.options.save'/>"/></div>
		       	<div class="window_button marg_lef10 float_lef"><input type="button" id="cancelOpe" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="<s:text name='common.options.cancel'/>" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
        $("#submitButton").click(function() {
        	$("#creditCardForm").submit();
        	return false;
        })

		$("#creditCardForm").validate({
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
