package com.ibaixiong.merchant.service;

import java.util.List;
import java.util.Map;

import com.ibaixiong.entity.SsssInfo;

public interface SsssInfoService {
	SsssInfo getByUserId(Long userId);

	int reduceMoney(Long ssssId, Float money);
	
	List<SsssInfo> getListByPidSearsh(Map<String, Object> map);
	
	List<SsssInfo> getListByPid(Long pid);
	
	SsssInfo selectByPrimaryKey(Long id);
}
