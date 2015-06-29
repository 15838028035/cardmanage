<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<s:set name="tpPk" value="#parameters.tpPk[0]"/>
<s:set name="stepId" value="#parameters.stepId[0]"/>
<s:set name="method" value="#parameters.method[0]"/>
<s:set name="wfRoleId" value="#parameters.wfRoleId[0]"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  </head>
  
  <body>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
            <td width="20%" valign="top">
                <iframe id="LT_menu" src="${ctx}/jsp/common/mainacctselect/organization.jsp?action=other&style=false"  scrolling="no" width="100%" height="410" frameborder="0" allowTransparency="true" ></iframe>
            </td>
            <td width="70%" valign="top">
               <iframe id="LT_main" src="${ctx}/jsp/common/mainacctselect/mainacct.jsp?multiselect=true&editBar=false&gridwidth=630&lockstatus=false&pwdtype=false&lastupdatetime=false&tpPk=${tpPk}&stepId=${stepId}&method=${method}&wfRoleId=${wfRoleId}" scrolling="auto" width="100%" height="400" frameborder="0" allowTransparency="true" style="overflow-x:hidden;"></iframe>
            </td>
    </tr>
    </table>

  </body>
</html>
