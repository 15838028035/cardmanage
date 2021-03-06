package com.lj.app.cardmanage.base.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.lj.app.cardmanage.base.model.BaseModel;
import com.lj.app.core.common.pagination.Page;

public interface BaseService<T> {

	public void insertObject(Object obj);

	public void insertObject(String sqlId, Object obj);

	public void updateObject(Object obj);

	public void updateObject(String sqlId, Object obj);

	public BaseModel findObject(String sqlId, Object obj);

	public BaseModel getInfoByKey(String sqlId, Object obj);

	public BaseModel getInfoByKey(Object obj);
	
	public Object queryObject(String sqlId, Object obj);
	
	public Object  queryForObject(String sqlId, Object obj);

	public List<T> findBaseModeList(Object obj);

	public List<T> findBaseModeList(String sqlId, Object obj);

	public List<T> findBaseModePageList(Object obj);

	public List<T> findBaseModePageList(String sqlId, Object obj);

	public void delete(Object obj);

	public void delete(String sqlId, Object obj);

	public String getSqlMapNameSpace();

	public List<T> queryForList(String statementName) throws DataAccessException;

	public List<T> queryForList(String statementName, Object parameterObject);

	public List<T> queryForList(String statementName, int skipResults,	int maxResults) throws DataAccessException;
		

	public List<T> queryForList(String statementName, Object parameterObject,int skipResults, int maxResults) throws DataAccessException;

	public Page<T> findPageList(Page<T> page,Map<String,Object> condition, String sqlId);
	
	public Page<T> findPageList(Page<T> page,Map<String,Object> condition);
	
	public int countObject(String sqlId, Object obj);
}
