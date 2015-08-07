package com.lj.app.cardmanage.user.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.lj.app.cardmanage.user.model.User;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.des.DesUtil;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-base.xml")
@Transactional  
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)  
public class UserServiceTest {

	@Autowired
	private UserService userService;
	
	@Test
	public void findBaseModeListTest() {
		Assert.assertTrue(userService.findBaseModeList(null).size()>0);
	}
	
	@Test
	public void findTest(){
	    Assert.assertNotNull(userService.getInfoByKey(1));
	}
	
	@Test
	public void pagtnateTest() {
		Map condition = new HashMap();
		Page<User> page = new Page<User>(10);
		Page<User> pageUser = (Page<User>)userService.findPageList(page, condition);
		List<User> userList = pageUser.getResult();
		
		Assert.assertEquals(10, userList.size());
		String result = PageTool.pageToJsonJQGrid(pageUser);
		System.out.println("result=" +result);
	}
	
	@Test
	public void insetTest() {
		User user = new User();
		user.setLoginNo("111");
		user.setUserName("user111");
		user.setCardNo("11001");
		user.setAddress("111");
		user.setMobile("1111111");
		user.setCreateBy(1);
		user.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
		userService.insertObject(user);
	}
	
}
