package com.lj.app.core.common.util;

import org.junit.AfterClass;
import org.junit.BeforeClass;

/**
 * 验收测试基类
 * 所有的验收测试必须集成此基类，该基类提供了setupContext()、tearDonwContext()方法供所有子类使用，
 * 请不要在子类中重写该方法。
 *
 */
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
