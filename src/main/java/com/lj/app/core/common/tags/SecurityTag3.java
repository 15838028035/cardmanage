package com.lj.app.core.common.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;


public class SecurityTag3 extends TagSupport {

	private String permissionId;

	public void setPermissionId(String permissionId) {
		this.permissionId = permissionId;
	}

	private String required;

	public void setRequired(String required) {
		this.required = required;
	}

	@Override
	public int doStartTag() throws JspException {
		return SKIP_BODY;

	}

}
