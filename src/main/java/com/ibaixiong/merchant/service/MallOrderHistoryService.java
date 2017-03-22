package com.ibaixiong.merchant.service;

import java.util.List;

import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.papabear.order.entity.MallOrderHistory;

public interface MallOrderHistoryService {

	List<MallOrderHistory> queryHistoryByOrderNumber(String orderNumber);
	
	/**
	 * 查询某订单状态变更历史记录
	 * @param orderNumber
	 * @param orderStatusEnum
	 * @param user
	 * @return
	 */
	MallOrderHistory getmMallOrderHistory(String orderNumber,OrderStatusEnum orderStatusEnum,User user);
}
