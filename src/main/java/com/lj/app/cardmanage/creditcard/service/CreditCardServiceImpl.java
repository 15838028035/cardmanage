package com.lj.app.cardmanage.creditcard.service;

import org.springframework.stereotype.Service;

import com.lj.app.cardmanage.base.service.BaseServiceImpl;
import com.lj.app.cardmanage.creditcard.model.CreditCard;

@Service("creditCardService")
public class CreditCardServiceImpl extends BaseServiceImpl implements CreditCardService{

	@Override
	public int getCreditBillDateCount(int billDate) {
		return countObject("getCreditBillDateCount",billDate);
	}
	
	/**
	 * 动态查询用户的新信用卡数量
	 * @param creditCard
	 * @return
	 */
	@Override
	public int getUserCreditBillDateCount(CreditCard creditCard){
		return countObject("getUserCreditBillDateCount",creditCard);
	}
}
