<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

/**
*msg 提示信息;点击确认后关闭弹出框 
*/
function showModalMessage(msg,fun){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-circle-check' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
    	modal: true,
    	dialogClass:'alert',
    	height:230,
    	width:250,
    	bgiframe:true,
    	position:"center",
    	title:'<s:text name="common.tips.info"/>',
    	buttons: {
    		'<s:text name="common.options.ok"/>': function() {
    		$(this).dialog('close');
    			eval(fun);
			}
		}
	});
}

function showModalMessageNew(msg,fun){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-circle-check' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
    	modal: true,
    	dialogClass:'alert',
    	height:230,
    	width:250,
    	bgiframe:true,
    	position:"center",
    	title:'<s:text name="common.tips.info"/>',
    	buttons: {
    		'<s:text name="common.options.ok"/>': function() {
    		$(this).dialog('close');
    		 location.reload() ;
    			eval(fun);
			}
		}
	});
}

function showModalMessageWH(msg,width,height){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-circle-check' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
    	modal: true,
    	dialogClass:'alert',
    	height:height,
    	width:width,
    	bgiframe:true,
    	position:"center",
    	title:'<s:text name="common.tips.info"/>',
    	buttons: {
    		'<s:text name="common.options.ok"/>': function() {
    		$(this).dialog('close');
			}
		}
	});
}

function showModalMessageWHNoMargin(msg,width,height){
    $("<div id='dialog-message'><br><p><span style='float:left; margin:0 0px 0px 0;'></span>"+msg+"</p></div>").dialog({
    	modal: true,
    	dialogClass:'alert',
    	height:height,
    	width:width,
    	bgiframe:true,
    	position:"center",
    	title:'<s:text name="common.tips.info"/>',
    	buttons: {
    		'<s:text name="common.options.ok"/>': function() {
    		$(this).dialog('close');
			}
		}
	});
}

function showModalMessageWHNoMargin(msg,width,height,fun){
    $("<div id='dialog-message'><br><p><span style='float:left; margin:0 0px 0px 0;'></span>"+msg+"</p></div>").dialog({
    	modal: true,
    	dialogClass:'alert',
    	height:height,
    	width:width,
    	bgiframe:true,
    	position:"center",
    	title:'<s:text name="common.tips.info"/>',
    	buttons: {
    		'<s:text name="common.options.ok"/>': function() {
    			eval(fun);
    			$(this).dialog('close');
			}
		}
	});
}
/**
*msg 确认信息;点击确认后调用方法名称 
*/
function showModalConfirmation(msg,fun){
    $("<div id='dialog-confirm'><br><p><span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>"+msg+"</p></div>").dialog({
        modal: true,
        dialogClass:'alert',
        bgiframe:true,
        position:"center",
        title:'<s:text name="common.tips.info"/>',
        height:180,
        buttons: {
            '<s:text name="common.options.cancel"/>': function() {
                $(this).dialog('close');
            },
            '<s:text name="common.options.ok"/>': function() {
                eval(fun);
                $(this).dialog('close');
            }
        }
    });
}

/**
*msg 确认信息;点击确认后调用方法名称fun,点击取消后调用方法funCancle
*/
function showModalConfirmationCancle(msg,fun,funCancle){
    $("<div id='dialog-confirm'><br><p><span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>"+msg+"</p></div>").dialog({
        modal: true,
        dialogClass:'alert',
        bgiframe:true,
        position:"center",
        title:'<s:text name="common.tips.info"/>',
        height:180,
        buttons: {
            '<s:text name="common.options.cancel"/>': function() {
            	eval(funCancle);
                $(this).dialog('close');
            },
            '<s:text name="common.options.ok"/>': function() {
                eval(fun);
                $(this).dialog('close');
            }
        }
    });
}

/**
*msg 提示信息;点击确认后关闭弹出框 
*/
function showModalMessageWithSize(msg,width,height,fun){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-circle-check' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
    	modal: true,
    	dialogClass:'alert',
    	height:height,
    	width:width,
    	bgiframe:true,
    	position:"center",
    	title:'<s:text name="common.tips.info"/>',
    	buttons: {
    		'<s:text name="common.options.ok"/>': function() {
    		$(this).dialog('close');
    			eval(fun);
			}
		}
	});
}
/**
*msg 确认信息;点击确认后调用方法名称 
*/
function showModalConfirmationWH(title,msg,width,height,fun){
    $("<div id='dialog-confirm'><br><p>"+msg+"</p><p style='size:20px;color:red;'>"+title+"</p></div>").dialog({
        modal: true,
        dialogClass:'alert',
        bgiframe:true,
        position:"center",
        title:'<s:text name="common.tips.info"/>',
        height:height,
        width:width,
        buttons: {
            '<s:text name="common.options.cancel"/>': function() {
                $(this).dialog('close');
            },
            '<s:text name="common.options.ok"/>': function() {
                eval(fun);
                $(this).dialog('close');
            }
        }
    });
}