package com.ibaixiong.merchant.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibaixiong.core.web.DateEditor;
import com.ibaixiong.entity.DictCode;
import com.ibaixiong.entity.util.DictTypeEnum;
import com.ibaixiong.merchant.service.DictCodeService;
import com.ibaixiong.merchant.service.MallOrderItemService;
import com.ibaixiong.merchant.service.MallOrderLogisticsService;
import com.ibaixiong.merchant.service.SsssOrderService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderHistory;

/**
 * Created by Administrator on 2015/8/3.
 */
@Controller
@RequestMapping("/u/order")
class OrderController extends AbstractController {

	@Resource
	private MallOrderLogisticsService orderLogisticsService;

	@Resource
	private MallOrderItemService orderItemService;
	@Resource
	private DictCodeService dictCodeService;

	@Resource
	private SsssOrderService ssssOrderService;
	@Resource
	private OrderService orderService;



	/**
	 * 店铺订单详细信息查看
	 * 
	 * @param modelMap
	 * @param orderNumber
	 * @return
	 */
	@RequestMapping("/detail")
	String detail(ModelMap modelMap, @RequestParam("number") String orderNumber) {
//		SsssOrder ssssOrder = ssssOrderService.getssSsssOrder(getUser(), orderNumber, OrderTypeEnum.COMMON.getCode());
		/*SsssOrder ssssOrder = ssssOrderService.getssSsssOrder(getUser(), orderNumber, null);
		if (ssssOrder == null) {
			return "redirect:/u/order/list.html";
		}*/
//		MallOrder order = mallOrderService.queryOrderByOrderNumber(orderNumber);
		MallOrder order = orderService.getMallOrder(orderNumber);
		modelMap.addAttribute("order", order);
		modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsAndPicsByOrderNumber(orderNumber));
//		modelMap.addAttribute("reciver", orderRevicerInformationService.getOrderRevicerInformation(orderNumber));
		modelMap.addAttribute("reciver", orderService.getRevicerByUserIdAndOrderNumber(null, orderNumber));
		modelMap.addAttribute("logistics", orderLogisticsService.getMallOrderLogistics(orderNumber));
		List<DictCode> dictCodes = null;
		if (order.getIsCustomMade() != null && order.getIsCustomMade().intValue() == 1) {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS);
		} else {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS, (byte) 0);
		}
		modelMap.addAttribute("orderStatusList", dictCodes);
//		List<MallOrderHistory> historyList = orderHistoryService.queryHistoryByOrderNumber(orderNumber);
		List<MallOrderHistory> historyList = orderService.queryHistoryByOrderNumber(orderNumber);
		for (DictCode code : dictCodes) {
			for (MallOrderHistory history : historyList) {
				if (code.getDictCodeValue().trim().equals(history.getStatus().toString())) {
					code.setFlow(true);
					code.setOrderHistory(history);
				}
			}
		}
		return "order/detail";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	/**
	 * 货物追踪查询
	 * 
	 * @param mailNo
	 * @param respons
	 *            http://erp.ibaixiong.com/order/trace.html?logisticsId=
	 *            O1007941445415653832
	 */
	@ResponseBody
	@RequestMapping("/trace")
	public String queryLogisticsTrace(@RequestParam("orderNumber") String orderNumber) {
		String json = orderLogisticsService.queryLogisticsTraceByOrderNumber(orderNumber);
		return json;
	}
}
