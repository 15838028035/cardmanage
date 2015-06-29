package com.lj.app.cardmanage.user.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.creditcard.model.CreditCard;
import com.lj.app.cardmanage.user.model.User;
import com.lj.app.cardmanage.user.service.UserService;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/user")
@Results({
		@Result(name = AbstractBaseAction.EDIT, location = "user-edit.jsp"),
		@Result(name = AbstractBaseAction.INPUT, location = "userAction!edit.action",type = "redirect"),
		@Result(name = "appAcctExportType", location = "AppAcctExportType.jsp")

})
@SuppressWarnings("unchecked")

@Action("userAction")
public class UserAction  extends AbstractBaseAction<User> {
	
	private int userId;
	private String loginNo;
	private String pwd;
	private String userName;
	private String cardNo;
	private String address;
	private String mobile;
	
	private String lockStatus;
	private String enableFlag;

	/**
	 * 多选删除
	 */
	private String multidelete;
	

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
		return null;
	}

	@Override
	public String input() throws Exception {
		return null;
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
				user.setPwd(pwd);
				user.setUserName(userName);
				user.setCardNo(cardNo);
				user.setAddress(address);
				user.setMobile(mobile);
				
				userService.updateObject(user);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				User user = new User();
				user.setUserId(userId);
				user.setLoginNo(loginNo);
				user.setPwd(pwd);
				user.setUserName(userName);
				user.setCardNo(cardNo);
				user.setAddress(address);
				user.setMobile(mobile);
				
				userService.insertObject(user);
				returnMessage = CREATE_SUCCESS;
			}
			
			return INPUT;
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
			long deleteId = Long.parseLong(multideleteTemp[i].trim());
			
			try{
				// 循环删除
				userService.delete("delete");
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
