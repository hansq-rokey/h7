package com.ibaixiong.merchant.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.ibaixiong.constant.PageConstant;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.merchant.dao.SsssInfoDao;
import com.ibaixiong.merchant.service.SsssInfoService;

@Service
public class SsssInfoServiceImpl implements SsssInfoService {
	@Resource
	SsssInfoDao ssssInfoDao;

	@Override
	public SsssInfo getByUserId(Long userId) {
		return ssssInfoDao.getByUserId(userId);
	}

	/**
	 * 扣除金额
	 * 
	 * @param money
	 * @return
	 */
	@Override
	public int reduceMoney(Long ssssId, Float money) {
		return ssssInfoDao.reduceMoney(ssssId, money);
	}

	@Override
	public List<SsssInfo> getListByPidSearsh(Map<String, Object> map) {
		PageHelper.startPage((Integer) map.get("pageNo"), PageConstant.bbspageSize, true);
		return ssssInfoDao.getListByPidSearsh(map);
	}
	
	@Override
	public List<SsssInfo> getListByPid(Long pid) {
		return ssssInfoDao.getListByPid(pid);
	}

	@Override
	public SsssInfo selectByPrimaryKey(Long id) {
		return ssssInfoDao.selectByPrimaryKey(id);
	}

}
