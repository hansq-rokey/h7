/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.merchant.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.entity.SsssInvitationCode;
import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.service.InvitationCodeService;
import com.ibaixiong.merchant.service.SsssInfoService;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallProduct;

/**
 * @description
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年12月23日-上午10:18:07
 */
@Controller
@RequestMapping("/u/invitationcode")
public class InvitationCodeController extends AbstractController {
	@Autowired
	InvitationCodeService invitationCodeService;
	@Autowired
	ProductQueryService productQueryService;
	@Autowired
	SsssInfoService ssssInfoService;

	/** 购买邀请码页面 **/
	@RequestMapping("/goadd")
	public String toAddInvitationCode(ModelMap modelMap, HttpServletRequest request) {
		List<MallProduct> listProduct = productQueryService.queryProductIdAndTitleList();
		User user = getUser();
		SsssInfo ssss = ssssInfoService.getByUserId(user.getId());
		modelMap.addAttribute("listProduct", listProduct);
		modelMap.addAttribute("ssssMoney", ssss.getMoney());
		return "/invitationcode/add";
	}


	/** 邀请码列表 **/
	@RequestMapping("/list")
	public String listInvitationCode(ModelMap modelMap, HttpServletRequest request) {
		Byte status = null;
		if (StringUtils.isNotBlank(request.getParameter("status"))) {
			status = Byte.valueOf(request.getParameter("status"));
			modelMap.addAttribute("status", status);
		}
		User user = getUser();
		List<SsssInvitationCode> invitationCodeList = invitationCodeService.getSsssInvitationCodeList(user.getSsssId(), status);
		modelMap.addAttribute("invitationCodeList", invitationCodeList);
		return "/invitationcode/list";
	}

	/** 关闭邀请码 **/
	@RequestMapping("/close")
	@ResponseBody
	public String closeInvitationCode(ModelMap modelMap, HttpServletRequest request) {
		try {
			User user = getUser();
			Long invitationCodeId = Long.valueOf(request.getParameter("invitationCodeId"));
			invitationCodeService.closeInvitationCode(invitationCodeId, user.getSsssId());
		} catch (Exception e) {
			return "{\"code\":-1}";
		}
		return "{\"code\":0}";
	}

	/** 关闭邀请码 **/
	@RequestMapping("/getallowproduct")
	@ResponseBody
	public String getAllowProduct(ModelMap modelMap, HttpServletRequest request) {
		String productList = null;
		try {
			String id = request.getParameter("id");
			if (StringUtils.isNotBlank(id)) {
				String[] ids = id.split(",");
				List<Long> listProductIds = new ArrayList<Long>();
				for (int i = 0; i < ids.length; i++) {
					listProductIds.add(Long.valueOf(ids[i]));
				}
				List<MallProduct> listProduct = productQueryService.queryProductListByIds(listProductIds);
				productList = JSON.toJSONString(listProduct).toString();
			}
		} catch (Exception e) {
			return "{\"code\":-1}";
		}
		return productList;
	}
}
