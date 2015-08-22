package com.lj.app.core.common.util;

import org.junit.AfterClass;
import org.junit.BeforeClass;

public abstract class AbstractAcceptanceTestBaseTestCase extends AbstractBaseSpringTransactionTestCase{

	@BeforeClass
	public static void setupContext(){
		SetupContextUtil.setupContext();
	}
	
	@AfterClass
	public static void tearDonwContext(){
		SetupContextUtil.tearDonwContext();
	}
}
