<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp" %>

function validateSession(data){
	if(data.indexOf('alert\(\'')!=-1){
    	var data2 = data.substring(data.indexOf('alert\(\'') + 'alert\(\''.length);
    	alert(data2.substring(0,data2.indexOf('\')')));
    	doReload();
        return false;
    }else if(data!=""&&data.indexOf("script")!=-1){
       	doReload();
       	return false;
	}
    return true;         
}
function doReload(){
	var windowRoot = window;
    while(windowRoot.parent.location!=windowRoot.location){
    windowRoot = windowRoot.parent;
    }
    windowRoot.location='${ctx}';
}	

function getEnvironmentValue (key){
    var path = GetUserValue("user",key);
    if(path == ""){
        path = GetUserValue("system",key);
    }
    return path ;
}

function GetUserValue(scope,key)
{
    wsh = new ActiveXObject("WScript.Shell");
    return wsh.Environment(scope).Item(key);
}

function setEnvironmentValue(key , value, scope){
    wsh = new ActiveXObject("WScript.Shell");
    if(scope == "undefined" || scope == null || scope == ""){
        wsh.Environment("system").Item(key) = value ;
    }else{
        wsh.Environment(scope).Item(key) = value ;
    }
}

/**
* 
* @param {} beginDate
* @param {} finishDate
* @return {Boolean}
*/
function checkDate(beginDate, finishDate) {
		    
	var d1 = new Date(beginDate.replace("-", "/"));
	
	var d2 = new Date(finishDate.replace("-", "/"));
   
    if (Date.parse(d2) - Date.parse(d1) >= 0) {
    	return true;
    }else {
    	return false;
    }
}


function copyPwd(pwd){
	window.clipboardData.setData("Text",pwd);
	
}

/**
 * 
 */
function   isIP(str){  
  var   ip   =   /^([1-9]|[1-9]\d|1\d{2}|2[0-1]\d|22[0-3])(\.(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){3}$/;  
  return   ip.test(str);  
}	


/**
 * 
 * 
 */
function clearForm(formName) {
	
	
	var formObj = document.forms[formName];
	var formEl = formObj.elements;

	for (var i=0; i<formEl.length; i++){
	
		var element = formEl[i];
		if (element.type == 'submit') { continue; }
		if (element.type == 'reset') { continue; }
		if (element.type == 'button') { continue; }
		if (element.type == 'hidden') { continue; }
		
		
		if (element.type == 'text') { element.value = ''; }
		if (element.type == 'textarea') { element.value = ''; }
		if (element.type == 'checkbox') { element.checked = false; }
		if (element.type == 'radio') { element.checked = false; }
		if (element.type == 'select-multiple') { element.selectedIndex = -1; }
		if (element.type == 'select-one') { element.selectedIndex = -1; }
	
	}

} 

function showMessage(msg,fun){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-info' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
            modal: false,
            dialogClass:'alert',
            height:180,
            width:250,
            bgiframe:true,
            title:dialogTitle,
            buttons: {
                '<s:text name="CommonOk"></s:text>': function() {
    				eval(fun);
                    $(this).dialog('close');
                }
            }
        });
}


