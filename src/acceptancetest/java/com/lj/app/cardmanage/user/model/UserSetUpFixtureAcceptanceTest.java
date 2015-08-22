package com.lj.app.cardmanage.user.model;

import org.springframework.beans.factory.annotation.Autowired;

import com.lj.app.cardmanage.user.service.UserService;
import com.lj.app.core.common.util.AbstractAcceptanceTestBaseTestCase;


/**
 *集成验收测试-->用户信息设置
 *
 */
public class UserSetUpFixtureAcceptanceTest extends AbstractAcceptanceTestBaseTestCase{
	
	private int userId;
	private String loginNo;
	private String pwd;
	private String userName;
	private String cardNo;
	private String address;
	private String mobile;
	private int createBy;
	private String createDate;
	private int updateBy;
	private String updateDate;
	private String enableFlag="T";
	private String lockStatus = "0";
	
	@Autowired
	private UserService userService;
	
	
	public   void setUpFixture() {
		User  user = new User();
		user.setUserId(userId);
		user.setLoginNo(loginNo);
		user.setPwd(pwd);
		user.setUserName(userName);
		user.setCardNo(cardNo);
		user.setAddress(address);
		user.setMobile(mobile);
		user.setCreateBy(createBy);
		user.setCreateDate(createDate);
		user.setUpdateBy(updateBy);
		user.setUpdateDate(updateDate);
		user.setEnableFlag(enableFlag);
		user.setLockStatus(lockStatus);
		
		userService.insertObject(user);
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
	public int getCreateBy() {
		return createBy;
	}
	public void setCreateBy(int createBy) {
		this.createBy = createBy;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(int updateBy) {
		this.updateBy = updateBy;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getEnableFlag() {
		return enableFlag;
	}
	public void setEnableFlag(String enableFlag) {
		this.enableFlag = enableFlag;
	}
	public String getLockStatus() {
		return lockStatus;
	}
	public void setLockStatus(String lockStatus) {
		this.lockStatus = lockStatus;
	}
}
