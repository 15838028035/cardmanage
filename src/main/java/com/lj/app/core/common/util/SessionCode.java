package com.lj.app.core.common.util;

public class SessionCode {
	
	/**
	 * Session 中存放登录名称的Session Code 
	 */
	public final static String LOGIN_NAME = "loginName";
	
	/**
	 * Session 中存放登主帐号的Session Code 
	 */
	public final static String MAIN_ACCT = "mainAcct";

	
	/**
	 * Session 中存放，主帐号ID
	 */
	public final static String MAIN_ACCT_ID = "mainAcctId" ;
	
	
	//----------------- Client Info -----------------------//
	
    /**
     * Session中存放，菜单列表 CODE=perminssionList
     */
    public final static String PERMINSSION_LIST = "perminssionList";
    
	/**
	 * Request 中存放，错误信息
	 */
	public final static String ERROR_MESSAGE = "errorMessage";
	
	/**
     * Request 中存放，警告信息
     */
	public final static String WARN_MESSAGE = "warnMessage";
	
	/**
     * Request 中存放，普通提示信息
     */
	public final static String INFO_MESSAGE = "infoMessage";
	
	/**
     * Request 中存放，普通提示信息
     */
    public final static String SUCCESS_MESSAGE = "successMessage";
	
}
