package com.lj.app.cardmanage.postcard.service;

import com.lj.app.cardmanage.base.service.BaseService;

public interface PostCardService extends BaseService{

	/**
	 * 生成post机器卡片编号
	 * @return
	 */
	public String generatePostCardNo(int userId,String userName);
}
