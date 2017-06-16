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
  
  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand hidden-sm" href="#">卡神管理系统</a>
        </div>
        <div class="navbar-collapse collapse" role="navigation">
          <ul class="nav navbar-nav">
           	<li><a href="${ctx}/jsp/creditCard/creditCardList.jsp"  target="_blank" >卡片管理</a></li>
             <li><a href="${ctx}/jsp/postCard/postCardList.jsp" target="_blank" >机具管理</a></li>
			<li><a href="${ctx}/jsp/plan/planList.jsp" target="_blank" >计划管理</a></li>
				<c:if test="${sessionScope.securityContext.loginName=='system'}">
					 <li><a href="${ctx}/jsp/user/userList.jsp" target="_blank" >用户管理</a></li>
				</c:if>
				
				<c:if test="${sessionScope.securityContext.loginName=='system'}">
				 <li><a href="${ctx}/jsp/bulletin/bulletinList.jsp" target="LT_main" >公告管理</a></li>
 				</c:if>

				<li><a href="${ctx}/jsp/user/changepwd.jsp" target="_blank" >修改密码</a></li>
				<li><a href="${ctx}/jsp/creditCard/cardapply.jsp" target="_blank" >申请卡片</a></li>
          </ul>
           <ul class="nav navbar-nav navbar-right hidden-sm">
            <li>
          <a href='#'>${sessionScope.securityContext.loginName}:您好！欢迎登录!&nbsp;&nbsp;</a>
            </li>
            <li>
          <a href="${ctx}/loginAction!logout.action">退出系统</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    
    <div class="jumbotron masthead">
	    <div class="container-fluid">
			<h1>卡神管理系统</h1>
			<h2>简洁、简单的卡神管理系统</h2>
	    </div>
    </div>
    
   <div class="container-fluid" > 
   
    <div class="row">

        <div class="col-sm-6 col-md-4 col-lg-3 ">
          <div class="thumbnail">
            <a href="${ctx}/jsp/creditCard/creditCardList.jsp" title="卡片管理" target="_blank" >
            <img class="lazy" src="${ctx}/images/image01.jpg" width="300" height="150"></a>
            <div class="caption">
              <h3>
                <a href="${ctx}/jsp/creditCard/creditCardList.jsp" title="卡片管理" target="_blank" >卡片管理</a>
              </h3>
            </div>
          </div>
        </div>
        
         <div class="col-sm-6 col-md-4 col-lg-3 ">
          <div class="thumbnail">
            <a href="${ctx}/jsp/postCard/postCardList.jsp" title="机具管理" target="_blank" >
            <img class="lazy" src="${ctx}/images/image02.jpg" width="300" height="150"></a>
            <div class="caption">
              <h3>
                <a href="${ctx}/jsp/postCard/postCardList.jsp" title="机具管理" target="_blank" >机具管理</a>
              </h3>
            </div>
          </div>
        </div>
        
        <div class="col-sm-6 col-md-4 col-lg-3 ">
          <div class="thumbnail">
            <a href="${ctx}/jsp/plan/planList.jsp" title="计划管理" target="_blank" >
            <img class="lazy" src="${ctx}/images/image03.jpg" width="300" height="150"></a>
            <div class="caption">
              <h3>
                <a href="${ctx}/jsp/plan/planList.jsp" title="计划管理" target="_blank" >计划管理</a>
              </h3>
            </div>
          </div>
        </div>
        
        <c:if test="${sessionScope.securityContext.loginName=='system'}">
        
        <div class="col-sm-6 col-md-4 col-lg-3 ">
          <div class="thumbnail">
            <a href="${ctx}/jsp/user/userList.jsp" title="用户管理" target="_blank" >
            <img class="lazy" src="${ctx}/images/image04.jpg" width="300" height="150"></a>
            <div class="caption">
              <h3>
                <a href="${ctx}/jsp/user/userList.jsp" title="用户管理" target="_blank" >用户管理</a>
              </h3>
            </div>
          </div>
        </div>
        
        </c:if>
        
        <c:if test="${sessionScope.securityContext.loginName=='system'}">
        
        <div class="col-sm-6 col-md-4 col-lg-3 ">
          <div class="thumbnail">
            <a href="${ctx}/jsp/bulletin/bulletinList.jsp" title="公告管理" target="_blank" >
            <img class="lazy" src="${ctx}/images/image05.jpg" width="300" height="150"></a>
            <div class="caption">
              <h3>
                <a href="${ctx}/jsp/bulletin/bulletinList.jsp" title="公告管理" target="_blank" >公告管理</a>
              </h3>
            </div>
          </div>
        </div>
        
        </c:if>
        
        <div class="col-sm-6 col-md-4 col-lg-3 ">
          <div class="thumbnail">
            <a href="${ctx}/jsp/user/changepwd.jsp" title="修改密码" target="_blank" >
            <img class="lazy" src="${ctx}/images/image06.jpg" width="300" height="150"></a>
            <div class="caption">
              <h3>
                <a href="${ctx}/jsp/user/changepwd.jsp" title="修改密码" target="_blank" >修改密码</a>
              </h3>
            </div>
          </div>
        </div>
        
<!--          <div class="col-sm-6 col-md-4 col-lg-3 "> -->
<!--           <div class="thumbnail"> -->
<%--             <a href="${ctx}/jsp/creditCard/cardapply.jsp" title="申请卡片" target="_blank" > --%>
<%--             <img class="lazy" src="${ctx}/images/image07.jpg" width="300" height="150"></a> --%>
<!--             <div class="caption"> -->
<!--               <h3> -->
<%--                 <a href="${ctx}/jsp/creditCard/cardapply.jsp" title="申请卡片" target="_blank" >申请卡片</a> --%>
<!--               </h3> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
        
   </div>

    </div>
  </body>
</html>