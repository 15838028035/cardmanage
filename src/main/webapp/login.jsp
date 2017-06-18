<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<title>UPM用户权限管理系统--用户登录</title>

<style type="text/css">
.form-bg{
    background: #00b4ef;
}
.form-horizontal{
    background: #fff;
    padding-bottom: 40px;
    border-radius: 15px;
    text-align: center;
}
.form-horizontal .heading{
    display: block;
    font-size: 35px;
    font-weight: 700;
    padding: 35px 0;
    border-bottom: 1px solid #f0f0f0;
    margin-bottom: 30px;
}
	</style>
	
	<script type="text/javascript">
		 function login() {
			document.forms[0].submit();
		} 
	</script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
            <form class="form-horizontal" action="${ctx}/loginAction!login.action" method="post">
                <span class="heading"><h1>卡神管理系统</h1><h2>用户登录</h2></span>
                <div class="form-group">
                    <input type="text" class="form-control" id="loginNo" name="loginNo" placeholder="用户名">
                </div>
                <div class="form-group help">
                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="密　码">
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary btn-lg btn-block" onclick="login();">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>