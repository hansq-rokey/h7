package com.ibaixiong.merchant.service;

import java.util.List;

import com.ibaixiong.entity.MerchantBondMoneyRecord;

public interface MerchantBondMoneyRecordService {

	int insert(MerchantBondMoneyRecord record);
	
	List<MerchantBondMoneyRecord> queryListByMerchantId(Long merchantId,Integer pageNo);
}
