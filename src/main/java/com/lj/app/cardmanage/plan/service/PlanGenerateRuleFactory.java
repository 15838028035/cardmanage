package com.lj.app.cardmanage.plan.service;

import java.math.BigDecimal;

public class PlanGenerateRuleFactory {
	
	
	private static int remMoney;
	
	private static  int  OUTMONEY_1 = new BigDecimal(remMoney*Math.floor(0 + (Math.random() * 5))/100).intValue();
	private static  int  OUTMONEY_2 = new BigDecimal(remMoney*Math.floor(5 + (Math.random() * 10))/100).intValue();
	private static  int  OUTMONEY_3 = new BigDecimal(remMoney*Math.floor(10 + (Math.random() * 15))/100).intValue();
	private static  int  OUTMONEY_4 = new BigDecimal(remMoney*Math.floor(15 + (Math.random() * 20))/100).intValue();
	private static  int  OUTMONEY_5 = new BigDecimal(remMoney*Math.floor(13 + (Math.random() * 17))/100).intValue();
	
	
	public static int getRadomOutMoney(int remainMoney){
		remMoney = remainMoney;
		int randomId =new BigDecimal(Math.floor(1 + (Math.random() * 4))).intValue();
		
		if(randomId == 1){
			OUTMONEY_1 = new BigDecimal(remMoney*Math.floor(0 + (Math.random() * 5))/100).intValue();
			return OUTMONEY_1;
		}
		if(randomId == 2){
			 OUTMONEY_2 = new BigDecimal(remMoney*Math.floor(5 + (Math.random() * 10))/100).intValue();
			return OUTMONEY_2;
		}
		if(randomId == 3){
			OUTMONEY_3 = new BigDecimal(remMoney*Math.floor(10 + (Math.random() * 15))/100).intValue();
			return OUTMONEY_3;
		}
		if(randomId == 4){
			OUTMONEY_4 = new BigDecimal(remMoney*Math.floor(15 + (Math.random() * 20))/100).intValue();
			return OUTMONEY_4;
		}
		if(randomId == 5){
			 OUTMONEY_5 =  new BigDecimal(remMoney*Math.floor(13 + (Math.random() * 17))/100).intValue();
			return OUTMONEY_5;
		}
		return remMoney;
	}
}
