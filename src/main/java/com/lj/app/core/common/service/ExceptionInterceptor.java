package com.lj.app.core.common.service;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.log4j.Logger;

public class ExceptionInterceptor implements MethodInterceptor{
	
	private static Logger logger = Logger.getLogger(ExceptionInterceptor.class);
	
	public Object invoke(MethodInvocation object) throws Throwable {
		try{
    		Object obj=object.proceed();
    		return obj;
    	}catch(Throwable ex){
    		logger.error(ex.getMessage(), ex);
    		throw ex;
    	}
	}
		

}
