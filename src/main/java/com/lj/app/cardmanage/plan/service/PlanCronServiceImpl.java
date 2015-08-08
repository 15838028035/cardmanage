package com.lj.app.cardmanage.plan.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.lj.app.cardmanage.base.service.BaseServiceImpl;
import com.lj.app.cardmanage.plan.model.Plan;
import com.lj.app.core.common.util.SpringContextHolder;


@Component("taskService")
public class PlanCronServiceImpl extends BaseServiceImpl<Plan> implements PlanCronService<Plan> {  
	
	
    @Scheduled(cron="* * 4  * * ? ")   //每5秒执行一次  
    public void exceutePlanCron(){
    	PlanService<Plan> planService = (PlanService<Plan>) SpringContextHolder.getBean("planService");
    	planService.exceutePlanCron();
    }  
    
}
