package com.lj.app.cardmanage.creditcard.service;

import com.lj.app.cardmanage.base.service.BaseService;

public interface CreditCardService  extends BaseService{
	/**
	 * 获得当天是账单日懂得信用卡的数量
	 * @return
	 */
	public int getCreditBillDateCount(int billDate);
}
