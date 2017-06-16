package com.lj.app.cardmanage.bulletin.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.base.service.BaseService;
import com.lj.app.cardmanage.bulletin.model.Bulletin;
import com.lj.app.cardmanage.bulletin.service.BulletinService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.ValidateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :BulletinAction.java
 * @description :BulletinAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("unchecked")
@Controller
@Namespace("/jsp/bulletin")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "bulletinAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/bulletin/bulletin-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "bulletinAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/bulletin/bulletinList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("bulletinAction")
public class BulletinAction extends AbstractBaseAction<Bulletin> {
	
	 protected Logger logger = LoggerFactory.getLogger(BulletinAction.class);
	 
	/**
	 * 
	 */
	private Integer bulletinId;
	
	/**
	 * 类别名称
	 */
	private String typeName;
	
	/**
	 * 等级名称
	 */
	private String levelName;
	
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 目标类别名称
	 */
	private String targetTypeName;
	
	/**
	 * 目标名称
	 */
	private String targetName;
	
	/**
	 * 是否内部名称
	 */
	private String isNestedName;
	
	/**
	 * 账号ID
	 */
	private Integer userId;
	
	/**
	 * 状态
	 */
	private String state;
	
	/**
	 * 生效日期
	 */
	private java.util.Date effDate;
	
	/**
	 * 有效期
	 */
	private java.util.Date expDate;
	
	/**
	 * 建创日期
	 */
	private java.util.Date createTime;
	
	/**
	 * 操作者
	 */
	private String operator;
	
	/**
	 * 操作日期
	 */
	private java.util.Date optDate;
	
	
	/**
	*排序列
	*/
	private String sidx;
	
	/**
	*排序方式
	*/
	private String sord;
	
	/**
	*排序列
	*/
	private String sortColumns;

	@Autowired
	private BulletinService bulletinService;
	
	private Bulletin bulletin;
	
	public   BaseService getBaseService(){
		return bulletinService;
	}
	
