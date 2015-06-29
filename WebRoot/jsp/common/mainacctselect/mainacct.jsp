<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<s:set name="belongOrg" value="#parameters.belongOrg[0]"/>
<s:set name="editBar" value="#parameters.editBar[0]"/>
<s:set name="dirBar" value="#parameters.dirBar[0]"/>
<s:set name="clickMainAcctEvent" value="#parameters.clickMainAcctEvent[0]"/>
<s:set name="multiselect" value="#parameters.multiselect[0]"/>

<s:set name="lockstatus" value="#parameters.lockstatus[0]"/>
<s:set name="pwdtype" value="#parameters.pwdtype[0]"/>
<s:set name="gridwidth" value="#parameters.gridwidth[0]"/>
<s:set name="lastupdatetime" value="#parameters.lastupdatetime[0]"/>

<s:set name="tpPk" value="#parameters.tpPk[0]"/>
<s:set name="stepId" value="#parameters.stepId[0]"/>
<s:set name="method" value="#parameters.method[0]"/>
<s:set name="wfRoleId" value="#parameters.wfRoleId[0]"/>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/jsp/common/taglibs.jsp" %>
	<%@ include file="/jsp/common/scripts/base.jsp"%>
	<%@ include file="/jsp/common/scripts/jqgrid.jsp"%>
	<script type="text/javascript">
		function queryByOrg() {
			 $("#list").jqGrid('setGridParam',{
			     url:"${ctx}/jsp/common/mainacctselect/mainacct!queryByOrg.action",
			     postData:{
			     	"queryVO.belongOrg":$("#belongOrg").val()
			     },
			 	 page:1
			 }).trigger("reloadGrid");
		  	
		  	return false;
		}		
	
		function refresh() {
		 	$("#list").jqGrid().trigger("reloadGrid"); 				
		}
	
		function clearGridData() {
			$("#list").jqGrid('clearGridData');
		}
		
		$(function() {
			var belongOrgTemp = '${belongOrg}';
			if(belongOrgTemp==''){
				belongOrgTemp = '0';
			}
			//表格 
			$("#list").jqGrid({
				url : "${ctx}/jsp/common/mainacctselect/mainacct!queryByOrg.action?queryVO.belongOrg="+belongOrgTemp,
				datatype: 'json',
				mtype: 'POST',
				colNames:['id', '<s:text name="Common.name"/>','<s:text name="wfTemp.mainAcctName"/>', '<s:text name="wfTemp.org"/>'],
				colModel:[
					 {name:'mainAcctId',index:'mainAcctId', hidden:true},
					 {name:'name',index:'name',width : 120, align:'center'},
					 {name:'loginName',index:'loginName', width : 150, align:'center' ${clickMainAcctEvent==null?'' : ',formatter:'}${clickMainAcctEvent}},
					 {name:'defaultOrg.orgName',index:'defaultOrg', width : 252, align:'center'}
					 ],
				pager: '#pager',
				sortable: true,
				rowNum: 15,
				rowList:[15,30,45],
				multiselect: ${multiselect == 'true'?'true':'false'}, 
				prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
				jsonReader: {     
					root: "rows",   
					repeatitems : false,
					id:"0"        		    
					},
				viewrecords: true,
				height: '100%',
				width:'80%',
				hidegrid: false,
				loadtext: '<s:text name="Common.reading"/>',
				scrollrows: true
			}); 

			//保存已选择的自然人
			$('#savePerson').click(function() {
				eval("${method}");
			});	
		
		    function setParentFormValue(){
		      var rows = getGridSelectedRows('list');
              if (rows == -1) return ;
               
	           var mainAcctName = getGridCellValue("list",rows,3); 
               parent.authorForm.mainAcctId.value=rows;
               parent.$("#authorMainAcct").val(mainAcctName);  
               parent.$("#Authorize_select_dialog").dialog("close");
		    }
		    
					
		});
		
		function formSubmit(){
		
			 var loginName = $("#loginName").val();
			 var name = $("#name").val();

			 $("#list").jqGrid('setGridParam',{
			     url:"${ctx}/jsp/common/mainacctselect/mainacct.action",
			     postData:{"queryVO.loginName":loginName,
			     		   "queryVO.name":name
			     },
			 	 page:1
			 }).trigger("reloadGrid"); 		
			 
			 return false;		
		
		}
		
		function saveStepPersons(){
		  var rows = getGridSelectedRows('list');
		  if (rows == -1) return ;
		  showModalConfirmation("<s:text name="wfTemp.isAddFlowParticipator"/>","saveStepPersonsCallBack()");
		}
		
		function saveConfigAdmin(){
		  var rows = getGridSelectedRows('list');
		  if (rows == -1) {
		  	showModalMessage("请选择一条记录!");
		  	return ;
		  }else if(rows.length>1){
		  	showModalMessage("只能选择一条记录!");
		  	return ;
		  }
		  window.parent.parent.$("#selectMainAcctText").val(getGridCellValue("list",rows,2)); 
		  window.parent.parent.$("#selectMainAcctId").val(rows); 
		  window.parent.parent.closeWindow();
		}
		
		function selectPerson(){
	                  var rows = getGridSelectedRows('list');
	                  if (rows == -1) return ;
	                  window.parent.$("#loginName").val(getGridCellValue("list",rows,3));
	                  window.parent.$("#selPersonDiv").dialog('close');
                }
		function saveStepPersonsCallBack(){
		  var participators = getGridSelectedRows('list');
		  var result = jQuery.ajax({
		                  url:"${ctx}/wfTemplateCfg!addStepParticipator.action?&tpPk=${tpPk}&stepId=${stepId}&participatorType=0&participators="+participators,
		                  async:false,
		                  dataType:"json"
		              }).responseText;
		  window.parent.parent.reloadPersons();
		  showModalMessage(result);
		}
		
		function saveRoleParticipator(){
		  var rows = getGridSelectedRows('list');
		  if (rows == -1) return ;
		      
		  showModalConfirmation("<s:text name="wfTemp.isAddFlowParticipator"/>","saveRoleParticipatorCallBack("+rows+")");
		}
		
		function saveRoleParticipatorCallBack(rows){
		  var rows = getGridSelectedRows('list');
		  var result = jQuery.ajax({
		                  url:"${ctx}/wfRoleCfg!addRoleParticipator.action?wfRoleId=${wfRoleId}&rows="+rows,
		                  async:false,
		                  dataType:"json"
		              }).responseText;
	      window.parent.parent.gridReload();
	      showModalMessage(result);
		}
		
		function fetchMainAcctInfo(){
		  
	      showModalConfirmation("<s:text name="mainAcctInfo.isSureAgent"/>","fetchMainAcctInfoCallBack()");
	      
		}
		function fetchMainAcctInfoCallBack(rows){
			var rows = getGridSingleSelectedRow('list');
	      	if (rows == -1) return ;
	      	var selectMainAcctId=getGridCellValue("list",rows,1);
	      	
			window.parent.loadMainAcctInfo(selectMainAcctId); 
			window.parent.$("#selMainAcctDiv").dialog("close");
		    //showModalMessage(result);	
		}
	</script>    
