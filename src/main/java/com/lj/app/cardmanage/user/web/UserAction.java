package com.lj.app.cardmanage.user.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.user.model.User;
import com.lj.app.cardmanage.user.service.UserService;
import com.lj.app.core.common.web.AbstractBaseAction;

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
		User user = new User();
		user.setUserId(userId);
		user.setLoginNo(loginNo);
		user.setPwd(pwd);
		user.setUserName(userName);
		user.setCardNo(cardNo);
		user.setAddress(address);
		user.setMobile(mobile);
		
		userService.insertObject(user);
		return null;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	@Override
	protected void prepareModel() throws Exception {
		
	}
	
}
