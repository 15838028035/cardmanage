﻿<%@ page contentType="text/html;charset=UTF-8" %>
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

	<!--[if IE 6]>
	<script src="${ctx}/scripts/DD_belatedPNG.js"></script>
	<![endif]-->	
	<script language="javascript">
		
		    //顶部帮助按钮图标切换
function topMenuEff(){
	  $("#TopMenu img").hover(function(){
		$(this).css('opacity', 0.3).attr('src',$(this).attr('src').substring(0,$(this).attr('src').indexOf('_'))+'.gif').stop().animate({opacity: '1'},500);
		},function(){
		$(this).css('opacity', 0.3).attr('src',$(this).attr('src').substring(0,$(this).attr('src').indexOf('.'))+'_h.gif').stop().animate({opacity: '1'},500);	
		});
}
		$(function(){
			topMenuEff();
			layout_Tradition.layout();				 //修改 layout(260)为layout()
			layout_Tradition.submenu();
			layout_Tradition.TopMenu();              //增加项    给帐号管理加背景
			//layout_Tradition.menu();              //此行一定去掉，否则菜单出错
			//contralEffect.logout();
			contralEffect.menu();
			contralEffect.blueButton();
			Management_4A.Refresh();
			Management_4A.cteat();//左侧menu
			Management_4A.T_Menu();//顶部导航
			Management_4A.BulkImport();
			
			//Management_4A.tabs();
			contral_4A_dialog.indexLockPing();
			contral_4A_dialog.SystemConfiguration();
			contral_4A_dialog.Announcement();//页面刷新弹出层
			
			//全屏，默认进入页面不采用全屏显示。
			$("#fullscreen").click(function(){
				Fkey();
		    });
		    
			 Management_4A.tabs();
			 
			 var isshow = "1";
			 var oriLeftFrmWidth = $("#LT_left").width();
			 var showdivwidth = $("#LT_hide_ELe").width();;
			 var oriRightFrmWidth = $("#LT_left").width();
			 $("#showhideimg").click(function(e){
				if(isshow=="1"){
					hideframe();
				}else if(isshow=="0"){	
					showframe();
				}				
			}); 
			
			function showframe(){
				isshow="1";							
					//$("#showhideimg").attr("src","${ctx}/images/LT_hide_ELe_bg.jpg");
					$("#showhideimg").attr("src","${ctx}/images/al_1.gif");
					//$("#LT_left").show("fast");
					$("#LT_left").animate({left:0,width:oriLeftFrmWidth},"fast");
					$("#LT_hide_ELe").animate(
						{
							left:oriLeftFrmWidth,width:showdivwidth
						},
						"fast"
						);
					$("#LT_main").animate({ 
						left:oriLeftFrmWidth+showdivwidth,
					    width: screen.width-oriLeftFrmWidth-showdivwidth,					     
					    marginLeft: "0"
					  }, "fast" );
			}
			
			function hideframe(){
				//$("#showhideimg").attr("src","${ctx}/images/LT_show_ELe_bg.jpg");
				$("#showhideimg").attr("src","${ctx}/images/bl_1.gif");
					isshow="0";										
					//$("#LT_left").hide("fast");
					$("#LT_left").animate({left:0,width:0},"fast");
					$("#LT_hide_ELe").animate(
						{left:"0",width:showdivwidth},
						"fast"
					);
					$("#LT_main").animate({ 
						left:showdivwidth,
					    width:screen.width-8,					     
					    marginLeft: "0"
					  }, "fast" );
			}
			
			var isdown="0";
			$("#LT_hide_ELe").mousemove(function(e){
				var x = e.pageX;
				var y = e.pageY;
				
				if(isdown!="1")return ;
				
				//forbidden dragging to left and the end of right.
				if(x>document.body.clientWidth*0.95 ||x <=(oriLeftFrmWidth+showdivwidth)){
					return ;
				}
			     var lft = x+$("#LT_hide_ELe").width();
			     	$("#LT_left").css({width:x,left:0});
			     	$("#LT_hide_ELe").css({left:x,width:showdivwidth});
			     	$("#LT_main").css({width:screen.width-lft,left:lft});
			     		
		    });
		    
		    $('#LT_hide_ELe').mousedown(function() {
		    	//alert(document.body.clientWidth);
			  	isdown="1";
			  	this.setCapture();
			  	
			});
			
			$('#LT_hide_ELe').mouseup(function() {
			 	isdown="0";
			 	this.releaseCapture();
			});
						
			
		});
		
		function creatDialog(url,title,width,height){
			jQuery.FrameDialog
				.create({
					url: url,
					title: title,
					width: width,
					height: height,
					//show: 'slide',
	     			//hide: 'slide',
					buttons: {}
			});
		}
		
		window.onresize = function()
		{
			layout_Tradition.layout();
		}
		
		
			
		function Fkey(){
			try{
				var WsShell = new ActiveXObject('WScript.Shell')
		     WsShell.SendKeys('{F11}');
			}catch(err){
				//alert("您没有允许对于窗口的最小化："+err.description );
			}
	     
		}		
		
		function MouseDownToResize(obj){ 
			obj.mouseDownX=event.clientX; 
			obj.pareneTdW=obj.parentElement.offsetWidth; 
			obj.pareneTableW=theObjTable.offsetWidth; 
			obj.setCapture(); 
		} 
		function MouseMoveToResize(obj){ 
			if(!obj.mouseDownX) return false; 
			var newWidth=obj.pareneTdW*1+event.clientX*1-obj.mouseDownX; 
			if(newWidth>0) 
			{ 
			obj.parentElement.style.width = newWidth; 
			theObjTable.style.width=obj.pareneTableW*1+event.clientX*1-obj.mouseDownX; 
			} 
		} 
		function MouseUpToResize(obj){ 
			obj.releaseCapture(); 
			obj.mouseDownX=0; 
		} 
		
		function initDomain(para){
			jQuery.FrameDialog.create({
				url: "${ctx}/jsp/domain/domain_init.jsp?domainId="+para,
				title: '初始化',
				width: 600,
				height: 300,
				//show: 'slide',
				hide: 'slide',
				buttons:{}	
			});	
		}
		
		function deleteConfirm(ojectId,objectClass){
			$("<div>确定要删除对象吗？</div>").dialog({
				resizable: false,
				height:200,
				modal: true,
				title:"请确认您的操作",
				buttons: {
					"取消": function() {
							$(this).dialog('close');
						},
					"确定": function() {
						var result = jQuery.ajax({
				          	url:"${ctx}/jsp/domain/domainrightcontent!deleteStruct.action?objectClass=" + objectClass + "&objectId=" + ojectId,
				          	async:false,
				          	dataType:"text"
				        	}).responseText;
				        		//parent.LT_main.location.reload();
								//window.LT_menu.$("#tree").jstree("remove",obj);				        	
				        	if(result == "1") {
				        		showModalMessage("删除成功");
				        		window.LT_menu.location.reload();
				        		window.LT_main.location = "${ctx}/jsp/domain/domainmanage!domainIndex.action";
				        		$(this).dialog('close');
				        	}else if(result == "2"){
				        		showModalMessage("无此权限");	
								$(this).dialog('close');
							}else{
								showModalMessage("删除失败");
								$(this).dialog('close');
							}
					}
				}
				});
		
		}
	</script>	
  </head>
  
  <body>
	<div class="layout_t_hd">
	<div class="layout_t_hd_wrap">
        	<div class="LT_logo">
      <div class="float_rig">
        	<div class="LT_Fr_wrap slideMenu" id="TopMenu">
            	<ul>
            		<!--
                	<li class="float_lef LT_hd_li indexLockPing">
                    	<img src="images/lock-screen.gif" title="锁定屏幕" />
                    </li>
                    -->
                <li class="float_lef LT_hd_li" id="fullscreen" >
						<a href="#"><img src="${ctx}/images/Esc_h.gif" title="全屏" /></a>
				</li>
                <LI class="float_lef LT_hd_li help" id="help" >
						<a href="#"><img src="${ctx}/images/help-browser_h.gif" title="帮助中心" /></a>
				</LI>
				<li class="float_lef LT_hd_li Logout">
					<a href="#"><img src="${ctx}/images/logout_h.gif" title="退出系统" /></a>
				</li>
              </ul>
            </div><!--end LT_logo-->
            </div><!--end LT_Fr_wrap-->
      </div><!--end float_rig-->
        <div class="float_rig">
       		<div class="menu_slide">
            
            </div><!--end menu_slide-->
        </div><!--end float_rig-->
        <div class="clear"></div>
    </div><!--end layout_t_hd_wrap-->
