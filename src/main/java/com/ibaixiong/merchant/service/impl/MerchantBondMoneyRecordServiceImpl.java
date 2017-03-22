package com.ibaixiong.merchant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.ibaixiong.constant.PageConstant;
import com.ibaixiong.entity.MerchantBondMoneyRecord;
import com.ibaixiong.merchant.dao.MerchantBondMoneyRecordDao;
import com.ibaixiong.merchant.service.MerchantBondMoneyRecordService;
@Service
public class MerchantBondMoneyRecordServiceImpl implements MerchantBondMoneyRecordService {
	
	@Resource
	private MerchantBondMoneyRecordDao merchantBondMoneyRecordDao;
	
	@Override
	public int insert(MerchantBondMoneyRecord record) {
		// TODO Auto-generated method stub
		return merchantBondMoneyRecordDao.insert(record);
	}

	@Override
	public List<MerchantBondMoneyRecord> queryListByMerchantId(Long merchantId,Integer pageNo) {
		// TODO Auto-generated method stub
		PageHelper page = new PageHelper();
		page.startPage(pageNo, PageConstant.bbspageSize, true);
		return merchantBondMoneyRecordDao.queryListByMerchantId(merchantId);
	}

}
