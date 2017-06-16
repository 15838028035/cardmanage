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
	 * 服务费率
	 */
	private float serviceRate;
	
	/**
	 * 手续费
	 */
	private double poundage;
	
	/**
	 * 收益金额
	 */
	private float incomeMoney;
	
	/**
	 * 计划是否执行
	 */
	private String excuteFlag = "F";
	
	/**
	 * 服务费率统计
	 */
	private String serviceRateSumFormat;
	
	/**
	 * 手续费统计
	 */
	private String poundageSumFormat;
	
	/**
	 * 收益金额统计
	 */
	private String incomeMoneySumFormat;
	
	/**
	 * 还款统计
	 */
	private String inMoneySumFormat;
	/**
	 * 消费统计
	 */
	private String outMoneySumFormat;
	
	/**
	 * 自定义编号
	 */
	private String cardNoProfile;	
	
	private String bankNo;
	
	private String userName;
	
	private String postCardNo;
	
	private String manName;
	
	private float rate;
	
	private int billDate;
	
	private int repaymentDate;
	
	private int maxLimit;
	
	private String cardNo;

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

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public double getPoundage() {
		return poundage;
	}

	public void setPoundage(double poundage) {
		this.poundage = poundage;
	}

	public float getServiceRate() {
		return serviceRate;
	}

	public void setServiceRate(float serviceRate) {
		this.serviceRate = serviceRate;
	}

	public float getIncomeMoney() {
		return incomeMoney;
	}

	public void setIncomeMoney(float incomeMoney) {
		this.incomeMoney = incomeMoney;
	}

	public String getServiceRateSumFormat() {
		return serviceRateSumFormat;
	}

	public void setServiceRateSumFormat(String serviceRateSumFormat) {
		this.serviceRateSumFormat = serviceRateSumFormat;
	}

	public String getPoundageSumFormat() {
		return poundageSumFormat;
	}

	public void setPoundageSumFormat(String poundageSumFormat) {
		this.poundageSumFormat = poundageSumFormat;
	}

	public String getIncomeMoneySumFormat() {
		return incomeMoneySumFormat;
	}

	public void setIncomeMoneySumFormat(String incomeMoneySumFormat) {
		this.incomeMoneySumFormat = incomeMoneySumFormat;
	}

	public String getCardNoProfile() {
		return cardNoProfile;
	}

	public void setCardNoProfile(String cardNoProfile) {
		this.cardNoProfile = cardNoProfile;
	}

	public String getInMoneySumFormat() {
		return inMoneySumFormat;
	}

	public void setInMoneySumFormat(String inMoneySumFormat) {
		this.inMoneySumFormat = inMoneySumFormat;
	}

	public String getOutMoneySumFormat() {
		return outMoneySumFormat;
	}
	public void setOutMoneySumFormat(String outMoneySumFormat) {
		this.outMoneySumFormat = outMoneySumFormat;
	}

	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	
}
