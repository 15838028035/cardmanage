<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>卡神管理系统</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
 </head>
  <body>
   <div class="container-fluid" > 
	<div class="page-header">
		<h1>卡神管理系统</h1>
		<small>${sessionScope.securityContext.loginName}:您好！欢迎登录!&nbsp;&nbsp;<a href="${ctx}/loginAction!logout.action">退出系统</a></small>
    </div>
		<div  class="sidebar-nav">
        	<ul>
				  <li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
                 	 <a href="${ctx}/jsp/creditCard/creditCardList.jsp"  target="_blank" >卡片管理</a>
                  </li>
                  
                   <li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
						<a href="${ctx}/jsp/postCard/postCardList.jsp" target="_blank" >机具管理</a>
				  </li>
				
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/plan/planList.jsp" target="_blank" >计划管理</a>
				</li>
				
				<c:if test="${sessionScope.securityContext.loginName=='system'}">
					 <li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
						<a href="${ctx}/jsp/user/userList.jsp" target="_blank" >用户管理</a>
					 </li>
				</c:if>
				
				<c:if test="${sessionScope.securityContext.loginName=='system'}">
				 <li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
 						<a href="${ctx}/jsp/bulletin/bulletinList.jsp" target="LT_main" >公告管理</a>
 					</li>
 					</c:if>

				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/user/changepwd.jsp" target="_blank" >修改密码</a>
				</li>
				
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/creditCard/cardapply.jsp" target="_blank" >申请卡片</a>
				</li>
          </ul>
    </div>
    </div>
  </body>
</html>