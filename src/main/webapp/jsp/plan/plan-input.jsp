<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<head>
    <title>计划管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<script>
		$(document).ready(function(){
			if('${returnMessage}' != ""){
				bootbox.alert("${returnMessage}");
			}
		});
	</script>
</head>
<body>
<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">计划修改</div>
            <div class="panel-body">
                    <div class="form-group" style="margin-top:15px">
                    
<form action="planAction!save.action" method="post" name="planForm" id="planForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
            <td align="right">还款金额<font color="red">*</font></td>
            <td><input type="text" id="inMoney" name="inMoney" value="${inMoney}" maxlength="10"/> </td>
        </tr>
          <tr>
            <td align="right">刷卡金额<font color="red">*</font></td>
             <td><input type="text" id="outMoney" name="outMoney" value="${outMoney}" maxlength="10"/> </td>
        </tr>
         <tr>
            <td align="right">剩余金额<font color="red">*</font></td>
             <td><input type="text" id="remainMoney" name="remainMoney" value="${remainMoney}" maxlength="10"/> </td>
        </tr>
         <tr>
            <td align="right">机具修改<font color="red">*</font></td>
             <td>
             <c:set var="postCardId" value="${postCardId}"></c:set>
             	<select name="postCardId" id="postCardId" style="width:auto;height:auto;">
             	<c:forEach var="postCard" items="${postCardList}">
             	    <c:if test="${postCardId==postCard.id}">
             	    
             	    <option value="${postCard.id}" selected>${postCard.postCardNo}_${postCard.manName}</option>
             	    </c:if>
             	     <c:if test="${postCardId!=postCard.id}">
             	    <option value="${postCard.id}">${postCard.postCardNo}_${postCard.manName}</option>
             	    </c:if>
					
             	</c:forEach>
             	</select>
              </td>
        </tr>
         <tr>
            <td>友情提示:</td>
            <td>请确保修改前后，还款金额、刷卡金额、剩余金额的正确性 </td>
        </tr>
        <tr>
            <td></td>
            <td>
 				<div class="window_button marg_lef10 float_lef">
 				<button type="submit" id="save" class="btn window_button_centerInput btn-shadow window_button_centerInput1 ">保存</button> 
 				<button type="button" id="backToHomeButton" class="btn btn-primary ">返回</button> 
            </td>
        </tr>
    </table>
</form>

</div>

</div>
</div>
</div>
<script>
        
        $('#postCardForm').bootstrapValidator({  
            fields: {  
            	"inMoney": {  
                message: '参数不能为空',  
                validators: {  
                    notEmpty: {  
                    message: '参数不能为空'  
                    }  
                	}
        		},
                "outMoney": {  
                    message: '参数不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '参数不能为空'  
                        } 
                       
                    }  
                },
                "remainMoney": {  
                    message: '参数不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '参数不能为空'  
                        }  
                    	}
            		}
            	
            },
            
            submitHandler: function(validator, form, submitButton) {  
                validator.defaultSubmit();  
            }  
        });  
        
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/jsp/plan/planList.jsp";
        });

</script>
</body>
</html>
