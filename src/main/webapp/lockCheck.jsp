<%@ page contentType="text/html;charset=UTF-8" %>
﻿<%@ page import = "com.lj.app.cardmanage.user.model.User,com.lj.app.core.common.util.SessionCode" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>卡神管理系统</title>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
	<%@ include file="/jsp/common/resource/scripts_base.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_jqueryui.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_render.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_date.jsp" %>
	
		<!--新引入的文件开始-->
	<script src="${ctx}/scripts/jquery/jquery-framedialog.js" type="text/javascript"></script>
	<script language="javascript" src="${ctx}/scripts/layout_tradition_4A.js"></script>
	<script language="javascript" src="${ctx}/scripts/control_4A_dialog.js"></script>
	<!--新引入的文件结束-->

<style type="text/css">
.sp_close {
	clear:both;
	width:52px;
	right:0px;
	top:0px;
	height:47px;
	cursor:pointer;
	position:absolute;
	background:url(../images/close05.png) no-repeat;
}

.sp_close:hover {
	clear:both;
	width:52px;
	right:0px;
	top:0px;
	height:47px;
	cursor:pointer;
	position:absolute;
	background:url(../images/close05_on.png) no-repeat;
}

</style>
</head>
	<script type="text/javascript">
		$(function(){
			$("#password").val("");
			$("#password").focus();
		});

		logOut = function(){
			window.location.href="${ctx}/loginAction!logout.action";
		}

		logIn = function(){
			
			$("#notice").text("");
			
			if($("#password").val()==''){
				$("#notice").html("<font color='red'>请输入密码</font>");
				$("#password").select("");
				window.setTimeout(function () {$("#notice").text("") ;}, 5000);
				return;
            }
            
			$.ajax({
                type: "POST",
                url: "${ctx}/loginAction!lockCheck.action",
                data: "loginName=" + $("#loginName").val()+"&password="+$("#password").val(),
                dataType:"json",
                success: function(data){
						if(data =="0"){
							//$("#indexLockPing").dialog("close");
							//$.FrameDialog.closeDialog();
							window.location.href="${ctx}/index.jsp";
							return;
						}else {
							alert("密码错误");
							return;
						}
				}
			});
        }
	</script>
		<!--start  contain容器-->
		<body>
						  <div class="sp_close" title='退出' onclick="logOut();"></div>
						    <div class="sp_tab">
						      <div class="sp_tit"></div>
							  <div class="sp_word">${sessionScope.securityContext.loginName}</div>
							  <div class="sp_input">
								<input type="password" id="password" name="password" class="input05" maxlength="20" value="" />
							    <input type="button" class="button04" onclick="logIn();" value='登陆'/>
							    <div id="notice" align="center"></div>
							  </div>
						    </div>
						
				</body>
</html>
