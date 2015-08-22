package com.lj.app.cardmanage.creditcard.service;

import com.lj.app.cardmanage.base.service.BaseService;
import com.lj.app.cardmanage.creditcard.model.CreditCard;

public interface CreditCardService  extends BaseService{
	/**
	 * 获得当天是账单日懂得信用卡的数量
	 * @return
	 */
	public int getCreditBillDateCount(int billDate);
	
	/**
	 * 动态查询用户的新信用卡数量
	 * @param creditCard
	 * @return
	 */
	public int getUserCreditBillDateCount(CreditCard creditCard);
}
