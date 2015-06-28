<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
	<title>中国移动统一帐号认证授权审计系统登录</title>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_base.jsp" %>
	
	<!--[if IE 6]>
	<script src="js/DD_belatedPNG.js"></script>	
	<![endif]-->
	
	<script type="text/javascript">

		//得到文档宽高值并赋给con这个元素
		var conWidHeig = function(){
			var domWidth = document.documentElement.clientWidth;
			var domheight = document.documentElement.clientHeight;
			$(".login_content").css({"width":domWidth,"height":domheight});
		}
		//通过计算得到box垂直水平居中
		var conBoxLeftTop = function(){
			var domBoxLeft = (document.documentElement.clientWidth -531)/2;
			var domBoxTop = (document.documentElement.clientHeight -349)/2;
			$(".login_box").css({"left":domBoxLeft,"top":domBoxTop});
		}
		//按钮鼠标滑过效果
		var mouseOver = function(){
			$(".but01_hover,.but02_hover").css('opacity',0).hover(function (){
				$(this).stop().fadeTo(650, 1);
			}, function () {
				$(this).stop().fadeTo(650, 0);
			});
			
		}	
		
		function login() {
			$("#loginForm").submit();
		}
		
		$(document).ready(function() {
			conWidHeig();
			conBoxLeftTop();
			$(window).resize(function(){
				conWidHeig();
				conBoxLeftTop();
			}); 
			mouseOver();

		});
		//获得焦点后输入框改变样式 加粗边框
		function changeCssOnfocus(obj){
		 // obj.style.background = "${ctx}/images/login_inputextbg-hover.jpg";
		 $(obj).css({"background-image":"url(./images/login_inputextbg-hover.jpg)"});
		}
		//失去焦点后输入框改变样式 加粗边框
		function changeCssOnBlur(obj){
		 $(obj).css({"background-image":"url(./images/login_inputextbg.jpg)"});
		}
	
	</script>
	
</head>
<body>
<div class="login_content">
<div class="login_box">
<div class="lb_wrap">
	<div class="login_logo"></div>
    <div class="login_form">
    <div class="login_form_wrap">
		<form id="loginForm" action="${ctx}/loginAction!login.action" method="post">
        	<table cellpadding="0" cellspacing="0" border="0" width="364">
            	<tr id="login_name"><td align="right"><label for="user">用户ID：</label></td><td align="left"><input id='mainAcctName' name='mainAcctName' type="text" class="login_inputext" value="admin" onfocus="changeCssOnfocus(this)" onblur="changeCssOnBlur(this)"/></td></tr>
            	<tr id="login_pwd"><td align="right"><label for="password">密&nbsp;&nbsp;&nbsp;码：</label></td><td align="left"><input id='password' name='password' type="password" value="12345678" class="login_inputext" onfocus="changeCssOnfocus(this)" onblur="changeCssOnBlur(this)"/></td></tr>
                <tr><td colspan="2" align="left"><span class="Warning">&nbsp;</span></td></tr>
            </table>
            <table cellpadding="0" cellspacing="0" border="0" width="364" style="margin-top:20px;">
            	<tr><td align="center">
	                <div id="loginHintInto" style="font-size:25px;color:red;align:center;display:none">
					</div>
                </td></tr>
            </table>
            <table id="btnSubmit" cellpadding="0" cellspacing="0" border="0" width="364" style="margin-top:20px;">
            	<tr><td align="center">
                <div class="but but01">
                	<a href="#" onClick="login();">
                	<div class="but01_hover">
                	</div>
                    </a>
                </div>
                </td></tr>
            </table>
        
        </form>
    </div>
    </div><!--end login_form-->
</div><!--end lb_wrap-->
</div><!--end login_box-->
</div>

</body>
</html>