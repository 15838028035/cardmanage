package com.lj.app.cardmanage.plan.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.lj.app.cardmanage.base.service.BaseServiceImpl;
import com.lj.app.cardmanage.creditcard.model.CreditCard;
import com.lj.app.cardmanage.creditcard.service.CreditCardService;
import com.lj.app.cardmanage.plan.model.Plan;
import com.lj.app.core.common.util.DateUtil;

@Service("planService")
public class PlanServiceImpl extends BaseServiceImpl<Plan> implements PlanService<Plan>{
	
	public Log log = LogFactory.getLog(PlanServiceImpl.class);
	
	private String batchNo;//批次编号
	private String currentDate;//当前日期
	private String currentDateOfDD;//当天日期
	private int billDate;//账单日期
	private String nextMonthToday;//下个月今天
	private String preMonthToday;//上个月今天
	private int getIntervalDaysOfBill;//下一个账单日-当前日期相差时间
	private int credit_bill_date_count;//信用卡账单日是今天的数量
	
	private int repaymentDate;//还款日
	
	private List selectUserAndCardOfBillDayList;
	
	private int sumAllMoney;//信用卡总金额
	private int cuurentSaleSumMoney;//当月消费总金额
	private int billSaleRate;//费率
	private int remainMoney;//剩余金额
	
	private int outMoney;//单笔消费金额
	private int inMoney;//单笔还款金额
	
	private int currentMonthSumInMoney;//当月还款总金额
	
	private int preMonthOutMoney;//上个月消费总金额
	private int preMonthInMoney;//上个月还款金额
	private int preMonthOutSubInMoney;//上个月帐号金额
	
	private int preMonthOutSubInMoneySubcurrentMonthSumInMoney;//上月欠款，当月应还金额
	
	private int realRemainMoney;//实际剩余金额
	private int planRemainMoney;//计划剩余金额
	
	private int checkSaleDay;//是否是消费日
	private int getMaxSaleDay = 0;//最大消费日
	
	private int postCardId;//post机器id
	private int userId;
	private String saleDate = "";
	private  int checkIsAlreadyRunPaln = 0;//是否已经生计划
	
	private static final int SIGLE_SALE_MIN_MONEY = 10;//单笔消费最小金额
	
	private float initRemainMoney;//初始剩余金额
	
	
	@Autowired
	private CreditCardService creditCardService;
	
	@Override
	public void exceutePlanCron() {
	  log.debug("Start to  exceutePlanFromJava  ........");
	  exceutePlanFromJava();
	  log.debug("End  exceutePlanFromJava  ........");
	}

	@Override
	public String generateBatchNo() {
		return DateUtil.getNowDateYYYYMMddHHMMSS();
	}

	@Override
	public String getCurrentDateOfDD() {
		return DateUtil.getNowDate("dd");
	}
	
	/**
	 * 获取账单日
	 * @param CurrentDateOfDD
	 * @return
	 */
	public int getBillDay(String CurrentDateOfDD){
		int billDay = 0;
		if(CurrentDateOfDD!=null) {
			if(CurrentDateOfDD.length()>1&&CurrentDateOfDD.startsWith("0")){
				billDay = Integer.parseInt(CurrentDateOfDD.substring(1,CurrentDateOfDD.length()));
			}else{
				billDay = Integer.parseInt(CurrentDateOfDD);
			}
		}
		
		return billDay;
	}

	@Override
	public String getNextMonthToday() {
	  Calendar calendar = Calendar.getInstance();
      calendar.add(Calendar.MONTH, 1);
      return DateUtil.formatDate(calendar.getTime(),DateUtil.DATE_FOMRAT_yyyyMMddhhMMss);
	}

	@Override
	public String getPreMonthToday() {
		 Calendar calendar = Calendar.getInstance();
	     calendar.add(Calendar.MONTH, -1);
	     return DateUtil.formatDate(calendar.getTime(),DateUtil.DATE_FOMRAT_yyyyMMddhhMMss);
	}

	@Override
	public String getCurrentDate() {
		return DateUtil.getNowDateYYYYMMddHHMMSS();
	}

	@Override
	public int getIntervalDaysOfBill(String nextMonthToday, String currentDate) {
		return DateUtil.getIntervalDays(nextMonthToday, currentDate);
	}
	
	/**
	 * 查找账单日中要生成计划的帐号、卡信息
	 * @param billDay
	 * @return
	 */
	public List<Plan> selectUserAndCardOfBillDay(int billDay){
		return queryForList("selectUserAndCardOfBillDay", billDay);
	}
	
