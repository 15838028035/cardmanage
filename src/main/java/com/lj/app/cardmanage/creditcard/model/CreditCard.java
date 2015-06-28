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
	private int billDate;//账单日期
	private int repaymentDate;//还款日
	
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
	public int getBillDate() {
		return billDate;
	}
	public void setBillDate(int billDate) {
		this.billDate = billDate;
	}
	public int getRepaymentDate() {
		return repaymentDate;
	}
	public void setRepaymentDate(int repaymentDate) {
		this.repaymentDate = repaymentDate;
	}
	
}
