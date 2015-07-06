package com.lj.app.cardmanage.sysconfig.service;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.lj.app.cardmanage.base.service.BaseServiceImpl;
import com.lj.app.cardmanage.sysconfig.model.CMPermission;

@Service("cMPermissionService")
public class CMPermissionServiceImpl extends BaseServiceImpl<CMPermission> implements CMPermissionService<CMPermission>{

	@Override
	public Set<String> findPermissionUrl() {
		List CMPermissionList =findBaseModeList(null);
		
		Set<String> CMPermissionSet = new HashSet<String>();
		
		for(int i=0 ;i <CMPermissionList.size();i++ ){
			CMPermission permission = (CMPermission )CMPermissionList.get(i);
			CMPermissionSet.add(permission.getUrl());
			
		}
		return CMPermissionSet;
	}

}
