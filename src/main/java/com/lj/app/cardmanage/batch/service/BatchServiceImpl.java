package com.lj.app.cardmanage.batch.service;

import org.springframework.stereotype.Service;

import com.lj.app.cardmanage.base.service.BaseServiceImpl;
import com.lj.app.core.common.util.DateUtil;

@Service("batchService")
public class BatchServiceImpl<Batch> extends BaseServiceImpl<Batch> implements BatchService<Batch>{

	public static final int  BATCH_CODE_RANDOM_LENGTH = 8;
	
	@Override
	public String getGenerateBatchCode() {
		//TODO:修改代码，产生固定长度的编码
		return DateUtil.getNowDate(DateUtil.DATE_FORMAT_YYYYMMDDHHMMSS).replaceAll(" ", "")+"_"+Math.random()*10000;
	}
	
	@Override
	public int getMaxBatchId() {
		int batchId = this.countObject("selectMaxId", null);
		return batchId;
	}

}
