package com.lj.app.core.common.util;



/**  
 *<p>定义了Session中存放数据的key值</p>
 * @author WangHaiming wanghm2@asiainfo.com  
 * @date 2010-7-14 
 * @version V1.0  
 *
 */

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
     * Session 中存放登主帐号附加属性的Session Code 
     */
    public final static String MAIN_ACCT_EXT = "mainAcctExt";
	
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
	 * Session 中存放，ip地址，逗号分隔，4A侧专用(审计+内部访问使用)
	 */
	public final static String CLIENT_INFO_IP_ADDRESS = "ipAddress";
	
	/**
	 * Session 中存放，ip地址列表
	 */
	public final static String CLIENT_INFO_IP_ADDRESS_LIST = "ipAddressList";	
	
	/**
	 * Session 中存放，Mac地址
	 */
	public final static String CLIENT_INFO_MAC_ADDRESS = "macAddress";
	
	/**
	 * Session 中存放，Mac地址列表
	 */
	public final static String CLIENT_INFO_MAC_ADDRESS_LIST = "macAddressList";	
	
	/**
	 * Session中存放，cpu序列号
	 */
	public final static String CLIENT_INFO_CPU_SERIAL = "cpuSerial";
	
	/**
	 * Session中存放，服务器ip地址
	 */
	public final static String SERVER_INFO_IP_ADDRESS = "serverIp";
	

	/**
	 * Session中存放，服务器端口
	 */
	public final static String SERVER_INFO_PORT = "serverPort";
	
	
	/**
     * Session中存放，计算机名称
     */
	public final static String CLIENT_INFO_HOST_NAME = "hostName";
	
	/**
	 * Session中存放，登录到当前计算机的用户名称
	 */
	public final static String CLIENT_INFO_HOST_ACCOUNT = "hostAccount";

	
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
	
	   /**
     * Session中存放，最新公告条数
     */
    public final static String NEW_BULLETIN_COUNT = "newBulletinCount";
    
    /**
     * Session中存放，未读消息条数
     */
    public final static String UNREAD_NOTICE_COUNT = "unreadNoticeCount";
    
    /**
     * Session中存放，待办工单条数
     */
    public final static String UNFINISH_WORK_SHEET_COUNT = "unfinishWorkSheetCount";
    
    
    /**
     * Session中存放，快捷方式菜单列表
     */
    public final static String SHORT_CUT_MENU_LIST = "shortcutMenuList"; 
    
    /**
     * Session中存放，堡垒状态列表 CODE=graphFortState
     */
    public final static String GRAPH_FORT_STATE = "graphFortState";
    
    /**
	 * Session 当前session是否是金库审批页面
	 */
	public final static String IS_GOLD_BANK = "isGoldBank";    
	
}
