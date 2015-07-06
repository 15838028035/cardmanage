package com.lj.app.cardmanage.batch.model;

import com.lj.app.cardmanage.base.model.BaseModel;

public class Batch extends BaseModel{
	
	private int id;
	private String batchCode;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getBatchCode() {
		return batchCode;
	}
	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}
	
}
