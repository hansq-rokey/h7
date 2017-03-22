package com.ibaixiong.merchant.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.service.SsssCityMerchantService;
import com.ibaixiong.merchant.service.SsssGetcashService;
import com.ibaixiong.merchant.service.SsssInfoService;
import com.ibaixiong.merchant.service.SsssOrderService;
import com.ibaixiong.merchant.service.UserService;

/**
 * Created by Administrator on 2015/7/27.
 */
class AbstractController {
	@Resource
	SsssInfoService ssssInfoService;
	@Resource
	SsssGetcashService ssssGetcashService;
	@Resource
	SsssCityMerchantService ssssCityMerchantService;
	@Resource
	SsssOrderService ssssOrderService;
	@Resource
	UserService userService;
	
    @ModelAttribute("user")
    User getUser() {
		Subject subject=SecurityUtils.getSubject();
		if(subject!=null &&subject.getPrincipal()!=null){
			Object obj=subject.getPrincipal();
			if(obj instanceof User){
				User user = (User)obj;
				return user;
			}
		}
        return null;
    }
}
