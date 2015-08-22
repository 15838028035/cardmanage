package com.lj.app.core.common.util;

import com.lj.app.cardmanage.user.model.UserSetUpFixtureAcceptanceTest;


public class SetupContextUtil extends AbstractAcceptanceTestBaseTestCase{
	
	private static  UserSetUpFixtureAcceptanceTest userSetUpFixtureAcceptanceTest;

	public static void setupContext(){
		userSetUpFixtureAcceptanceTest = new UserSetUpFixtureAcceptanceTest();
		userSetUpFixtureAcceptanceTest.setUpFixture();
	}
	
	public static void tearDonwContext(){
		System.out.println("Tear down  context ......");
	}
}
