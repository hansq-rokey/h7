package com.ibaixiong.merchant.service;

import java.util.List;

import com.papabear.order.entity.MallOrderItem;


/**
 * created by 重剑 on 2015/8/30 0030
 */
public interface MallOrderItemService {
	
	/**
	 * 查询订单详细信息
	 * @param userId		用户ID
	 * @param orderNumber	订单编号
	 * @return
	 */
	List<MallOrderItem> queryMallOrderItemsByOrderNumber(Long userId, String orderNumber);
	/**
	 * 查询订单详细信息及图片
	 * @param ssssId
	 * @param orderNumber
	 * @return
	 */
	List<MallOrderItem> queryMallOrderItemsAndPicsByOrderNumber(String orderNumber);
}
