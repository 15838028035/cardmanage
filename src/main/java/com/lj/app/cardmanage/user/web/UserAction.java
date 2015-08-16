package com.lj.app.cardmanage.user.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.user.model.User;
import com.lj.app.cardmanage.user.service.UserService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.des.DesUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/user")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/user/user-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "userAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/user/userList.jsp", type=AbstractBaseAction.REDIRECT)
})
@SuppressWarnings("unchecked")

@Action("userAction")
public class UserAction  extends AbstractBaseAction<User> {
	
	private int userId=-1;
	private String loginNo;
	private String pwd;
	private String userName;
	private String cardNo;
	private String address;
	private String mobile;
	
	private String lockStatus;
	private String enableFlag;
	
	@Autowired
	private UserService userService;
	
	private User user;
	
	
	@Override
	public User getModel() {
		user = (User)userService.getInfoByKey(userId);
		return user;
	}

	@Override
	public String list() throws Exception {
		try {
			Map condition = new HashMap();
			condition.put("userName", userName);
			condition.put("cardNo", cardNo);
			condition.put("address", address);
			condition.put("mobile", mobile);
			condition.put(CREATE_BY, getLoginUserId());
			this.userService.findPageList(page, condition);
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
	boolean isSave = true;//是否保存操作
		
	try{
			if (operate != null && operate.equals("edit")) {
				isSave = false;
				User user = new User();
				user.setUserId(userId);
				user.setLoginNo(loginNo);
				user.setPwd(DesUtil.encrypt(pwd));
				user.setUserName(userName);
				user.setCardNo(cardNo);
				user.setAddress(address);
				user.setMobile(mobile);
				
				
				user.setUpdateBy(getLoginUserId());
				user.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				userService.updateObject(user);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				User user = new User();
				user.setUserId(userId);
				user.setLoginNo(loginNo);
				user.setPwd(DesUtil.encrypt(pwd));
				user.setUserName(userName);
				user.setCardNo(cardNo);
				user.setAddress(address);
				user.setMobile(mobile);
				
				user.setCreateBy(getLoginUserId());
				user.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				userService.insertObject(user);
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
				userService.delete(deleteId);
			}catch(Exception e){
				returnMessage = "删除失败";
				e.printStackTrace();
				throw e;
			}finally{
			}
		}
		AjaxResult ar = new AjaxResult();
		if (returnMessage.equals("")) {
			ar.setOpResult("删除成功");//删除成功！
		}else{
			ar.setOpResult(returnMessage);
		}
		
		Struts2Utils.renderJson(ar);
		return null;
	}


	@Override
	protected void prepareModel() throws Exception {
		user = (User)userService.getInfoByKey(userId);
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getLoginNo() {
		return loginNo;
	}

	public void setLoginNo(String loginNo) {
		this.loginNo = loginNo;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getLockStatus() {
		return lockStatus;
	}

	public void setLockStatus(String lockStatus) {
		this.lockStatus = lockStatus;
	}

	public String getEnableFlag() {
		return enableFlag;
	}

	public void setEnableFlag(String enableFlag) {
		this.enableFlag = enableFlag;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
