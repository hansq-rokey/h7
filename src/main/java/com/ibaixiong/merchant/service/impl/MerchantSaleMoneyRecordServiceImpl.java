package com.ibaixiong.merchant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.ibaixiong.constant.PageConstant;
import com.ibaixiong.entity.MerchantSaleMoneyRecord;
import com.ibaixiong.merchant.dao.MerchantSaleMoneyRecordDao;
import com.ibaixiong.merchant.service.MerchantSaleMoneyRecordService;

@Service
public class MerchantSaleMoneyRecordServiceImpl implements MerchantSaleMoneyRecordService {
	@Resource
	MerchantSaleMoneyRecordDao saleRecordDao;

	@Override
	public int insertSelective(MerchantSaleMoneyRecord record) {
		// TODO Auto-generated method stub
		return saleRecordDao.insertSelective(record);
	}

	@Override
	public List<MerchantSaleMoneyRecord> queryListByMerchantId(Long merchantId,Integer pageNo) {
		PageHelper page = new PageHelper();
		page.startPage(pageNo, PageConstant.bbspageSize, true);
		return saleRecordDao.queryListByMerchantId(merchantId);
	}

}
