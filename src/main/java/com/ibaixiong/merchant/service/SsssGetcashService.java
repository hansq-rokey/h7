package com.ibaixiong.merchant.service;

import java.util.List;
import java.util.Map;

import com.ibaixiong.entity.SsssGetcash;
import com.ibaixiong.entity.User;

public interface SsssGetcashService {
	/**
	 * 插入提现记录
	 * @author zhaolei
	 * @date 2015年12月23日
	 * @param money
	 * @param user
	 */
	void insert(Float money,User user);
	
	List<SsssGetcash> getList(Map<String, Object> map);
}
