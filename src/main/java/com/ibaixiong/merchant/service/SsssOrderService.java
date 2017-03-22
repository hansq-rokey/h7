package com.ibaixiong.merchant.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibaixiong.entity.SsssOrder;
import com.ibaixiong.entity.User;


public interface SsssOrderService {
	
	SsssOrder getssSsssOrder(User user,String orderNumber,Byte orderType);
	
	List<SsssOrder> getList(Map<String, Object> map);
	
	List<SsssOrder> getListBySearch(Map<String, Object> map);
	
	List<SsssOrder> getOrderListBySearch(Map<String, Object> map);
	
	List<SsssOrder> getSum(Map<String, Object> map);
	
	List<SsssOrder> selectByInfoId(Long id,Integer pageNo);
}
