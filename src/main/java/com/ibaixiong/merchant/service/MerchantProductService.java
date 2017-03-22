package com.ibaixiong.merchant.service;

import java.util.List;

import com.ibaixiong.entity.MerchantProduct;

public interface MerchantProductService {
	
	int deleteByMerchantId(Long merchantId);
	
	void insert(MerchantProduct merchantProduct);
	
	List<MerchantProduct> queryList(Long merchantId);

	MerchantProduct getMerchantProduct(Long merchantId, Long productId);
}
