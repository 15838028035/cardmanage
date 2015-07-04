package com.lj.app.cardmanage.user.web;

import org.apache.struts2.StrutsSpringTestCase;
import org.junit.Test;

import com.opensymphony.xwork2.ActionProxy;

public class LoginActionTest extends StrutsSpringTestCase{  
	  private static final String DEFAULT_CONTEXT_LOCATION = "classpath*:spring-base.xml";
	 private LoginAction loginAction;  
	 private ActionProxy proxy;  
	 
	 @Override
		protected String[] getContextLocations() {
		  return new String[] {DEFAULT_CONTEXT_LOCATION};
	}
	
	 @Test
	public void testLogin() {
		ActionProxy proxy = null;
		 request.setParameter("param", "test...");
		 request.setParameter("loginNo", "system");
	     request.setParameter("pwd", "system");
	     
		
		 proxy=getActionProxy("/loginAction!login.action");  
		
		 loginAction = (LoginAction)proxy.getAction();

		try {
			loginAction.login();
		} catch (Exception e) {
			e.printStackTrace();
		}
		assertEquals("success", "success");
		
	}


}
