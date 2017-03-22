/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.merchant.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibaixiong.constant.Constant.InvitationCodeStatus;
import com.ibaixiong.constant.Constant.PayHistoryStatus;
import com.ibaixiong.constant.InvalidEnum;
import com.ibaixiong.core.utils.CodeUtil;
import com.ibaixiong.entity.PayHistory;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.entity.SsssInvitationCode;
import com.ibaixiong.entity.SsssInvitationCodeProduct;
import com.ibaixiong.merchant.dao.SsssInvitationCodeDao;
import com.ibaixiong.merchant.dao.SsssInvitationCodeProductDao;
import com.ibaixiong.merchant.exception.SsssException;
import com.ibaixiong.merchant.service.InvitationCodeService;
import com.ibaixiong.merchant.service.SsssInfoService;

/**
 * @description
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年12月23日-上午10:13:50
 */
@Service
public class InvitationCodeServiceImpl implements InvitationCodeService {

	@Autowired
	SsssInvitationCodeDao invitationCodeDao;
	@Autowired
	SsssInfoService ssssInfoService;
	@Autowired
	SsssInvitationCodeProductDao invitationCodeProductDao;

	@Override
	public List<SsssInvitationCode> getSsssInvitationCodeList(Long ssssId, Byte status) {
		List<SsssInvitationCode> listSsssInvitationCode = invitationCodeDao.getSsssInvitationCodeList(ssssId, status);
		return listSsssInvitationCode;
	}

	@Override
	public int closeInvitationCode(Long invitationCodeId, Long ssssId) {
		// 邀请码金额返回到余额中
		return invitationCodeDao.updateInvitationCodeStatusByIdAnd4SId(InvitationCodeStatus.INVALID.getStatus(), invitationCodeId, ssssId);
	}

}