	@Override
	public Bulletin getModel() {
		return bulletin;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (bulletinId != null) {
			bulletin = (Bulletin)bulletinService.getInfoByKey(bulletinId);
		} else {
			bulletin = new Bulletin();
		}
		
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			if (ValidateUtil.isNotEmpty(this.getSidx())) {
				String orderBy = this.getSidx() + " "+ this.getSord();
				sortColumns= orderBy;
				page.setSortColumns(sortColumns);
			}
			
			condition.put("bulletinId",  bulletinId);
			condition.put("typeName",  typeName);
			condition.put("levelName",  levelName);
			condition.put("title",  title);
			condition.put("targetTypeName",  targetTypeName);
			condition.put("targetName",  targetName);
			condition.put("isNestedName",  isNestedName);
			condition.put("userId",  userId);
			condition.put("state",  state);
			condition.put("effDate",  effDate);
			condition.put("effDateBegin",  Struts2Utils.getParameter("effDateBegin"));
			condition.put("effDateEnd",  Struts2Utils.getParameter("effDateEnd"));
			condition.put("expDate",  expDate);
			condition.put("expDateBegin",  Struts2Utils.getParameter("expDateBegin"));
			condition.put("expDateEnd",  Struts2Utils.getParameter("expDateEnd"));
			condition.put("createTime",  createTime);
			condition.put("createTimeBegin",  Struts2Utils.getParameter("createTimeBegin"));
			condition.put("createTimeEnd",  Struts2Utils.getParameter("createTimeEnd"));
			condition.put("operator",  operator);
			condition.put("optDate",  optDate);
			condition.put("optDateBegin",  Struts2Utils.getParameter("optDateBegin"));
			condition.put("optDateEnd",  Struts2Utils.getParameter("optDateEnd"));
			condition.put(CREATE_BY, getLoginUserId());
			
			bulletinService.findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public String input() throws Exception {
		return INPUT;
	}
	
	@Override
	public String save() throws Exception {
		
	try{
			if (operate != null && operate.equals("edit")) {
				bulletin.setBulletinId(bulletinId);
				bulletin.setTypeName(typeName);
				bulletin.setLevelName(levelName);
				bulletin.setTitle(title);
				bulletin.setTargetTypeName(targetTypeName);
				bulletin.setTargetName(targetName);
				bulletin.setIsNestedName(isNestedName);
				bulletin.setUserId(this.getLoginUserId());
				bulletin.setState(state);
				bulletin.setEffDate(effDate);
				bulletin.setExpDate(expDate);
				//bulletin.setCreateTime(createTime);
				bulletin.setOperator(getLoginUserName());
				bulletin.setOptDate(new Date());
				bulletin.setUpdateBy(getLoginUserId());
				bulletin.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				bulletinService.updateObject(bulletin);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				bulletin = new Bulletin();
				bulletin.setBulletinId(bulletinId);
				bulletin.setTypeName(typeName);
				bulletin.setLevelName(levelName);
				bulletin.setTitle(title);
				bulletin.setTargetTypeName(targetTypeName);
				bulletin.setTargetName(targetName);
				bulletin.setIsNestedName(isNestedName);
				bulletin.setUserId(this.getLoginUserId());
				bulletin.setState(state);
				bulletin.setEffDate(effDate);
				bulletin.setExpDate(expDate);
				bulletin.setCreateTime(new Date());
				bulletin.setOperator(getLoginUserName());
				bulletin.setOptDate(new Date());
				bulletin.setUpdateBy(getLoginUserId());
				
				bulletin.setCreateBy(getLoginUserId());
				bulletin.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				bulletinService.insertObject(bulletin);
				returnMessage = CREATE_SUCCESS;
			}
			
			return LIST;
		}catch(Exception e){
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}finally{
		}
		
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	public String multidelete() throws Exception {
		String operateResult = null;//操作结果：1失败，0成功
		
		String returnMessage = "";
		String[] multideleteTemp;
		if (multidelete.indexOf(",") > 0) {
			multideleteTemp = multidelete.split(",");
		}
		else{
			multideleteTemp = new String[]{multidelete};
		}
		for (int i = 0; i < multideleteTemp.length; i++) {
			int deleteId = Integer.parseInt(multideleteTemp[i].trim());
			
			try{
				// 循环删除
				bulletinService.delete(deleteId);
			}catch(Exception e){
				e.printStackTrace();
				throw e;
			}finally{
			}
		}
		AjaxResult ar = new AjaxResult();
		if (returnMessage.equals("")) {
			ar.setOpResult(DELETE_SUCCESS);//删除成功！
		}else{
			ar.setOpResult(DELETE_FAILURE);
		}
		
		Struts2Utils.renderJson(ar);
		return null;
	}
	
	public void setBulletinId(Integer value) {
		this.bulletinId = value;
	}
	
	public Integer getBulletinId() {
		return this.bulletinId;
	}
	public void setTypeName(String value) {
		this.typeName = value;
	}
	
	public String getTypeName() {
		return this.typeName;
	}
	public void setLevelName(String value) {
		this.levelName = value;
	}
	
	public String getLevelName() {
		return this.levelName;
	}
	public void setTitle(String value) {
		this.title = value;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setTargetTypeName(String value) {
		this.targetTypeName = value;
	}
	
	public String getTargetTypeName() {
		return this.targetTypeName;
	}
	public void setTargetName(String value) {
		this.targetName = value;
	}
	
	public String getTargetName() {
		return this.targetName;
	}
	public void setIsNestedName(String value) {
		this.isNestedName = value;
	}
	
	public String getIsNestedName() {
		return this.isNestedName;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setState(String value) {
		this.state = value;
	}
	
	public String getState() {
		return this.state;
	}
	public void setEffDate(java.util.Date value) {
		this.effDate = value;
	}
	
	public java.util.Date getEffDate() {
		return this.effDate;
	}
	public void setExpDate(java.util.Date value) {
		this.expDate = value;
	}
	
	public java.util.Date getExpDate() {
		return this.expDate;
	}
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	public void setOperator(String value) {
		this.operator = value;
	}
	
	public String getOperator() {
		return this.operator;
	}
	public void setOptDate(java.util.Date value) {
		this.optDate = value;
	}
	
	public java.util.Date getOptDate() {
		return this.optDate;
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
	
	public String getSortColumns() {
		return sortColumns;
	}

	public void setSortColumns(String sortColumns) {
		this.sortColumns = sortColumns;
	}


}

