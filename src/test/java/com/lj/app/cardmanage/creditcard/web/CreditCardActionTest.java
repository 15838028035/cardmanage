package com.lj.app.cardmanage.creditcard.web;


import org.apache.struts2.StrutsSpringTestCase;
import org.junit.Ignore;
import org.junit.Test;

import com.opensymphony.xwork2.ActionProxy;

public class CreditCardActionTest extends StrutsSpringTestCase{  
	  private static final String DEFAULT_CONTEXT_LOCATION = "classpath*:spring-base.xml";
//	 private CreditCardAction creditCardAction;  
	 private ActionProxy proxy;  
	 
	 @Override
		protected String[] getContextLocations() {
		  return new String[] {DEFAULT_CONTEXT_LOCATION};
	}
	 
	
	 @Test
	 @Ignore
	public void testLogin() {
		ActionProxy proxy = null;
		request.setParameter("param", "test...");
		 proxy=getActionProxy("/jsp/creditCard/creditCardAction!list.action");  
//		creditCardAction = (CreditCardAction)proxy.getAction();

		try {
//			  creditCardAction.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
