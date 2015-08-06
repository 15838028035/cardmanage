package com.lj.app.core.common.util;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

public class ValidateUtilTest {
	
	private ValidateUtil ValidateUtil;
	
	@Before
	public void setUp() {
		ValidateUtil = new ValidateUtil();
	}

	@Test
	public void isNotEmptyTest() {
		assertTrue(ValidateUtil.isNotEmpty("AA"));
		assertTrue(ValidateUtil.isNotEmpty("A A"));
		assertTrue(ValidateUtil.isNotEmpty(" B B"));
		assertTrue(ValidateUtil.isNotEmpty(" "));
		assertFalse(ValidateUtil.isNotEmpty(null));
	}

	@Test
	public void isEmptyTest() {
		assertFalse(ValidateUtil.isNotEmpty("AA"));
		assertFalse(ValidateUtil.isNotEmpty("A A"));
		assertFalse(ValidateUtil.isNotEmpty(" B B"));
		assertTrue(ValidateUtil.isNotEmpty(" "));
		assertTrue(ValidateUtil.isNotEmpty(null));
	}

}
