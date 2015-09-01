package com.lj.app.core.common.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.cardmanage.user.model.User;
import com.lj.app.core.common.security.CMSecurityContext;
import com.lj.app.core.common.security.SecurityConstants;
import com.lj.app.core.common.web.Struts2Utils;

public class SessionUtil {
	private static Log logger = LogFactory.getLog(SessionUtil.class);
	
	public static User getUser() {
		User user = (User) Struts2Utils.getSession().getAttribute(SessionCode.MAIN_ACCT);
		return user;
	}

	public static void setuser(User user) {
		Struts2Utils.getSession().setAttribute(SessionCode.MAIN_ACCT, user);
	}

	public static long getMainAcctId() {
		CMSecurityContext securityContext = (CMSecurityContext) Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT);
		if (securityContext == null) {
			User user = getUser();
			return user == null ? null : user.getUserId();
		}
		return securityContext.getMainAcctId();
	}

	public static String getUserName() {
		User mainAcct = getUser();
		return mainAcct == null ? null : mainAcct.getUserName();
	}

	public static Object getSessionAttribute(String key) {
		return Struts2Utils.getSession().getAttribute(key);
	}

	public static Map getSessionMap() {
		CMSecurityContext securityContext = (CMSecurityContext) Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT);
		String loginName = securityContext.getLoginName();
		Map sessionMap = new HashMap<String, String>();
		sessionMap.put(SessionCode.LOGIN_NAME, loginName);
		return sessionMap;
	}
}
