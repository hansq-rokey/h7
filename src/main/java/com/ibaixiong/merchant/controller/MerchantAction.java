package com.ibaixiong.merchant.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.ibaixiong.core.utils.DateUtil;
import com.ibaixiong.core.web.DateEditor;
import com.ibaixiong.entity.DictCode;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.entity.SsssOrder;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.DictTypeEnum;
import com.ibaixiong.merchant.service.DictCodeService;
import com.papabear.commons.entity.Pager;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderHistory;
import com.papabear.order.entity.MallOrderItem;
import com.papabear.order.entity.MallOrderItemExt;
import com.papabear.order.entity.MallOrderItemExtend;
import com.papabear.order.entity.MallOrderRevicerInformation;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallProductPic;

/**
 * 
 * @description 代理商相关操作Action
 * @author zhaolei
 * @create 2016年1月4日
 */
@Controller
public class MerchantAction extends AbstractController{
	@Resource
	private OrderService orderService;
	
	@Resource
	private DictCodeService dictCodeService;
	
	@Resource
	ProductQueryService productQueryService;
	/**
	 * 
	 * @author zhaolei
	 * @date 2016年1月14日
	 * @param searchKey 搜索主键
	 * @param status 状态
	 * @param level 等级
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param pageNo 当前页
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/u/merchant/list")
	String list(
			@RequestParam(value="keywords",required=false) String keywords,
			@RequestParam(value="status",required=false) String status,
			@RequestParam(value="level",required=false) Integer level,
			@RequestParam(value="startTime",required=false)Date startTime,
			@RequestParam(value="endTime",required=false)Date endTime,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap modelMap) {
		//查询个人4s店信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		//查询该城运商的账单详细信息
		if(startTime != null){
			modelMap.addAttribute("startTime",DateUtil.format(startTime, "yyyy-MM-dd"));
		}
		if(endTime != null){
			modelMap.addAttribute("endTime",DateUtil.format(endTime, "yyyy-MM-dd"));
			endTime=DateUtil.getDateEndTime(endTime);
		}
		if (StringUtils.isNotBlank(keywords)) {
			modelMap.addAttribute("keywords", keywords);
		}else{
			keywords = null;
		}
		if (startTime != null) {
			modelMap.addAttribute("startTime", DateUtil.format(startTime, "yyyy-MM-dd"));
		}
		if (endTime != null) {
			modelMap.addAttribute("endTime", DateUtil.format(endTime, "yyyy-MM-dd"));
		}
		if(StringUtils.isBlank(status) || status.equals("-1")){
			//查询的是全部
			status = null;
		}
		modelMap.addAttribute("status", status);
		if(StringUtils.isNotBlank(status)){
			if(status.equals("2")){
				status = "0";
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("pageNo", pageNo);
		//map.put("userId", user.getId());
		map.put("merchantId", ssssCityMerchant.getId());
		if(StringUtils.isNotBlank(status))
			map.put("status", Byte.valueOf(status));
		//map.put("level", level);
		map.put("keywords", keywords);
		List<SsssInfo> dataList = ssssInfoService.getListByPidSearsh(map);
		PageInfo<SsssInfo> pageInfo = new PageInfo<SsssInfo>(dataList);
		modelMap.addAttribute("pageInfo", pageInfo);
		modelMap.addAttribute("dataList",dataList);

		modelMap.addAttribute("level",level);
		modelMap.addAttribute("info", ssssCityMerchant);
		return "merchant/list";
	}
	
	
	@RequestMapping("/u/merchant/orderlist")
	public String queryOrderList(
			@RequestParam(value="keywords",required=false) String keywords,
			@RequestParam(value="status",required=false) String status,
			@RequestParam(value="level",required=false) Integer level,
			@RequestParam(value="startTime",required=false)Date startTime,
			@RequestParam(value="endTime",required=false)Date endTime,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap modelMap) {
		//查询个人4s店信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		//查询该城运商的账单详细信息
		if(startTime != null){
			modelMap.addAttribute("startTime",DateUtil.format(startTime, "yyyy-MM-dd"));
		}
		if(endTime != null){
			modelMap.addAttribute("endTime",DateUtil.format(endTime, "yyyy-MM-dd"));
			endTime=DateUtil.getDateEndTime(endTime);
		}
		if (StringUtils.isNotBlank(keywords)) {
			modelMap.addAttribute("keywords", keywords);
		}else{
			keywords = null;
		}
		if (startTime != null) {
			modelMap.addAttribute("startTime", DateUtil.format(startTime, "yyyy-MM-dd"));
		}
		if (endTime != null) {
			modelMap.addAttribute("endTime", DateUtil.format(endTime, "yyyy-MM-dd"));
		}
		if(StringUtils.isBlank(status) || status.equals("-1")){
			//查询的是全部
			status = null;
		}else{
			modelMap.addAttribute("status", status);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("pageNo", pageNo);
		map.put("merchantId", ssssCityMerchant.getId());
		if(StringUtils.isNotBlank(status))
			map.put("status", Byte.valueOf(status));
		map.put("keywords", keywords);

		List<SsssOrder> dataList = ssssOrderService.getListBySearch(map);

		PageInfo<SsssOrder> pageInfo = new PageInfo<SsssOrder>(dataList);
		dataList = setStatus(dataList);
		modelMap.addAttribute("pageInfo", pageInfo);
		modelMap.addAttribute("dataList",dataList);
		modelMap.addAttribute("level",level);
		modelMap.addAttribute("keywords",keywords);
		modelMap.addAttribute("info", ssssCityMerchant);
		return "order/list";
	}
	
	/**
	 * 下级代理列表
	 * @param pageNo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/u/merchant/cityList")
	public String cityList(@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,ModelMap modelMap) {
		//查询代理商信息
		User user = getUser();//登陆用户
		SsssCityMerchant cityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		List<SsssCityMerchant> lists = new ArrayList<SsssCityMerchant>();
		List<SsssCityMerchant> citys = ssssCityMerchantService.queryMerchantByParentId(cityMerchant.getId());
		if(citys!=null){
			for(SsssCityMerchant city : citys){
				city.setParentName(cityMerchant.getCityMerchantName());
				lists.add(city);
				List<SsssCityMerchant> cs = ssssCityMerchantService.queryMerchantByParentId(city.getId());
				if(cs!=null){
					for(SsssCityMerchant c : cs){
						c.setParentName(city.getCityMerchantName());
						lists.add(c);
						List<SsssCityMerchant> s = ssssCityMerchantService.queryMerchantByParentId(c.getId());
						if(s!=null){
							for(SsssCityMerchant ss : s){
								ss.setParentName(c.getCityMerchantName());
								lists.add(ss);
							}
						}
					}
				}
			}
		}
		modelMap.addAttribute("citys", lists);
		modelMap.addAttribute("typeNames", dictCodeService.queryDictCodeByDictType(DictTypeEnum.CITY_MERCHANT_TYPE.getDictType()));
		modelMap.addAttribute("info", cityMerchant);
		return "order/down_list";
	}
	
	/**
	 * 代理商详情--代理商进货订单列表
	 * @param pageNo
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/u/merchant/cityDetail.html")
	public String selectDetail(@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			@RequestParam(value="id",required = false)Long id,ModelMap model){
		//查询代理商信息
		User user = getUser();//登陆用户
		SsssCityMerchant cityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		SsssCityMerchant city = ssssCityMerchantService.getById(id);
		Pager<MallOrder> pager = orderService.queryOrdersByUserIdAndStatus(city.getUserId(), null, pageNo, 10);
		model.addAttribute("pageInfo", pager);
		model.addAttribute("id", id);
		model.addAttribute("info", cityMerchant);
		return "/order/down_order_list";
	}
	
	@RequestMapping("/u/merchant/todayOrderlist")
	public String queryTodayOrderList(
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			@RequestParam(value="status",required=false) String status,
			ModelMap modelMap) {
		//查询个人4s店信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		//查询该城运商的账单详细信息
		if(StringUtils.isBlank(status) || status.equals("-1")){
			//查询的是全部
			status = null;
		}else{
			modelMap.addAttribute("status", status);
		}
		//当天订单（含分页）信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", DateUtil.getTodayStartTime());
		map.put("endTime", DateUtil.getTodayEndTime());
		map.put("pageNo", pageNo);
		map.put("merchantId", ssssCityMerchant.getId());
//		if(StringUtils.isNotBlank(status))
//			map.put("status", Byte.valueOf(status));
		List<SsssOrder> dataList = ssssOrderService.getListBySearch(map);
//		//查询当天所有的订单
		List<SsssOrder> todaySum = ssssOrderService.getSum(map);
		//月订单信息
		Map<String, Object> monthMap = new HashMap<String, Object>();
		monthMap.put("startTime", DateUtil.getMonthstartTime());
		monthMap.put("endTime", DateUtil.getMonendTime());
		monthMap.put("pageNo", pageNo);
		monthMap.put("merchantId", ssssCityMerchant.getId());
//		if(StringUtils.isNotBlank(status))
//			monthMap.put("status", Byte.valueOf(status));
		List<SsssOrder> monthDataList = ssssOrderService.getSum(monthMap);
		//分页
		PageInfo<SsssOrder> pageInfo = new PageInfo<SsssOrder>(dataList);
		dataList = setStatus(dataList);
		//查询本月有效（去除关闭的订单）的订单数
		monthDataList = setStatus1(monthDataList);
		//todaySum = setStatus1(todaySum);
		
		modelMap.addAttribute("todayCount", todaySum.size());
		modelMap.addAttribute("todayTotalProfit", add(todaySum));
		modelMap.addAttribute("monthCount", monthDataList.size());
		modelMap.addAttribute("monthTotalProfit", add(monthDataList));
		modelMap.addAttribute("pageInfo", pageInfo);
		modelMap.addAttribute("dataList",dataList);
		modelMap.addAttribute("info", ssssCityMerchant);
		return "merchant/todayOrderList";
	}
	
	public BigDecimal add(List<SsssOrder> list){
		BigDecimal sum = new BigDecimal(0.0);
		for(int i=0;i<list.size();i++){
			BigDecimal dec = new BigDecimal(Float.toString(list.get(i).getProfit()));
			sum = sum.add(dec);
		}
		return sum;
	}
	
	private List<SsssOrder> setStatus(List<SsssOrder> dataList){
		List<SsssOrder> dataList1 = new ArrayList<SsssOrder>();
		if(dataList!=null){
			for (SsssOrder order : dataList) {
//				MallOrder ordert = orderService.queryOrderByOrderNumber(order.getOrderNumber());
				MallOrder ordert = orderService.getMallOrder(order.getOrderNumber());
				order.setStatus(ordert.getStatus());
				dataList1.add(order);
			}
		}
		return dataList1;
	}
	private List<SsssOrder> setStatus1(List<SsssOrder> dataList){
		List<SsssOrder> dataList1 = new ArrayList<SsssOrder>();
		if(dataList!=null){
			for (SsssOrder order : dataList) {
//				MallOrder ordert = orderService.queryOrderByOrderNumber(order.getOrderNumber());
				MallOrder ordert = orderService.getMallOrder(order.getOrderNumber());
				if(ordert.getStatus()!=60){
					order.setStatus(ordert.getStatus());
					dataList1.add(order);
				}
			}
		}
		return dataList1;
	}
	/**
	 * 城市运营中心订单详情
	 * @param orderNumber
	 * @param model
	 * @return
	 */
	@RequestMapping("/u/merchant/detail")
	String cityOrderList(String orderNumber,ModelMap model) {
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		MallOrder mallOrder = orderService.getMallOrder(orderNumber);
		List<MallOrderItem> dataList = orderService.queryOrderItems(mallOrder.getUserId(),orderNumber);
		String data = null;
		for(MallOrderItem orderItem : dataList){
			MallOrderItemExtend extend = orderService.getOrderItemExtend(mallOrder.getUserId(), orderItem.getId());
			orderItem.setOrderItemExtend(extend);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("productId", orderItem.getProductId());
			map.put("formatId", orderItem.getProductModelFormatId());
			List<MallProductPic> pics = productQueryService.queryProductPicByFormatId(map);
			orderItem.setPics(pics);
		}
		MallOrderRevicerInformation orderInformation = 
				orderService.getRevicerByUserIdAndOrderNumber(mallOrder.getUserId(), orderNumber);
		List<DictCode> dictCodes = null;
		if (mallOrder.getIsCustomMade() != null && mallOrder.getIsCustomMade().intValue() == 1) {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS);
		} else {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS, (byte) 0);
		}
		model.addAttribute("orderStatusList", dictCodes);
		List<MallOrderHistory> historyList = orderService.queryHistoryByOrderNumber(orderNumber);
		for (DictCode code : dictCodes) {
			for (MallOrderHistory history : historyList) {
				if (code.getDictCodeValue().trim().equals(history.getStatus().toString())) {
					code.setFlow(true);
					code.setOrderHistory(history);
				}
			}
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("orderInfomation", orderInformation);
		model.addAttribute("info", ssssCityMerchant);
		return "merchant/detail";
	}
	
	/**
	 * 合伙人（4s）订单列表
	 * @param id
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/u/merchant/ssssOrderList")
	String ssssOrderList(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,
			ModelMap model) {
		SsssInfo ssssInfo = ssssInfoService.selectByPrimaryKey(id);
		List<SsssOrder> ssssOrderList = ssssOrderService.selectByInfoId(id, pageNo);
		PageInfo<SsssOrder> pageInfo = new PageInfo<SsssOrder>(ssssOrderList);
		ssssOrderList = setStatus(ssssOrderList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("dataList", ssssOrderList);
		model.addAttribute("ssssInfo", ssssInfo);
		return "merchant/ssssOrderList";
	}
	
	/**
	 * 合伙人（4s）订单列表详情
	 * @param orderNumber
	 * @param model
	 * @return
	 */
	@RequestMapping("/u/merchant/ssssOrderDetail")
	String ssssOrderDetail(String orderNumber,ModelMap model) {
		MallOrder mallOrder = orderService.getMallOrder(orderNumber);
		List<MallOrderItem> dataList = orderService.queryOrderItems(mallOrder.getUserId(),orderNumber);
		String data = null;
		for(MallOrderItem orderItem : dataList){
			List<MallOrderItemExt> orderItemExt = orderService.queryOrderItemExts(orderNumber, orderItem.getId());
			orderItem.setOrderItemExts(orderItemExt);
		}
		MallOrderRevicerInformation orderInformation = 
				orderService.getRevicerByUserIdAndOrderNumber(mallOrder.getUserId(), orderNumber);
		List<DictCode> dictCodes = null;
		if (mallOrder.getIsCustomMade() != null && mallOrder.getIsCustomMade().intValue() == 1) {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS);
		} else {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS, (byte) 0);
		}
		model.addAttribute("orderStatusList", dictCodes);
		List<MallOrderHistory> historyList = orderService.queryHistoryByOrderNumber(orderNumber);
		for (DictCode code : dictCodes) {
			for (MallOrderHistory history : historyList) {
				if (code.getDictCodeValue().trim().equals(history.getStatus().toString())) {
					code.setFlow(true);
					code.setOrderHistory(history);
				}
			}
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("orderInfomation", orderInformation);
		return "merchant/ssssOrderDetail";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new DateEditor());
	}
}
