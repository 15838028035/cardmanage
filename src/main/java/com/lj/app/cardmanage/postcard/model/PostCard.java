package com.lj.app.cardmanage.postcard.model;

import com.lj.app.cardmanage.base.model.BaseModel;

public class PostCard extends BaseModel{

	private int id;
	/**
	 * 机具编号
	 */
	private String postCardNo;
	/**
	 * 商户名字
	 */
	private String manName;
	/**
	 * 费率
	 */
	private float rate;
	/**
	 * 匹配最小额度
	 */
	private int minMoney;
	/**
	 * 匹配最大额度
	 */
	private int maxMoney;
	
	/**
	 * 行业
	 */
	private String trade;
	
	/**
	 * 绑定银行
	 */
	private String bindBank;
	
	/**
	 * 卡号
	 */
	private String cardNo;
	/**
	 * 姓名
	 */
	private String userName;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getMinMoney() {
		return minMoney;
	}
	public void setMinMoney(int minMoney) {
		this.minMoney = minMoney;
	}
	public int getMaxMoney() {
		return maxMoney;
	}
	public void setMaxMoney(int maxMoney) {
		this.maxMoney = maxMoney;
	}
	public String getTrade() {
		return trade;
	}
	public void setTrade(String trade) {
		this.trade = trade;
	}
	public String getBindBank() {
		return bindBank;
	}
	public void setBindBank(String bindBank) {
		this.bindBank = bindBank;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
