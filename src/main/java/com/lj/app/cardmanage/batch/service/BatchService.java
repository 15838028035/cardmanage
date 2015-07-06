package com.lj.app.cardmanage.batch.service;

import com.lj.app.cardmanage.base.service.BaseService;

public interface BatchService<Batch> extends BaseService{

	public int getMaxBatchId();
	public String getGenerateBatchCode();
	
}