</div><!--end layout_t_hd-->

<div class="subTopMenu" id="subTopMenu">
	<div class="subTopMenu_wrap">
    
    	<div class="LT_Fr_wrap_TM" id="LT_Fr_wrap_TM">
        	<ul>
        		<c:if test="${provCodeEn == 'CHONG_QING'}">
	        		<li class="float_lef LT_hd_li_TM chongqingMenu">
	                	<table cellpadding="0" cellspacing="0"  border="0"> <tr> <td width="10"> <img src="images/job.png" align="absmiddle"  width=15 height=15/> </td> <td><span class="marg_lef5">本地功能</span></td></tr></table>
	                </li>
        		</c:if>
						<!--LT_hd_li改成了LT_hd_li_TM-->
           		<sec:authorize code="uap_mainacct_mainmenu" >
                  	<li class="float_lef LT_hd_li_TM accentMannagent">
                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/system-users.gif" align="absmiddle" width=15 height=15 /></td><td><span class="marg_lef5"><s:text name="mainacct.zhgl" /></span></td></tr></table>
                    </li>
				</sec:authorize>
					<!--LT_hd_li改成了LT_hd_li_TM-->
					<sec:authorize code="uap_appmgmt" required="true">
                    <li class="float_lef LT_hd_li_TM ApplicationMannagent">
                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/spreadsheet18.gif"  align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5"><s:text name='appmgmt'/></span></td></tr></table>
                    </li>
                    </sec:authorize>
					<c:if test="${provCodeEn != 'SHANG_HAI' || outNet != 'Y'}">					
					<!--LT_hd_li改成了LT_hd_li_TM-->
					
					<sec:authorize code="uap_equipment_manament" required="true">
	                    <li class="float_lef LT_hd_li_TM EquipmentManament">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/network-server.png"  align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5"><s:text name='menu.equipmentManament'/></span></td></tr></table>
	                    </li>
                    </sec:authorize>
                    
                    
                     <!--LT_hd_li改成了LT_hd_li_TM---------------->
                     <sec:authorize code="uap_rackgroup_manament" required="true">
	                    <li class="float_lef LT_hd_li_TM RackGroupManament">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/network-server.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">群组管理</span></td></tr></table>
	                    </li>
                      </sec:authorize>
                    
                    <!--LT_hd_li改成了LT_hd_li_TM-->
					<sec:authorize code="uap_security_menu" required="true">
						<li class="float_lef LT_hd_li_TM SecurityManament">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/sj.gif" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">数据管控</span></td></tr></table>
	                    </li>
                    </sec:authorize>
                    <!--LT_hd_li改成了LT_hd_li_TM-->
					<sec:authorize code="uap_goldbank_menu" required="true">
						<li class="float_lef LT_hd_li_TM GoldBankManagement">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/sj.gif" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5"><s:text name="menu.goldbank"></s:text></span></td></tr></table>
	                    </li>
                    </sec:authorize>
                    <!--LT_hd_li改成了LT_hd_li_TM-->
					<sec:authorize code="uap_domain_menu" required="true">
						<li class="float_lef LT_hd_li_TM DomainManament">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/sj.gif" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">域管理</span></td></tr></table>
	                    </li>
                   </sec:authorize>
					<!--LT_hd_li改成了LT_hd_li_TM-->
					<sec:authorize code="uap_config_menu" required="true">
	                    <li class="float_lef LT_hd_li_TM SystemConfiguration">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/system.gif" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5"><s:text name="menu.syscfg"></s:text></span></td></tr></table>
	                    </li>
                    </sec:authorize>
					<sec:authorize code="uap_report_menu" required="true">
	                    <li class="float_lef LT_hd_li_TM ReportManament">
		               		<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/spreadsheet.png"  align="absmiddle"  width=15 height=15//></td><td><span class="marg_lef2">报表管理</span></td></tr></table>
		             	</li>
                    </sec:authorize>
					<!--LT_hd_li改成了LT_hd_li_TM-->
					<sec:authorize code="uap_platform_menu" required="true">
	                    <li class="float_lef LT_hd_li_TM PlatformManagment">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/computer.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">平台管理</span></td></tr></table>
	                    </li>
                    </sec:authorize>
                    <!--LT_hd_li改成了LT_hd_li_TM-->
					<sec:authorize code="uap_job_menu" required="true">
	                    <li class="float_lef LT_hd_li_TM TaskManagment">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/job.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">作业管理</span></td></tr></table>
	                    </li>
                    </sec:authorize>
					<!--LT_hd_li改成了LT_hd_li_TM 浙江应用接入-->
					<sec:authorize code="uap_app_con" required="true">
						<li class="float_lef LT_hd_li_TM CutInApp">
							<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/job.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">应用接入</span></td></tr></table>
						</li>
					</sec:authorize>
					<sec:authorize code="mainacctMng_zj" required="true">
						<li class="float_lef LT_hd_li_TM mainacctCutin">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/system-users.gif" align="absmiddle" width=15 height=15 /></td><td><span class="marg_lef5"><s:text name="mainacct.zhgl" /></span></td></tr></table>
	                    </li>
                    </sec:authorize>
					<!--LT_hd_li改成了LT_hd_li_TM-->
					<!-- added by WangXianfeng 2013-05-21 begin -->
                    <sec:authorize code="uap_main_acct_login_rate" required="true">
	                    <li class="float_lef LT_hd_li_TM MainAcctLoginRate">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/job.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">帐号登录率</span></td></tr></table>
	                    </li>
                    </sec:authorize>
                    <!-- added by WangXianfeng 2013-05-21 end -->
                    
                    <!-- added by ge.jiawei 2013-07-1 begin -->
                    <sec:authorize code="union_acct_view" required="true">
	                    <li class="float_lef LT_hd_li_TM UnionViewManagment">
	                    	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/job.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">统一视图</span></td></tr></table>
	                    </li>
                    </sec:authorize>
                    </c:if>
                    <!-- added by ge.jiawei 2013-07-1 end -->
                    <!-- <li class="float_lef LT_hd_li_TM">
                    	<table cellpadding="0" cellspacing="0"  border="0" class="logout"><tr><td width="10"><img src="images/logout.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">登出系统</span></td></tr></table>
                    </li>
					-->
                    <!-- 上海本地添加 -->
					<sec:authorize code="uap_manu_menu" required="true">
	                    <li class="float_lef LT_hd_li_TM ManuMannagent">
	                     	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/system-users.gif" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5" width="100">合作伙伴</span></td></tr></table>
	                    </li>
                    </sec:authorize>
					 <sec:authorize code="uap_local_menu" required="true">
	                    <li class="float_lef LT_hd_li_TM LocalManagment">
	                     	<table cellpadding="0" cellspacing="0"  border="0"><tr><td width="10"><img src="images/job.png" align="absmiddle"  width=15 height=15/></td><td><span class="marg_lef5">本地功能</span></td></tr></table>
	                    </li>
                    </sec:authorize>
          </ul>
         </div><!--end LT_Fr_wrap_TM-->
       
    </div><!--end subTopMenu_wrap-->
