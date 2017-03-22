package com.ibaixiong.merchant.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.ibaixiong.constant.Constant;
import com.ibaixiong.constant.PageConstant;
import com.ibaixiong.core.utils.CodeUtil;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.entity.SsssOrder;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.ibaixiong.merchant.dao.SsssCityMerchantDao;
import com.ibaixiong.merchant.dao.SsssInfoDao;
import com.ibaixiong.merchant.dao.SsssOrderDao;
import com.ibaixiong.merchant.service.SsssOrderService;
import com.papabear.order.api.AfterSaleService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallAfterSalesService;
import com.papabear.order.entity.MallOrder;
import com.papabear.pay.api.PayService;
import com.papabear.pay.entity.PayHistory;

@Service
public class SsssOrderServiceImpl implements SsssOrderService {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	@Resource
	private SsssOrderDao ssssOrderDao;
	@Resource
	private SsssInfoDao ssssInfoDao;
	@Resource
	private SsssCityMerchantDao ssssCityMerchantDao;
	@Resource
	private PayService payService;
	@Resource
	private OrderService orderService;
	@Resource
	AfterSaleService afterSaleService;
	@Override
	public SsssOrder getssSsssOrder(User user, String orderNumber, Byte orderType) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ssssId", user.getSsssId());
		map.put("orderNumber", orderNumber);
		map.put("orderType", orderType);
		return ssssOrderDao.getssSsssOrder(map);
	}
	
	@Override
	public List<SsssOrder> getList(Map<String, Object> map) {
		PageHelper.startPage((Integer) map.get("pageNo"), PageConstant.pageSize, true);
		return ssssOrderDao.getList(map);
	}
	
	@Override
	public List<SsssOrder> getListBySearch(Map<String, Object> map) {
		PageHelper.startPage((Integer) map.get("pageNo"), PageConstant.bbspageSize, true);
		return ssssOrderDao.getListBySearch(map);
	}
	@Override
	public List<SsssOrder> getOrderListBySearch(Map<String, Object> map) {
		PageHelper.startPage((Integer) map.get("pageNo"), PageConstant.bbspageSize, true);
		return ssssOrderDao.getListBySearch(map);
	}
	
	@Override
	public List<SsssOrder> getSum(Map<String, Object> map) {
		//PageHelper.startPage((Integer) map.get("pageNo"), PageConstant.pageSize, true);
		return ssssOrderDao.getListBySearch(map);
	}

	@Override
	public List<SsssOrder> selectByInfoId(Long id, Integer pageNo) {
		PageHelper.startPage(pageNo, PageConstant.bbspageSize, true);
		return ssssOrderDao.selectByInfoId(id);
	}
}
