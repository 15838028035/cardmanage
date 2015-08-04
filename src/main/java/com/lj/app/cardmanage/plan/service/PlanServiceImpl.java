package com.lj.app.cardmanage.plan.service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.lj.app.cardmanage.base.service.BaseServiceImpl;
import com.lj.app.cardmanage.creditcard.service.CreditCardService;
import com.lj.app.cardmanage.plan.model.Plan;
import com.lj.app.core.common.util.DateUtil;

@Service("planService")
public class PlanServiceImpl extends BaseServiceImpl<Plan> implements PlanService<Plan>{
	
	public Log log = LogFactory.getLog(PlanServiceImpl.class);
	
	private String batchNo;//批次编号
	private String currentDate;//当前日期
	String currentDateOfDD;//当天日期
	private int billDate;//账单日期
	private String nextMonthToday;//下个月今天
	private String preMonthToday;//上个月今天
	private int getIntervalDaysOfBill;//下一个账单日-当前日期相差时间
	private int credit_bill_date_count;//信用卡账单日是今天的数量
	
	private List selectUserAndCardOfBillDayList;
	
	private int sumAllMoney;//信用卡总金额
	private int cuurentSaleSumMoney;//当月消费总金额
	private int billSaleRate;//费率
	private int remainMoney;//剩余金额
	private int outMoney;//单笔消费金额
	private int inMoney;//单笔还款金额
	
	private int checkSaleDay;//是否是消费日
	
	private int postCardId;//post机器id
	private int userId;
	private String saleDate = "";
	
	private static final int SIGLE_SALE_MIN_MONEY = 100;//单笔消费最小金额
	
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
			if(CurrentDateOfDD.length()>1){
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
		return this.queryForList("selectUserAndCardOfBillDay", billDay);
	}
	
	/**
	 * 生成消费费率
	 * @return
	 */
	public int generateBillSaleRate(){
		BigDecimal d = new BigDecimal( Math.floor(70+(Math.random()*10)));
		int rate = d.intValue();
		return  rate;
	}

	/**
	 *是否是消费日
	 * @return
	 */
	public int checkSaleDay(int day) {
		
		//TODO:fixme 
		return 1;
	}
	
	/**
	 * 获取pos机器编号
	 * @param outMoney
	 * @param userId
	 * @return
	 */
	public int getPostCardId(int outMoney,int userId){
		return 0;//FIXME 
	}
	
	@Override
	public void exceutePlanFromJava() {
		 batchNo =  generateBatchNo();
		 currentDate  = getCurrentDate();
		 currentDateOfDD = getCurrentDateOfDD();
		nextMonthToday = getNextMonthToday();
		preMonthToday = getPreMonthToday();
		
		billDate =  getBillDay(currentDateOfDD);
		getIntervalDaysOfBill = getIntervalDaysOfBill(nextMonthToday,currentDate);
		credit_bill_date_count = creditCardService.getCreditBillDateCount(billDate);
		billSaleRate = generateBillSaleRate();//70-80
		inMoney = 0;
	
		
		if(credit_bill_date_count>0) { //账单日数量大于0,开始排计划
			selectUserAndCardOfBillDayList = this.selectUserAndCardOfBillDay(billDate);
			for(int i = 0; i<selectUserAndCardOfBillDayList.size();i++){
				Plan p = (Plan)selectUserAndCardOfBillDayList.get(i);
				sumAllMoney = p.getMaxLimit();
				cuurentSaleSumMoney = sumAllMoney*billSaleRate/100;
				remainMoney = cuurentSaleSumMoney;
				checkSaleDay =checkSaleDay(i);
				
				userId = p.getUserId();
				
				if (i<10){
					outMoney=  new BigDecimal(remainMoney*0.25).intValue();
				}else {
					outMoney=  new BigDecimal(remainMoney*Math.floor(5 + (Math.random() * 10))/100).intValue();
				}
			
				if(checkSaleDay != 1){
					outMoney = 0;
				}
				
				remainMoney =remainMoney-outMoney;
				
				postCardId = getPostCardId(outMoney,userId);
				
				p.setBatchNo(batchNo);
				p.setUserId(userId);
				p.setPostCardId(postCardId);
				p.setSaleDate(saleDate);
				p.setSumAllMoney(sumAllMoney);
				p.setInMoney(inMoney);
				p.setOutMoney(outMoney);
				p.setRemainMoney(remainMoney);
				p.setExcuteFlag("F");
				p.setCreateBy(userId);
					
				i++;
			}
		}
	}
	
}
