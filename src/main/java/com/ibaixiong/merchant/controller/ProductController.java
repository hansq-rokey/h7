package com.ibaixiong.merchant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.ibaixiong.entity.MerchantProduct;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.service.MerchantProductService;
import com.papabear.commons.entity.enumentity.Constant.Status;
import com.papabear.commons.entity.enumentity.PicTypeEnum;
import com.papabear.product.api.CategoryQueryService;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallProduct;

@Controller
@RequestMapping("/u/product")
public class ProductController extends AbstractController {

	@Resource
	private ProductQueryService productQueryService;
	@Resource
	private CategoryQueryService categoryQueryService;
	@Resource
	private MerchantProductService merchantProductService;
	
	/**
	 * 代理商代理产品列表（只显示B端可见的产品）
	 * @param pageNo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="pageNo",defaultValue="0")Integer pageNo,ModelMap modelMap){
		SsssCityMerchant merchant=ssssCityMerchantService.getByUserId(getUser().getId());
		List<MerchantProduct> lists = merchantProductService.queryList(merchant.getId());
		List<Long> productIds = new ArrayList<Long>();
		if(lists!=null && lists.size()>0){
			for(MerchantProduct merchantProduct : lists){
				productIds.add(merchantProduct.getProductId());
			}
			PageInfo<MallProduct> pageInfo=productQueryService.queryProducts(productIds,Status.NORMAL.getStatus(), null, (byte)1, pageNo, 8);
			List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
			for(MallProduct p:pageInfo.getList()){
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("product", p);
				MallBasicCategoryModelFormat format=categoryQueryService.getCategoryModelFormat(p.getCategoryModelId(), "product_purchase_price", "asc");
				if(format!=null){
					map.put("pics", productQueryService.queryPics(p, format.getId(), PicTypeEnum.FORMAT_PROPERTY_THUMBANIL.getType().shortValue()));
					map.put("format", format);	
				}
				list.add(map);
			}
			modelMap.addAttribute("pageInfo", pageInfo);
			modelMap.addAttribute("list", list);
			modelMap.addAttribute("fixProfit", merchant.getFixateProfit());
		}
		modelMap.addAttribute("info", merchant);
		return "product/list";
	}
}
