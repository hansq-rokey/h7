package com.ibaixiong.merchant.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.ibaixiong.core.utils.DateUtil;
import com.ibaixiong.core.utils.Md5Util;
import com.ibaixiong.core.utils.ResponseResult;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.SsssGetcash;
import com.ibaixiong.entity.SsssOrder;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.ibaixiong.merchant.service.MallOrderHistoryService;
import com.ibaixiong.merchant.service.SsssOrderService;
import com.ibaixiong.merchant.util.DateEditor;
import com.papabear.commons.entity.Pager;
import com.papabear.order.api.AfterSaleService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallAfterSalesService;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderHistory;
import com.papabear.pay.api.PayAccountService;
import com.papabear.pay.api.PayService;
import com.papabear.pay.entity.PayAccount;
import com.papabear.pay.entity.PayHistory;

/**
 * @description 财务模块
 * @author zhaolei
 * @create 2015年12月22日-上午10:10:42
 */
@Controller
class FinanceController extends AbstractController {
	@Resource
	PayService payService;
	@Resource
	SsssOrderService ssssOrderService;
	@Resource
	OrderService orderService;
	@Resource
	MallOrderHistoryService orderHistoryService;
	@Resource
	AfterSaleService afterSaleService;
	/**
	 * 查询代理商下单财务列表
	 * @author zhaolei
	 * @date 2015年12月22日
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @param pageNo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/u/finance/list")
	String list(
			@RequestParam(value="type",required=false) Byte type,
//			@RequestParam(value="startTime",required=false)Date startTime,
//			@RequestParam(value="endTime",required=false)Date endTime,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap modelMap) {
		//查询个人4s店信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		//查询该城运商的账单详细信息
//		if(startTime != null){
//			modelMap.addAttribute("startTime",DateUtil.format(startTime, "yyyy-MM-dd"));
//		}
//		if(endTime != null){
//			modelMap.addAttribute("endTime",DateUtil.format(endTime, "yyyy-MM-dd"));
//			endTime=DateUtil.getDateEndTime(endTime);
//		}
//		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("type", type);
//		map.put("startTime", startTime);
//		map.put("endTime", endTime);
//		map.put("pageNo", pageNo);
		//map.put("userId", user.getId());
//		map.put("merchantId", ssssCityMerchant.getId());
//		List<SsssOrder> orderList = ssssOrderService.getOrderListBySearch(map);
//		orderList = setStatus(orderList);
		
		//查询已付款的订单（排除未支付和关闭的订单）
		Pager<PayHistory> pageInfo = payService.queryPayHistoryList(user.getId(), null,ssssCityMerchant.getId(), type, 1, null, null, pageNo, 10);
		modelMap.addAttribute("pager", pageInfo);
		modelMap.addAttribute("info",ssssCityMerchant);
		modelMap.addAttribute("totalProfit", ssssCityMerchant.getFreezedMoney());
		modelMap.addAttribute("url", "/u/finance/list.html?pageNo=");
		modelMap.addAttribute("sureProfit", ssssCityMerchant.getMoney());
		modelMap.addAttribute("dataList",pageInfo.getList());
//		modelMap.addAttribute("orderList",orderList);
		modelMap.addAttribute("type",type);
		return "finance/list";
	}
	/**
	 * 查询C端用户在代理商区域下单的财务列表
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @param pageNo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/u/finance/profitList")
	String profitList(
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap modelMap) {
		//查询个人4s店信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		//map.put("userId", user.getId());
		map.put("merchantId", ssssCityMerchant.getId());
		List<SsssOrder> orderList = ssssOrderService.getListBySearch(map);
		PageInfo<SsssOrder> pageInfo = new PageInfo<SsssOrder>(orderList);
		orderList = setStatus(orderList);
		modelMap.addAttribute("pageInfo", pageInfo);
		modelMap.addAttribute("info",ssssCityMerchant);
		modelMap.addAttribute("totalProfit", ssssCityMerchant.getFreezedMoney());
		modelMap.addAttribute("sureProfit", ssssCityMerchant.getMoney());
		modelMap.addAttribute("orderList",orderList);
		return "finance/profitList";
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
	
	@RequestMapping("/u/finance/setCash")
	String setCash(ModelMap modelMap) {
		return "finance/setCash";
	}
	/**
	 * 提现操作
	 * @author zhaolei 
	 * @date 2015年12月23日
	 * @param money 提现金额
	 * @param code 提现验证码
	 * @param modelMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/u/finance/getCash")
	String getCash(@RequestParam(value="money") float money,
			@RequestParam(value="password") String password,
			ModelMap modelMap){
		int code=0;
		String msg=null;
		User user = getUser();
		User oldUser = userService.get(user.getId());//当前登陆用户ID
		String md5pwd  =Md5Util.encode(Md5Util.encode(password+oldUser.getSalt()));
		if(oldUser.getUserPwd().equals(md5pwd)){//密码正确
			//说明验证码校验成功
			ssssGetcashService.insert(money, user);
		}else{
			code = 1;
			msg = "密码错误";
		}
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(Date.class, new DateEditor());
	}
	
	/**
	 * 提现列表
	 * @author zhaolei
	 * @date 2016年1月2日
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @param pageNo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/u/finance/cashList")
	String cashList(
			@RequestParam(value="startTime",required=false)Date startTime,
			@RequestParam(value="endTime",required=false)Date endTime,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap modelMap) {
		//查询个人4s店信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		//查询该4S店的账单详细信息
		if(startTime != null){
			modelMap.addAttribute("startTime",DateUtil.format(startTime, "yyyy-MM-dd"));
		}
		if(endTime != null){
			modelMap.addAttribute("endTime",DateUtil.format(endTime, "yyyy-MM-dd"));
			endTime=DateUtil.getDateEndTime(endTime);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("pageNo", pageNo);
		map.put("userId", user.getId());
		map.put("merchantId", ssssCityMerchant.getId());
		List<SsssGetcash> dataList = ssssGetcashService.getList(map);
		PageInfo<SsssGetcash> pageInfo = new PageInfo<SsssGetcash>(dataList);
		modelMap.addAttribute("pageInfo", pageInfo);
		modelMap.addAttribute("dataList",dataList);
		modelMap.addAttribute("info", ssssCityMerchant);
		return "finance/cashList";
	}
	@RequestMapping("/u/finance/freezedList")
	String freezedList(
			@RequestParam(value="startTime",required=false)Date startTime,
			@RequestParam(value="endTime",required=false)Date endTime,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap modelMap) {
		//查询个人4s店信息
		User user = getUser();//登陆用户
		SsssCityMerchant merchant = ssssCityMerchantService.getByUserId(user.getId());
		//查询该4S店的账单详细信息
		if(startTime != null){
			modelMap.addAttribute("startTime",DateUtil.format(startTime, "yyyy-MM-dd"));
		}
		if(endTime != null){
			modelMap.addAttribute("endTime",DateUtil.format(endTime, "yyyy-MM-dd"));
			endTime=DateUtil.getDateEndTime(endTime);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("pageNo", pageNo);
		map.put("userId", user.getId());
		map.put("merchantId", merchant.getId());
		List<SsssOrder> dataList = ssssOrderService.getList(map);
		PageInfo<SsssOrder> pageInfo = new PageInfo<SsssOrder>(dataList);
		modelMap.addAttribute("pageInfo", pageInfo);
		modelMap.addAttribute("dataList",dataList);
		return "finance/freezedList";
	}
}
