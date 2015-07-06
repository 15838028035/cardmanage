package com.lj.app.cardmanage.base.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.lj.app.cardmanage.base.model.BaseModel;

public interface BaseDao<T>{

	void insertObject(String sqlid, Object obj);

	void updateObject(String sqlId, Object obj);

	void deleteObject(String sqlId, Object obj);

	BaseModel findObject(String sqlId, Object obj);
	
	Object queryForObject(String sqlId, Object obj);

	BaseModel getInfoByKey(String sqlId, Object obj);

	List<BaseModel> findBaseModeList(String sqlId, Object obj);

	List<BaseModel> findBaseModePageList(String sqlId, Object obj);
	
    public List queryForList(String statementName) throws DataAccessException ;
    public List queryForList(String statementName, Object parameterObject);
    
    public List queryForList(String statementName, int skipResults, int maxResults) throws DataAccessException;
    
    public List queryForList(String statementName, Object parameterObject, int skipResults, int maxResults)
    	    throws DataAccessException;
    
    public int countObject(String sqlId, Object obj);

}
