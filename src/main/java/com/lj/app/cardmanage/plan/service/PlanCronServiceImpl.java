package com.lj.app.cardmanage.plan.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.lj.app.core.common.util.SpringContextHolder;

@Component("taskService")
public class PlanCronServiceImpl implements PlanCronService {  
	
	
    @Scheduled(cron="*/10 * *  * * ? ")   //每5秒执行一次  
    @Override  
	public void exceutePlanCron(){
    	PlanService planService = (PlanService) SpringContextHolder.getBean("planService");
    	planService.exceutePlanCron();
    }  
    
}