</div><!--end subTopMenu-->


	<div class="LT_left" id="LT_left">
		
	   	<iframe class="LT_menu" style="margin: 0px"  id="LT_menu" src="" width="100%" frameborder="0" allowTransparency="true" scrolling="auto"></iframe>
	   
	</div><!--end LT_left-->
	
	
	<div class="LT_hide_ELe" id="LT_hide_ELe" style="vertical-align: bottom;background-color: #C0C0C0;padding: 0px;" >		
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><img src="${ctx}/images/al_1.gif" id="showhideimg" name="showhideimg" style="cursor: hand;" />
	</div>
	
	
	<iframe class="LT_main" id="LT_main" src="" scrolling="auto" frameborder="0" allowTransparency="true" name="LT_main"></iframe><!--end LT_main-->
	<div class="clear"></div>
	<div class="LT_footer">
	<div class="LT_ft_wrap">
	<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="80%" align="center">${applicationScope.title}</td>
	<td width="20%">
	<table width="450" cellpadding="0" cellspacing="0" height="20">
	      <tr>
	        <td align="right"><img src="${ctx}/images/LT_footer_i1.jpg" title="用户名" align="middle" /></td>
	        <td align="left" width="190"><span class="marg_lef5" style="vertical-align:middle;">:<s:property value="#session.securityContext.loginName"/></span></td>
	        <td align="right"><img src="${ctx}/images/LT_footer_i2.jpg" title="登录时间" align="middle" /></td>
	        <td align="left"><span class="marg_lef5" style="vertical-align:middle;"><s:text name="common.logintime"></s:text>:${sessionScope.securityContext.loginTime}</span></td>
	      </tr>
	    </table></td></tr>
	</table>
	 </div>
	 </div>
	 
	 
	 
	 
	 <!--帮助中心-->
