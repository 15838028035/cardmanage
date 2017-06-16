package com.lj.app.core.common.web;

import java.util.HashMap;
import java.util.Map;

import com.lj.app.cardmanage.base.service.BaseService;
import com.lj.app.cardmanage.user.model.User;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.SessionCode;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * Struts2中典型CRUD Action的抽象基类.
 * 
 * 主要定义了对Preparable,ModelDriven接口的使用,以及CRUD函数和返回值的命名.
 *
 * @param <T> CRUDAction所管理的对象类型.
 * 
 */
@SuppressWarnings("serial")
public abstract class AbstractBaseAction<T> extends ActionSupport implements ModelDriven<T>, Preparable {

	/** 进行增删改操作后,以redirect方式重新打开action默认页的result名.*/
	public static final String RELOAD = "reload";
	
	public static final String REDIRECT = "redirect";
	
	public static final String INPUT = "input";
	public static final String EDIT = "edit";
	public static final String SAVE = "save";
	public static final String LIST = "list";
	
	
	protected Page<T> page = new Page<T>(PAGESIZE);
	
	public static int PAGESIZE = 20;
	
	public static final String CREATE_SUCCESS = "保存成功";
	public static final String UPDATE_SUCCESS = "修改成功";
	public static final String DELETE_SUCCESS = "删除成功";
	
	public static final String CREATE_FAILURE = "保存失败";
	public static final String UPDATE_FAILURE = "修改失败";
	public static final String DELETE_FAILURE = "删除失败";
	
	
	public static final String CREATE_BY = "createBy";
	
	protected  String returnMessage = "";
	
	protected String multidelete;
	
	protected String multidExecute;
	
	private String sidx;
	private String sord;
	
	private String sortName;
	private String sortOrder;
	
	public String getMultidExecute() {
		return multidExecute;
	}

	public void setMultidExecute(String multidExecute) {
		this.multidExecute = multidExecute;
	}

	public  String operate;//操作
	
	public String getReturnMessage() {
		return returnMessage;
	}

	public void setReturnMessage(String returnMessage) {
		this.returnMessage = returnMessage;
	}

	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	
	public Page<T> getPage() {
		return page;
	}

	public void setPage(Page<T> page) {
		this.page = page;
	}

	public String getMultidelete() {
		return multidelete;
	}

	public void setMultidelete(String multidelete) {
		this.multidelete = multidelete;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	
	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public int getLoginUserId() {
		User user = (User)Struts2Utils.getSessionAttribute(SessionCode.MAIN_ACCT);
		return user.getUserId();
	}
	
	public String getLoginUserName() {
		User user = (User)Struts2Utils.getSessionAttribute(SessionCode.MAIN_ACCT);
		return user.getUserName();
	}
	
	/**
	 * Action函数, 默认的action函数, 默认调用list()函数.
	 */
	@Override
	public String execute() throws Exception {
		return list();
	}

	//-- CRUD Action函数 --//
	/**
	 * Action函数,显示Entity列表界面.
	 * 建议return SUCCESS.
	 */
	public abstract String list() throws Exception;

	/**
	 * Action函数,显示新增或修改Entity界面.
	 * 建议return INPUT.
	 */
	@Override
	public abstract String input() throws Exception;

	/**
	 * Action函数,新增或修改Entity. 
	 * 建议return RELOAD.
	 */
	public abstract String save() throws Exception;

	/**
	 * Action函数,删除Entity.
	 * 建议return RELOAD.
	 */
	public abstract String delete() throws Exception;

	//-- Preparable函数 --//
	/**
	 * 实现空的prepare()函数,屏蔽所有Action函数公共的二次绑定.
	 */
	@Override
	public void prepare() throws Exception {
	}

	/**
	 * 在input()前执行二次绑定.
	 */
	public void prepareInput() throws Exception {
		prepareModel();
	}

	/**
	 * 在save()前执行二次绑定.
	 */
	public void prepareSave() throws Exception {
		prepareModel();
	}

	/**
	 * 等同于prepare()的内部函数,供prepardMethodName()函数调用. 
	 */
	protected abstract void prepareModel() throws Exception;
	
	
	/**
	 * getBaseService();
	 */
	protected abstract BaseService getBaseService()  ;
	
	/**
	 * 公共bootStrapList查询方法
	 * @return
	 * @throws Exception
	 */
	public String bootStrapList() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			page.setFilters(getModel());
			
			if (this.getSortName()!=null) {
				String orderBy =this.getSortName() + " "+ this.getSortOrder();
				page.setSortColumns(orderBy);
			}
			
			page = getBaseService().findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
}
}
