package com.lj.app.cardmanage.sysconfig.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.cardmanage.base.service.BaseService;
import com.lj.app.cardmanage.sysconfig.model.CMPermission;
import com.lj.app.cardmanage.sysconfig.service.CMPermissionService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/CMPermission")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/CMPermission/CMPermission-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "postCardAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/CMPermission/CMPermissionList.jsp",type=AbstractBaseAction.REDIRECT),
		

})
@SuppressWarnings("unchecked")

@Action("cMPermissionAction")
public class CMPermissionAction  extends AbstractBaseAction<CMPermission> {

	@Autowired
	private CMPermissionService cMPermissionService;
	
	private int id;
	private String code;
	private String name;
	private String url;
	
	private CMPermission cMPermission;
	
	public   BaseService getBaseService(){
		return cMPermissionService;
	}
	
	@Override
	public CMPermission getModel() {
		cMPermission = (CMPermission)cMPermissionService.getInfoByKey(id);
		return cMPermission;
	}

	@Override
	public String list() throws Exception {
		try {
			Map condition = new HashMap();
			this.cMPermissionService.findPageList(page, condition);
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
				CMPermission cMPermission = new CMPermission();
				cMPermission.setId(id);
				cMPermission.setName(name);
				cMPermission.setUrl(url);
				
				cMPermission.setUpdateBy(getLoginUserId());
				cMPermission.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				
				cMPermissionService.updateObject(cMPermission);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				CMPermission cMPermission = new CMPermission();
				cMPermission.setId(id);
				cMPermission.setName(name);
				cMPermission.setUrl(url);
				
				cMPermission.setCreateBy(getLoginUserId());
				cMPermission.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				
				cMPermissionService.insertObject(cMPermission);
				returnMessage = CREATE_SUCCESS;
			}
			
			return LIST;
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
			int deleteId = Integer.parseInt(multideleteTemp[i].trim());
			
			try{
				// 循环删除
				cMPermissionService.delete(deleteId);
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


	public CMPermissionService getcMPermissionService() {
		return cMPermissionService;
	}

	public void setcMPermissionService(CMPermissionService cMPermissionService) {
		this.cMPermissionService = cMPermissionService;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public CMPermission getcMPermission() {
		return cMPermission;
	}

	public void setcMPermission(CMPermission cMPermission) {
		this.cMPermission = cMPermission;
	}

}
