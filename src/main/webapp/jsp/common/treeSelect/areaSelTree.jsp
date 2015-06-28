<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<%@ taglib prefix="h" uri="http://www.asiainfo.com/uac/html"%>

<html>
	<head>
	<title></title>
    
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/scripts/treePanel.jsp" %>

	</head>
	<body>
	<div class="padd10">
	<!--start  contain容器-->
	    <div class="contain" id="areaTreeDiv" style="height:300px;width:100%;overflow-y:scroll;overflow-x:scroll;">
	       
				  		<h:SimpleTree data="${JsonData}"
							iconPath="${ctx}/scripts/tree/img/" switchType="ajax"
							ajaxAction="${ctx}/tree!listAreaTreeNode.action"
							renderTo="areaTreeDiv" 
							>
						</h:SimpleTree>
						
				
		</div>
	</div>
	</body>
</html>
    <script type="text/javascript">
            
        $(document).ready(function() {
        $(".TreePanel").css({'height':'auto'});
        $(".TreePanel").css({'overflow-x':'hidden'});
            tree.on(function(node){
                 if(node.attributes.nodeType=="root"){
                        $("#areaId").val("0");
                        $("#areaName").val(node.attributes.text);
                }else{
	                $("#areaId").val(node.attributes.id);
	                $("#areaName").val(node.attributes.text);
                }
                $("#selAreaDiv").dialog('close');
            })
            
        });
    </script>