	/**
	 * 生成消费费率
	 * @return
	 */
	public int generateBillSaleRate(){
		//BigDecimal d = new BigDecimal(Math.round(Math.random()*5)+90);
		int rate = 100;
		return  rate;
	}
	
	/**
	 * 获得最大的消费日期
	 * @return
	 */
	public int getMaxSaleDay(){
		int result = 0;
		try{
			Map obj  = (HashMap)queryForObject("getMaxSaleDay", null);
			result = Integer.parseInt(String.valueOf(obj.get("F_GETMAXSALEDAY")));
		  }catch(Exception e){
			e.printStackTrace();
		}
		return result;
		
	}

	/**
	 * 生成计划消费的日期
	 * @param days
	 * @return
	 */
	public void  generatePlanDayTmp(int days) {
		Map<String,Integer> queryMap = new HashMap<String,Integer>();
		queryMap.put("days", days);
		queryForObject("generatePlanDayTmp", queryMap);
	}
	
	/**
	 *是否是消费日
	 * @return
	 */
	public int checkSaleDay(int day) {
		
		int result = 0;
		try{
			Map<String,Integer> queryMap = new HashMap<String,Integer>();
			queryMap.put("day", day);
			Map obj  = (HashMap)queryForObject("checkSaleDay", queryMap);
			result = Integer.parseInt(String.valueOf(obj.get("F_CHECK_SALE_DAY")));
		  }catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取机具器编号
	 * @param outMoney
	 * @param userId
	 * @return
	 */
	public int getPostCardId(int outMoney,int userId){
		int result = 0;
		try{
			Map<String,Integer> queryMap = new HashMap<String,Integer>();
			queryMap.put("outMoney", outMoney);
			queryMap.put("userId", userId);
			Map obj  = (HashMap) queryForObject("getPostCardId", queryMap);
			result = Integer.parseInt(String.valueOf(obj.get("F_GET_POST_CARDID")));
		  }catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取下一个日期
	 * @param outMoney
	 * @param userId
	 * @return
	 */
	public String getSaleDay(String saleDay,int interOfDay){
		 Calendar calendar = Calendar.getInstance();
		 calendar.setTime(DateUtil.formatDate(saleDay,DateUtil.DATE_FOMRAT_yyyyMMddhhMMss));
	     calendar.add(Calendar.DAY_OF_MONTH, interOfDay);
	     return DateUtil.formatDate(calendar.getTime(),DateUtil.DATE_FOMRAT_yyyyMMddhhMMss);
	}
	
	/**
	 * 检验是否已经生成账单
	 * @param creditCardId
	 * @param saleDate
	 * @return
	 */
	public int checkIsAlreadyRunPaln(int creditCardId, String saleDate){
		int result = 0;
		try{
			Map<String,Object> queryMap = new HashMap<String,Object>();
			queryMap.put("creditCardId", creditCardId);
			queryMap.put("saleDate", saleDate);
			Map obj  = (HashMap) queryForObject("checkIsAlreadyRunPaln", queryMap);
			result = Integer.parseInt(String.valueOf(obj.get("userCreditCardAndPlanCount")));
		  }catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 上个月消费总金额
	 * @param preMonthToday
	 * @param saleDate
	 * @param creditCardId
	 * @return
	 */
	public int getPreMonthOutMoney(String preMonthToday,String saleDate,int creditCardId) {
		int result = 0;
		try{
			Map<String,Object> queryMap = new HashMap<String,Object>();
			queryMap.put("preMonthToday", preMonthToday);
			queryMap.put("saleDate", saleDate);
			queryMap.put("creditCardId", creditCardId);
			Map obj  = (HashMap) queryForObject("queryPreMonthOutMoney", queryMap);
			result = Integer.parseInt(String.valueOf(obj.get("preMonthOutMoney")));
		  }catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 上个月还款金额
	 * @param preMonthToday
	 * @param saleDate
	 * @param creditCardId
	 * @return
	 */
	public  int getPreMonthInMoney(String preMonthToday,String saleDate,int creditCardId) {
		int result = 0;
		try{
			Map<String,Object> queryMap = new HashMap<String,Object>();
			queryMap.put("preMonthToday", preMonthToday);
			queryMap.put("saleDate", saleDate);
			queryMap.put("creditCardId", creditCardId);
			Map obj  = (HashMap) queryForObject("queryPreMonthInMoney", queryMap);
			result = Integer.parseInt(String.valueOf(obj.get("preMonthInMoney")));
		  }catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 上个月帐号金额
	 * @param preMonthToday
	 * @param saleDate
	 * @param creditCardId
	 * @return
	 */
	public int getPreMonthOutSubInMoney(String preMonthToday,String saleDate,int creditCardId) {
		int result = 0;
		try{
			Map<String,Object> queryMap = new HashMap<String,Object>();
			queryMap.put("preMonthToday", preMonthToday);
			queryMap.put("saleDate", saleDate);
			queryMap.put("creditCardId", creditCardId);
			Map obj  = (HashMap) queryForObject("queryPreMonthOutSubInMoney", queryMap);
			result = Integer.parseInt(String.valueOf(obj.get("preMonthOutSubInMoney")));
		  }catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public void exceutePlanFromJava() {
		 batchNo =  generateBatchNo();
		 currentDate  = getCurrentDate();
		 currentDateOfDD = getCurrentDateOfDD();
		nextMonthToday = getNextMonthToday();
		preMonthToday = getPreMonthToday();
		
		billDate =  getBillDay(currentDateOfDD);
		getIntervalDaysOfBill = getIntervalDaysOfBill(nextMonthToday,currentDate)-1;
		credit_bill_date_count = creditCardService.getCreditBillDateCount(billDate);
		billSaleRate = generateBillSaleRate();//70-80
		inMoney = 0;
		
		saleDate = getCurrentDate();
	
		//生计划消费日
		generatePlanDayTmp(getIntervalDaysOfBill);
		
		getMaxSaleDay=getMaxSaleDay();
		
		if(credit_bill_date_count>0) { //账单日数量大于0,开始排计划
			selectUserAndCardOfBillDayList = this.selectUserAndCardOfBillDay(billDate);
			for(int i = 0; i<selectUserAndCardOfBillDayList.size();i++){
				Plan p = (Plan)selectUserAndCardOfBillDayList.get(i);
				
				 preMonthOutMoney = getPreMonthOutMoney(preMonthToday,getCurrentDate(),p.getCreditCardId());//上个月消费总金额
				 preMonthInMoney= getPreMonthInMoney(preMonthToday,getCurrentDate(),p.getCreditCardId());//上个月还款金额
			     preMonthOutSubInMoney=getPreMonthOutSubInMoney(preMonthToday,getCurrentDate(),p.getCreditCardId());//上个月帐号金额
			     
			     repaymentDate = p.getRepaymentDate();
			   
			    	 for(int j=0; j<getIntervalDaysOfBill;j++){
							sumAllMoney = p.getMaxLimit();
							checkSaleDay =checkSaleDay(j+1);
							
							if(j==0){
								cuurentSaleSumMoney = sumAllMoney*billSaleRate/100;
								//remainMoney = sumAllMoney-preMonthOutSubInMoney;
								remainMoney = sumAllMoney;
								saleDate = getCurrentDate();
								planRemainMoney = sumAllMoney-cuurentSaleSumMoney;
								currentMonthSumInMoney = 0;
								//preMonthOutSubInMoneySubcurrentMonthSumInMoney=preMonthOutSubInMoney-currentMonthSumInMoney;
								preMonthOutSubInMoneySubcurrentMonthSumInMoney=sumAllMoney;
							}
							
							userId = p.getUserId();
							
							//还款操作
							inMoney = PlanGenerateRuleFactory.getRandompInMoney(preMonthOutSubInMoney,currentMonthSumInMoney,inMoney,j,repaymentDate,preMonthOutSubInMoneySubcurrentMonthSumInMoney);
							
							currentMonthSumInMoney = currentMonthSumInMoney +inMoney;
							
							
							
							//outMoney = PlanGenerateRuleFactory.getRadomOutMoneyHasBill(remainMoney,j+1,getMaxSaleDay);
							
							if(outMoney<=SIGLE_SALE_MIN_MONEY){
								outMoney = 0;
							}
						
							if(checkSaleDay != 1){
								outMoney = 0;
							}
							
							if(inMoney>0){//还款了，必须刷出，
							
								//int randomNumber=(int)(Math.random()*5)+5;
								int randomNumber=(int)(Math.random()*5+1)*5;
								outMoney = inMoney-randomNumber;
							}
							
							/*if(remainMoney<=planRemainMoney){
								remainMoney =Math.abs(remainMoney+outMoney);
								outMoney=0;
							}*/
							
							remainMoney =Math.abs(realRemainMoney-outMoney+inMoney);
							
							if(outMoney ==0){
								postCardId = getPostCardId(SIGLE_SALE_MIN_MONEY,userId);
							}else {
								postCardId = getPostCardId(outMoney,userId);
							}
							
							saleDate = getSaleDay(saleDate,1);
							//realRemainMoney = remainMoney+planRemainMoney;//实际剩余金额
							
							if(inMoney==0){
								outMoney = realRemainMoney;
								if (outMoney<0){
									outMoney=0;
								}
								remainMoney =0;
							}
							
							if(remainMoney>0) {
								realRemainMoney = remainMoney;
							}else {
								realRemainMoney=0;
							}
							
							/*if(j==0){
								realRemainMoney = remainMoney;
							}*/
							
							p.setBatchNo(batchNo);
							p.setUserId(userId);
							p.setPostCardId(postCardId);
							p.setSaleDate(saleDate);
							p.setSumAllMoney(sumAllMoney);
							p.setInMoney(inMoney);
							p.setOutMoney(outMoney);
							p.setRemainMoney(realRemainMoney);
							p.setExcuteFlag("F");
							p.setCreateBy(userId);
							p.setPostCardId(postCardId);
							p.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
							
							checkIsAlreadyRunPaln = this.checkIsAlreadyRunPaln(p.getCreditCardId(), saleDate);
							
							if(checkIsAlreadyRunPaln == 1){
							}else{
								insertObject(p);
							}
			}
			}
		}
	}
	
	
	
	
	@Override
	public void exceutePlanFromJava2() {
		 batchNo =  generateBatchNo();
		 currentDate  = getCurrentDate();
		 currentDateOfDD = getCurrentDateOfDD();
		nextMonthToday = getNextMonthToday();
		preMonthToday = getPreMonthToday();
		
		billDate =  getBillDay(currentDateOfDD);
		getIntervalDaysOfBill = getIntervalDaysOfBill(nextMonthToday,currentDate)-1;
		credit_bill_date_count = creditCardService.getCreditBillDateCount(billDate);
		billSaleRate = generateBillSaleRate();//70-80
		inMoney = 0;
		
		saleDate = getCurrentDate();
	
		//生计划消费日
		generatePlanDayTmp(getIntervalDaysOfBill);
		
		getMaxSaleDay=getMaxSaleDay();
		
		if(credit_bill_date_count>0) { //账单日数量大于0,开始排计划
			selectUserAndCardOfBillDayList = this.selectUserAndCardOfBillDay(billDate);
			for(int i = 0; i<selectUserAndCardOfBillDayList.size();i++){
				Plan p = (Plan)selectUserAndCardOfBillDayList.get(i);
				
				 preMonthOutMoney = getPreMonthOutMoney(preMonthToday,getCurrentDate(),p.getCreditCardId());//上个月消费总金额
				 preMonthInMoney= getPreMonthInMoney(preMonthToday,getCurrentDate(),p.getCreditCardId());//上个月还款金额
			     preMonthOutSubInMoney=getPreMonthOutSubInMoney(preMonthToday,getCurrentDate(),p.getCreditCardId());//上个月帐号金额
			     
			     repaymentDate = p.getRepaymentDate();
			     
			     if(preMonthOutSubInMoney<=0) {//上个月没呀欠费，消费金额=0||还款金额>消费金额.
				
					for(int j=0; j<getIntervalDaysOfBill;j++){
						sumAllMoney = p.getMaxLimit();
						checkSaleDay =checkSaleDay(j+1);
						
						userId = p.getUserId();
						
						if(j==0){
							cuurentSaleSumMoney = sumAllMoney*billSaleRate/100;
							remainMoney = cuurentSaleSumMoney;
							saleDate = getCurrentDate();
							planRemainMoney = sumAllMoney-remainMoney;
							
							initRemainMoney = ((CreditCard)creditCardService.getInfoByKey(p.getCreditCardId())).getInitRemainMoney();
							//outMoney=sumAllMoney-new BigDecimal(initRemainMoney).intValue();
							outMoney=0;
							checkSaleDay=1;
						}else {
							outMoney = PlanGenerateRuleFactory.getRadomOutMoney(remainMoney,j+1,getMaxSaleDay);
						}
						
						if(outMoney<=SIGLE_SALE_MIN_MONEY){
							outMoney = 0;
						}
					
						if(checkSaleDay != 1){
							outMoney = 0;
						}
						
						remainMoney =remainMoney-outMoney;
						
						if(outMoney ==0){
							postCardId = getPostCardId(SIGLE_SALE_MIN_MONEY,userId);
						}else {
							postCardId = getPostCardId(outMoney,userId);
						}
						
						saleDate = getSaleDay(saleDate,1);
						
						
						realRemainMoney = remainMoney+planRemainMoney;//实际剩余金额
						
						p.setBatchNo(batchNo);
						p.setUserId(userId);
						p.setPostCardId(postCardId);
						p.setSaleDate(saleDate);
						p.setSumAllMoney(sumAllMoney);
						p.setInMoney(inMoney);
						p.setOutMoney(outMoney);
						p.setRemainMoney(realRemainMoney);
						p.setExcuteFlag("F");
						p.setCreateBy(userId);
						p.setPostCardId(postCardId);
						p.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
						
						checkIsAlreadyRunPaln = this.checkIsAlreadyRunPaln(p.getCreditCardId(), saleDate);
						
						if(checkIsAlreadyRunPaln == 1){
						}else{
							insertObject(p);
						}
						}
				     }else {//上个月有消费，欠款.
				    	 for(int j=0; j<getIntervalDaysOfBill;j++){
								sumAllMoney = p.getMaxLimit();
								checkSaleDay =checkSaleDay(j+1);
								
								if(j==0){
									cuurentSaleSumMoney = sumAllMoney*billSaleRate/100;
									remainMoney = sumAllMoney-preMonthOutSubInMoney;
									saleDate = getCurrentDate();
									planRemainMoney = sumAllMoney-cuurentSaleSumMoney;
									currentMonthSumInMoney = 0;
									preMonthOutSubInMoneySubcurrentMonthSumInMoney=preMonthOutSubInMoney-currentMonthSumInMoney;
								}
								
								userId = p.getUserId();
								
								//还款操作
								inMoney = PlanGenerateRuleFactory.getRandompInMoney(preMonthOutSubInMoney,currentMonthSumInMoney,inMoney,j,repaymentDate,preMonthOutSubInMoneySubcurrentMonthSumInMoney);
								
								currentMonthSumInMoney = currentMonthSumInMoney +inMoney;
								
								outMoney = PlanGenerateRuleFactory.getRadomOutMoneyHasBill(remainMoney,j+1,getMaxSaleDay);
								
								if(outMoney<=SIGLE_SALE_MIN_MONEY){
									outMoney = 0;
								}
							
								if(checkSaleDay != 1){
									outMoney = 0;
								}
								
								remainMoney =Math.abs(remainMoney-outMoney+inMoney);
								
								if(remainMoney<=planRemainMoney){
									remainMoney =Math.abs(remainMoney+outMoney);
									outMoney=0;
								}
								
								if(outMoney ==0){
									postCardId = getPostCardId(SIGLE_SALE_MIN_MONEY,userId);
								}else {
									postCardId = getPostCardId(outMoney,userId);
								}
								
								saleDate = getSaleDay(saleDate,1);
								//realRemainMoney = remainMoney+planRemainMoney;//实际剩余金额
								
								if(inMoney>0){//还款了，必须刷出，
								//int randomNumber=(int)(Math.random()*5)+5;
								int randomNumber=(int)(Math.random()*5)+5;
								outMoney = inMoney-randomNumber;
									remainMoney =Math.abs(remainMoney-outMoney);
								}
								
								realRemainMoney = remainMoney;
								
								/*if(j==0){
									realRemainMoney = remainMoney;
								}*/
								
								p.setBatchNo(batchNo);
								p.setUserId(userId);
								p.setPostCardId(postCardId);
								p.setSaleDate(saleDate);
								p.setSumAllMoney(sumAllMoney);
								p.setInMoney(inMoney);
								p.setOutMoney(outMoney);
								p.setRemainMoney(realRemainMoney);
								p.setExcuteFlag("F");
								p.setCreateBy(userId);
								p.setPostCardId(postCardId);
								p.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
								
								checkIsAlreadyRunPaln = this.checkIsAlreadyRunPaln(p.getCreditCardId(), saleDate);
								
								if(checkIsAlreadyRunPaln == 1){
								}else{
									insertObject(p);
								}
								}
				     }
			}
		}
	}
	
	/**
	 * 更新计划
	 * @param plan
	 * @param planId
	 */
	@Transactional
	public void updatePlan(Plan plan, int planId){
		updateObject(plan);
		int currentRemainMoney = plan.getRemainMoney();
		
		Plan planParam =(Plan)getInfoByKey(planId);
		planParam.setBatchNo(planParam.getBatchNo().substring(0, 10));
		
		List<Plan> updatePlanList = queryForList("getPlanInfoForUpdate",planParam);
		
		for(Plan planTmp : updatePlanList){
			int inMoney = planTmp.getInMoney();
			int outMoney = planTmp.getOutMoney();
			int remainMoney = planTmp.getRemainMoney();
			
			remainMoney = currentRemainMoney+ inMoney -outMoney;
			currentRemainMoney = remainMoney;
			planTmp.setRemainMoney(remainMoney);
			updateObject(planTmp);
		}
		
	}
}
