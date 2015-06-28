<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>cardmanage</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
<style>
.altclass{background: #E5EFFD ;}
</style>

<script language="javascript">
	$(document).ready(function(){
		contralEffect.contain();
		contralEffect.tablelist();
		contralEffect.blueButton();
		var isAlert = '${saveSuc}';
		if(isAlert == "1"){
			showModalMessage("编辑");
		}
			
		onSelectRowaction = function(id){
			var s = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
			var sc = s.toString();
			var scindex = sc.indexOf(',');
			
			if(scindex >= 0){
				jQuery("#list").jqGrid('setSelection',sc.substring(0,scindex)); 
			}
		}	
		//编辑数据库客户端
		 $("#editButton").click(function(){
		 	var ids = $("#list").getGridParam("selarrrow");
			 if(ids == ""){
			 	showModalMessage("请选择要编辑的记录'/>");
			 	return false;
			 }
			 ids += "";
			 var splitId = ids.split(","); 
			 if(splitId.length > 1) {
				showModalMessage("请选择一条记录'/>");
				return false;
			 }
			 var id = jQuery("#list").jqGrid('getRowData',ids).id;
			location.href="${ctx}/jsp/userAction!input.action?&id="+id;
	  	});
			
	});
	
	jQuery(document).ready(function(){ 
		var lastsel;
		jQuery("#list").jqGrid({
			url:'${ctx}/jsp/user/userAction!listByJQGrid.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:['ID','id','登录帐号','密码','用户名','卡号','地址','手机号码','加锁状态','是否有效'],
			colModel:[
				 {name:'userId',index:'userId',hidden:true},
				 {name:'loginNo',loginNo:'resType',hidden:true},
				 {name:'pwd',index:'pwd',hidden:true},
				 {name:'userName',index:'userName',width:240,align:'center'},
				 {name:'cardNo',index:'cardNo',width:240,align:'center'},
				 {name:'address',index:'address',width:240,align:'center'},
				 {name:'mobile',index:'mobile',width:240,align:'center'},
				 {name:'lockStatus',index:'lockStatus',width:240,align:'center'},
				 {name:'enableFlag',index:'enableFlag',width:240,align:'center'}
				 ],
			pager: '#pager',
			sortable: true,
			rowNum: 10,
			rowList:[10,15,20],
			multiboxonly:true,
			multiselect: true,
			prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
			jsonReader: {     
				root: "rows",   
				repeatitems : false,
				id:"0"        		    
				},
			viewrecords: true,
			height: '100%',
			sortname:'loginNo',
			sortorder:'asc',
			width:'940',
			hidegrid: false,
			loadtext: '正在加载,请稍等..',
			scrollrows: true,
			altRows:true,
			altclass:'altclass',
			onSelectRow: onSelectRowaction
		}); 
		$("#cb_list").attr("style", "display:none");
		
		});
		
</script>
</head>

<body>

<div class="padd10">
<!--start  contain容器-->
<div class="contain">
<div class="contain_wrap">
    <div class="toolbar">
    	<div class="contain_l_wrap">
            <div class="datalist">
            	<br />
            	<table id="list"></table>
				<div id="pager"></div>
            </div><!--end datalist-->
        </div><!--end contain_l_wrap-->
    </div><!--end contain_list-->
     
</div><!--end contain_wrap-->
</div><!--end contain-->
</div>



</body>
</html>
