/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.merchant.service;

import java.util.List;

import com.ibaixiong.entity.SsssInvitationCode;

/**
 * @description
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年12月23日-上午10:12:11
 */
public interface InvitationCodeService {


	List<SsssInvitationCode> getSsssInvitationCodeList(Long ssssId, Byte status);

	int closeInvitationCode(Long invitationCodeId, Long ssssId);

}