<div id="help_dialog">
<!--start  contain容器-->
<div class="contain">
<div class="contain_wrap">
<div class="contain_search">
	<div class="contain_s_wrap">
	<div id="tabs02">
            <ul>
                <li><a href="#tabs02-1">帮助信息</a></li>
                <li><a href="#tabs02-2">版本信息</a></li>
            </ul>
            <div id="tabs02-1">
               <!--start  contain容器-->
                <div class="contain">
                <div class="contain_wrap">
                <div class="contain_search">
                <div class="contain_s_wrap" onclick="window.open('${ctx}/help/index.html','_blank');"><a href="#">
                    1.帮助文档</a><br/>
                    </div>
                    </div><!--end contain_search-->
                    </div><!--end contain_wrap-->
                    </div><!--end contain-->
            </div><!--end tabs01-1-->
            <div id="tabs02-2">
             	<!--start  contain容器-->
                <div class="contain">
                	<div class="contain_wrap">
               		 	<div class="contain_search" style="background:#e0f0ff;">
                   			<div class="contain_s_wrap">
                            	<img src="images/help_p1.jpg" />
                            </div>
                    	</div><!--end contain_search-->
                    </div><!--end contain_wrap-->
                </div><!--end contain-->
            </div><!--end tabs01-2-->
      </div><!--end tabs01-->
      </div><!--end contain_s_wrap-->
    </div><!--end contain_search-->
    </div></div>
</div><!--end help_dialog-->

  </body>

</html>
