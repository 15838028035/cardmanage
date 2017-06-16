package com.lj.app.cardmanage.creditcard.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.base.service.BaseService;
import com.lj.app.cardmanage.creditcard.model.CreditCard;
import com.lj.app.cardmanage.creditcard.service.CreditCardService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.ValidateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/creditCard")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/creditCard/creditCard-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "creditCardAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/creditCard/creditCardList.jsp" ,type=AbstractBaseAction.REDIRECT),

})
@SuppressWarnings("unchecked")

@Action("creditCardAction")
public class CreditCardAction  extends AbstractBaseAction<CreditCard> {

	@Autowired
	private CreditCardService creditCardService;
	
	private CreditCard creditCard;
	
	private Integer id;
	private String cardNo;
	private String bankNo;
	private String userName;
	private float  maxLimit;//额度
	private String secNo;//安全码
	private String validateDate;//有效期
	private Integer billDate;//账单日期
	private int repaymentDate;//还款日
	private float serviceRate;//服务费率
	private float initRemainMoney;//初始剩余金额
	private String cardNoProfile;//自定义编号
	private String lockStatus = "0";
	
	
	@Override
	protected BaseService getBaseService() {
		return creditCardService;
	}
	
	@Override
	public CreditCard getModel() {
		return creditCard;
	}

	@Override
	public String list() throws Exception {
		return null;
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
			condition.put("cardNo",cardNo);
			condition.put("userName", userName);
			condition.put("bankNo", bankNo);
			condition.put("cardNoProfile", cardNoProfile);
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
			if (operate != null && operate.equals("edit")) {
				isSave = false;
				creditCard = new CreditCard();
				creditCard.setId(id);
				creditCard.setCardNo(cardNo);
				creditCard.setBankNo(bankNo);
				creditCard.setUserName(userName);
				creditCard.setMaxLimit(maxLimit);
				creditCard.setSecNo(secNo);
				
				creditCard.setValidateDate(validateDate);
				creditCard.setBillDate(billDate);
				creditCard.setRepaymentDate(repaymentDate);
				
				creditCard.setUpdateBy(getLoginUserId());
				creditCard.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				creditCard.setServiceRate(serviceRate);
				creditCard.setInitRemainMoney(initRemainMoney);
				creditCard.setCardNoProfile(cardNoProfile);
				creditCard.setLockStatus(lockStatus);
				
				creditCardService.updateObject(creditCard);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				creditCard = new CreditCard();
				creditCard.setId(id);
				creditCard.setCardNo(cardNo);
				creditCard.setBankNo(bankNo);
				creditCard.setUserName(userName);
				creditCard.setMaxLimit(maxLimit);
				creditCard.setSecNo(secNo);
				
				creditCard.setValidateDate(validateDate);
				creditCard.setBillDate(billDate);
				creditCard.setRepaymentDate(repaymentDate);
				
				creditCard.setCreateBy(getLoginUserId());
				creditCard.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				creditCard.setServiceRate(serviceRate);
				creditCard.setInitRemainMoney(initRemainMoney);
				creditCard.setCardNoProfile(cardNoProfile);
				creditCard.setLockStatus(lockStatus);
				
				creditCardService.insertObject(creditCard);
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

	@Override
	protected void prepareModel() throws Exception {
		
		if(id!=null){
			creditCard = (CreditCard)creditCardService.getInfoByKey(id);
		}else {
			creditCard =new CreditCard();
		}
	}
	
	
	public String multidelete() throws Exception {
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
				creditCardService.delete(deleteId);
			}catch(Exception e){
				returnMessage = "删除失败";
				e.printStackTrace();
				throw e;
			}finally{
			}
		}
		AjaxResult ar = new AjaxResult();
		if (returnMessage.equals("")) {
			ar.setOpResult(DELETE_SUCCESS);//删除成功！
		}else{
			ar.setOpResult(DELETE_FAILURE);
		}
		
		Struts2Utils.renderJson(ar);
		return null;
	}

	@Override
	public String getMultidelete() {
		return multidelete;
	}

	@Override
	public void setMultidelete(String multidelete) {
		this.multidelete = multidelete;
	}

	public CreditCardService getCreditCardService() {
		return creditCardService;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public CreditCard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public float getMaxLimit() {
		return maxLimit;
	}

	public void setMaxLimit(float maxLimit) {
		this.maxLimit = maxLimit;
	}

	public String getSecNo() {
		return secNo;
	}

	public void setSecNo(String secNo) {
		this.secNo = secNo;
	}

	public String getValidateDate() {
		return validateDate;
	}

	public void setValidateDate(String validateDate) {
		this.validateDate = validateDate;
	}

	public int getBillDate() {
		return billDate;
	}

	public void setBillDate(int billDate) {
		this.billDate = billDate;
	}

	public int getRepaymentDate() {
		return repaymentDate;
	}

	public void setRepaymentDate(int repaymentDate) {
		this.repaymentDate = repaymentDate;
	}

	public float getServiceRate() {
		return serviceRate;
	}

	public void setServiceRate(float serviceRate) {
		this.serviceRate = serviceRate;
	}

	public float getInitRemainMoney() {
		return initRemainMoney;
	}

	public void setInitRemainMoney(float initRemainMoney) {
		this.initRemainMoney = initRemainMoney;
	}

	public String getCardNoProfile() {
		return cardNoProfile;
	}

	public void setCardNoProfile(String cardNoProfile) {
		this.cardNoProfile = cardNoProfile;
	}

	public String getLockStatus() {
		return lockStatus;
	}
	public void setLockStatus(String lockStatus) {
		this.lockStatus = lockStatus;
	}
}
