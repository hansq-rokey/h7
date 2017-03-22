package com.ibaixiong.merchant.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.ibaixiong.constant.Constant;
import com.ibaixiong.constant.PageConstant;
import com.ibaixiong.core.utils.CodeUtil;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.SsssGetcash;
import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.dao.SsssCityMerchantDao;
import com.ibaixiong.merchant.dao.SsssGetcashDao;
import com.ibaixiong.merchant.service.SsssGetcashService;
@Service
public class SsssGetcashServiceImpl implements SsssGetcashService {
	@Resource
	SsssGetcashDao ssssGetcashDao;
	@Resource
	SsssCityMerchantDao ssssCityMerchantDao;
	@Transactional
	@Override
	public void insert(Float money, User user) {
		//插入金额变更记录
		//SsssInfo ssssInfo = ssssInfoDao.getByUserId(user.getId());
		SsssCityMerchant merchant = ssssCityMerchantDao.getByUserId(user.getId());
		String payNumber = CodeUtil.getPayNumber(user.getId());
		/*PayHistory history = new PayHistory();
		history.setStatus(Constant.Status.WAIT.getStatus());
		history.setPayNumber(payNumber);
		history.setCreateDateTime(new Date());
		history.setUserId(user.getId());
		history.setMoney(-money);
		history.setMerchantId(merchant.getId());
		history.setType(Constant.PayHistoryStatus.GETCASH.getStatus());
		history.setRemainMoney(merchant.getMoney().floatValue()+history.getMoney().floatValue());
		payHistoryDao.insertSelective(history);*/
		//插入提现表
		SsssGetcash cash = new SsssGetcash();
		cash.setCityMerchantId(merchant.getId());
		cash.setCreateDateTime(new Date());
		cash.setBankName(merchant.getBankName());
		cash.setBankNumber(merchant.getBankNumber());
		cash.setBankAddress(merchant.getBankAddress());
		cash.setUserId(user.getId());
		cash.setMoney(money);
		cash.setStatus(Constant.Status.WAIT.getStatus());
		cash.setInvalid(false);
		cash.setPayNumber(payNumber);
		ssssGetcashDao.insertSelective(cash);
		/*merchant.setMoney(history.getRemainMoney());
		ssssCityMerchantDao.updateByPrimaryKeySelective(merchant);*/
	}
	@Override
	public List<SsssGetcash> getList(Map<String, Object> map) {
		PageHelper.startPage((Integer) map.get("pageNo"), PageConstant.bbspageSize, true);
		return ssssGetcashDao.getList(map);
	}
}
