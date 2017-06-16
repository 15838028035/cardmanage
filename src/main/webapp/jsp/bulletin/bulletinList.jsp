<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>公告管理</title>
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
	});
	
	jQuery(document).ready(function(){ 
		var lastsel;
		jQuery("#list").jqGrid({
			url:'${ctx}/jsp/bulletin/bulletinAction!list.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
					'ID',
			 		'公告编号',
			 		'公告标题',
			 		'公告内容',
			 		'建创日期'
			],
			colModel:[
					{name:'bulletinId',index:'bulletinId',hidden:true},		 				 		
			 		{name:'levelName',index:'levelName'},
			 		{name:'title',index:'title'},			 		
			 		{name:'targetName',index:'targetName'},			 				 
			 		{name:'createTime',index:'createTime'}		 	
				 ],
			pager: '#pager',
			sortable: true,
			rowNum: 20,
			rownumbers:true,
			rowList:[10,20,30,50,100],
			multiboxonly:true,
			multiselect: true,
			prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
			jsonReader: {     
				root: "rows",   
				repeatitems : false,
				id:"0"        		    
				},
			viewrecords: true,
			autowidth:true,
			shrinkToFit:true,
			height: '100%',
			sortname:'bulletinId',
			sortorder:'desc',
			hidegrid: false,
			gridComplete:function(){},
			loadtext: '正在加载,请稍等..',
			scrollrows: true,
			altRows:true,
			altclass:'altclass'
			
		}); 
		
		});
		
</script>
</head>

<body>

 <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">公告管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<c:if test="${sessionScope.securityContext.loginName=='system'}">
						<div class="window_button marg_lef10 float_lef">
						<input type="button" id="add" class="window_button_centerInput"
						 value="新增" /></div>
						<div class="window_button marg_lef10 float_lef">
						<input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
						</c:if>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="view" class="window_button_centerInput"  value="查看" /></div>
					<table>
						<tr>
			 			<td>标题</td>
						<td><input name="title" id = "title" type="text"/></td>
			 			
						<td>		
							<div class="window_button marg_lef10 float_lef">
								<input class="window_button_centerInput" name="select" id = "select" type="button" value="查询" /></div>
							</div>
						</td>
						</tr>
					</table>
					</div>
				</div>
				
				<table id="list"></table>
				<div id="pager"></div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
    
	  //查询
	    $("#select").click(function() {
			 	var title=$("#title").val();
	    		var effDateEnd=$("#effDateEnd").val();
	    		var expDateBegin=$("#expDateBegin").val();
	    		var expDateEnd=$("#expDateEnd").val();
	    	
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/bulletin/bulletinAction!list.action',
				postData : {
			 			 	"title":title,
							"effDateBegin":effDateBegin,
							"effDateEnd":effDateEnd,
							"expDateBegin":expDateBegin,
							"expDateEnd":expDateEnd
							
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/bulletin/bulletinAction!input.action'
        })
		//编辑
        $("#edit").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要编辑的记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	//window.location.href = "${ctx}/jsp/bulletin/bulletinAction!input.action?operate=edit&bulletinId=" + ids;
        	
        	jQuery.FrameDialog.create({
						url: "${ctx}/jsp/bulletin/bulletinAction!input.action?operate=edit&bulletinId=" + ids,
						title: "编辑",
						width: 1000,
						height: 750,
						position:'left',
						hide: 'slide',
						buttons:{}							
					}).bind('dialogclose', function(event, ui) {
							refreshGrid();
			    	});
        })
        
        
        $("#view").click(function() {
       	 var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要查看记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	window.location.href = '${ctx}/jsp/bulletin/bulletinAction!input.action?operate=view&bulletinId=' + ids;
        })
        
		//删除
        function mulDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('请选择一条记录');
        		return;
        	}

        	showModalConfirmation('确认要删除么',"doDelete()");
        }	
        function doDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/bulletin/bulletinAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        }
        
      	function refreshGrid(){
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/bulletin/bulletinAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
