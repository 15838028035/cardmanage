<%@ page contentType="text/html;charset=UTF-8" %>
<c:if test="${successMessage != null }">
<DIV class="state-message ui-state-highlight" style="PADDING-RIGHT: 0.7em;PADDING-BOTTOM: 5px; PADDING-TOP: 5px;background-color: #fbf9ee;border:1px solid #fcefa1;vertical-align: middle;">
	<P><SPAN class="ui-icon ui-icon-info" style="FLOAT: left; MARGIN-RIGHT: 0.3em"></SPAN>
		<STRONG><s:text name="common.infoMessage"/></STRONG> 
		${successMessage }
	</P>
</DIV>
</c:if>
<c:if test="${infoMessage != null }">
<DIV class="state-message ui-state-highlight" style="PADDING-RIGHT: 0.7em;PADDING-BOTTOM: 5px; PADDING-TOP: 5px;background-color: #fbf9ee;border:1px solid #fcefa1;vertical-align: middle;">
	<P><SPAN class="ui-icon ui-icon-info" style="FLOAT: left; MARGIN-RIGHT: 0.3em"></SPAN>
		<STRONG><s:text name="common.infoMessage"/></STRONG> 
		${infoMessage }
	</P>
</DIV>
</c:if>
<c:if test="${errorMessage != null }">
<DIV class="error-message ui-state-error" style="PADDING-RIGHT: 0.7em;  PADDING-BOTTOM: 5px; PADDING-TOP: 5px;vertical-align: middle;">
	<P><SPAN class="ui-icon ui-icon-alert" style="FLOAT: left; MARGIN-RIGHT: 0.3em"></SPAN>
		<STRONG><s:text name="common.errorMessage"/></STRONG> 
		${errorMessage }
	</P>
</DIV>
</c:if>
