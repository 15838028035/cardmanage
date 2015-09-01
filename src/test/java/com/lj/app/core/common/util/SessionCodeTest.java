package com.lj.app.core.common.util;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class SessionCodeTest {

	@Test
	public void loginNameTest() {
		assertEquals("loginName",SessionCode.LOGIN_NAME);
	}
	
	@Test
	public void mainAcctTest() {
		assertEquals("mainAcct",SessionCode.MAIN_ACCT);
	}
	
	@Test
	public void mainAcctIdTest() {
		assertEquals("mainAcctId",SessionCode.MAIN_ACCT_ID);
	}
	
	@Test
	public void perminssionListTest() {
		assertEquals("perminssionList",SessionCode.PERMINSSION_LIST);
	}
	
	@Test
	public void errorMessageTest() {
		assertEquals("errorMessage",SessionCode.ERROR_MESSAGE);
	}
	
	@Test
	public void warnMessageTest() {
		assertEquals("warnMessage",SessionCode.WARN_MESSAGE);
	}
	
	@Test
	public void infoMessageTest() {
		assertEquals("infoMessage",SessionCode.INFO_MESSAGE);
	}
	
	@Test
	public void successMessageTest() {
		assertEquals("successMessage",SessionCode.SUCCESS_MESSAGE);
	}
	
	
}
