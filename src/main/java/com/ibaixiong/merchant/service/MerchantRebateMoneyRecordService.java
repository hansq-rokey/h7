package com.ibaixiong.merchant.service;

import java.util.List;

import com.ibaixiong.entity.MerchantRebateMoneyRecord;

public interface MerchantRebateMoneyRecordService {
	
	int insertSelective(MerchantRebateMoneyRecord record);
	
	List<MerchantRebateMoneyRecord> queryListByMerchantId(Long merchantId,Integer pageNo);
}
