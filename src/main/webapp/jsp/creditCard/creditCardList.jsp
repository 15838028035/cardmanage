<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>卡片管理</title>
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
   			var bankNo = $("#bankNoParam").val();
			jQuery("#list").jqGrid('setGridParam',{
			    url:"${ctx}/jsp/creditCard/creditCardAction!list.action",
				postData : {"cardNo" : cardNo,
							"userName" : userName,
							"bankNo" : bankNo,
							},
			 	page:1
			}).trigger("reloadGrid");
    	}; 
    };
    		jQuery(document).ready(function(){ 
			jQuery("#list").jqGrid({
				url:'${ctx}/jsp/creditCard/creditCardAction!list.action',
				datatype: 'json',
				mtype: 'POST',
				colNames:['编号','卡号','用户名','最大额度','有效期','绑定银行','账单日','还款日'],
				colModel:[
					 {name:'id',index:'id',align:'center',hidden:true},
					 {name:'cardNo',index:'cardNo', width:200,align:'center',editable:false},
					 {name:'userName',index:'userName', width:100,align:'center',editable:true},
					 {name:'maxLimit',index:'maxLimit', width:100,align:'center',editable:true},
					 {name:'validateDate',index:'validateDate', width:100,align:'center',editable:true},
					 {name:'bankNo',index:'bankNo', width:100,align:'center',editable:true},
					 {name:'billDate',index:'billDate', width:100,align:'center',editable:true},
					 {name:'repaymentDate',index:'repaymentDate', width:100,align:'center',editable:true}
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
				rowList:[10,15,20],
				sortname: 'id',
				sortorder: 'desc',
								
				viewrecords: true,
				caption: '卡片管理',
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
					            <span class="marg_lef5"><a href="#">卡片管理</a></span>
					            <span class="marg_lef5"> <img src="${ctx}/images/next.gif" align="absmiddle" /></span>
					           	 <span class="marg_lef5">卡片管理</span>
			        		</div><!--end contain_t_text-->
			    	 </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			 
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class="window_button marg_lef10 float_lef">
							<input type="button" id="add" class="window_button_centerInput"  value="新增" />
						</div>
						<div class="window_button marg_lef10 float_lef">
							<input type="button" id="edit" class="window_button_centerInput" value="编辑"/>
						</div>
						<div class="window_button marg_lef10 float_lef">
							<input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/>
						</div>
					
						<table>
							<tr>
							<td></td><td></td>
							<td>卡号</td>
							<td><input name="cardNoParam" id = "cardNoParam" type="text" /></td>
							<td>用户名</td>
							<td><input name="userNameParam" id = "userNameParam" type="text"/></td>
							<td>绑定银行</td>
							<td><input name="bankNoParam" id = "bankNoParam" type="text"/></td>
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
	     var cardNo = $("#cardNoParam").val();
       	 var userName = $("#userNameParam").val();
       	var bankNo = $("#bankNoParam").val();
       
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/creditCard/creditCardAction!list.action',
				postData : {"cardNo" : cardNo,
							"userName" : userName,
							"bankNo" : bankNo,
							},
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/creditCard/creditCardAction!input.action'
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
        	window.location.href = "${ctx}/jsp/creditCard/creditCardAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/creditCard/creditCardAction!multidelete.action?multidelete=" + ids,
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
			    url:'${ctx}/jsp/creditCard/creditCardAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>
    
</body>
</html>
