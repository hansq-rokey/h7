package com.ibaixiong.merchant.service;

import java.util.List;
import java.util.Map;

import com.ibaixiong.entity.SsssCityMerchant;

public interface SsssCityMerchantService {
	SsssCityMerchant getByUserId(Long userId);
	void insert(SsssCityMerchant merchant);
	void update(SsssCityMerchant merchant);
	List<SsssCityMerchant> getListByPidSearsh(Map<String, Object> map);
	List<SsssCityMerchant> getListByPid(Long pid);
	List<SsssCityMerchant> queryMerchantByParentId(Long parentId);
	SsssCityMerchant getById(Long id);
}
