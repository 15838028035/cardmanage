package com.lj.app.cardmanage.plan.service;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.record.formula.functions.T;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lj.app.cardmanage.creditcard.model.CreditCard;
import com.lj.app.cardmanage.creditcard.service.CreditCardService;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.util.AbstractAcceptanceTestBaseTestCase;

public class PlanServiceAcceptanceTest<Plan> extends AbstractAcceptanceTestBaseTestCase{
	
	private String batchNo;//批次编号
	private String currentDate;//当前日期
	private String currentDateOfDD;//当天日期
	private int billDate;//账单日期
	private String nextMonthToday;//下个月今天
	private String preMonthToday;//上个月今天
	
	private CreditCard creditCard;
	
	private  int creditCardSize;
	
	@Autowired
	private PlanService planService;
	
	@Autowired
	private CreditCardService creditCardService;
	
	protected Page<T> page = new Page<T>(PAGESIZE);
	
	public static int PAGESIZE = 500;

	/**
	 * 用户U10001拥有一张信用卡、一个POST机,并且当天是账单日
	 */
	@Test
	public void userHasOneCreditCardAndOnePostCardAndCurrentDayIsBillDayTest() {
		 currentDateOfDD = planService.getCurrentDateOfDD();
		 billDate =  planService.getBillDay(currentDateOfDD);
		 
		 creditCard = new CreditCard();
		 creditCard.setCreateBy(1);
		 creditCardSize = creditCardService.getUserCreditBillDateCount(creditCard);
		 
		 currentDate  = planService.getCurrentDate();
		 nextMonthToday =planService.getNextMonthToday();
		 
		 if(creditCardSize>0){//检验生成的账单
				Map<String,String> condition = new HashMap<String,String>();
				condition.put("loginNo", "U10001");
				condition.put("userName", "U10001");
				condition.put("cardNo", "");
				condition.put("currentDate", currentDate);
				condition.put("nextMonthToday", nextMonthToday);
				planService.findPageList(page, condition);
				
				assertTrue(page.getTotalCount()>=28 && page.getTotalCount()<=31);
		 }
	}
	
	/**
	 * 用户U10001拥有一张信用卡、一个POST机,并且当天不是账单日
	 */
	@Test
	public void userHasOneCreditCardAndOnePostCardAndCurrentDayIsNotBillDayTest() {
		 currentDateOfDD = planService.getCurrentDateOfDD();
		 billDate =  planService.getBillDay(currentDateOfDD);
		 creditCard = new CreditCard();
		 creditCard.setCreateBy(1);
		 creditCardSize = creditCardService.getUserCreditBillDateCount(creditCard);
		 
		 currentDate  = planService.getCurrentDate();
		 nextMonthToday =planService.getNextMonthToday();
		 
		 if(creditCardSize==0){//用户当天没呀账单,检验当天没有生成U10001的计划
			 	Map<String,String> condition = new HashMap<String,String>();
				condition.put("loginNo", "U10001");
				condition.put("userName", "U10001");
				condition.put("cardNo", "");
				condition.put("currentDate", currentDate);
				condition.put("nextMonthToday", nextMonthToday);
				planService.findPageList(page, condition);
				
				assertTrue(page.getTotalCount()==0);
		 }
	}
}
