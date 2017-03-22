package com.ibaixiong.merchant.service;

import javax.servlet.http.HttpServletRequest;

public interface VerificationCodeService {

	
	/**
	 * 发送验证码
	 * @param account   用户名
	 * @param type   类型  注册 1 还是密码找回 2   查看账号 3
	 * @param request
	 * @return  1：成功
	 */
	 int send(String account,Byte type, HttpServletRequest request);
	
	/**
	 * 验证码是否相同
	 * @param name 手机号码或邮箱
	 * @param code 验证码
	 * @param type 注册 1 ;密码找回 2
	 * @return -1:没有找到相应记录  
	 * 			-2：验证码为空
	 * 			-3：验证码时间超过1小时
	 * 			-4:验证码输入有误
	 */
	int compareCode(String name,Byte type, String code);
	/**
	 * 删除之前的短信验证码
	 * @param name
	 * @param type
	 * @param code
	 * @return
	 */
	int remove(String name,Byte type, String code);
	
}
