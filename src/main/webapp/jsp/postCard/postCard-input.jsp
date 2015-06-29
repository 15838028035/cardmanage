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
<form action="postCardAction!save.action" method="post" name="postCardForm" id="postCardForm">
<input type="hidden" name="id" value="${id }"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
           <td align="right"> <font color="red">*POS机编号</td>
           <td><input type="text" id="postCardNo" name="postCardNo" value="${postCardNo}" maxlength="30"/> </td>
        </tr>
        <tr>
           <td align="right"> <font color="red">*商户名字</td>
           <td><input type="text" id="manName" name="manName" value="${manName}" maxlength="30"/> </td>
        </tr>
          <tr>
            <td align="right"> <font color="red">* 费率</td>
             <td><input type="text" id="rate" name="rate" value="${rate}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font>匹配最小额度</td>
             <td><input type="text" id="minMoney" name="minMoney" value="${minMoney}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font>匹配最大额度</td>
             <td><input type="text" id="maxMoney" name="maxMoney" value="${maxMoney}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font>行业</td>
             <td><input type="text" id="trade" name="trade" value="${trade}" maxlength="30"/> </td>
        </tr>
        <tr>
            <td align="right"> <font color="red">*</font>绑定银行</td>
             <td><input type="text" id="bindBank" name="bindBank" value="${bindBank}" maxlength="30"/> </td>
        </tr>
        <tr>
            <td align="right"> <font color="red">*</font>卡号</td>
             <td><input type="text" id="cardNo" name="cardNo" value="${cardNo}" maxlength="30"/> </td>
        </tr>
         <tr>
            <td align="right"> <font color="red">*</font> 姓名</td>
             <td><input type="text" id="userName" name="userName" value="${userName}" maxlength="30"/> </td>
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
        	$("#postCardForm").submit();
        	return false;
        })

		$("#postCardForm").validate({
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
