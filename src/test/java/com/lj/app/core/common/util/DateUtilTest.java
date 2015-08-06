package com.lj.app.core.common.util;


import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;

import com.sun.tools.example.debug.expr.ParseException;

public class DateUtilTest {
	
	private DateUtil dateUtil;
	
	@Before
	public void setUp() {
		dateUtil = new DateUtil();
	}

	@Test
	public void getNowDateYYYYMMddHHMMSSTest() {
		String date = DateUtil.getNowDateYYYYMMddHHMMSS();
		assertTrue(date.length()==18);
	}

	@Test
	public void getNowDateTest() {
		String date = DateUtil.getNowDate("yyyy-MM-dd");
		assertTrue(date.length()==10);
	}

	@Test
	public void formatDateStringStringTest() {
	}

	@Test
	public void formatDateDateTest() {
		Date date = DateUtil.formatDate("2015-10-01 10:00:00", "yyyy-MM-dd HH:mm:ss");
		assertNotNull(date);
	}
	
	@Test(expected = ParseException.class)
	public void formatDateDateWidthBadFormatTest() {
		Date date = DateUtil.formatDate("2015-10-01 10:00:00", "yyyy-MM-dd gg ff");
		assertNull(date);
	}
	
	@Test
	public void getIntervalDaysTest(){
		int interDays = DateUtil.getIntervalDays("2015-08-10", "2015-08-05");
		assertTrue(interDays==5);
	}
	
	@Test
	public void getIntervalDaysNumIsZerorTest(){
		int interDays = DateUtil.getIntervalDays("2015-08-10", "2015-08-20");
		assertTrue(interDays==-10);
	}
	
	@Test
	public void getIntervalDaysNumBadeFormatDateTest(){
		int interDays = DateUtil.getIntervalDays("2015000", "2015-08-20");
		assertTrue(interDays==0);
	}
	
	@Test
	public void getIntervalDaysWithNullDateStrTest(){
		String date1 = null;
		String date2 = null;
		int interDays = DateUtil.getIntervalDays(date1, date2);
		assertTrue(interDays==-1);
	}
	
	@Test
	public void getIntervalDaysCompareDateTest(){
		int interDays = DateUtil.getIntervalDays(new Date(), new Date());
		assertTrue(interDays==0);
	}
	
	@Test
	public void getIntervalDaysWithNullDateTest(){
		Date date1 = null;
		Date date2 = null;
		int interDays = DateUtil.getIntervalDays(date1,date2);
		assertTrue(interDays==-1);
	}

}
