<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
    <title>机具新增</title>
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
            <div class="panel-heading">机具新增</div>
            <div class="panel-body">
                    <div class="form-group" style="margin-top:15px">
		<form action="postCardAction!save.action" class="form-horizontal" method="post" name="postCardForm" id="postCardForm">
		<input type="hidden" name="id" value="${id }"/>
		<input type="hidden" name="operate" value="${operate}" />
		        <div class="form-group">  
		              <label class="control-label col-sm-1 col-md-1  col-lg-1" for="postCardNo">机具编号 </label>  
		              <div class="col-sm-3 col-md-3 col-lg-3"><input  class="form-control" type="text" id="postCardNo" name="postCardNo" value="${postCardNo}" readonly="readonly"  /></div>
		            
		             <label class="control-label col-md-1 col-sm-1  col-lg-1" for="manName">商户名字 </label>
		            <div class="col-sm-3 col-md-3 col-lg-3"> <input  class="form-control" type="text" id="manName" name="manName" value="${manName}" /></div>
		            
		              <label class="control-label col-sm-1 col-md-1 col-lg-1" for="rate">费率</label>  
		               <div class="col-sm-3 col-md-3  col-lg-3"><input class="form-control" type="text" id="rate" name="rate" value="${rate}" /></div>
		             
		              <label class="control-label col-sm-1  col-md-1 col-lg-1" for="minMoney">最小匹配额度</label>  
		             <div class="col-sm-3 col-md-3 col-lg-3"><input  class="form-control" type="text" id="minMoney" name="minMoney" value="${minMoney}"/></div>
		           
		               <label class="control-label col-sm-1 col-md-1 col-lg-1" for="maxMoney">最大匹配额度</label>  
		               <div class="col-sm-3 col-md-3  col-lg-3"><input  class="form-control" type="text" id="maxMoney" name="maxMoney" value="${maxMoney}" /></div>
		             
		              <%-- <label class="control-label col-sm-1 col-md-1 col-lg-1" for="trade">行业</label>  
		              <div class="col-sm-3 col-md-3 col-lg-3"> <input  class="form-control" type="text" id="trade" name="trade" value="${trade}"/></div> --%>
		              
		              <label class="control-label col-sm-1 col-md-1 col-lg-1" for="userName">姓名</label>  
		              <div class="col-sm-3 col-md-3 col-lg-3"> <input  class="form-control" type="text" id="userName" name="userName" value="${userName}"/></div>
		              
		              <label class="control-label col-sm-1 col-md-1 col-lg-1" for="cardNo">卡号</label>  
		              <div class="col-sm-3 col-md-3 col-lg-3"> <input  class="form-control" type="text" id="cardNo" name="cardNo" value="${cardNo}"/></div>
		              
		              <label class="control-label col-sm-1 col-md-1 col-lg-1" for="bindBank">绑定银行</label>  
		              <div class="col-sm-3 col-md-3 col-lg-3"> <input  class="form-control" type="text" id="bindBank" name="bindBank" value="${bindBank}"/></div>
		              
		         <label class="control-label col-sm-1 col-md-1 col-lg-1" for="lockStatus">锁定状态</label>  
		              <div class="col-sm-3 col-md-3 col-lg-3"> 
		                <input   type="radio"  name="lockStatus" value="0"   <c:if test="${lockStatus==0}">checked</c:if>/>否
		               <input    type="radio"   name="lockStatus" value="1"  <c:if test="${lockStatus==1}">checked</c:if>/>是
		               </div>
		        </div>
		         <div class="form-group col-sm-12 col-md-12 col-lg-12"> 
		        		<button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
		        		   <button type="button" id="backToHomeButton" class="btn btn-primary ">返回</button> 
		        </div>
		        
		</form>

</div>
</div>
</div>
</div>

<script>
        $('#postCardForm').bootstrapValidator({  
            fields: {  
            	"manName": {  
                message: '商户名字不能为空',  
                validators: {  
                    notEmpty: {  
                    message: '商户名字不能为空'  
                    }  
                	}
        		},
                "rate": {  
                    message: '费率不不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '费率不不能为空'  
                        } 
                       
                    }  
                },
                "minMoney": {  
                    message: '最小匹配额度不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '最小匹配额度不能为空'  
                        }  
                    	}
            		},
            	"maxMoney": {  
                    message: '最大匹配额度不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '最大匹配额度不能为空'  
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
                "cardNo": {  
                    message: '卡号不能为空',  
                    validators: {  
                                    notEmpty: {  
                                    message: '卡号不能为空'  
                                    }  
                                	}
                        		},
                "bindBank": {  
                                    message: '绑定银行不能为空',  
                                    validators: {  
                                        notEmpty: {  
                                        message: '绑定银行不能为空'  
                                        }  
                                    	}
                            		},
            },
            
            submitHandler: function(validator, form, submitButton) {  
                validator.defaultSubmit();  
            }  
        });  

        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/jsp/postCard/postCardList.jsp";
        });
</script>
</body>
</html>
