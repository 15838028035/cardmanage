<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>测试主页面</title>
    
	<%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/scripts/base.jsp" %>
    <%@ include file="/jsp/common/scripts/jqgrid.jsp" %>
    <%@ include file="/jsp/common/scripts/treePanel.jsp" %>
  </head>
  
  <body>
  	<div class="tab wraper-bc">
         <ul>
             <li><a href="javascript:void(0)" onclick="showAll(1);">应用资源管理</a> </li>
             <li><a href="javascript:void(0)" onclick="showAll(2);">系统资源目录管理</a></li>
             <li><a href="javascript:void(0)" onclick="showAll(21);">系统资源登录</a></li>
             <li><a href="javascript:void(0)" onclick="showAll(3);">公告管理</a></li>
             <li><a href="javascript:void(0)" onclick="showAll(31);">我的公告</a></li>
             <li><a href="javascript:void(0)" onclick="showAll(4);">我的消息</a></li>
             <li><a href="javascript:void(0)" onclick="showAll(5);">密码修改</a></li>
             <li><a href="javascript:void(0)" onclick="showAll(51);">密码提示答案修改</a></li>
         </ul>
         <div class="clear">
         </div>
     </div>
     <iframe id="actionFrm" name="actionFrm" scrolling="auto" width="100%" height="90%" src="" frameborder="1"></iframe>

</body>
</html>
  </body>
  <form action=""></form>
  <script type="text/javascript">
  		
	function showBulletin(){
	
           var url ="${ctx}/jsp/bulletin/bulletinAgreementList.jsp?date="+(new Date()).getTime() ;
           var $dialog = $('<div id="bulletinInfo"></div>').load(url)
              .dialog({
                  autoOpen: false,
                  bgiframe:true,
                  title: "公告信息",
                  width: 900,
                  height: 500,
                  modal: true 
              });
              $dialog.dialog('open');
	}
	showBulletin();
	  function showAll(value){
	  	var b = document.getElementById("actionFrm");
	  	if(value=="1"){
	  		b.setAttribute("src","${ctx}/jsp/resource/app/appRes.action");
	  	}
	  	if(value=="2"){
	  		b.setAttribute("src","${ctx}/jsp/resource/sys/sysRes!listResDir.action?type=1");
	  	}
	  	if(value=="21"){
	  		b.setAttribute("src","${ctx}/jsp/resource/sys/sysRes!listResDir.action?type=2");
	  	}
	  	if(value=="3"){
	  		b.setAttribute("src","${ctx}/jsp/bulletin/bulletinMng!initQryCondition.action");
	  	}
	  	if(value=="31"){
	  		b.setAttribute("src","${ctx}/jsp/bulletin/bulletinMng!showMyBulletin.action");
	  	}
	  	if(value=="4"){
	  		b.setAttribute("src","${ctx}/jsp/bulletin/noticeMng!initQryNoticeCondition.action");
	  	}
	  	
	  	if(value=="5"){
            b.setAttribute("src","${ctx}/jsp/self/modify-password.jsp");
        }
        if(value=="51"){
            b.setAttribute("src","${ctx}/jsp/self/modify-security-answer.jsp");
        }
	  }
  </script>
</html>
