package com.ibaixiong.merchant.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ibaixiong.constant.PageConstant;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.merchant.dao.SsssCityMerchantDao;
import com.ibaixiong.merchant.service.SsssCityMerchantService;
import com.ibaixiong.merchant.util.Pager;
@Service
public class SsssCityMerchantServiceImpl implements SsssCityMerchantService{
	@Resource
	private SsssCityMerchantDao ssssCityMerchantDao;

	@Override
	public SsssCityMerchant getByUserId(Long userId) {
		return ssssCityMerchantDao.getByUserId(userId);
	}

	@Override
	public void insert(SsssCityMerchant merchant) {
		ssssCityMerchantDao.insertSelective(merchant);
	}

	@Override
	public void update(SsssCityMerchant merchant) {
		ssssCityMerchantDao.updateByPrimaryKeySelective(merchant);
	}
	
	@Override
	public List<SsssCityMerchant> getListByPidSearsh(Map<String, Object> map) {
		PageHelper page = new PageHelper();
		page.startPage((Integer) map.get("pageNo"), PageConstant.pageSize, true);
		return ssssCityMerchantDao.getListByPidSearsh(map);
	}
	
	@Override
	public List<SsssCityMerchant> getListByPid(Long pid) {
		return ssssCityMerchantDao.getListByPid(pid);
	}

	@Override
	public List<SsssCityMerchant> queryMerchantByParentId(Long parentId) {
		return ssssCityMerchantDao.queryMerchantByParentId(parentId);
	}

	@Override
	public SsssCityMerchant getById(Long id) {
		// TODO Auto-generated method stub
		return ssssCityMerchantDao.getById(id);
	}
}
