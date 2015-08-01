package com.lj.app.cardmanage.plan.model;

import com.lj.app.cardmanage.base.model.BaseModel;

public class Plan extends BaseModel{

	private int id;
	/**
	 * 批次编号
	 */
	private String batchNo;
	
	private int userId;
	
	/**
	 * 信用卡编号
	 */
	private int creditCardId;
	
	/**
	 * post机编号
	 */
	private int postCardId;
	
	/**
	 * 消费日期
	 */
	private String saleDate;
	
	/**
	 * 总金额
	 */
	private int sumAllMoney;
	
	/**
	 * 存款金额
	 */
	private int inMoney;
	/**
	 * 刷卡金额
	 */
	private int outMoney;
	
	/**
	 * 剩余金额
	 */
	private int remainMoney;
	
	/**
	 * 计划是否执行
	 */
	private String excuteFlag = "F";
	
	
	private String userName;
	
	private String postCardNo;
	
	private String manName;
	
	private float rate;
	
	private int billDate;
	
	private int repaymentDate;
	
	private int maxLimit;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCreditCardId() {
		return creditCardId;
	}

	public void setCreditCardId(int creditCardId) {
		this.creditCardId = creditCardId;
	}

	public int getPostCardId() {
		return postCardId;
	}

	public void setPostCardId(int postCardId) {
		this.postCardId = postCardId;
	}

	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}

	public int getSumAllMoney() {
		return sumAllMoney;
	}

	public void setSumAllMoney(int sumAllMoney) {
		this.sumAllMoney = sumAllMoney;
	}

	public int getInMoney() {
		return inMoney;
	}

	public void setInMoney(int inMoney) {
		this.inMoney = inMoney;
	}

	public int getOutMoney() {
		return outMoney;
	}

	public void setOutMoney(int outMoney) {
		this.outMoney = outMoney;
	}

	public int getRemainMoney() {
		return remainMoney;
	}

	public void setRemainMoney(int remainMoney) {
		this.remainMoney = remainMoney;
	}

	public String getExcuteFlag() {
		return excuteFlag;
	}

	public void setExcuteFlag(String excuteFlag) {
		this.excuteFlag = excuteFlag;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPostCardNo() {
		return postCardNo;
	}

	public void setPostCardNo(String postCardNo) {
		this.postCardNo = postCardNo;
	}

	public String getManName() {
		return manName;
	}

	public void setManName(String manName) {
		this.manName = manName;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
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

	public int getMaxLimit() {
		return maxLimit;
	}

	public void setMaxLimit(int maxLimit) {
		this.maxLimit = maxLimit;
	}
	
	
	
	
}
