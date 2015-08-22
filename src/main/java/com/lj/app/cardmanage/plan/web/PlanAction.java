package com.lj.app.cardmanage.plan.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.plan.model.Plan;
import com.lj.app.cardmanage.plan.service.PlanService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/plan")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/plan/plan-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "planAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/plan/planList.jsp", type=AbstractBaseAction.REDIRECT)
})
@SuppressWarnings("unchecked")

@Action("planAction")
public class PlanAction extends AbstractBaseAction<Plan> {
	
	private int id=-1;
	
	private String lockStatus;
	private String enableFlag;
	
	private String userName;
	private String cardNo;
	private String saleDate;
	
	private int inMoney;
	private int outMoney;
	private int remainMoney;
	
	
	@Autowired
	private PlanService planService;
	
	private Plan plan;
	
	
	@Override
	public Plan getModel() {
		plan = (Plan)planService.getInfoByKey(id);
		return plan;
	}

	@Override
	public String list() throws Exception {
		try {
			Map condition = new HashMap();
			condition.put("userName", userName);
			condition.put("cardNo", cardNo);
			condition.put("saleDate", saleDate);
			condition.put(CREATE_BY, getLoginUserId());
			
			this.planService.findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public String input() throws Exception {
		return INPUT;
	}

	@Override
	public String save() throws Exception {
	boolean isSave = true;//是否保存操作
		
	try{
			//TODO:FIXME 修改代码，实现计划管理功能
			if (operate != null && operate.equals("edit")) {
				isSave = false;
				Plan plan = new Plan();
				
				plan.setId(id);
				plan.setInMoney(inMoney);
				plan.setOutMoney(outMoney);
				plan.setRemainMoney(remainMoney);
				
				plan.setUpdateBy(getLoginUserId());
				plan.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				planService.updateObject(plan);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				Plan plan = new Plan();
				
				plan.setId(id);
				plan.setInMoney(inMoney);
				plan.setOutMoney(outMoney);
				plan.setRemainMoney(remainMoney);
				
				plan.setCreateBy(getLoginUserId());
				plan.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				planService.insertObject(plan);
				returnMessage = CREATE_SUCCESS;
			}
			
			return LIST;
		}catch(Exception e){
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}finally{
		}
		
	}

	@Override
	public String delete() throws Exception {
		return null;
	}
	
	public String multidelete() throws Exception {
		String operateResult = null;//操作结果：1失败，0成功
		
		String returnMessage = "";
		String[] multideleteTemp;
		if (multidelete.indexOf(",") > 0) {
			multideleteTemp = multidelete.split(",");
		}
		else{
			multideleteTemp = new String[]{multidelete};
		}
		for (int i = 0; i < multideleteTemp.length; i++) {
			int deleteId = Integer.parseInt(multideleteTemp[i].trim());
			
			try{
				// 循环删除
				planService.delete(deleteId);
			}catch(Exception e){
				returnMessage = "删除失败";
				e.printStackTrace();
				throw e;
			}finally{
			}
		}
		AjaxResult ar = new AjaxResult();
		if (returnMessage.equals("")) {
			ar.setOpResult("删除成功");//删除成功！
		}else{
			ar.setOpResult(returnMessage);
		}
		
		Struts2Utils.renderJson(ar);
		return null;
	}

	
	public String multiExecute() throws Exception {
		String operateResult = null;//操作结果：1失败，0成功
		
		String returnMessage = "";
		String[] multideleteTemp;
		if (multidExecute.indexOf(",") > 0) {
			multideleteTemp = multidExecute.split(",");
		}
		else{
			multideleteTemp = new String[]{multidExecute};
		}
		for (int i = 0; i < multideleteTemp.length; i++) {
			int multidExecuteId = Integer.parseInt(multideleteTemp[i].trim());
			
			try{
				Plan p = new Plan();
				p.setId(multidExecuteId);
				p.setExcuteFlag("T");
				planService.updateObject(p);
			}catch(Exception e){
				returnMessage = "执行失败";
				e.printStackTrace();
				throw e;
			}finally{
			}
		}
		AjaxResult ar = new AjaxResult();
		if (returnMessage.equals("")) {
			ar.setOpResult("执行成功");
		}else{
			ar.setOpResult(returnMessage);
		}
		
		Struts2Utils.renderJson(ar);
		return null;
	}

	

	@Override
	protected void prepareModel() throws Exception {
		plan = (Plan)planService.getInfoByKey(id);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLockStatus() {
		return lockStatus;
	}

	public void setLockStatus(String lockStatus) {
		this.lockStatus = lockStatus;
	}

	public String getEnableFlag() {
		return enableFlag;
	}

	public void setEnableFlag(String enableFlag) {
		this.enableFlag = enableFlag;
	}

	public PlanService getPlanService() {
		return planService;
	}

	public void setPlanService(PlanService planService) {
		this.planService = planService;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public int getInMoney() {
		return inMoney;
	}

	public void setInMoney(int inMoney) {
		this.inMoney = inMoney;
	}

	public int getOutMoney() {
		return outMoney;
	}

	public void setOutMoney(int outMoney) {
		this.outMoney = outMoney;
	}

	public int getRemainMoney() {
		return remainMoney;
	}

	public void setRemainMoney(int remainMoney) {
		this.remainMoney = remainMoney;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}
}
