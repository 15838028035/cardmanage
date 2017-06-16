
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>计划管理</title>
    <meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script language="javascript"  type="text/javascript">
	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	     
	 	$(".datetimepicker").datetimepicker({
	       	 language: 'zh-CN',//显示中文
	         format: 'yyyy-mm-dd',//显示格式
	         minView: "month",//设置只显示到月份
	         clearBtn:true,   //加入清空
	         initialDate: new Date(),//初始化当前日期
	         autoclose: true,//选中自动关闭
	         todayBtn: true//显示今日按钮
		         });
	});

	
	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/plan/planAction!bootStrapList.action',         //请求后台的URL（*）
                method: 'post',                     //请求方式（*）
                dataType: "json",
                contentType : "application/x-www-form-urlencoded;charset=UTF-8",
                dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
                totalField: 'total',
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                smartDisplay:true,
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
                pageSize: 100,                       //每页的记录行数（*）
                pageList: [100,300,500,1000,'all'],        //可供选择的每页的行数（*）
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                height: 800,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                showPaginationSwitch:true,
                detailView: false,                   //是否显示父子表
                //visible:false
                columns: [  
			    { field: 'checkStatus', title: '',checkbox:true }, 
			 	{field:'cardNoProfile',title:'编号', sortable:true},
			 	{field:'cardNo',title:'信用卡卡号', sortable:true},
			 	{field:'bankNo',title:'银行', sortable:true},
			 	{field:'saleDate',title:'消费日期', sortable:true},
			 	{field:'sumAllMoney',title:'固定额度', sortable:true},
			 	{field:'inMoney',title:'还款金额', sortable:true},
			 	{field:'outMoney',title:'消费金额', sortable:true},
			 	{field:'remainMoney',title:'剩余金额', sortable:true},
			 	
			 	{field:'userName',title:'姓名', sortable:true},
			 	{field:'postCardNo',title:'机具编号', sortable:true},
			 	//{field:'manName',title:'商户名', sortable:true},
			 	{field:'rate',title:'费率', sortable:true},
			 	{field:'billDate',title:'账单日', sortable:true},
			 	{field:'repaymentDate',title:'还款日', sortable:true},
			 	//{field:'serviceRate',title:'服务费', sortable:true},
			 	
			 	//{field:'poundage',title:'手续费', sortable:true},
			 	//{field:'incomeMoney',title:'收益', sortable:true},
			 	{field:'excuteFlag',title:'执行', sortable:true,
			 		formatter:function operateFormatter(value, row, index) {
			 			  if(value=='T'){
			        	return '<font style="color:blue;" >是</font>';
			 			  }else {
			 				 return '<font style="color:#000;" >否</font>';
			 			  }
			   	 }
			 	}
			 
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
             		  return res;
             	}
              
            });
            
        };
 
        //得到查询的参数
      oTableInit.queryParams = function (params) {
			var cardNoProfile=$("#cardNoProfileParam").val();
			var cardNo=$("#cardNoParam").val();
			var userName=$("#userNameParam").val();
			var postCardNo=$("#postCardNoParam").val();
			var saleDateStratParam=$("#saleDateStratParam").val();
			var saleDateEndParam=$("#saleDateEndParam").val();
			
            var temp = { 
            		"page.pageSize":params.pageSize,
                    "page.pageNumber":params.pageNumber,
                "sortName":this.sortName,
                "sortOrder":this.sortOrder,
		"cardNoProfile":cardNoProfile,
		"cardNo":cardNo,
		"userName":userName,
		"postCardNo":postCardNo,
		"saleDateStratParam":saleDateStratParam,
		"saleDateEndParam":saleDateEndParam,
		
            };
            return temp;
        };
        return oTableInit;
    };
</script>

</head>

<body>


