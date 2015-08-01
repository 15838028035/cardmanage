<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>计划管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script type="">
		$(document).ready(function(){
			contralEffect.contain();
			contralEffect.tablelist();
			contralEffect.blueButton();
			//$("#tabs").tabs();
			//manageApplicationDialog();//dialog
			//Management_4A.AccentTree();
		});
	
	</script>
		<style>
		.altclass{background: #E5EFFD;}
		</style>
    <script type="text/javascript">
    document.onkeydown=function(event){            
    	var e = event || window.event || arguments.callee.caller.arguments[0]                    
    	if(e && e.keyCode==13){ // enter 键                 //要做的事情           
    		var cardNo = $("#cardNoParam").val();
	    	var userName = $("#userNameParam").val();
			jQuery("#list").jqGrid('setGridParam',{
			    url:"${ctx}/jsp/plan/planAction!list.action",
				postData : {"cardNo" : cardNo,
							"userName" : userName
				},
			 	page:1
			}).trigger("reloadGrid");
    	}; 
    };
    		jQuery(document).ready(function(){ 
			jQuery("#list").jqGrid({
				url:'${ctx}/jsp/plan/planAction!list.action',
				datatype: 'json',
				mtype: 'POST',
				colNames:['编号','批次编号','用户编号','post机编号','信用卡编号','消费日期','总金额','还款金额','消费金额','剩余金额','用户名',
							'POST机编号','商户名','费率','账单日','还款日','是否执行'],
				colModel:[
					 {name:'id',index:'id',align:'center',hidden:true},
					 {name:'batchNo',index:'batchNo', width:150,align:'center',editable:false},
					 {name:'userId',index:'userId', width:100,align:'center',editable:true},
					 {name:'creditCardId',index:'creditCardId', width:100,align:'center',editable:true},
					 {name:'postCardId',index:'postCardId', width:100,align:'center',editable:true},
					 {name:'saleDate',index:'saleDate', width:100,align:'center',editable:true},
					 {name:'sumAllMoney',index:'sumAllMoney', width:100,align:'center',editable:true},
					 {name:'inMoney',index:'inMoney', width:100,align:'center',editable:true},
					 {name:'outMoney',index:'outMoney', width:100,align:'center',editable:true},
					 {name:'remainMoney',index:'remainMoney', width:100,align:'center',editable:true},
					 {name:'userName',index:'userName', width:100,align:'center',editable:true},
					 {name:'postCardNo',index:'postCardNo', width:100,align:'center',editable:true},
					 {name:'manName',index:'manName', width:100,align:'center',editable:true},
					 {name:'rate',index:'rate', width:100,align:'center',editable:true},
					 {name:'billDate',index:'billDate', width:100,align:'center',editable:true},
					 {name:'repaymentDate',index:'repaymentDate', width:100,align:'center',editable:true},
					 {name:'excuteFlag',index:'excuteFlag', width:100,align:'center',editable:true}
					 ],
				pager: '#pager',
				sortable: false,
				rowNum:10,
				multiselect: true, 
				prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
				jsonReader: {     
					root: "rows",   
					repeatitems : false,
					id:"0"        		    
					},
				rowList:[10,15,20,50,100],
				sortname: 'id',
				sortorder: 'desc',
				viewrecords: true,
				caption: '计划管理',
				height: '100%',
				hidegrid: false,
				altRows:true,
				altclass:'altclass',
				loadtext: '加载中，请稍等...',
				scrollrows: true
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
			            <span class=""><img src="${ctx}/images/system16.png" align="absmiddle" /></span>
			            <span class="marg_lef5"><a href="#">计划管理</a></span>
			            <span class="marg_lef5"><img src="${ctx}/images/next.gif" align="absmiddle" /></span>
			            <span class="marg_lef5"></span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            	<div class="contain_icon"></div>
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
						<div class="window_button marg_lef10 float_lef"> <input type="button" id="edit" class="window_button_centerInput" value="执行" onclick="mulExecute();" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
					
					<table>
						<tr>
						<td>用户名</td>
						<td><input name="userNameParam" id = "userNameParam" type="text"  value="" /></td>
						<td>卡号</td>
						<td><input name="cardNoParam" id = "cardNoParam" type="text"  value="" /></td>
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
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/plan/planAction!list.action',
				postData : {"cardNo" : cardNo,
							"userName" : userName
				},
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/plan/planAction!input.action'
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
        	window.location.href = "${ctx}/jsp/plan/planAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/plan/planAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        }
        
        function mulExecute() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('请选择一条记录');
        		return;
        	}

        	showModalConfirmation('确认要执行么',"doExecute()");
        }
        
        function doExecute(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/plan/planAction!multiExecute.action?multidExecute=" + ids,
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
			    url:'${ctx}/jsp/plan/planAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>
    
</body>
</html>
