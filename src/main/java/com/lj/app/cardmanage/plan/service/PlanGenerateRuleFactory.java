package com.lj.app.cardmanage.plan.service;

import java.math.BigDecimal;

public class PlanGenerateRuleFactory {
	
	
	private static int remMoney;
	private static int inmMoney;
	
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
	
	//获得随机还款金额
	public static int getRandompInMoney(int preMonthOutSubInMoney,int currentMonthSumInMoney, int inMoney, int j,int repaymentDate){
		inmMoney = preMonthOutSubInMoney-currentMonthSumInMoney;
		
		int randomId =new BigDecimal(Math.floor(1 + (Math.random() * 4))).intValue();
		int randomJ =new BigDecimal(Math.floor(1 + (Math.random() * 1))).intValue();
		
		if(j<=9){
			if(randomJ==1){//还款操作
				if(preMonthOutSubInMoney-currentMonthSumInMoney>=200){
					if(randomId == 1){
						inmMoney = new BigDecimal(inmMoney*Math.floor(25 + (Math.random() * 5))/100).intValue();
					}
					if(randomId == 2){
						inmMoney = new BigDecimal(inmMoney*Math.floor(20 + (Math.random() * 10))/100).intValue();
					}
					if(randomId == 3){
						inmMoney = new BigDecimal(inmMoney*Math.floor(20 + (Math.random() * 15))/100).intValue();
					}
					if(randomId == 4){
						inmMoney = new BigDecimal(inmMoney*Math.floor(20 + (Math.random() * 20))/100).intValue();
					}
					if(randomId == 5){
						inmMoney =  new BigDecimal(inmMoney*Math.floor(13 + (Math.random() * 17))/100).intValue();
					}
					
					if(inmMoney<100){
						inmMoney = 0;
					}
					
					return inmMoney;
				}
		
				if(preMonthOutSubInMoney-currentMonthSumInMoney<200&&preMonthOutSubInMoney-currentMonthSumInMoney>0){
					return inmMoney = preMonthOutSubInMoney-currentMonthSumInMoney;
				}
			}
			
		}
		
		if(j>=10){//必须还款
			if(preMonthOutSubInMoney-currentMonthSumInMoney>0){
				return inmMoney = preMonthOutSubInMoney-currentMonthSumInMoney;
			}
		}
		return 0;
	}
}
