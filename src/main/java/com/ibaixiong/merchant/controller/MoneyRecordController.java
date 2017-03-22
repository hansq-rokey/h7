package com.ibaixiong.merchant.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.ibaixiong.entity.DictCode;
import com.ibaixiong.entity.MerchantBondMoneyRecord;
import com.ibaixiong.entity.MerchantCouponMoneyRecord;
import com.ibaixiong.entity.MerchantFirstGoodsMoneyRecord;
import com.ibaixiong.entity.MerchantRebateMoneyRecord;
import com.ibaixiong.entity.MerchantSaleMoneyRecord;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.DictTypeEnum;
import com.ibaixiong.merchant.service.DictCodeService;
import com.ibaixiong.merchant.service.MerchantBondMoneyRecordService;
import com.ibaixiong.merchant.service.MerchantCouponMoneyRecordService;
import com.ibaixiong.merchant.service.MerchantFirstGoodsRecordService;
import com.ibaixiong.merchant.service.MerchantRebateMoneyRecordService;
import com.ibaixiong.merchant.service.MerchantSaleMoneyRecordService;
import com.ibaixiong.merchant.service.SsssCityMerchantService;
/**
 * 
 * @author hansq
 *
 */
@Controller
public class MoneyRecordController extends AbstractController{

	@Resource
	private MerchantCouponMoneyRecordService couponRecordService;
	@Resource
	private MerchantBondMoneyRecordService bondRecordService;
	@Resource
	private MerchantFirstGoodsRecordService firstGoodsRecordService;
	@Resource
	private DictCodeService dictCodeService;
	@Resource
	private MerchantSaleMoneyRecordService saleMoneyRecordService;
	@Resource
	private MerchantRebateMoneyRecordService rebateRecordService;
	@Resource
	private SsssCityMerchantService ssssCityMerchantService;
	
	/**
	 * 优惠券记录详情
	 * @param id
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/u/couponRecord.html")
	public String couponRecordList(@RequestParam(value="id",required = false)Long id,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap model){
		//查询代理商信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		List<MerchantCouponMoneyRecord> records = couponRecordService.queryListByMerchantId(id,pageNo);
		PageInfo<MerchantCouponMoneyRecord> pageInfo = new PageInfo<MerchantCouponMoneyRecord>(records);
		List<DictCode> codes = dictCodeService.queryDictCodeByDictType(DictTypeEnum.BALANCE_CHANGE_STATUS.getDictType());
		model.addAttribute("codes", codes);
		model.addAttribute("merchantId",id);
		model.addAttribute("records", records);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("types", dictCodeService.queryDictCodeByDictType(DictTypeEnum.CITY_MERCHANT_TYPE.getDictType()));
		model.addAttribute("info", ssssCityMerchant);
		return "/record/coupon_record";
	}
	
	/**
	 * 保证金记录详情
	 * @param id
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/u/bondRecord.html")
	public String bondRecordList(@RequestParam(value="id",required = false)Long id,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap model){
		//查询代理商信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		List<MerchantBondMoneyRecord> records = bondRecordService.queryListByMerchantId(id, pageNo);
		PageInfo<MerchantBondMoneyRecord> pageInfo = new PageInfo<MerchantBondMoneyRecord>(records);
		List<DictCode> codes = dictCodeService.queryDictCodeByDictType(DictTypeEnum.BALANCE_CHANGE_STATUS.getDictType());
		model.addAttribute("codes", codes);
		model.addAttribute("merchantId",id);
		model.addAttribute("records", records);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("types", dictCodeService.queryDictCodeByDictType(DictTypeEnum.CITY_MERCHANT_TYPE.getDictType()));
		model.addAttribute("info", ssssCityMerchant);
		return "/record/bond_record";
	}
	
	/**
	 * 首批提货款记录详情
	 * @param id
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/u/firstGoodsRecord.html")
	public String firstGoodsRecordList(@RequestParam(value="id",required = false)Long id,
			@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,
			ModelMap model){
		//查询代理商信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		List<MerchantFirstGoodsMoneyRecord> records = firstGoodsRecordService.queryListByMerchantId(id,pageNo);
		PageInfo<MerchantFirstGoodsMoneyRecord> pageInfo = new PageInfo<MerchantFirstGoodsMoneyRecord>(records);
		List<DictCode> codes = dictCodeService.queryDictCodeByDictType(DictTypeEnum.BALANCE_CHANGE_STATUS.getDictType());
		model.addAttribute("codes", codes);
		model.addAttribute("merchantId",id);
		model.addAttribute("records", records);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("types", dictCodeService.queryDictCodeByDictType(DictTypeEnum.CITY_MERCHANT_TYPE.getDictType()));
		model.addAttribute("info", ssssCityMerchant);
		return "/record/first_goods_record";
	}
	
	/**
	 * 销售额记录信息
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/u/saleRecordList.html")
	public String saleRecordList(
			@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,
			@RequestParam(value="id",required = false)Long id,
			Model model,HttpServletRequest request) {
		//查询代理商信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		List<MerchantSaleMoneyRecord> records = saleMoneyRecordService.queryListByMerchantId(id,pageNo);
		PageInfo<MerchantSaleMoneyRecord> pageInfo = new PageInfo<MerchantSaleMoneyRecord>(records);
		
		List<DictCode> codes = dictCodeService.queryDictCodeByDictType(DictTypeEnum.BALANCE_CHANGE_STATUS.getDictType());
		model.addAttribute("codes", codes);
		model.addAttribute("merchantId",id);
		model.addAttribute("records", records);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("types", dictCodeService.queryDictCodeByDictType(DictTypeEnum.CITY_MERCHANT_TYPE.getDictType()));
		model.addAttribute("info", ssssCityMerchant);
		return "/record/sale_record";
	}
	/**
	 * 销售额记录信息
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/u/rebateRecord.html")
	public String rebateRecord(
			@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,
			@RequestParam(value="id",required = false)Long id,
			Model model,HttpServletRequest request) {
		//查询代理商信息
		User user = getUser();//登陆用户
		SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
		List<MerchantRebateMoneyRecord> records = rebateRecordService.queryListByMerchantId(id, pageNo);
		PageInfo<MerchantRebateMoneyRecord> pageInfo = new PageInfo<MerchantRebateMoneyRecord>(records);
		List<MerchantRebateMoneyRecord> list = new ArrayList<MerchantRebateMoneyRecord>();
		for(MerchantRebateMoneyRecord record : pageInfo.getList()){
			if(record.getDownMerchantId()!=null){
				SsssCityMerchant city = ssssCityMerchantService.getById(record.getDownMerchantId());
				record.setDownCityName(city.getCityMerchantName());
			}
			list.add(record);
		}
		List<DictCode> codes = dictCodeService.queryDictCodeByDictType(DictTypeEnum.BALANCE_CHANGE_STATUS.getDictType());
		model.addAttribute("codes", codes);
		model.addAttribute("merchantId",id);
		model.addAttribute("records", list);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("types", dictCodeService.queryDictCodeByDictType(DictTypeEnum.CITY_MERCHANT_TYPE.getDictType()));
		model.addAttribute("info", ssssCityMerchant);
		return "/record/rebate_record";
	}
}