function showModalMessage(msg,fun){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-info' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
            modal: true,
            dialogClass:'alert',
            height:180,
            width:250,
            bgiframe:true,
            title:dialogTitle,
            buttons: {
                '<s:text name="CommonOk"></s:text>': function() {
    				eval(fun);
                    $(this).dialog('close');
                }
            }
        });
}
function showModalMessageSmall(msg,fun){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-info' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
            modal: true,
            dialogClass:'alert',
            height:160,
            width:200,
            bgiframe:true,
            title:dialogTitle,
            buttons: {
                '<s:text name="CommonOk"></s:text>': function() {
    				eval(fun);
                    $(this).dialog('close');
                }
            }
        });
}
function showModalMessageNew(msg,wd,he,fun){
    $("<div id='dialog-message'><br><p><span class='ui-icon ui-icon-info' style='float:left; margin:0 7px 50px 0;'></span>"+msg+"</p></div>").dialog({
            modal: true,
            dialogClass:'alert',
            height:he,
            width:wd,
            bgiframe:true,
            title:dialogTitle,
            buttons: {
                '<s:text name="CommonOk"></s:text>': function() {
    				eval(fun);
                    $(this).dialog('close');
                }
            }
        });
}
function showModalConfirmation(msg,fun){
    $("<div id='dialog-confirm'><br><p><span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>"+msg+"</p></div>").dialog({
        modal: true,
        dialogClass:'alert',
        bgiframe:true,
        title:dialogTitle,
        height:180,
        buttons: {
            '<s:text name="CommonCancel"></s:text>': function() {
                $(this).dialog('close');
            },
            '<s:text name="CommonOk"></s:text>': function() {
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
            '<s:text name="CommonCancel"></s:text>': function() {
            	eval(funCancle);
                $(this).dialog('close');
            },
            '<s:text name="CommonOk"></s:text>': function() {
                eval(fun);
                $(this).dialog('close');
            }
        }
    });
}

Date.prototype.Format = function(fmt){ //author: meizz 
    var o = { 
        "M+" : this.getMonth()+1, //月份 
        "d+" : this.getDate(), //日 
        "h+" : this.getHours(), //小时 
        "m+" : this.getMinutes(), //分 
        "s+" : this.getSeconds(), //秒 
        "q+" : Math.floor((this.getMonth()+3)/3), //季度 
        "S" : this.getMilliseconds() //毫秒 
    }; 
    if(/(y+)/.test(fmt)) 
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 

    for(var k in o) 
        if(new RegExp("("+ k +")").test(fmt)) 
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 

    return fmt; 
} 


function sso(path,attribute){
    /*var shell = new ActiveXObject("WScript.Shell");
    if(path == ""){
        
    }
    shell.run( "\"" + path +"\"" +" "+attribute);
    alert(attribute);*/
    var win = window.navigator.platform;
    if(win == "Win64"){
    	OssActiveX4Ax64.LocalExecLoginTwo(path,attribute);
    }else{
    	OssActiveX4Ax86.LocalExecLoginTwo(path,attribute);
    }
}

function remoteApp(path,attribute){
    var win = window.navigator.platform;
    if(win == "Win64"){
    	return OssActiveX4Ax64.LocalRemoteAppLogin(path, attribute,"未安装图形堡垒客户端工具,请到首页-工具下载中下载并安装");
    }else{
    	return OssActiveX4Ax86.LocalRemoteAppLogin(path, attribute,"未安装图形堡垒客户端工具,请到首页-工具下载中下载并安装");
    }
}
function remoteGold(path,attribute){
    var win = window.navigator.platform;
    if(win == "Win64"){
    	return OssActiveX4Ax64.LocalRemoteGoldLogin(path, attribute,"");
    }else{
    	return OssActiveX4Ax86.LocalRemoteGoldLogin(path, attribute,"");
    }
   
}
function ssoProgressBarDialog()
{
	//假如ssoProgressBar层存在
	if($("#ssoProgressBarDialog").length>0)
	{
	     $("#ssoProgressBarDialog").dialog({
	         modal: true,
	         height:150,
	         width:400,
	         title:"<s:text name='rdpClient.title' />",
	         buttons: {
	         }
	     });
	     window.setTimeout(function () {
	      $("#ssoProgressBarDialog").dialog('close');
    	}, 60000);
	}
	else if(parent.$("#ssoProgressBarDialog").length>0)
	{
	     parent.$("#ssoProgressBarDialog").dialog({
	         modal: true,
	         height:150,
	         width:400,
	         title:"<s:text name='rdpClient.title' />",
	         buttons: {
	         }
	     });
	     window.setTimeout(function () {
	      parent.$("#ssoProgressBarDialog").dialog('close');
    	}, 10000);
	}
}
function clearMessage(){
     window.setTimeout(function () {
        $("#authenMessage").text("") ;
        $("#successMessage").text("") ;
        $(".successMessage").text("") ;
        $(".failMessage").text("") ;
        $(".message").text("") ;
        $(".error").text("") ;
        $(".state-message").remove();
        $(".error-message").remove();
    }, 10000);
}
function clearMessageNow(){
	$("#authenMessage").text("") ;
    $("#successMessage").text("") ;
    $(".successMessage").text("") ;
    $(".failMessage").text("") ;
    $(".message").text("") ;
    $(".error").text("") ;
	
}


function formSubmit(formName){
    $("#"+formName).submit();
}
function addToResourceFavorite(resKind,entityId,subacctid){
    showModalConfirmation(addToUsedMsg,"addToUsed('"+resKind+"','"+entityId+"','"+subacctid.value+"')");
}
function addToResourceFavoriteForApp(resKind,entityId,subacctid){
	$.ajax({
	         type: "POST",
	         url: "${ctx}/jsp/setup/resourceFavorite!isAddToResourceFavorite.action",
	         data: "resKind=" +resKind +"&entityId="+ entityId +"&subacctid="+subacctid.value+"&date="+(new Date()).getTime() ,
	         dataType: "text",
	         async : false,
	         success: function(data){
	         	if(data=='exist'){
	         		 showModalConfirmation('<s:text name="offenlogin.cover"/>',"addToUsed('"+resKind+"','"+entityId+"','"+subacctid.value+"')");
	         	}else if(data=='equal'){
	         		  showModalMessage('<s:text name="offenlogin.exsit"/>');
	         		  return false; 
	         	}else{
	                showModalConfirmation('<s:text name="offenlogin.add"></s:text>',"addToUsed('"+resKind+"','"+entityId+"','"+subacctid.value+"')");
	         	}
	        }
	  });
    
}
function addToUsed(resKind,entityId,subacctid){
    $.ajax({
	         type: "POST",
	         url: "${ctx}/jsp/setup/resourceFavorite!addToResourceFavorite.action",
	         data: "resKind=" +resKind +"&entityId="+ entityId +"&subacctid="+subacctid+"&date="+(new Date()).getTime() ,
	         dataType: "text",
	         async : false,
	         success: function(data){
	                showModalMessage(data);
	        }
	  });
}

function getResKindByResName(resType){
    var resKind ;
    if( resType== db){
        resKind = "3" ;
    }else if(resType == host){
        resKind = "2" ;
    }else if(resType == nd){
        resKind = "4" ;
    }else if(resType == sd){
        resKind = "5" ;
    }else if(resType == app){
    	resKind = "1";
    }
    
    return resKind ;
}

function checkStrLength(strTemp){  
  var i,sum;  
  sum=0;  
  for(i=0;i<strTemp.length;i++)  
  {  
   if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))  
    sum=sum+1;  
   else  
    sum=sum+2;  
  }  
  return sum;  
}  

