package com.ibaixiong.merchant.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.merchant.service.MallOrderItemService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallOrderItem;
import com.papabear.product.api.ProductQueryService;



/**
 * Created by Administrator on 2015/8/30 0030.
 */
@Service
class MallOrderItemServiceImpl implements MallOrderItemService {

	@Resource
	private OrderService orderService;
	@Resource
	private ProductQueryService productQueryService;

	@Override
	public List<MallOrderItem> queryMallOrderItemsByOrderNumber(Long userId,String orderNumber) {
		List<MallOrderItem> list= orderService.queryOrderItems(userId, orderNumber);
		return list;
	}
	/**
	 * 查询订单详细信息及图片
	 * @param userId
	 * @param orderNumber
	 * @return
	 */
	public List<MallOrderItem> queryMallOrderItemsAndPicsByOrderNumber(String orderNumber){
		List<MallOrderItem> list= orderService.queryOrderItems(orderNumber);
		for(MallOrderItem item:list){
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("productId", item.getProductId());
			map.put("formatId", item.getProductModelFormatId());
			item.setPics(productQueryService.queryProductPicByFormatId(map));
		}
		return list;
	}
}
