package com.lj.app.cardmanage.postcard.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.base.service.BaseService;
import com.lj.app.cardmanage.postcard.model.PostCard;
import com.lj.app.cardmanage.postcard.service.PostCardService;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.ValidateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/postCard")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/postCard/postCard-input.jsp"),
		@Result(name = AbstractBaseAction.EDIT, location = "/jsp/postCard/postCardList.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "postCardAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/postCard/postCardList.jsp",type=AbstractBaseAction.REDIRECT),
		

})
@SuppressWarnings("unchecked")

@Action("postCardAction")
public class PostCardAction  extends AbstractBaseAction<PostCard> {
	
	private Integer id;
	/**
	 * 机具编号
	 */
	private String postCardNo;
	/**
	 * 商户名字
	 */
	private String manName;
	/**
	 * 费率
	 */
	private float rate;
	/**
	 * 匹配最小额度
	 */
	private int minMoney;
	/**
	 * 匹配最大额度
	 */
	private int maxMoney;
	
	/**
	 * 行业
	 */
	private String trade;
	
	/**
	 * 绑定银行
	 */
	private String bindBank;
	
	/**
	 * 卡号
	 */
	private String cardNo;
	/**
	 * 姓名
	 */
	private String userName;
	private String lockStatus = "0";
	

	@Autowired
	private PostCardService postCardService;
	
	private PostCard postCard;
	
	@Override
	protected BaseService getBaseService() {
		return postCardService;
	}
	
	@Override
	public PostCard getModel() {
		return postCard;
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
			condition.put("postCardNo", postCardNo);
			condition.put("manName", manName);
			condition.put("bindBank", bindBank);
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
		postCard = new PostCard();
		postCardNo = postCardService.generatePostCardNo(getLoginUserId(), getLoginUserName());
		postCard.setPostCardNo(postCardNo);
		return INPUT;
	}

	@Override
	public String save() throws Exception {
		boolean isSave = true;//是否保存操作
		
		try{
			if (operate != null && operate.equals("edit")) {
				isSave = false;
				PostCard postCard = new PostCard();
				postCard.setId(id);
				postCard.setPostCardNo(postCardNo);
				postCard.setManName(manName);
				postCard.setRate(rate);
				postCard.setMinMoney(minMoney);
				postCard.setMaxMoney(maxMoney);
				postCard.setTrade(trade);
				postCard.setBindBank(bindBank);
				postCard.setCardNo(cardNo);
				postCard.setUserName(userName);
				postCard.setLockStatus(lockStatus);
				
				postCard.setUpdateBy(getLoginUserId());
				postCard.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				
				postCardService.updateObject(postCard);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				PostCard postCard = new PostCard();
				postCard.setPostCardNo(postCardNo);
				postCard.setManName(manName);
				postCard.setRate(rate);
				postCard.setMinMoney(minMoney);
				postCard.setMaxMoney(maxMoney);
				postCard.setTrade(trade);
				postCard.setBindBank(bindBank);
				postCard.setCardNo(cardNo);
				postCard.setUserName(userName);
				postCard.setLockStatus(lockStatus);
				
				postCard.setCreateBy(getLoginUserId());
				postCard.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				
				postCardService.insertObject(postCard);
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
			postCard = (PostCard)postCardService.getInfoByKey(id);
		}else {
			postCard = new PostCard();
			postCardNo = postCardService.generatePostCardNo(getLoginUserId(), getLoginUserName());
			postCard.setPostCardNo(postCardNo);
		}
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
				postCardService.delete(deleteId);
			}catch(Exception e){
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPostCardNo() {
		return postCardNo;
	}

	public void setPostCardNo(String postCardNo) {
		this.postCardNo = postCardNo;
	}

	public String getManName() {
		return manName;
	}

	public void setManName(String manName) {
		this.manName = manName;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public int getMinMoney() {
		return minMoney;
	}

	public void setMinMoney(int minMoney) {
		this.minMoney = minMoney;
	}

	public int getMaxMoney() {
		return maxMoney;
	}

	public void setMaxMoney(int maxMoney) {
		this.maxMoney = maxMoney;
	}

	public String getTrade() {
		return trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public String getBindBank() {
		return bindBank;
	}

	public void setBindBank(String bindBank) {
		this.bindBank = bindBank;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String getMultidelete() {
		return multidelete;
	}

	@Override
	public void setMultidelete(String multidelete) {
		this.multidelete = multidelete;
	}

	@Override
	public Page<PostCard> getPage() {
		return page;
	}

	@Override
	public void setPage(Page<PostCard> page) {
		this.page = page;
	}

	public PostCard getPostCard() {
		return postCard;
	}

	public void setPostCard(PostCard postCard) {
		this.postCard = postCard;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public PostCardService getPostCardService() {
		return postCardService;
	}

	public void setPostCardService(PostCardService postCardService) {
		this.postCardService = postCardService;
	}

	public String getLockStatus() {
		return lockStatus;
	}

	public void setLockStatus(String lockStatus) {
		this.lockStatus = lockStatus;
	}
}
