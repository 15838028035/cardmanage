package com.lj.app.cardmanage.creditcard.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.creditcard.model.CreditCard;
import com.lj.app.cardmanage.creditcard.service.CreditCardService;
import com.lj.app.cardmanage.postcard.model.PostCard;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/creditCard")
@Results({
		@Result(name = AbstractBaseAction.EDIT, location = "creditCard-edit.jlsp"),
		@Result(name = AbstractBaseAction.INPUT, location = "creditCardAction!edit.action",type = "redirect")

})
@SuppressWarnings("unchecked")

@Action("creditCardAction")
public class CreditCardAction  extends AbstractBaseAction<CreditCard> {
	
	/**
	 * 多选删除
	 */
	private String multidelete;
	
	private Page<PostCard> page = new Page<PostCard>(PAGESIZE);
	

	@Autowired
	private CreditCardService creditCardService;
	
	private CreditCard creditCard;
	
	private int id;
	private String cardNo;
	private String bankNo;
	private String userName;
	private float  maxLimit;//额度
	private String secNo;//安全码
	private String validateDate;//有效期
	private int billDate;//账单日期
	private int repaymentDate;//还款日
	
	
	@Override
	public CreditCard getModel() {
		creditCard = (CreditCard)creditCardService.getInfoByKey(id);
		return creditCard;
	}

	@Override
	public String list() throws Exception {
		try {
			String param = ServletActionContext.getRequest().getParameter("param");
			Map condition = new HashMap();
			this.creditCardService.findPageList(page, condition);
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
			long deleteId = Long.parseLong(multideleteTemp[i].trim());
			
			try{
				// 循环删除
				creditCardService.delete("delete");
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

	public String getMultidelete() {
		return multidelete;
	}

	public void setMultidelete(String multidelete) {
		this.multidelete = multidelete;
	}

	public Page<PostCard> getPage() {
		return page;
	}

	public void setPage(Page<PostCard> page) {
		this.page = page;
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

}
