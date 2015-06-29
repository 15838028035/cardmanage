package com.lj.app.cardmanage.postcard.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.postcard.model.PostCard;
import com.lj.app.cardmanage.postcard.service.PostCardService;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/postCard")
@Results({
		@Result(name = AbstractBaseAction.EDIT, location = "/jsp/postCard/postCard-edit.jsp"),
		@Result(name = AbstractBaseAction.INPUT, location = "postCardAction!edit.action",type = "redirect")

})
@SuppressWarnings("unchecked")

@Action("postCardAction")
public class PostCardAction  extends AbstractBaseAction<PostCard> {
	
	private int id;
	/**
	 * POS机编号
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
	
	/**
	 * 多选删除
	 */
	private String multidelete;
	
	private Page<PostCard> page = new Page<PostCard>(PAGESIZE);
	

	@Autowired
	private PostCardService PostCardService;
	
	private PostCard PostCard;
	
	
	@Override
	public PostCard getModel() {
		PostCard = (PostCard)PostCardService.getInfoByKey(id);
		return PostCard;
	}

	@Override
	public String list() throws Exception {
		try {
			String param = ServletActionContext.getRequest().getParameter("param");
			Map condition = new HashMap();
			
			this.PostCardService.findPageList(page, condition);
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
		PostCardService.insertObject(postCard);
		return null;
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
				PostCardService.delete("delete");
			}catch(Exception e){
				e.printStackTrace();
				throw e;
			}finally{
			}
		}
		AjaxResult ar = new AjaxResult();
		if (returnMessage.equals("")) {
			ar.setOpResult(getText("deleteSuccess"));//删除成功！
		}else{
			ar.setOpResult(returnMessage);
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

	public PostCardService getPostCardService() {
		return PostCardService;
	}

	public void setPostCardService(PostCardService postCardService) {
		PostCardService = postCardService;
	}

	public PostCard getPostCard() {
		return PostCard;
	}

	public void setPostCard(PostCard postCard) {
		PostCard = postCard;
	}
	
}
