<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POS管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script type="">
		$(document).ready(function(){
			//contralEffect.contain();
			//contralEffect.tablelist();
			//contralEffect.blueButton();
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
    		var param = $("#param").val();
			jQuery("#list").jqGrid('setGridParam',{
			    url:"${ctx}/jsp/postCard/postCardAction!list.action",
				postData : {"param" : param},
			 	page:1
			}).trigger("reloadGrid");
    	}; 
    };
    		jQuery(document).ready(function(){ 
			jQuery("#list").jqGrid({
				url:'${ctx}/jsp/postCard/postCardAction!list.action',
				datatype: 'json',
				mtype: 'POST',
				colNames:['编号','POS机编号','商户名字','费率','匹配最小额度','匹配最大额度','行业','绑定银行','卡号','姓名'],
				colModel:[
					 {name:'id',index:'id',align:'center',hidden:true},
					 {name:'postCardNo',index:'postCardNo', width:280,align:'center',editable:false},
					 {name:'manName',index:'manName', width:500,align:'center',editable:true},
					 {name:'rate',index:'rate', width:500,align:'center',editable:true},
					 {name:'minMoney',index:'minMoney', width:500,align:'center',editable:true},
					 {name:'maxMoney',index:'maxMoney', width:500,align:'center',editable:true},
					 {name:'trade',index:'trade', width:500,align:'center',editable:true},
					 {name:'bindBank',index:'bindBank', width:500,align:'center',editable:true},
					 {name:'cardNo',index:'cardNo', width:500,align:'center',editable:true},
					 {name:'userName',index:'userName', width:500,align:'center',editable:true}
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
				caption: 'POS管理',
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
			            <span class="marg_lef5"><a href="#"><s:text name="menu.syscfg"></s:text></a></span><span class="marg_lef5"><img src="${ctx}/images/next.gif" align="absmiddle" /></span><span class="marg_lef5"><s:text name="menu.syscfg.ip_rule.ip"></s:text></span>
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
						<div class="window_button marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
					
					<div class="window_button marg_lef10 float_lef">
						<input type="button" class="window_button_centerInput" id="batchbtn" value='批量操作" />' />
					</div>
					<table>
						<tr>
						<td></td><td></td>
						<td><s:text name='ipgroup.nameQuery' /></td>
						<td><input name="param" id = "param" type="text"  value="" /></td>
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
	    	var param = $("#param").val();
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/postCard/postCardAction!list.action',
				postData : {"param" : param},//FIXME 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/postCard/postCardAction!input.action'
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
        	window.location.href = "${ctx}/jsp/postCard/postCardAction!input.action?operate=edit&id=" + ids;
        })
		//删除
        function mulDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('<s:text name="delete.info.selectRowCount"/>');
        		return;
        	}
        	/**
        	var rm = jQuery.ajax({
	      	  url:"${ctx}/jsp/postCard/postCardAction!deleteValidate.action?multidelete=" + ids,
	          async:false,
	          cache:false,
	          dataType:"json"
		      }).responseText;
		    var rms = eval("("+rm+")");
		    var returnM = rms.opResult;
		    if(returnM != ''){
		    	showModalMessage(returnM);
		    	return;
		    }
		    */

        	showModalConfirmation('确认要删除么',"doDelete()");
        }	
        function doDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/postCard/postCardAction!multidelete.action?id=" + ids,
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
			    url:'${ctx}/jsp/postCard/postCardAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
      	//批量操作
      	$("#batchbtn").click(function() {
			//window.location = "${ctx}/jsp/syscfg/ipgroup/ipgroupbatch!batchinit.action";
		});	
    </script>
    
</body>
</html>
