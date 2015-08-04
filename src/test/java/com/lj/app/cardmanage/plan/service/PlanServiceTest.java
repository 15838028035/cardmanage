package com.lj.app.cardmanage.plan.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-base.xml")
public class PlanServiceTest {

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
		System.out.println("currentDate="+ currentDate);
		System.out.println("nextMonthToday="+ nextMonthToday);
		System.out.println("diffDays="+ diffDays);
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
		
	}
}
