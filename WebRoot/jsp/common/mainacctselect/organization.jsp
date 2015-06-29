<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/jsp/common/taglibs.jsp" %>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/scripts/base.jsp"%>
	<%@ include file="/jsp/common/scripts/jqgrid.jsp"%>
	<%@ include file="/jsp/common/scripts/tree.jsp"%>
	<s:set name="action" value="#parameters.action[0]"/>
	<s:set name="style" value="#parameters.style[0]"/>
	
	<script type="text/javascript">
		$(function(){
			//生成树
	        root = jQuery.ajax({
	          url:"${ctx}/jsp/common/mainacctselect/organization.action" ,
	          async:false,
	          dataType:"text"
	        }).responseText;
			
			var dataObj=eval("("+root+")");
			
			tree = new TreePanel({
				renderTo:'treediv',
				'root' : dataObj,
				'iconPath' : "${ctx}/scripts/tree/img/",
				'switchType' : 'ajax',
				'ajaxAction' : "${ctx}/jsp/common/mainacctselect/organization.action"
			});
			tree.render();
			
			//选择事件
			tree.on(function(node){
				var treeNodeId = node.attributes.id;
				var treeNodeName = node.attributes.text;
				var nodeType = node.attributes.nodeType;
				if(nodeType=="root"){
					treeNodeId=0;   //business data
				}
				var isOrgAdmin = jQuery.ajax({
			          url:"${ctx}/jsp/common/mainacctselect/mainacctpermission!isOrgAdmin.action?orgId=" + treeNodeId ,
			          async:false,
			          dataType:"text"
			        }).responseText;
				
				var action = "${action}";			
				
				if(action == "navi") {
					if(isOrgAdmin == "true") {
						parent.LT_main.location = "${ctx}/jsp/common/mainacctselect/mainacct.jsp?belongOrg=" + treeNodeId;
					} else {
						parent.LT_main.location = "${ctx}/jsp/common/mainacctselect/mainacct.jsp?belongOrg=-1";
					}				
				} else if(action == "select"){
					if(isOrgAdmin == "true") {
						var isSelected = false;
						if(isSelected == true) {
							alert("<s:text name="wfTemp.nodeIsSelected"/>");
						} else {
							$(parent.window.document).find('#orgId').val(treeNodeId);
							$(parent.window.document).find('#orgName').val(treeNodeName);
							
							$.FrameDialog.closeDialog();
						}
						
					} else {
						alert("<s:text name="wfTemp.withOutOrgAuthority"/>");
					}
				} else if(action == "other"){
					$(parent.LT_main.window.document).find("#belongOrg").val(treeNodeId);
					parent.LT_main.queryByOrg();
				}
			});
		})
	
	</script>
</head>
<body>
	<s:if test="#style == 'false'">
		<div id="treediv" style=""></div>
	</s:if>
	<s:else>
        <div class="AT_tree">
        	<div class="AT_tree_wrap">
        	<div class="AT_tree_tit"></div><!--end AT_tree_tit-->
            <div class="AT_tree_mid">
            	<div class="AT_tree_mid_wrap">
       				<div class="widget_tree">
						<div id="treediv" style=""></div>
                	</div>
                </div>
            </div><!--end AT_tree_mid-->
            <div class="AT_tree_bot"></div><!--end AT_tree_bot-->
            </div><!--end AT_tree_wrap-->
        </div><!--end AT_tree-->	
	</s:else>
	
</body>
</html>
