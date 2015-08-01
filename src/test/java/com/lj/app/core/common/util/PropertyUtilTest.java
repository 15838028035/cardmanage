package com.lj.app.core.common.util;

import static org.junit.Assert.assertNotNull;

import java.io.IOException;
import java.util.Properties;

import org.junit.Test;

public class PropertyUtilTest {

	@Test
	public void loadPropertiesTest() throws Exception{
		Properties properties = PropertyUtil.loadProperties("env.properties");
		assertNotNull(properties);
	}
	
	@Test(expected = IOException.class)
	public void loadPropertiesNotExistsTest() throws Exception{
		Properties properties = PropertyUtil.loadProperties("notExits.properties");
		assertNotNull(properties);
	}
	
	@Test
	public void PropertyUtilConstructTest() {
		PropertyUtil PropertyUtil = new PropertyUtil();
		assertNotNull(PropertyUtil);
	}

}
