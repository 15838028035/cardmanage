<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>卡片新增</title>
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
<div class="panel-heading">卡片新增</div>
 <div class="panel-body">
  <div class="form-group" style="margin-top:15px">    
                
<form action="creditCardAction!save.action" class="form-horizontal" method="post" name="creditCardForm" id="creditCardForm">
<input type="hidden" name="id" value="${id }"/>
<input type="hidden" name="operate" value="${operate}" />
        <div class="form-group">  
        <br>
              <label class="control-label col-sm-1" for="cardNo">卡号</label>  
              <div class="col-sm-3"><input  class="form-control" type="text" id="cardNo" name="cardNo" value="${cardNo}"  /></div>
            
             <label class="control-label col-sm-1" for="cardNoProfile">编号  </label>
            <div class="col-sm-3"> <input  class="form-control" type="text" id="cardNoProfile" name="cardNoProfile" value="${cardNoProfile}" /></div>
            
              <label class="control-label col-sm-1" for="bankNo">银行</label>  
               <div class="col-sm-3"><input class="form-control" type="text" id="bankNo" name="bankNo" value="${bankNo}" /></div>
             
               <label class="control-label col-sm-1" for="userName">姓名 </label>  
               <div class="col-sm-3"><input  class="form-control" type="text" id="userName" name="userName" value="${userName}" /></div>
             
              <label class="control-label col-sm-1" for="maxLimit">固定额度</label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="maxLimit" name="maxLimit" value="${maxLimit}"/></div>
              
              
                 <label class="control-label col-sm-1" for="initRemainMoney">初始金额</label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="initRemainMoney" name="initRemainMoney" value="${initRemainMoney}"/></div>

                 <label class="control-label col-sm-1" for="billDate">账单日</label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="billDate" name="billDate" value="${billDate}"/></div>
              
                 <label class="control-label col-sm-1" for="repaymentDate">还款日 </label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="repaymentDate" name="repaymentDate" value="${repaymentDate}"/></div>
              
                 <label class="control-label col-sm-1" for="serviceRate">服务费率 </label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="serviceRate" name="serviceRate" value="${serviceRate}"/></div>
              
              <label class="control-label col-sm-1" for="validateDate">计划开始周期</label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="validateDate" name="validateDate" value="${validateDate}"/></div>
              
              <label class="control-label col-sm-1" for="secNo">有效期</label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="secNo" name="secNo" value="${secNo}"/></div>
              
                 <label class="control-label col-sm-1" for="serviceRate">锁定状态 </label>  
              <div class="col-sm-3"> 
              <input type="radio" id="lockStatus" name="lockStatus" value="0"   <c:if test="${lockStatus==0}">checked</c:if>/>否
              <input type="radio" id="lockStatus" name="lockStatus" value="1"  <c:if test="${lockStatus==1}">checked</c:if>/>是
              
              </div>
              
              
        </div>
         <div class="form-group"> 
       	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button>
        		   <button type="button" id="backToHomeButton" class="btn btn-primary ">返回</button> 
        </div>
</form>
<script>
        $('#creditCardForm').bootstrapValidator({  
            fields: {  
            	"cardNo": {  
                message: '卡号不能为空',  
                validators: {  
                    notEmpty: {  
                    message: '卡号不能为空'  
                    }  
                	}
        		},
                "cardNoProfile": {  
                    message: '编号 不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '编号 不能为空'  
                        } 
                       
                    }  
                },
                "bankNo": {  
                    message: '银行不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '银行不能为空'  
                        } 
                       
                    }  
                },
                "userName": {  
                    message: '姓名不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '姓名不能为空'  
                        } 
                       
                    }  
                },
                "maxLimit": {  
                    message: '固定额度不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '固定额度不能为空'  
                        } 
                       
                    }  
                },
                "initRemainMoney": {  
                    message: '初始金额不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '初始金额不能为空'  
                        } 
                       
                    }  
                },
                "billDate": {  
                    message: '账单日不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '账单日不能为空'  
                        } 
                       
                    }  
                },
                "repaymentDate": {  
                    message: '还款日不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '还款日不能为空'  
                        } 
                       
                    }  
                },
                "serviceRate": {  
                    message: '服务费率不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '服务费率不能为空'  
                        } 
                       
                    }  
                },
            },
            
            submitHandler: function(validator, form, submitButton) {  
                validator.defaultSubmit();  
            }  
        });  

        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/jsp/creditCard/creditCardList.jsp";
        });
</script>
</body>
</html>
