package com.lj.app.core.common.pagination;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class PageRequest<T> implements Serializable {

	private T filters;
	
	private int pageNumber;

	private int pageSize;

	private String sortColumns;
	
	public PageRequest() {
		this(0,0);
	}
	
	public PageRequest(T filters) {
		this(0,0,filters);
	}
	
	public PageRequest(int pageNumber, int pageSize) {
		this(pageNumber,pageSize,(T)null);
	}
	
	public PageRequest(int pageNumber, int pageSize, T filters) {
		this(pageNumber,pageSize,filters,null);
	}
	
	public PageRequest(int pageNumber, int pageSize,String sortColumns) {
		this(pageNumber,pageSize,null,sortColumns);
	}
	
	public PageRequest(int pageNumber, int pageSize, T filters,String sortColumns) {
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

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
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
	
}