<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">计划管理</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                   
                    
			 	<label class="control-label col-sm-1" for="cardNoProfile">编号</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="cardNoProfileParam"></div>
                        
			 	<label class="control-label col-sm-1" for="cardNoParam">卡号</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="cardNoParam"></div>
			 	<label class="control-label col-sm-1" for="userNameParam">姓名</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="userNameParam"></div>
				
				<label class="control-label col-sm-1" for="postCardNoParam"> 机具编号</label>
				<div class="col-sm-3"> <input type="text" class="form-control" id="postCardNoParam"></div>
				<label class="control-label col-sm-1" for="userName">开始日期</label>
				<div class="col-sm-3"> 
				  <input name="saleDateStratParam" id = "saleDateStratParam" type="text"   class=" datetimepicker" data-date-format="yyyy-MM-dd" readOnly="true" />
				</div>
				<label class="control-label col-sm-1" for="userName">结束日期</label>
				<div class="col-sm-3"> 
					<input name="saleDateEndParam" id = "saleDateEndParam" type="text"  class="  datetimepicker" data-date-format="yyyy-MM-dd"  readOnly="true" />
				</div>
				
						
			    <div class="col-sm-12" style="text-align:left;">
                     &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-success btn-shadow btn-shadow-success ">查询</button>
                   <button type="button" id="backToHomeButton" class="btn btn-primary ">返回</button>    
                 </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
            
            
            <button id="exportExcel" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>导出
            </button>
            <button id="exportSumExcel" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>机具流水
            </button>
            <button id="sumCalc" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>合计
            </button>
            
              <button id="mulExecute" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 执行
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
        	window.location.href = '${ctx}/jsp/plan/planAction!list.actionn'
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
        	window.location.href = "${ctx}/jsp/plan/planAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/plan/planAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);
			//refreshGrid();
			window.location.reload();
        }
        
  		$btn_query.click(function () {
        	 refreshGrid();
        });

      	
      	 $("#exportExcel").click(function() {
 	    	var userName = $("#userNameParam").val();
 	    	var cardNo = $("#cardNoParam").val();
 	    	var saleDateStratParam = $("#saleDateStratParam").val();
 	    	var saleDateEndParam = $("#saleDateEndParam").val();
 	    	var cardNoProfile = $("#cardNoProfileParam").val();
 	    	var postCardNo = $("#postCardNoParam").val();
 			window.location ="${ctx}/jsp/plan/planAction!exportExcel.action?cardNo="+cardNo+"&userName="+ encodeURIComponent(encodeURIComponent(userName))+"&saleDateStratParam="+saleDateStratParam
 			+"&saleDateEndParam="+saleDateEndParam+"&cardNoProfile="+cardNoProfile+"&postCardNo="+encodeURIComponent(encodeURIComponent(postCardNo));
 					 					
 	    });
 	    
 	     $("#exportSumExcel").click(function() {
 	    	var userName = $("#userNameParam").val();
 	    	var cardNo = $("#cardNoParam").val();
 	    	var saleDateStratParam = $("#saleDateStratParam").val();
 	    	var saleDateEndParam = $("#saleDateEndParam").val();
 	    	var cardNoProfile = $("#cardNoProfileParam").val();
 	    	var postCardNo = $("#postCardNoParam").val();
 			window.location ="${ctx}/jsp/plan/planAction!exportSumExcel.action?cardNo="+cardNo+"&userName="+ encodeURIComponent(encodeURIComponent(userName))+"&saleDateStratParam="+saleDateStratParam
 			+"&saleDateEndParam="+saleDateEndParam+"&cardNoProfile="+cardNoProfile+"&postCardNo="+encodeURIComponent(encodeURIComponent(postCardNo));
 					 					
 	    });
 	    
 	    $("#sumCalc").click(function() {
 	    	var userName = $("#userNameParam").val();
 	    	var cardNo = $("#cardNoParam").val();
 	    	var saleDateStratParam = $("#saleDateStratParam").val();
 	    	var saleDateEndParam = $("#saleDateEndParam").val();
 	    	var cardNoProfile = $("#cardNoProfileParam").val();
 	    	var postCardNo = $("#postCardNoParam").val();
 	    	
             var result = jQuery.ajax({
 		      	  url:"${ctx}/jsp/plan/planAction!sumCalc.action?userName="+encodeURIComponent(encodeURIComponent(userName))+"&cardNo="+cardNo+"&saleDateStratParam="+saleDateStratParam
 		      	  +"&saleDateEndParam="+saleDateEndParam+"&cardNoProfile="+cardNoProfile+"&postCardNo="+encodeURIComponent(encodeURIComponent(postCardNo)),
 		          async:false,
 		          cache:false,
 		          dataType:"json"
 		      }).responseText;
 			var obj = eval("("+result+")");
 			bootbox.alert(obj.opResult);
 	    });
 	    
 	    $("#mulExecute").click(function() {
 	    	var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.id;
            	});
       	 if(ids == ''|| ids==null){
       		bootbox.alert('请选择要执行的记录');
       		return;
       	 }

     	bootbox.confirm('确认要执行么?',function (result) {  
            if(result) {  
            	doExecute();
            }
     	});
     	
 	    });
 	    
 	   function doExecute(){
 		  var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
              return row.id;
          	});
           var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/plan/planAction!multiExecute.action?multidExecute=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);
			refreshGrid();
       }
 	   
 		        
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
