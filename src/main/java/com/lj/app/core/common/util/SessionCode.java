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
	 * Session中存放，强认证策略方式列表
	 */
	public final static String AUTHEN_RULE_MODE_LIST = "authenRuleModeList";
	
	/**
	 * Session中存放，是否已经通过强认证,Session中如果存放的值是主帐号ID，则表示验证通过，
	 * 其他值或者空值均为错误
	 */
	public final static String AUTHEN_SUCCESS = "authenSuccess";
	
	/**
	 * Session 中存放，输错的密码次数
	 */
	public final static String PASSWORD_CHECK_COUNT = "passwordCheckCount";	
	
	/**
	 * Session 中存放，主帐号ID
	 */
	public final static String MAIN_ACCT_ID = "mainAcctId" ;
	
	
	//----------------- Client Info -----------------------//
	/**
	 * Session 中存放，真实请求服务ip地址
	 */
	public final static String CLIENT_INFO_REQUEST_ADDRESS = "requestAddress";	
	
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
