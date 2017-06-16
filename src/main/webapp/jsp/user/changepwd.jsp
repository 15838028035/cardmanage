<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改密码</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<script>
		$(document).ready(function(){
			if('${returnMessage}' != ""){
				bootbox.alert("${returnMessage}");
			}
		});
	</script>
	
	<style type="text/css">
	
	body {
    //background:url(${ctx}/images/login_conbg.jpg) #f8f6e9;
	}
		 .mycenter{
		    margin-top: 100px;
		    margin-left: auto;
		    margin-right: auto;
		    height: 350px;
		    width:320px;
		    padding: 5%;
		    padding-left: 5%;
		    padding-right: 5%;
		}

	</style>
</head>
<body>
			    
<form action="userAction!updateAcctPwd.action" method="post" name="userForm" id="userForm">
         <div class="mycenter">
           <div class="col-sm-12">
              <input  class="form-control" type="password" id="oldPwd" name="oldPwd" class="form-control"placeholder="请输入旧密码"/>
              </div>
              
               <div class="col-sm-12">
              <input  class="form-control" type="password" id="pwd" name="pwd" class="form-control"placeholder="请输入新密码"/>
              </div>
              
               <div class="col-md-12">
              <input  class="form-control" type="password" id="newPwd" name="newPwd" class="form-control"placeholder="请输入确认密码"/>
              </div>
              
                 <div class="col-sm-12">
               		<button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
        		   <button type="button" id="backToHomeButton" class="btn btn-primary ">返回</button> 
              </div>
        
        </div>
        
</form>
<script>
        $("#submitButton").click(function() {
        	$("#userForm").submit();
        	return false;
        })
		
		 $('#userForm').bootstrapValidator({  
	            fields: {  
	            	"oldPwd": {  
	                message: '旧密码不能为空',  
	                validators: {  
	                    notEmpty: {  
	                    message: '旧密码不能为空'  
	                    }  
	                	}
	        		},
	                "pwd": {  
	                    message: '密新密码不能为空',  
	                    validators: {  
	                        notEmpty: {  
	                        message: '密码不不能为空'  
	                        } 
	                       
	                    }  
	                },
	                "newPwd": {  
	                    message: '确认密码不不能为空',  
	                    validators: {  
	                        notEmpty: {  
	                        message: '确认密码不不能为空'  
	                        } 
	                    }  
	                }
	            },
	            
	            submitHandler: function(validator, form, submitButton) {  
	            	 validator.defaultSubmit();  
	            	doChangePwd();
	            }  
	        });  
		 
		 function doChangePwd() {
				var oldPwd = $("#oldPwd").val();
		    	var pwd = $("#pwd").val();
		    	var newPwd = $("#newPwd").val();
		    	
		    	var queryUrl = "${ctx}/jsp/user/userAction!updateAcctPwd.action?oldPwd="+oldPwd+"&pwd="+pwd+"&newPwd="+newPwd;
	            var result = jQuery.ajax({
			      	  url:queryUrl,
			          async:false,
			          cache:false,
			          dataType:"json"
			      }).responseText;
				var obj = eval("("+result+")");
				var optResult = obj.opResult;
				bootbox.alert(optResult);
				
				if(optResult.indexOf("成功")==-1){
					$("#oldPwd").val("");
					$("#pwd").val("");
					$("#newPwd").val("");
				}
			}
		 

	        $("#backToHomeButton").click(function() {
				window.parent.location.href="${ctx}/index.jsp";
	        });
		
</script>
</body>
</html>
