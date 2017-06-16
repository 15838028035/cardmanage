package com.lj.app.cardmanage.plan.service;

import java.math.BigDecimal;
import java.util.Random;

public class PlanGenerateRuleFactory {
	
	
	private static int remMoney;
	private static int inmMoney;
	
	private static  int  OUTMONEY_1 = new BigDecimal(remMoney*Math.round(0 + (Math.random() * 5))/100).intValue();
	private static  int  OUTMONEY_2 = new BigDecimal(remMoney*Math.round(5 + (Math.random() * 10))/100).intValue();
	private static  int  OUTMONEY_3 = new BigDecimal(remMoney*Math.round(10 + (Math.random() * 15))/100).intValue();
	private static  int  OUTMONEY_4 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 20))/100).intValue();
	private static  int  OUTMONEY_5 = new BigDecimal(remMoney*Math.round(13 + (Math.random() * 17))/100).intValue();
	
	
	/**
	 * 上月没有刷卡记录，获得随机刷卡金额
	 * @param remainMoney
	 * @param j
	 * @param maxSaleDay
	 * @return
	 */
	public static int getRadomOutMoney(int remainMoney,int j, int maxSaleDay){
		remMoney = remainMoney;
		int randomId =new BigDecimal(Math.round(1 + (Math.random() * 4))).intValue();
		
		if(maxSaleDay==j){
			return remainMoney+new BigDecimal(remMoney*Math.round(0 + (Math.random() * 5))/100).intValue();
		}
		
		if(randomId == 1){
			OUTMONEY_1 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 8))/100).intValue();
			return OUTMONEY_1;
		}
		if(randomId == 2){
			 OUTMONEY_2 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 10))/100).intValue();
			return OUTMONEY_2;
		}
		if(randomId == 3){
			OUTMONEY_3 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 15))/100).intValue();
			return OUTMONEY_3;
		}
		if(randomId == 4){
			OUTMONEY_4 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 20))/100).intValue();
			return OUTMONEY_4;
		}
		if(randomId == 5){
			 OUTMONEY_5 =  new BigDecimal(remMoney*Math.round(20 + (Math.random() * 17))/100).intValue();
			return OUTMONEY_5;
		}
		
		return remMoney;
	}
	
	/**
	 * 上月已欠款，刷卡金额
	 * @param remainMoney
	 * @param j
	 * @param maxSaleDay
	 * @return
	 */
	public static int getRadomOutMoneyHasBill(int remainMoney,int j, int maxSaleDay){
		remMoney = remainMoney;
		/*int randomId =new BigDecimal(Math.round(1 + (Math.random() * 4))).intValue();
		
		if(maxSaleDay==j){
			return remainMoney;
		}
		
		if(randomId == 1){
			OUTMONEY_1 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 8))/100).intValue();
			return OUTMONEY_1;
		}
		if(randomId == 2){
			 OUTMONEY_2 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 10))/100).intValue();
			return OUTMONEY_2;
		}
		if(randomId == 3){
			OUTMONEY_3 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 15))/100).intValue();
			return OUTMONEY_3;
		}
		if(randomId == 4){
			OUTMONEY_4 = new BigDecimal(remMoney*Math.round(15 + (Math.random() * 20))/100).intValue();
			return OUTMONEY_4;
		}
		if(randomId == 5){
			 OUTMONEY_5 =  new BigDecimal(remMoney*Math.round(20 + (Math.random() * 17))/100).intValue();
			return OUTMONEY_5;
		}
		*/
		return remMoney;
	}
	
	//获得随机还款金额
	public static int getRandompInMoney(int preMonthOutSubInMoney,int currentMonthSumInMoney, int inMoney, int j,int repaymentDate,int preMonthOutSubInMoneySubcurrentMonthSumInMoney){
		inmMoney = preMonthOutSubInMoneySubcurrentMonthSumInMoney;
		
		int randomId =new BigDecimal(Math.floor(1 + (Math.random() * 7))).intValue();
		int randomJ =new BigDecimal(Math.floor(1 + (Math.random() * 1))).intValue();
		Random ra =new Random();

		if(j<=14){
			if(randomJ==1){//还款操作
				//if(preMonthOutSubInMoney-currentMonthSumInMoney>=200){
				if(randomId == 1){
					inmMoney = new BigDecimal(inmMoney*(5.95 + (ra.nextDouble()*0.71))/100).intValue();
				}
				if(randomId == 2){
					inmMoney = new BigDecimal(inmMoney*(6.18 + (ra.nextDouble()*0.48))/100).intValue();
				}
				if(randomId == 3){
					inmMoney = new BigDecimal(inmMoney*(6.09 + (ra.nextDouble()*0.57))/100).intValue();
				}
				if(randomId == 4){
					inmMoney = new BigDecimal(inmMoney*(6.03 + (ra.nextDouble()*0.63))/100).intValue();
				}
				if(randomId == 5){
					inmMoney =  new BigDecimal(inmMoney*(6.33 + (ra.nextDouble()*0.33))/100).intValue();
				}
				
				if(randomId == 6){
					inmMoney =  new BigDecimal(inmMoney*(6.23 + (ra.nextDouble()*0.43))/100).intValue();
				}
				
				if(randomId == 7){
					inmMoney =  new BigDecimal(inmMoney*(6.13 + (ra.nextDouble()*0.53))/100).intValue();
				}
				if(randomId == 8){
					inmMoney =  new BigDecimal(inmMoney*(6.26 + (ra.nextDouble()*0.4))/100).intValue();
				}
				
				if(inmMoney<10){
					inmMoney = 0;
				}
					
				
				 int inMoneyTmp = inmMoney/10;
				 
				 inmMoney =inMoneyTmp*10;
				 
					return inmMoney;
			}
		
				if(preMonthOutSubInMoneySubcurrentMonthSumInMoney-currentMonthSumInMoney<100&&preMonthOutSubInMoneySubcurrentMonthSumInMoney-currentMonthSumInMoney>0){
					return inmMoney = preMonthOutSubInMoneySubcurrentMonthSumInMoney-currentMonthSumInMoney;
				}
			//}
			
		}
		
		if(j>=15){//必须还款
			if(preMonthOutSubInMoneySubcurrentMonthSumInMoney-currentMonthSumInMoney>0){
				return inmMoney = preMonthOutSubInMoneySubcurrentMonthSumInMoney-currentMonthSumInMoney;
			}
		}
		return 0;
	}
	
	
	public static void main(String []args) {
		int inmMoney = 85;
		 int inMoneyTmp = inmMoney/10;
		 inmMoney =inMoneyTmp*10;
		 
		 System.out.println(inmMoney);
		 
		
	}
}
