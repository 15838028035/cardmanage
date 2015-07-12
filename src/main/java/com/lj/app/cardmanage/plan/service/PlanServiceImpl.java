package com.lj.app.cardmanage.plan.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.lj.app.cardmanage.base.service.BaseServiceImpl;

@Service("planService")
public class PlanServiceImpl<Plan> extends BaseServiceImpl<Plan> implements PlanService<Plan>{
	
	public Log log = LogFactory.getLog(PlanServiceImpl.class);

	@Override
	public void exceutePlanCron() {
		
	  log.debug("Start to  exceutePlanCron  ........");
		
	 String param1 = "param1";
	 String param2 = "param2";
		
	  Map<String, Object> paramMap = new HashMap<String, Object>();
	  paramMap.put("param1", param1);
	  paramMap.put("param2", param2);
	  this.queryObject("exceutePlanCron", paramMap);
	  int id =  (Integer)paramMap.get("p_val");
	  
	  log.debug("execute output id = "+ id);
	  log.debug("End  exceutePlanCron  ........");
		  
	}
	
}
