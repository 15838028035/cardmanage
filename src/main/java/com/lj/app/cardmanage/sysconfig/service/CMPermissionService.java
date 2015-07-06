package com.lj.app.cardmanage.sysconfig.service;

import java.util.Set;

import com.lj.app.cardmanage.base.service.BaseService;

public interface CMPermissionService<CMPermission> extends BaseService{
	/**
	 * 根据domainId查询所有权限对应的URL列表
	 * @return 权限点对应的URL集合
	 */
	public Set<String> findPermissionUrl();
}
