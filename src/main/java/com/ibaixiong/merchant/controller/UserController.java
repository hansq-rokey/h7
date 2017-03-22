package com.ibaixiong.merchant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.core.utils.Md5Util;
import com.ibaixiong.core.utils.ResponseResult;
import com.ibaixiong.entity.MerchantProxyArea;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.service.ChannelAreaService;
import com.ibaixiong.merchant.service.MerchantProxyAreaService;
import com.ibaixiong.merchant.service.VerificationCodeService;
import com.ibaixiong.merchant.util.Response;

/**
 * @description 账户信息
 * @author zhaolei
 * @create 2015年12月22日-上午10:16:05
 */
@Controller
class UserController extends AbstractController {
	@Resource
	VerificationCodeService verificationCodeService;
	@Resource
	MerchantProxyAreaService merchantAreaService;
	/**
	 * 去4s店信息查看
	 * @author zhaolei
	 * @date 2015年12月24日
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/u/user/ssssInfo")
	String ssssInfo(ModelMap modelMap) {
		User user = getUser();
		SsssCityMerchant info = ssssCityMerchantService.getByUserId(user.getId());
		if(info.getBankNumber().length()>16){
			String bankNumber = info.getBankNumber();
			String leftStr = bankNumber.substring(0,5);
			String rightStr = bankNumber.substring(16);
			info.setBankNumber(leftStr+"********"+rightStr);
		}
		if(info.getBankNumber().length()<=16){
			String bankNumber = info.getBankNumber();
			String leftStr = bankNumber.substring(0,5);
			String rightStr = bankNumber.substring(13);
			info.setBankNumber(leftStr+"********"+rightStr);
		}
		if(info.getIdentityCard()!=null){
			if(info.getIdentityCard().length()>15){
				String identityCard = info.getIdentityCard();
				String leftStr = identityCard.substring(0,12);
				info.setIdentityCard(leftStr+"******");
			}
			if(info.getIdentityCard().length()<=15){
				String identityCard = info.getIdentityCard();
				String leftStr = identityCard.substring(0,10);
				info.setIdentityCard(leftStr+"******");
			}
		}
		modelMap.addAttribute("info",info);
		modelMap.addAttribute("user",user);//设置用户对象
		modelMap.addAttribute("areas", merchantAreaService.queryByMerchantId(info.getId()));
		return "user/ssssInfo";
	}
	/**
	 * 去账号查看页面
	 * @author zhaolei
	 * @date 2015年12月24日
	 * @param user
	 * @param newPwd
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/u/user/account")
	String account(ModelMap modelMap) {
		modelMap.addAttribute("user",getUser());//设置用户对象
		return "user/account";
	}
	
	@ResponseBody
	@RequestMapping("/u/user/show")
	String showBankNumber(@ModelAttribute("user") User u,
			@RequestParam(value = "password", required = false) String password) {
		Response response = new Response();
		//说明是密码发生修改操作
		User user = userService.get(u.getId());
		SsssCityMerchant info = ssssCityMerchantService.getByUserId(user.getId());
		if(user.getUserPwd().equals(Md5Util.encode(Md5Util.encode(password+user.getSalt())))){
			response.setSuccess(true);
			response.setResult(info);
			response.setMessage("密码正确");
		}else{
			response.setSuccess(false);
			response.setMessage("密码错误");
		}
		return JSON.toJSONString(response);
	}
	
	@ResponseBody
	@RequestMapping("/u/user/update")
	String update(@ModelAttribute("user") User user,@RequestParam(value = "newPwd", required = false) String newPwd,
			@RequestParam(value = "oldPwd", required = false) String oldPwd,
		HttpServletResponse response,ModelMap modelMap) {
		int code=0;
		String msg=null;
		//说明是密码发生修改操作
		User oldUser = userService.get(user.getId());//当前登陆用户ID
		String md5pwd  =Md5Util.encode(Md5Util.encode(oldPwd+oldUser.getSalt()));
		if(oldUser.getUserPwd().equals(md5pwd)){
			User newUser=new User();
			newUser.setUserPwd(Md5Util.encode(Md5Util.encode(newPwd+oldUser.getSalt())));
			newUser.setId(user.getId());
			userService.update(newUser);
			Subject subject =SecurityUtils.getSubject();
			if(subject.isAuthenticated()){
				subject.logout();
			}
			//return "redirect:http://login.ibaixiong.com/logout?service=http://login.ibaixiong.com/login";
		}else{
			code=1;
			msg="原密码错误";
		}
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}
	/**
	 * 用户推送验证码
	 * @author zhaolei
	 * @date 2015年12月24日
	 * @param user
	 * @param type
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/u/user/sendVer")
	String sendVer(@ModelAttribute("user") User user,
			@RequestParam(value = "type", defaultValue = "1") Byte type,
		HttpServletRequest request,
		HttpServletResponse response) {
		int code=0;
		String msg=null;
		//发送验证码
		//手机发送种类
		String  account = "";
		if(StringUtils.isNotBlank(user.getPhone())){
			account = user.getPhone();
		}
		verificationCodeService.send(account,type,request);
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}
	/**
	 * 验证填写的验证码
	 * @author zhaolei
	 * @date 2015年12月24日
	 * @param user
	 * @param type
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/u/user/VerCode")
	String VerCode(@ModelAttribute("user") User user,
			@RequestParam(value = "type", defaultValue = "1") Byte type,
			@RequestParam("vcode") String vcode,
		HttpServletRequest request,
		HttpServletResponse response) {
		int code=0;
		String msg=null;
		Map<String, Object> map = new HashMap<String, Object>();
		int flag = verificationCodeService.compareCode(user.getPhone(), type , vcode);
		if (flag != 1) {
			code=1;
			msg="验证码错误";
		}else{
			SsssCityMerchant info = ssssCityMerchantService.getByUserId(user.getId());
			map.put("bankNumber", info.getBankNumber());
		}
		return JSON.toJSONString(ResponseResult.result(code, msg,map));
	}
	@ResponseBody
	@RequestMapping("/user/info")
	public String getUserInfo(HttpServletRequest request){
		boolean loginstatus = false;
		String name = null;
		Response response=new Response();
		User user=getUser();
		Map<String, Object> map=new HashMap<String, Object>();
		if (user != null) {
			loginstatus = true;
			if(user.getNickName()!=null&&StringUtils.isNotBlank(user.getNickName())){
				name=user.getNickName();
			}else{
			name=user.getBxNum();
			}
			List<String> names = userService.queryRoleNames(user.getId());
			if(names != null && names.size()>0){
				String s = names.toString();
				if(s.indexOf("4s店")>-1){
					//在去验证4s信息表中是否有记录存在
					SsssInfo ssssinfo = ssssInfoService.getByUserId(user.getId());
					if(ssssinfo!=null){
						map.put("ssssTag", 1);
					}
					
				}
				if(s.indexOf("代理商")>-1){
					SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
					if(ssssCityMerchant!=null){
						map.put("merchantTag", 1);
						name=ssssCityMerchant.getCityMerchantName();
					}
				}
			}
		}
		map.put("loginstatus", loginstatus);
		map.put("name", name);
		response.setMessage("success");
		response.setResult(map);
		return JSON.toJSONString(response);

	}
}