</head>
<body>	
<div class="padd10">
<!--start  contain容器-->
<div class="contain">
<div class="contain_wrap">
	<div class="contain_title">
    	<div class="contain_t_wrap">
            <div class="float_lef contain_t_text">
            <span class=""><img src="${ctx}/images/User.png" align="absmiddle" /></span>
            <span class="marg_lef5"><s:text name="wfTemp.personSelect"/></span>
            </div><!--end contain_t_text-->
            <div class="float_rig contain_t_check">
            	
            </div><!--end contain_t_check-->
            <div class="clear"></div>
        </div><!--end contain_t_wrap-->
    </div><!--end contain_title-->
    <div class="contain_search">
    	<div class="contain_s_wrap">
	        <form action="${ctx}/jsp/common/mainacctselect/mainacct.action" method="post" id="queryForm">    	
    		<input type="hidden" name="belongOrg" id="belongOrg" value="${belongOrg}"/> 	        	
        	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	            <tr>
	            <td width="10%" align="right" class="font_wei"><s:text name="mainAcctInfo.name"/></td>
	            <td width="15%" align="left"> <input type="text" class="input_text80"  name="queryVO.name" id="name"/></td>
	            <td width="7%" align="right" class="font_wei"><s:text name="wfTemp.mainAcctConditon"/></td>
	            <td width="15%" align="left"><input type="text" class="input_text80" name="queryVO.loginName" id="loginName"/></td>
	            <td width="10%"><input type="button" value="<s:text name="commonQuery"/>" onClick="formSubmit();"/></td>
	            <script>document.getElementById('name').focus();</script>
	            </tr>
            </table>
            </form>
        </div><!--end contain_s_wrap-->
    </div><!--end contain_search-->
	<div class="toolbar">
	    <div class="toolbar_wrap">
			<input type="button" class="blue_button" id="savePerson" value="<s:text name="CommonSave"/>" />
	   </div>
	</div>
	<!--start grid-->
	<table id="list"></table>
	<div id="pager"></div>
          <!--end grid-->
</div><!--end contain_wrap-->
</div><!--end contain-->
</div>
</body>
</html>