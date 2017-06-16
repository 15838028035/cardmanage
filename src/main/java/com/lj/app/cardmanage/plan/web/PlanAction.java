package com.lj.app.cardmanage.plan.web;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.base.service.BaseService;
import com.lj.app.cardmanage.plan.model.Plan;
import com.lj.app.cardmanage.plan.service.PlanService;
import com.lj.app.cardmanage.postcard.model.PostCard;
import com.lj.app.cardmanage.postcard.service.PostCardService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.ExcelUtil;
import com.lj.app.core.common.util.ValidateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/plan")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/plan/plan-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "planAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/plan/planList.jsp",type=AbstractBaseAction.REDIRECT)
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
	private String saleDateStratParam;
	private String saleDateEndParam;
	private String postCardNo;
	
	private int inMoney;
	private int outMoney;
	private int remainMoney;
	private String cardNoProfile;//自定义编号
	
	/**
	 * post机编号
	 */
	private int postCardId;
	
	
	/**
	 * 服务费率统计
	 */
	private String serviceRateSumFormat;
	
	/**
	 * 手续费统计
	 */
	private String poundageSumFormat;
	
	/**
	 * 收益金额统计
	 */
	private String incomeMoneySumFormat;
	
	@Autowired
	private PlanService planService;
	
	private Plan plan;
	
	private List<PostCard> postCardList;
	
	@Autowired
	private PostCardService postCardService;
	
	public   BaseService getBaseService(){
		return planService;
	}
	
	
	@Override
	public Plan getModel() {
		plan = (Plan)planService.getInfoByKey(id);
		return plan;
	}

	@Override
	public String list() throws Exception {
		try {
			
			if (ValidateUtil.isNotEmpty(this.getSidx())) {
				String orderBy =this.getSidx() + " " + this.getSord();
				page.setSortColumns(orderBy);
			}
			
			Map condition = new HashMap();
			condition.put("userName", userName);
			condition.put("cardNo", cardNo);
			condition.put("cardNoProfile", cardNoProfile);
			condition.put("saleDateStratParam", saleDateStratParam);
			condition.put("saleDateEndParam", saleDateEndParam);
			condition.put("postCardNo", postCardNo);
			condition.put(CREATE_BY, getLoginUserId());
			
			this.planService.findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page),new String[0]);
			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 公共bootStrapList查询方法
	 * @return
	 * @throws Exception
	 */
	public String bootStrapList() throws Exception {
		try {
			
			if (ValidateUtil.isNotEmpty(this.getSidx())) {
				String orderBy =this.getSidx() + " " + this.getSord();
				page.setSortColumns(orderBy);
			}
			
			Map condition = new HashMap();
			condition.put("userName", userName);
			condition.put("cardNo", cardNo);
			condition.put("cardNoProfile", cardNoProfile);
			condition.put("saleDateStratParam", saleDateStratParam);
			condition.put("saleDateEndParam", saleDateEndParam);
			condition.put("postCardNo", postCardNo);
			condition.put(CREATE_BY, getLoginUserId());
			
			page.setFilters(getModel());
			
			if (this.getSortName()!=null) {
				String orderBy =this.getSortName() + " "+ this.getSortOrder();
				page.setSortColumns(orderBy);
			}
			
			page = getBaseService().findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page),new String[0]);
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
				plan.setPostCardId(postCardId);
				
				plan.setUpdateBy(getLoginUserId());
				plan.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				
				planService.updatePlan(plan, id);
				
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
			
			return INPUT;
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
				planService.updateObject("updateExecuteState",p);
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
	
	public String exportExcel() throws  Exception{
		ExcelUtil excel=new ExcelUtil();
		Map condition = new HashMap();
		condition.put("userName",  java.net.URLDecoder.decode(userName, "UTF-8"));
		condition.put("cardNo", cardNo);
		condition.put("cardNoProfile", cardNoProfile);
		condition.put("saleDateStratParam", saleDateStratParam);
		condition.put("saleDateEndParam", saleDateEndParam);
		condition.put("postCardNo", java.net.URLDecoder.decode(postCardNo, "UTF-8"));
		condition.put(CREATE_BY, getLoginUserId());
		List<LinkedHashMap> li=planService.queryForList("exportExcel",condition);  
	    String[] Title={"编号","信用卡卡号","银行","消费日期","总金额","还款金额","消费金额","剩余金额","用户名","机具编号","账单日","还款日","执行"};  
	    //String[] Title={"编号","信用卡卡号","银行","消费日期","总金额","还款金额","消费金额","剩余金额","用户名","机具编号","商户名","费率","账单日","还款日","服务费","手续费","收益","执行"};
	    ExcelUtil.exportExcel("计划信息.xls",Title, li);   
	    return null;  
	}
	
	public String exportSumExcel() throws  Exception{
		ExcelUtil excel=new ExcelUtil();
		Map condition = new HashMap();
		condition.put("userName",  java.net.URLDecoder.decode(userName, "UTF-8"));
		condition.put("cardNo", cardNo);
		condition.put("cardNoProfile", cardNoProfile);
		condition.put("saleDateStratParam", saleDateStratParam);
		condition.put("saleDateEndParam", saleDateEndParam);
		condition.put("postCardNo", java.net.URLDecoder.decode(postCardNo, "UTF-8"));
		condition.put(CREATE_BY, getLoginUserId());
		List<LinkedHashMap> li=planService.queryForList("exportSumExcel",condition);  
	    String[] Title={"商铺名字","法人名字","刷卡金额","刷卡费率","到账金额","手续费"};  
	    ExcelUtil.exportExcel("机具流水.xls",Title, li);   
	    return null;  
	}
	
	public String sumCalc()  throws Exception{
		String operateResult = null;//操作结果：1失败，0成功
		
		String returnMessage = "";
		AjaxResult ar = new AjaxResult();
		
		Map condition = new HashMap();
		condition.put("userName", java.net.URLDecoder.decode(userName, "UTF-8"));
		condition.put("cardNo", cardNo);
		condition.put("cardNoProfile", cardNoProfile);
		condition.put("saleDateStratParam", saleDateStratParam);
		condition.put("saleDateEndParam", saleDateEndParam);
		condition.put("postCardNo", java.net.URLDecoder.decode(postCardNo, "UTF-8"));
		condition.put(CREATE_BY, getLoginUserId());
		
		
		List<Plan> planCalcList = this.planService.queryForList("planCalc", condition);
		
		if(planCalcList!=null&&planCalcList.size()>0){
			Plan planCalc = planCalcList.get(0);
			String inMoneySumFormat = planCalc.getInMoneySumFormat();
			String outMoneySumFormat = planCalc.getOutMoneySumFormat();
			returnMessage="还款总金额:"+inMoneySumFormat+"<br/> 消费总金额:"+outMoneySumFormat+"<br/> 服务费总计:" + planCalc.getServiceRateSumFormat() + "<br/> 手续费总计:"+planCalc.getPoundageSumFormat()+ "<br/>  收益总计:"+planCalc.getIncomeMoneySumFormat()+"<br/>";
		}
		
		if (!returnMessage.equals("")) {
			ar.setOpResult(returnMessage);
		}else{
			returnMessage="服务费总计:0,手续费总计:0,收益总计:0";
			ar.setOpResult(returnMessage);
		}
		
		Struts2Utils.renderJson(ar);
		return null;
	}

	@Override
	protected void prepareModel() throws Exception {
		plan = (Plan)planService.getInfoByKey(id);
		Map<String,Object> filterMap = new HashMap<String,Object>();
		filterMap.put("createBy", this.getLoginUserId());
		filterMap.put("lockStatus", "0");
		postCardList = postCardService.queryForList("select",filterMap);
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

	public String getSaleDateStratParam() {
		return saleDateStratParam;
	}

	public void setSaleDateStratParam(String saleDateStratParam) {
		this.saleDateStratParam = saleDateStratParam;
	}

	public String getSaleDateEndParam() {
		return saleDateEndParam;
	}

	public void setSaleDateEndParam(String saleDateEndParam) {
		this.saleDateEndParam = saleDateEndParam;
	}

	public String getServiceRateSumFormat() {
		return serviceRateSumFormat;
	}

	public void setServiceRateSumFormat(String serviceRateSumFormat) {
		this.serviceRateSumFormat = serviceRateSumFormat;
	}

	public String getPoundageSumFormat() {
		return poundageSumFormat;
	}

	public void setPoundageSumFormat(String poundageSumFormat) {
		this.poundageSumFormat = poundageSumFormat;
	}

	public String getIncomeMoneySumFormat() {
		return incomeMoneySumFormat;
	}

	public void setIncomeMoneySumFormat(String incomeMoneySumFormat) {
		this.incomeMoneySumFormat = incomeMoneySumFormat;
	}

	public String getCardNoProfile() {
		return cardNoProfile;
	}

	public void setCardNoProfile(String cardNoProfile) {
		this.cardNoProfile = cardNoProfile;
	}

	public String getPostCardNo() {
		return postCardNo;
	}

	public void setPostCardNo(String postCardNo) {
		this.postCardNo = postCardNo;
	}

	public List<PostCard> getPostCardList() {
		return postCardList;
	}

	public void setPostCardList(List<PostCard> postCardList) {
		this.postCardList = postCardList;
	}

	public PostCardService getPostCardService() {
		return postCardService;
	}
	public void setPostCardService(PostCardService postCardService) {
		this.postCardService = postCardService;
	}

	public int getPostCardId() {
		return postCardId;
	}

	public void setPostCardId(int postCardId) {
		this.postCardId = postCardId;
	}
	
}
