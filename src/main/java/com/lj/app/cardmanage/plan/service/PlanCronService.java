package com.lj.app.cardmanage.plan.service;

import com.lj.app.cardmanage.base.service.BaseService;

public interface PlanCronService<Plan> extends BaseService{

	/**
	 * 调用过程，生成计划
	 */
	public void exceutePlanCron();
}
