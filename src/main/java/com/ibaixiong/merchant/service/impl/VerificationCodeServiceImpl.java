/*
 * baixiong.com Inc. Copyright (c) 1999-2001 All Rights Reserved.
 */
package com.ibaixiong.merchant.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibaixiong.core.utils.AccountUtil;
import com.ibaixiong.core.utils.DateUtil;
import com.ibaixiong.core.web.RequestUtils;
import com.ibaixiong.entity.VerificationCode;
import com.ibaixiong.merchant.dao.VerificationCodeDao;
import com.ibaixiong.merchant.model.PropertyConfig;
import com.ibaixiong.merchant.service.VerificationCodeService;
import com.ibaixiong.merchant.util.MailUtil;
import com.shcm.bean.SendResultBean;
import com.shcm.send.DataApi;
import com.shcm.send.OpenApi;

/**
 * 
 * @author yaoweiguo
 * @Email yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年7月14日
 *
 */

@Service
public class VerificationCodeServiceImpl implements VerificationCodeService {

	@Autowired
	private MailUtil mailUtil;
	@Autowired
	private PropertyConfig propertyConfig;
	@Autowired
	private VerificationCodeDao verificationCodeDao;

	private Logger logger = LoggerFactory.getLogger(getClass());

	public int send(String account, Byte type, HttpServletRequest request) {

		int flag = AccountUtil.checkAccount(account);
		int result = 0;
		switch (flag) {
		case 1:
			result = this.sendMail(account, type, request);
			break;
		case 2:
			result = this.sendMobile(account, type, request);
			break;
		default:
			break;
		}

		return result;
	}

	public int compareCode(String name, Byte type, String code) {

		VerificationCode verificationCode = verificationCodeDao.selectByName(name, type);

		if (verificationCode == null) {
			return -1;
		}
		if (StringUtils.isBlank(code)) {
			return -2;
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.MINUTE, -20);
		Date date = calendar.getTime();
		if (!DateUtil.compareDate(verificationCode.getCreateDateTime(), date)) {
			return -3;
		}
		if (!verificationCode.getCode().equals(code)) {
			return -4;
		}

		return 1;
	}

	// todo
	private int sendMail(String email, Byte type, HttpServletRequest request) {
		String code = this.randomNum();
		VerificationCode verificationCode = new VerificationCode();
		verificationCode.setCode(code);
		verificationCode.setCreateDateTime(new Date());
		verificationCode.setName(email);
		verificationCode.setRegisterIp(RequestUtils.getIpAddr(request));
		verificationCode.setStatus((byte) 1);
		verificationCode.setUpdateTime(new Date());
		verificationCode.setType(type);
		verificationCodeDao.insert(verificationCode);
		boolean flag = mailUtil.send("白熊科技", "html", code, email, null, null);
		logger.info(code + "为您的白熊注册验证码。如非本人操作，请忽略  ---邮箱");
		System.out.println(flag);
		return 1;
	}

	private int sendMobile(String phone, Byte type, HttpServletRequest request) {

		String code = this.randomNum();
		VerificationCode verificationCode = new VerificationCode();
		verificationCode.setCode(code);
		verificationCode.setCreateDateTime(new Date());
		verificationCode.setName(phone);
		verificationCode.setRegisterIp(RequestUtils.getIpAddr(request));
		verificationCode.setStatus((byte) 1);
		verificationCode.setUpdateTime(new Date());
		verificationCode.setType(type);
		verificationCodeDao.insert(verificationCode);
		List<SendResultBean> listItem = sendOnce(phone, code + "为您的白熊注册验证码。如非本人操作，请忽略");

		logger.info(code + "为您的白熊注册验证码。如非本人操作，请忽略---手机");

		if (listItem != null) {
			for (SendResultBean t : listItem) {

				if (t.getResult() < 1) {

					logger.error("send mobile is error!", t.getErrMsg());
				}

				// System.out.println("发送成功: 消息编号<" + t.getMsgId() + "> 总数<"
				// + t.getTotal() + "> 余额<" + t.getRemain() + ">");
			}
		}

		return 1;
	}

	public List<SendResultBean> sendOnce(String mobile, String content) {
		// 发送参数
		OpenApi.initialzeAccount(propertyConfig.getsOpenUrl(), propertyConfig.getAccount(), propertyConfig.getAuthkey(), propertyConfig.getCgid(),
				propertyConfig.getCsid());

		// 状态及回复参数
		DataApi.initialzeAccount(propertyConfig.getsDataUrl(), propertyConfig.getAccount(), propertyConfig.getAuthkey());
		// 发送短信
		List<SendResultBean> listItem = OpenApi.sendOnce(mobile, content, 0, 0, null);
		return listItem;
	}

	private String randomNum() {
		Random random = new Random();
		return String.valueOf(random.nextInt(8999) + 1000);
	}

	@Override
	public int remove(String name, Byte type, String code) {
		return verificationCodeDao.remove(name, type, code);
	}
}
