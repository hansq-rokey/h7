package com.ibaixiong.merchant.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.exception.NotFindSsssCityMerchantException;
import com.ibaixiong.merchant.service.SsssCityMerchantService;

/**
 * 代理商添加
 * 
 * @author ywg
 *
 */
public class MerchantInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private SsssCityMerchantService ssssCityMerchantService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession();
		SsssCityMerchant merchant=(SsssCityMerchant) session.getAttribute("merchant");
		if(merchant==null){
			Subject subject = SecurityUtils.getSubject();
			if (subject != null && subject.getPrincipal() != null) {
				Object obj = subject.getPrincipal();
				if (obj instanceof User) {
					User user=(User) obj;
					SsssCityMerchant merCityMerchant=ssssCityMerchantService.getByUserId(user.getId());
					if(merCityMerchant==null)
						throw new NotFindSsssCityMerchantException("没找到您的代理商信息，请联系客服!");
					session.setAttribute("merchant", merCityMerchant);
				}
			}
			return true;
		}else{
			return super.preHandle(request, response, handler);
		}
	}

}