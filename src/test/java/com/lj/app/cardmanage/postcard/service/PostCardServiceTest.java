package com.lj.app.cardmanage.postcard.service;


import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lj.app.cardmanage.postcard.model.PostCard;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AbstractBaseSpringTransactionTestCase;
import com.lj.app.core.common.util.DateUtil;

public class PostCardServiceTest extends AbstractBaseSpringTransactionTestCase {

	@Autowired
	private PostCardService postCardService;
	
	@Test
	public void findBaseModeListTest() {
		assertTrue(postCardService.findBaseModeList(null).size()>0);
	}
	
	@Test
	public void findTest(){
	   assertNotNull(postCardService.getInfoByKey(1));
	}
	
	@Test
	public void pagtnateTest() {
		Map condition = new HashMap();
		Page<PostCard> page = new Page<PostCard>(10);
		Page<PostCard> pageList = (Page<PostCard>)postCardService.findPageList(page, condition);
		List<PostCard> list = pageList.getResult();
		
		Assert.assertEquals(10, list.size());
		String result = PageTool.pageToJsonJQGrid(pageList);
		System.out.println("result=" +result);
	}
	
	@Test
	public void insetTest() {
		PostCard  postCard = new  PostCard();
		postCard.setId(1);
		postCard.setPostCardNo("USER1_001");
		postCard.setManName("商户01");
		postCard.setRate(0.38F);
		postCard.setMinMoney(100);
		postCard.setMaxMoney(30000);
		postCard.setTrade("餐饮");
		postCard.setBindBank("中国银行");
		postCard.setCardNo("C001");
		postCard.setUserName("U001");
		 
		postCard.setCreateBy(1);
		postCard.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
		 postCardService.insertObject(postCard);
	}
	
	@Test
	public void updateTest() {
		PostCard  postCard = new  PostCard();
		postCard.setId(1);
		postCard.setPostCardNo("USER1_001");
		postCard.setManName("商户01");
		postCard.setRate(0.38F);
		postCard.setMinMoney(100);
		postCard.setMaxMoney(30000);
		postCard.setTrade("餐饮");
		postCard.setBindBank("中国银行");
		postCard.setCardNo("C001");
		postCard.setUserName("U001");
		 
		postCard.setUpdateBy(1);
		postCard.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
		 postCardService.updateObject(postCard);
	}


}
