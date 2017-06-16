<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>
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
<form action="userAction!save.action" class="form-horizontal" method="post" name="userForm" id="userForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="user.userId" value="${userId}"/>
<input type="hidden" name="operate" value="${operate}" />
        <div class="form-group">  
              <label class="control-label col-sm-1" for="loginNo">登录名</label>  
              <div class="col-sm-3"><input  class="form-control" type="text" id="loginNo" name="loginNo" value="${loginNo}"  /></div>
            
             <label class="control-label col-sm-1" for="pwd">密码 </label>
            <div class="col-sm-3"> <input  class="form-control" type="text" id="pwd" name="pwd" value="${pwd}" /></div>
            
              <label class="control-label col-sm-1" for="userName">用户名</label>  
               <div class="col-sm-3"><input class="form-control" type="text" id="userName" name="userName" value="${userName}" /></div>
             
              <label class="control-label col-sm-1" for="cardNo">卡号</label>  
             <div class="col-sm-3"><input  class="form-control" type="text" id="cardNo" name="cardNo" value="${cardNo}"/></div>
           
               <label class="control-label col-sm-1" for="mobile">手机号码 </label>  
               <div class="col-sm-3"><input  class="form-control" type="text" id="mobile" name="mobile" value="${mobile}" /></div>
             
              <label class="control-label col-sm-1" for="address">地址</label>  
              <div class="col-sm-3"> <input  class="form-control" type="text" id="address" name="address" value="${address}"/></div>
        </div>
         <div class="form-group"> 
        		  <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
        		   <button type="button" id="backToHomeButton" class="btn btn-primary ">返回</button> 
        </div>
        
</form>
<script>
        $('#userForm').bootstrapValidator({  
            fields: {  
            	"loginNo": {  
                message: '登录账号不能为空',  
                validators: {  
                    notEmpty: {  
                    message: '登录账号不能为空'  
                    }  
                	}
        		},
                "pwd": {  
                    message: '密码不不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: 'T密码不不能为空'  
                        } 
                       
                    }  
                },
                "userName": {  
                    message: '用户名不不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '用户名不不能为空'  
                        } 
                    }  
                }
            },
            
            submitHandler: function(validator, form, submitButton) {  
                validator.defaultSubmit();  
            }  
        });  

        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
