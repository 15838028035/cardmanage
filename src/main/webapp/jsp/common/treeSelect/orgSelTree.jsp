<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/web3/jsp/common/taglibs.jsp"%>


<html>
	<head>
	<title></title>
    <link href="${ctx}/web3/jsp/questionnaire/css/css2.css" type="text/css" rel="stylesheet" />
	<%@ include file="/web3/jsp/common/meta.jsp"%>
	<%@ include file="/web3/jsp/common/script_include.jsp" %>
	<%@ include file="/web3/jsp/common/jqgrid_include.jsp" %>
	<%@ include file="/web3/jsp/common/ztree_include.jsp" %>
	<%@ include file="/web3/jsp/common/msgbox_include.jsp" %>

	</head>
	<body>
	 <div class="sbdl_tree2">
		    <div class="sbdl_tree_top">
			  <div class="tree_tit_word">请选择</div>
			</div>
			<div class="sbdl_tree_mid">
			  <div class="sbdl_tree_mid_con">
					<ul id="treeDemo" class="ztree"></ul>
			  </div>
			</div>
			
		  </div>
	</body>
</html>
    <script type="text/javascript">
    /**
		 * 树节点单击事件
		 * @param {Object} event 标准的js event对象
		 * @param {Object} treeId 节点id
		 * @param {Object} treeNode 树节点
		 */
		function zTreeOnClick(event, treeId, treeNode) {
		 	if(treeNode.flag=="1"){
               parent.$("#orgId").val(treeNode.id);
               parent.$("#orgName").val(treeNode.name);
               //closeParentWindow();
                customBtnCloseMsgBox();
              }else{
                  showModalMessage('<s:text name="org.hasNoPermission"></s:text>');
              }
		}
    
    $(function(){
		var zNodes = [${JsonData}];
		initTree("treeDemo","${ctx}/web3/tree!listOrgTreeNode.action",zNodes,zTreeOnClick);
	});
	$.ajaxSetup ({
		cache: false //关闭AJAX相应的缓存  
	});
    </script>