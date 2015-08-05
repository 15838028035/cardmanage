package com.lj.app.cardmanage.plan.service;

import java.util.List;

import com.lj.app.cardmanage.base.service.BaseService;

public interface PlanService<Plan> extends BaseService{

	/**
	 * 调用过程，生成计划
	 */
	public void exceutePlanCron();
	
	/**
	 * 生成批次编号
	 * @return
	 */
	public String generateBatchNo();
	
	/**
	 * 获取当前日期
	 * @return
	 */
	public String getCurrentDate();
	
	/**
	 * 获取当前时间中的天
	 * @return
	 */
	public String getCurrentDateOfDD();
	
	/**
	 * 获取账单日
	 * @param CurrentDateOfDD
	 * @return
	 */
	public int getBillDay(String currentDateOfDD);

	/**
	 * 获取下个月的今天
	 * @return
	 */
	public String getNextMonthToday();

	/**
	 * 获取上个月的今天
	 * @return
	 */
	public String getPreMonthToday();

	/**
	 * 计算账单日期相差天数
	 * @param nextMonthToday
	 * @param currentDate
	 * @return
	 */
	public int getIntervalDaysOfBill(String nextMonthToday, String currentDate);
	
	/**
	 * 查找账单日中要生成计划的帐号、卡信息
	 * @param billDay
	 * @return
	 */
	public List<Plan> selectUserAndCardOfBillDay(int billDay);
	
	/**
	 * 生成消费费率
	 * @return
	 */
	public int generateBillSaleRate();
	
	/**
	 * 生成计划消费的日期
	 * @param days
	 * @return
	 */
	public void  generatePlanDayTmp(int days);
	
	/**
	 *是否是消费日
	 * @return
	 */
	public int checkSaleDay(int day);
	
	/**
	 * 获取pos机器编号
	 * @param outMoney
	 * @param userId
	 * @return
	 */
	public int getPostCardId(int outMoney,int userId);
	
	/**
	 * 获取下一个日期
	 * @param outMoney
	 * @param userId
	 * @return
	 */
	public String getSaleDay(String saleDay,int interOfDay);
	
	/**
	 * 根据java代码执行计划
	 */
	public void exceutePlanFromJava();
}
