package com.lj.app.core.common.util;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.cardmanage.user.model.User;

public class SessionUtilTest {
	
	@Before 
	public void setUp() {
		User user = new User();
		user.setUserId(0);
		user.setUserName("system");
		SessionUtil.setuser(user);
	}
	
	@Test
	public void getUserTest() {
		User user = new User();
		user.setUserId(0);
		user.setUserName("system");
		SessionUtil.setuser(user);
		assertTrue(SessionUtil.getMainAcctId()==0);
		assertEquals("system",SessionUtil.getUserName());
	}

	@Test
	public void setuserTest() {
		User user = new User();
		user.setUserId(0);
		user.setUserName("system");
		SessionUtil.setuser(user);
		assertTrue(SessionUtil.getMainAcctId()==0);
		assertEquals("system",SessionUtil.getUserName());
	}

	@Test
	public void getMainAcctIdTest() {
		assertTrue(SessionUtil.getMainAcctId()==0);
	}

	@Test
	public void getUserNameTest() {
		assertEquals("system",SessionUtil.getUserName());
	}

	@Test
	public void getSessionAttributeTest() {
		assertNotNull(SessionUtil.getSessionAttribute(SessionCode.MAIN_ACCT));
	}

	@Test
	public void getSessionMapTest() {
		assertNotNull(SessionUtil.getSessionMap());
		assertNotNull(SessionUtil.getSessionMap().containsKey(SessionCode.LOGIN_NAME));
	}

}
