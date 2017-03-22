package com.ibaixiong.merchant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.MerchantProduct;
import com.ibaixiong.merchant.dao.MerchantProductDao;
import com.ibaixiong.merchant.service.MerchantProductService;

@Service
public class MerchantProductServiceImpl implements MerchantProductService {
	@Resource
	private MerchantProductDao merchantProductDao;
	
	@Override
	public int deleteByMerchantId(Long merchantId) {
		return merchantProductDao.deleteByMerchantId(merchantId);
	}
	@Override
	public void insert(MerchantProduct merchantProduct) {
		merchantProductDao.insert(merchantProduct);
	}
	@Override
	public List<MerchantProduct> queryList(Long merchantId) {
		return merchantProductDao.queryList(merchantId);
	}
	@Override
	public MerchantProduct getMerchantProduct(Long merchantId, Long productId) {
		return merchantProductDao.getMerchantProduct(merchantId,productId);
	}
	
}
