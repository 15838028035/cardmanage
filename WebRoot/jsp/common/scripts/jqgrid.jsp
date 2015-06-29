<%@ page contentType="text/html;charset=UTF-8"%>
<script src="${ctx}/scripts/jquery/jqgrid/i18n/grid.locale-cn.js" type="text/javascript"></script>
<script src="${ctx}/scripts/jquery/jqgrid/jquery.jqGrid.min.js" type="text/javascript"></script>
<link href="${ctx}/scripts/jquery/jqgrid/ui.jqgrid.css" type="text/css" rel="stylesheet"/>


<script>
    //获取grid当前选中的唯一一行  (js 对象), 报错返回-1
	function getGridSingleSelectedRow(gridListName){
	   var rows = $("#"+gridListName).jqGrid('getGridParam','selarrrow')+""; 
	   var arr = rows.split(",");

       if(arr == ""){
          showModalMessage('<s:text name="onlySelectOne"/>');
          return -1;
       }
       
       if(arr.length>1){
          showModalMessage('<s:text name="onlySelectOne"/>');
          return -1;
       }
  	   return arr;
	}

    //获取grid当前选中的行的某列单元值 (js 对象)
	function getGridCellValue(gridList,row,cellNum){
  	   return $("#"+gridList).jqGrid('getCell',row,cellNum);
	}

    //获取grid当前选中的(多)行   , 报错返回-1
	function getGridSelectedRows(gridListName){
	   var rows = $("#"+gridListName).jqGrid('getGridParam','selarrrow')+""; 
	   var arr = rows.split(",");

       if(arr == ""){
          showModalMessage('<s:text name="onlySelectOne"/>');
          return -1;
       }
  	   return arr;
	}
</script>