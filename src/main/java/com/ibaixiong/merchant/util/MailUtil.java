/*
 * baixiong.com Inc.
 * Copyright (c) 1999-2001 All Rights Reserved.
 */
package com.ibaixiong.merchant.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

import com.ibaixiong.merchant.model.PropertyConfig;

/**
 * 
 * @author Administrator
 *
 */

@Component("mailUtil")
public class MailUtil {
	protected static Logger logger = LoggerFactory.getLogger(MailUtil.class);

	@Autowired
	private PropertyConfig propertyConfig;

	/**
	 * 标记初始化发送方信息
	 */
	private static boolean flag = true;
	/**
	 * 邮件发送发生异常后重复发送的次数
	 */
	private Integer exceptionCount = 5;

	private BufferedReader bufferedReader;
	private Reader reader;
	private static String sendContent = "";

	protected void readerMailContent() {
		try {
			File file = ResourceUtils.getFile("classpath:mail/index.htm");
			reader = new InputStreamReader(new FileInputStream(file));
			bufferedReader = new BufferedReader(reader);
			StringBuffer stringBuffer = new StringBuffer();
			String line = null;
			while ((line = bufferedReader.readLine()) != null) {
				stringBuffer.append(line);
			}
			sendContent = stringBuffer.toString();
			bufferedReader.close();
			reader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(bufferedReader!=null)
				bufferedReader.close();
				if(reader!=null)
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 发送邮件
	 * 
	 * @param subject
	 *            邮件主题
	 * @param type
	 *            邮件类型，html或者文本 (text)
	 * @param code
	 *            邮件内容
	 * @param to
	 *            收件人，有逗号隔开
	 * @param cc
	 *            抄送，逗号隔开
	 * @param bcc
	 *            暗送，逗号隔开
	 * @return boolean true 发送成功 false 发送失败
	 */
	public boolean send(String subject, String type, String code, String to,
			String cc, String bcc) {
		boolean result = true;
		if (StringUtils.isBlank(sendContent)) {
			this.readerMailContent();
		}
		System.out.println("----"+sendContent);
		logger.info("邮件内容", sendContent);
		// 首先列表排序
		// Collections.sort(mailFromList);
		// //获取发送频率最小的一个值
		// final MailInfo mailInfo = mailFromList.get(0) == null ? new
		// MailInfo() : mailFromList.get(0);
		// logger.info(mailInfo.toString());
		/**
		 * 每使用一次mail服务器就递增一次发送次数，而不是发送成功之后才递增，
		 * 这样做的目的是避免某一台mail服务器故障后无法发送邮件但永远频次最低， 故永远选择这台故障机发送，所带来的问题
		 */
		// mailInfo.setCount(mailInfo.getCount() + 1);
		// 以下为发送程序，用户无需改动

		Properties props = new Properties();
		props.put("mail.smtp.host", propertyConfig.getEmailHost());
		// 身份验证，一般邮件服务器都需要身份验证
		props.put("mail.smtp.auth", "true");
		Session ssn = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(propertyConfig
						.getEmailUsername(), propertyConfig.getEmailPassword());
			}

		});
		MimeMessage message = new MimeMessage(ssn);
		InternetAddress fromAddress;
		try {
			fromAddress = new InternetAddress(propertyConfig.getEmailUsername());
			message.setFrom(fromAddress);
			// 收件人，以逗号隔开
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to, false));
			// 抄送，以逗号隔开
			if (null != cc && !"".equals(cc)) {
				message.setRecipients(Message.RecipientType.CC,
						InternetAddress.parse(cc));
			}
			// 暗送，逗号隔开
			if (null != bcc && !"".equals(bcc)) {
				message.setRecipients(Message.RecipientType.BCC,
						InternetAddress.parse(bcc));
			}
			message.setSubject(subject);
			switch (type) {
			case "html":
				MimeBodyPart mbp = new MimeBodyPart();
				// 设定邮件内容的类型为 text/plain 或 text/html
				mbp.setContent(sendContent.replace("#code#", code), "text/html;charset=UTF-8");
				Multipart mp = new MimeMultipart();
				mp.addBodyPart(mbp);
				message.setContent(mp);
				break;
			case "text":
				// 发送文本邮件
				message.setText(code);
				break;
			}
			message.setSentDate(new Date());

			Transport.send(message);
			logger.info("mail send successfully from "
					+ propertyConfig.getEmailUsername() + " to " + to
					+ " and cc to " + cc);
		} catch (Exception e) {
			result = false;
			synchronized (exceptionCount) {
				if (exceptionCount <= 0) {
					exceptionCount = 5;
				} else {
					exceptionCount--;
					if (send(subject, type, code, to, cc, bcc)) {
						result = true;
						exceptionCount = 5;
					}
					logger.info("mail send failure ,from "
							+ propertyConfig.getEmailUsername() + " to " + to);
				}
			}
			e.printStackTrace();
		}

		return result;
	}
}
