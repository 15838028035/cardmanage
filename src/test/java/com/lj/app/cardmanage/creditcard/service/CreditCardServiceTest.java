package com.lj.app.cardmanage.creditcard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lj.app.cardmanage.creditcard.model.CreditCard;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AbstractBaseSpringTransactionTestCase;
import com.lj.app.core.common.util.DateUtil;

public class CreditCardServiceTest extends AbstractBaseSpringTransactionTestCase {

	@Autowired
	private CreditCardService creditCardService;
	
	@Test
	public void findBaseModeListTest() {
		Assert.assertTrue(creditCardService.findBaseModeList(null).size()>0);
	}
	
	@Test
	public void findTest(){
	    Assert.assertNotNull(creditCardService.getInfoByKey(1));
	}
	
	@Test
	public void pagtnateTest() {
		Map condition = new HashMap();
		Page< CreditCard> page = new Page< CreditCard>(10);
		Page< CreditCard> pageUser = (Page< CreditCard>)creditCardService.findPageList(page, condition);
		List< CreditCard> userList = pageUser.getResult();
		
		Assert.assertEquals(10, userList.size());
		String result = PageTool.pageToJsonJQGrid(pageUser);
		System.out.println("result=" +result);
	}
	
	@Test
	public void insetTest() {
		 CreditCard  creditCard = new  CreditCard();
		 creditCard.setId(1);
		 creditCard.setCardNo("1001");
		 creditCard.setBankNo("建设银行");
		 creditCard.setUserName("张三");
		 creditCard.setMaxLimit(30000);
		 creditCard.setSecNo("001");
		 creditCard.setValidateDate("2015-08-20");
		 creditCard.setBillDate(3);
		 creditCard.setRepaymentDate(21);
		 
		 creditCard.setCreateBy(1);
		 creditCard.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
		creditCardService.insertObject(creditCard);
	}
	
	@Test
	public void updateTest() {
		 CreditCard  creditCard = new  CreditCard();
		 creditCard.setId(1);
		 creditCard.setCardNo("1001");
		 creditCard.setBankNo("建设银行");
		 creditCard.setUserName("张三");
		 creditCard.setMaxLimit(30000);
		 creditCard.setSecNo("001");
		 creditCard.setValidateDate("2015-08-20");
		 creditCard.setBillDate(3);
		 creditCard.setRepaymentDate(21);
		 
		 creditCard.setUpdateBy(1);
		 creditCard.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
		creditCardService.updateObject(creditCard);
	}
}
