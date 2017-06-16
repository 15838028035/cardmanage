package com.lj.app.core.common.pagination;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.lj.app.core.common.util.DateJsonFormat;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class Page<T> implements Serializable {
	
	private List<T> result = new ArrayList<T>();

	private T filters;
	
	private int pageSize;

	private int pageNumber;

	private String sortColumns;
	
	private int totalCount = 0;
	
	private static final String JSONROWS = "rows";
	private static final String JSONPAGE = "page";
	
	public Page(int pageSize) {
		this(pageSize,(T)null);
	}
	
	public Page(T filters) {
		this(5, filters, null);
	}
	
	public Page(int pageSize, T filters) {
		this(pageSize,filters,null);
	}
	
	public Page(int pageSize,String sortColumns) {
		this(pageSize,null,sortColumns);
	}
	
	public Page(int pageSize, T filters,String sortColumns) {
		if(pageNumber == 0) {
			pageNumber = 1;
		}
		this.pageNumber = pageNumber;
		this.pageSize = pageSize;
		setFilters(filters);
		setSortColumns(sortColumns);
	}
	
	public T getFilters() {
		return filters;
	}

	public void setFilters(T filters) {
		this.filters = filters;
	}
	
	public String getSortColumns() {
		return sortColumns;
	}

	public void setSortColumns(String sortColumns) {
		this.sortColumns = sortColumns;
	}

	public List<SortInfo> getSortInfos() {
		return Collections.unmodifiableList(SortInfo.parseSortColumns(sortColumns));
	}
	
	public void setResult(List<T> elements) {
		this.result = elements;
	}
	
	public List<T> getResult() {
		return result;
	}
	
	public boolean isFirstPage() {
		return getThisPageNumber() == 1;
	}

	public boolean isLastPage() {
		return getThisPageNumber() >= getLastPageNumber();
	}
	
	public boolean isHasNextPage() {
		return getLastPageNumber() > getThisPageNumber();
	}
 
	public boolean isHasPreviousPage() {
		return getThisPageNumber() > 1;
	}
  
	public int getLastPageNumber() {
		return PageUtils.computeLastPageNumber(totalCount, pageSize);
	}
 
	public int getTotalCount() {
		return totalCount;
	}
 
	public int getThisPageFirstElementNumber() {
		return (getThisPageNumber() - 1) * getPageSize() + 1;
	}
 
	public int getThisPageLastElementNumber() {
		int fullPage = getThisPageFirstElementNumber() + getPageSize() - 1;
		return getTotalCount() < fullPage ? getTotalCount() : fullPage;
	}
 
	public int getNextPageNumber() {
		return getThisPageNumber() + 1;
	}
 
	public int getPreviousPageNumber() {
		return getThisPageNumber() - 1;
	}
 
	public int getPageSize() {
		return pageSize;
	}
 
	public int getThisPageNumber() {
		return pageNumber;
	}

 
	public List<Integer> getLinkPageNumbers() {
		return PageUtils.generateLinkPageNumbers(getThisPageNumber(), getLastPageNumber(),10);
	}
	
 
	public int getFirstResult() {
		return PageUtils.getFirstResult(pageNumber, pageSize);
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	/**
	 * 根据pageSize与totalCount计算总页数, 默认值为-1.
	 */
	public int getTotalPages() {
		if (totalCount < 0) {
			return -1;
		}

		int count = totalCount / pageSize;
		if (totalCount % pageSize > 0) {
			count++;
		}
		return count;
	}
	public String toJsonString(List list){
		return toJsonString(this,list);
	}
	
	public String toJsonString(Page page,List list){
		JsonConfig cfg = new JsonConfig();
		DateJsonFormat df = new DateJsonFormat();
		cfg.registerJsonValueProcessor(java.util.Date.class,df);
		
		
		JSONObject all = new JSONObject();
		if(list==null){
			all.put(JSONROWS, "");
		}else{
			all.put(JSONROWS, JSONArray.fromObject(list,cfg));
		}
		
		all.put(JSONPAGE, page);	
		String jsonString = all.toString();
		return jsonString ;
	}
	
	public static String toJsonString(Object object){
		 
		JsonConfig cfg = new JsonConfig();		
		DateJsonFormat df = new DateJsonFormat();
		cfg.registerJsonValueProcessor(java.util.Date.class,df);
		
		JSONObject all = JSONObject.fromObject(object,cfg);
		String jsonString = all.toString();
		return jsonString ;
	}
	
	public static Map<String, Object> toMap(Object o) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException{
		return BeanUtils.describe(o);
	}
}

