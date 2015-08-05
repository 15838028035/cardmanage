package com.lj.app.cardmanage.base.dao;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lj.app.cardmanage.base.model.BaseModel;


@Component("baseDao")
public class BaseDaoImpl<T> extends SqlMapClientDaoSupport implements BaseDao{

	
	@Resource(name = "sqlMapClient")    
	private SqlMapClient sqlMapClient;   
	
	@PostConstruct     
	public void initSqlMapClient(){      
		super.setSqlMapClient(sqlMapClient);   
	} 
	
	@Override
	public void insertObject(String sqlId, Object obj) {
		getSqlMapClientTemplate().insert(sqlId, obj);
	}

	@Override
	public void updateObject(String sqlId, Object obj) {
		getSqlMapClientTemplate().update(sqlId,obj);
		
	}

	@Override
	public void deleteObject(String sqlId, Object obj) {
		getSqlMapClientTemplate().delete(sqlId, obj);
	}

	@Override
	public BaseModel findObject(String sqlId, Object obj) {
		return (BaseModel)getSqlMapClientTemplate().queryForObject(sqlId, obj);
	}
	
	@Override
	public Object queryForObject(String sqlId, Object obj) {
		return getSqlMapClientTemplate().queryForObject(sqlId, obj);
	}
	

	@Override
	public BaseModel getInfoByKey(String sqlId, Object obj) {
		return (BaseModel)getSqlMapClientTemplate().queryForObject(sqlId, obj);
	}

	@Override
	public List<BaseModel> findBaseModeList(String sqlId, Object obj) {
		return getSqlMapClientTemplate().queryForList(sqlId,obj);
	}

	@Override
	public List<BaseModel> findBaseModePageList(String sqlId, Object obj) {
		return getSqlMapClientTemplate().queryForList(sqlId,obj);
	}

	@Override
	public List queryForList(String statementName) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statementName);
	}

	@Override
	public List queryForList(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().queryForList(statementName,parameterObject);
	}

	@Override
	public List queryForList(String statementName, int skipResults,int maxResults) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statementName,skipResults,maxResults);
	}

	@Override
	public List queryForList(String statementName, Object parameterObject,int skipResults, int maxResults) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statementName,parameterObject,skipResults,maxResults);
	}

	@Override
	public int countObject(String sqlId, Object obj) {
		int count  = (Integer)getSqlMapClientTemplate().queryForObject(sqlId, obj);
		return count;
	}
	
}