function getResNameByResKind(resType){
    var resName ;
    
    if( resType=="1" ){
        resName = app ;
    }else if( resType== "2"){
        resName = host ;
    }else if(resType == "3"){
        resName = db ;
    }else if(resType == "4"){
        resName = nd ;
    }else if(resType == "5"){
        resName = sd ;
    }
    
    return resName ;
}

/*密码类型框无法使用后退键 document.documentElement.onkeydown = function(evt){
                var b = !!evt, oEvent = evt || window.event;
                if (oEvent.keyCode == 8) {
                var node = b ? oEvent.target : oEvent.srcElement;
                var reg = /^(input|textarea)$/i, regType = /^(text|textarea)$/i;
                if (!reg.test(node.nodeName) || !regType.test(node.type) || node.readOnly || node.disabled) {
                if (b)
                {
                  oEvent.stopPropagation();
                } 
                else 
                {
                    oEvent.cancelBubble = true;
                    oEvent.keyCode = 0;
                    oEvent.returnValue = false;
                }
            }
        }
    }*/

function readonlyAll(){
        for(i=0;i<document.forms.length;i++){
                for(j=0;j<document.forms[i].elements.length;++j){
                        if(document.forms[i].elements[j].disabled==false){
                                if(document.forms[i].elements[j].type=="text"){
                                        document.forms[i].elements[j].readOnly=true;
                                        document.forms[i].elements[j].style.color = "#A8A8A8";
                                }
	                        if(document.forms[i].elements[j].type=="textarea"){
	                                document.forms[i].elements[j].readOnly=true;
	                                document.forms[i].elements[j].style.color = "#A8A8A8";
	                        }
                                if(document.forms[i].elements[j].type=="radio"){
                                        document.forms[i].elements[j].disabled=true;
                                        document.forms[i].elements[j].style.color = "#A8A8A8";
                                }
                                if(document.forms[i].elements[j].type=="checkbox"){
                                        document.forms[i].elements[j].disabled=true;
                                        document.forms[i].elements[j].style.color = "#A8A8A8";
                                }
                                if(document.forms[i].elements[j].type=="select-one"){
                                        document.forms[i].elements[j].disabled=true;
                                        document.forms[i].elements[j].style.color = "#A8A8A8";
                                }
                                if(document.forms[i].elements[j].type=="file"){
                                        document.forms[i].elements[j].disabled=true;
                                        document.forms[i].elements[j].style.color = "#A8A8A8";
                                }
                                //if(document.forms[i].elements[j].type=="button"){
                                       // if(document.forms[i].elements[j].name.toLowerCase().indexOf("readonly")==-1){
                                               // document.forms[i].elements[j].style.display="none";
                                       // }
                                //}
                        }
                }
        }
}
