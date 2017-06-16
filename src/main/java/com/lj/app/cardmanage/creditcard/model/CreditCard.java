package com.lj.app.cardmanage.creditcard.model;

import com.lj.app.cardmanage.base.model.BaseModel;

public class CreditCard extends BaseModel{

	private int id;
	private String cardNo;
	private String bankNo;
	private String userName;
	private float  maxLimit;//额度
	private String secNo;//安全码
	private String validateDate;//有效期
	private Integer billDate;//账单日期
	private Integer repaymentDate;//还款日
	private float serviceRate;//服务费率
	private float initRemainMoney;//初始剩余金额
	private String cardNoProfile;//自定义编号
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public float getMaxLimit() {
		return maxLimit;
	}
	public void setMaxLimit(float maxLimit) {
		this.maxLimit = maxLimit;
	}
	public String getSecNo() {
		return secNo;
	}
	public void setSecNo(String secNo) {
		this.secNo = secNo;
	}
	public String getValidateDate() {
		return validateDate;
	}
	public void setValidateDate(String validateDate) {
		this.validateDate = validateDate;
	}
	public Integer getBillDate() {
		return billDate;
	}
	public void setBillDate(Integer billDate) {
		this.billDate = billDate;
	}
	public Integer getRepaymentDate() {
		return repaymentDate;
	}
	public void setRepaymentDate(Integer repaymentDate) {
		this.repaymentDate = repaymentDate;
	}
	public float getServiceRate() {
		return serviceRate;
	}
	public void setServiceRate(float serviceRate) {
		this.serviceRate = serviceRate;
	}
	public float getInitRemainMoney() {
		return initRemainMoney;
	}
	public void setInitRemainMoney(float initRemainMoney) {
		this.initRemainMoney = initRemainMoney;
	}
	public String getCardNoProfile() {
		return cardNoProfile;
	}
	public void setCardNoProfile(String cardNoProfile) {
		this.cardNoProfile = cardNoProfile;
	}
	
	
}
