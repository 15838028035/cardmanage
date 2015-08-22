<%@page language="java" isELIgnored="false"%>
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
			url:'${ctx}/jsp/user/userAction!list.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:['ID','帐号','姓名','卡号','手机号码','地址'],
			colModel:[
				 {name:'userId',index:'userId',hidden:true},
				 {name:'loginNo',index:'loginNo',width:100,align:'center'},
				 {name:'userName',index:'userName',width:100,align:'center'},
				 {name:'cardNo',index:'cardNo',width:240,align:'center'},
				 {name:'mobile',index:'mobile',width:100,align:'center'},
				 {name:'address',index:'address',width:240,align:'center'}
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
			width: '100%',
			height: '100%',
			sortname:'loginNo',
			sortorder:'asc',
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
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            <span class=""><img src="${ctx}/images/system16.png" align="absmiddle" /></span>
			            <span class="marg_lef5"><a href="#">用户管理</a></span>
			            <span class="marg_lef5"><img src="${ctx}/images/next.gif" align="absmiddle" /></span>
			            <span class="marg_lef5"></span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class="window_button marg_lef10 float_lef">
						<input type="button" id="add" class="window_button_centerInput"
						 value="新增" /></div>
						<div class="window_button marg_lef10 float_lef">
						<input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
					<table>
						<tr>
						<td>用户名</td>
						<td><input name="userNameParam" id = "userNameParam" type="text"/></td>
						<td>卡号</td>
						<td><input name="cardNoParam" id = "cardNoParam" type="text"/></td>
						<td>手机号码</td>
						<td><input name="mobileParam" id = "mobileParam" type="text" style="width:100px;"/></td>
						<td>地址</td>
						<td><input name="addressParam" id = "addressParam" type="text"/></td>
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
	    	var userName = $("#userNameParam").val();
	    	var cardNo = $("#cardNoParam").val();
	    	var address = $("#addressParam").val();
	    	var mobile = $("#mobileParam").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/user/userAction!list.action',
				postData : {"userName" : userName,
							"cardNo" : cardNo,
							"address" : address,
							"mobile" : mobile,
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/user/userAction!input.action'
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
        	window.location.href = "${ctx}/jsp/user/userAction!input.action?operate=edit&userId=" + ids;
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
		      	  url:"${ctx}/jsp/user/userAction!multidelete.action?multidelete=" + ids,
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
			    url:'${ctx}/jsp/user/userAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
