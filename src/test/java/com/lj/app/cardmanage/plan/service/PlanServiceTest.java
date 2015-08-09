package com.lj.app.cardmanage.plan.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lj.app.core.common.util.AbstractBaseSpringTransactionTestCase;

public class PlanServiceTest extends AbstractBaseSpringTransactionTestCase{

	@Autowired
	private PlanService planService;
	
	@Test
	public void generateBatchNoTest() {
		String batchNo = planService.generateBatchNo();
		System.out.println("batchNO=" + batchNo);
		assertNotNull(batchNo);
		assertTrue(batchNo.contains(":"));
	}
	
	@Test
	public void getCurrentDateOfDD() {
		String currentDateOfDD = planService.getCurrentDateOfDD();
		System.out.println("getCurrentDateOfDD=" + currentDateOfDD);
		assertNotNull(currentDateOfDD);
	}
	
	@Test
	public void getBillDayTest(){
		String currentDateOfDD = planService.getCurrentDateOfDD();
		int billDate = planService.getBillDay(currentDateOfDD);
		assertTrue(billDate>=1);
	}
	
	@Test
	public void getNextMonthTodayTest() {
		String getNextMonthToday = planService.getNextMonthToday();
		System.out.println("getNextMonthToday=" + getNextMonthToday);
		assertNotNull(getNextMonthToday);
	}
	
	@Test
	public void getPreMonthTodayTest() {
		String getPreMonthToday = planService.getPreMonthToday();
		System.out.println("getPreMonthToday=" + getPreMonthToday);
		assertNotNull(getPreMonthToday);
	}
	
	@Test
	public void getIntervalDaysOfBillTest() {
		String currentDate = planService.getCurrentDate();
		String nextMonthToday = planService.getNextMonthToday();
		int diffDays= planService.getIntervalDaysOfBill(nextMonthToday,currentDate);
		assertTrue(diffDays>=28);
		assertTrue(diffDays<=31);
	}
	
	@Test
	public void generateBillSaleRateTest(){
		int rate = planService.generateBillSaleRate();
		assertTrue(rate>=70);
		assertTrue(rate<=80);
	}
	
	@Test
	public void checkSaleDayTest() {
		
	}
	
	@Test
	public void exceutePlanFromJavaTest() {
		planService.exceutePlanFromJava();
	}
	
	
	@Test
	public void getSaleDayTest(){
		String getSaleDay = planService.getSaleDay("2015-08-03 10:00:00", 1);
		String expetedDay = "2015-08-04 10:00:00";
		assertEquals(expetedDay,getSaleDay);
	}
}
