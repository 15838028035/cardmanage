
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>卡片管理</title>
    <meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script language="javascript"  type="text/javascript">
	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	});


	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/creditCard/creditCardAction!bootStrapList.action',         //请求后台的URL（*）
                method: 'post',                     //请求方式（*）
                dataType: "json",
                contentType : "application/x-www-form-urlencoded",
                dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
                totalField: 'total',
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                smartDisplay:false,
                showRefresh:true,
                showColumns:true,
                searchOnEnterKey:true,
                showFooter:true,
                search:false,
                sortable: true,                     //是否启用排序
                sortName:'id',
                sortOrder: "asc",                   //排序方式
                singleSelect:false,
                clickToSelect: true,
                smartDisplay:true,
                queryParams: oTableInit.queryParams,//传递参数（*）
                queryParamsType:'',					//  queryParamsType = 'limit' 参数: limit, offset, search, sort, order;
                									//  queryParamsType = '' 参数: pageSize, pageNumber, searchText, sortName, sortOrder.
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 25,                       //每页的记录行数（*）
                pageList: [10,50, 100, 500, 1000,'all'],        //可供选择的每页的行数（*）
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                height: 600,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                showPaginationSwitch:true,
                detailView: false,                   //是否显示父子表
                columns: [  
			{ field: 'checkStatus', title: '',checkbox:true }, 
// 			 	{field:'id',title:'ID', sortable:true},
			 	{field:'cardNoProfile',title:'编号', sortable:true},
			 	{field:'cardNo',title:'卡号', sortable:true},
			 	{field:'bankNo',title:'银行', sortable:true},
			 	{field:'userName',title:'姓名', sortable:true},
			 	{field:'maxLimit',title:'固定额度', sortable:true},
			 	{field:'initRemainMoney',title:'初始金额', sortable:true},
			 	{field:'validateDate',title:'开始周期', sortable:true},
			 	{field:'secNo',title:'有效期', sortable:true},
			 	{field:'billDate',title:'账单日', sortable:true},
			 	{field:'repaymentDate',title:'还款日', sortable:true},
			 	{field:'serviceRate',title:'服务费率', sortable:true},
			 	//{field:'createBy',title:'创建人ID', sortable:true},
			 	//{field:'createDate',title:'创建日期', sortable:true},
			 	//{field:'updateBy',title:'更新人ID', sortable:true},
			 	//{field:'updateDate',title:'更新日期', sortable:true},
			 	{field:'lockStatus',title:'锁定状态', sortable:true}
			 	//{field:'enableFlag',title:'是否有效', sortable:true},
			 	
			 	
			 	
                        ],               		
             	formatLoadingMessage: function () {
             		return "请稍等，正在加载中...";
             	},
             	formatNoMatches: function () { //没有匹配的结果
             		return '无符合条件的记录';
             	},
             	onLoadError: function (data) {
             		$('#tableList').bootstrapTable('removeAll');
             	},
             	responseHandler: function (res) {
             	    return {
             	        total: res.total,
             	        rows: res.rows
             	    };
             	}
              
            });
            
        };
 
        //得到查询的参数
      oTableInit.queryParams = function (params) {
			var cardNo=$("#cardNo").val();
			var bankNo=$("#bankNo").val();
			var userName=$("#userName").val();
			var billDate=$("#billDate").val();
			var repaymentDate=$("#repaymentDate").val();
			var cardNoProfile=$("#cardNoProfile").val();

            var temp = {  
            		"page.pageSize":params.pageSize,
                    "page.pageNumber":params.pageNumber,
                "sortName":this.sortName,
                "sortOrder":this.sortOrder,
		"creditCard.cardNo":cardNo,
		"creditCard.bankNo":bankNo,
		"creditCard.userName":userName,
		"creditCard.billDate":billDate,
		"creditCard.repaymentDate":repaymentDate,
		"creditCard.cardNoProfile":cardNoProfile
            };
            return temp;
        };
        return oTableInit;
    };
		
</script>
</head>

<body>


<div class="panel-body" style="padding-bottom:0px;">
<div class="mycenter">
            <div class="mysign">
        <div class="panel panel-default">
            <div class="panel-heading">卡片管理</div>
            <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
            <div class="form-group" style="margin-top:15px">
                        
                     	<label class="control-label col-sm-1" for="cardNoProfile">编号</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="cardNoProfile"></div>
				   
			 	<label class="control-label col-sm-1" for="cardNo">卡号</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="cardNo"></div>
                        
			 	<label class="control-label col-sm-1" for="bankNo">银行</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="bankNo"></div>
                        
			 	<label class="control-label col-sm-1" for="userName">姓名</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="userName"></div>
                        
			 	<label class="control-label col-sm-1" for="billDate">账单日</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="billDate"></div>
                        
			 	<label class="control-label col-sm-1" for="repaymentDate">还款日</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="repaymentDate"></div>

                        <div class="col-sm-12" style="text-align:left;">
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" style="margin-left:50px" id="btn_query" class="btn btn-success btn-shadow btn-shadow-success ">查询</button>
                        <button type="button" id="backToHomeButton" class="btn btn-primary ">返回</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>
        
        <table id="tableList"></table>
    </div>


    <script type="text/javascript">
    	    var $tableList = $('#tableList');
	    var $btn_add = $('#btn_add');
	    var $btn_edit = $('#btn_edit');
	    var $btn_delete = $('#btn_delete');
	    var $btn_query = $('#btn_query');

	
		//新增
        $("#btn_add").click(function() {
        	window.location.href = '${ctx}/jsp/creditCard/creditCardAction!input.action'
        })
		//编辑
        $("#btn_edit").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             	});
        	if(ids == ''|| ids==null){
        		bootbox.alert('请选择要编辑的记录');
        		return;
        	}
        	
        	if(ids.length>1){
        		bootbox.alert('请选择一条编辑的记录');
        		return;
        	}
        	window.location.href = "${ctx}/jsp/creditCard/creditCardAction!input.action?operate=edit&id=" + ids;
        })
		//删除
      $("#btn_delete").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	 
        	if(ids == ""){
        		bootbox.alert('请选择要删除的记录');
        		return;
        	}

        	bootbox.confirm('确认要删除么?',function (result) {  
                if(result) {  
                	doDelete();
                }
        	});
        })

        function doDelete(){
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/creditCard/creditCardAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);
			refreshGrid();
        }
        
  	$btn_query.click(function () {
        	 refreshGrid();
        });

      	function refreshGrid(){
		$tableList.bootstrapTable('refresh');
      	}
      	
    </script>

<script>
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
